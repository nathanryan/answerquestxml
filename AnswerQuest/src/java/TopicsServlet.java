/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.OutputKeys;

import javax.xml.transform.stream.StreamSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.dom.DOMSource;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xmldb.api.DatabaseManager;
import org.xmldb.api.base.Collection;
import org.xmldb.api.base.Database;
import org.xmldb.api.modules.XMLResource;
import org.xmldb.api.modules.XQueryService;

/**
 *
 * @reference Eugene McLaughlin
 * @author Daniel Benhamou, x13341086 
 * 
 */
@WebServlet(name="TopicsServlet", urlPatterns={"/TopicsServlet"})
public class TopicsServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            // Identify Sources
            String path = getServletContext().getRealPath("/WEB-INF/");
            String XMLFileName = path + "/Questions.xml";
            String XSLFileName = path + "/Topics.xsl";
            
      
        String TopicName;
       
        String topicinfo;
        try {
            
            TopicName = request.getParameter("topicname");
            topicinfo = request.getParameter("topicinfo");
            
            if (TopicName == null) TopicName="";
            if (topicinfo == null) topicinfo="";
        } catch (Exception e) {
            
            TopicName = "";
            topicinfo = "";
        }


            StreamSource XMLSource = new StreamSource(XMLFileName);
            StreamSource XSLSource = new StreamSource(XSLFileName);

            String URI = "xmldb:exist://localhost:8444/exist/xmlrpc";
            String driver = "org.exist.xmldb.DatabaseImpl";

        XMLResource res = null;
        Node resNode = null;
        Document doc = null;

        try {
            Class cl = Class.forName(driver);
            Database database = (Database) cl.newInstance();
            DatabaseManager.registerDatabase(database);

            // get the collection
            Collection col = DatabaseManager.getCollection(URI + "/db/AnswerQuest", "admin", "password");
            XQueryService service = (XQueryService) col.getService("XQueryService", "1.0");
            service.setProperty("indent", "yes");
            String queryString = "";
            
            
            if (!(topicinfo.equals(""))) {
                service.declareVariable("topicinfo", "");
                queryString = "for $topicinfo in //questionlist//name[text()='" +  TopicName + "']/../topicinfo " +
                              "return update replace $topicinfo with <topicinfo>" + topicinfo + "</topicinfo>";
                service.query(queryString);
            }
            
            
            col.setProperty(OutputKeys.INDENT, "no");
            res = (XMLResource)col.getResource("Questions.xml");
            

            resNode = res.getContentAsDOM();

            doc = (Document) resNode;
            
        }catch (Exception e) {
            System.err.println("Error Document: "+e.getMessage());
        }

        DOMSource origDocSource = new DOMSource(doc);
            
            // Identify Result
            StreamResult homeOutput = new StreamResult(out);

            // Create TransformerFactory
            TransformerFactory xFactory = TransformerFactory.newInstance();

            // Create Transformer
            Transformer optimusPrime = xFactory.newTransformer(XSLSource);

            // Apply transform
            optimusPrime.transform(XMLSource, homeOutput);

        } catch (TransformerConfigurationException ex) {

            System.out.println("Encountered TransformerConfiguration Error: " + ex.getMessage());
            
        } catch (TransformerException ex) {

            System.out.println("Encountered Transformer Error: " + ex.getMessage());

        } finally {
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}