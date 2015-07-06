import java.io.File;
import javax.xml.transform.dom.DOMSource;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import javax.xml.transform.stream.StreamSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.Transformer;
import java.io.IOException;
import java.io.PrintWriter;
import org.xmldb.api.base.*;
import org.xmldb.api.modules.*;
import org.xmldb.api.*;
import javax.xml.transform.OutputKeys;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @reference Eugene McLaughlin
 * @author Nathan Ryan, x13448212
 * 
 */
@WebServlet(name="AdminQuestionMemberServlet", urlPatterns={"/AdminQuestionMemberServlet"})
public class AdminQuestionMemberServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String URI = "xmldb:exist://localhost:8444/exist/xmlrpc";
        String driver = "org.exist.xmldb.DatabaseImpl";

        XMLResource res = null;
        Node resNode = null;
        Document doc = null;

        String path = getServletContext().getRealPath("/WEB-INF/");
        String XSLFileName = path + "/AdminQuestionMember.xsl";
        File XslFile = new File(XSLFileName);
        
        String MemberName;
        String TopicName;
        String questiontext;
        String correctAnswer;
        String incorrectAnswer;
        String topicinfo;
        try {
            MemberName = request.getParameter("name");
            TopicName = request.getParameter("topicname");
            questiontext = request.getParameter("questiontext");
            correctAnswer = request.getParameter("correct");
            incorrectAnswer = request.getParameter("incorrect");
            topicinfo = request.getParameter("topicinfo");
            if (MemberName == null) MemberName="";
            if (TopicName == null) TopicName="";
            if (questiontext == null) questiontext="";
            if (correctAnswer == null) correctAnswer="";
            if (incorrectAnswer == null) incorrectAnswer="";
            if (topicinfo == null) topicinfo="";
        } catch (Exception e) {
            MemberName = "";
            TopicName = "";
            questiontext = "";
            correctAnswer = "";
            incorrectAnswer = "";
            topicinfo = "";
        }

        try {
            Class cl = Class.forName(driver);
            Database database = (Database) cl.newInstance();
            DatabaseManager.registerDatabase(database);

            // get the collection
            Collection col = DatabaseManager.getCollection(URI + "/db/AnswerQuest", "admin", "password");

            XQueryService service = (XQueryService) col.getService("XQueryService", "1.0");
            service.setProperty("indent", "yes");
            String queryString = "";
            if (!(questiontext.equals(""))) {
                service.declareVariable("questiontext", "");
                queryString = "for $questiontext in //questionlist//name[text()='" +  MemberName + "']/../questiontext " +
                              "return update replace $questiontext with <questiontext>" + questiontext + "</questiontext>";
                service.query(queryString);
            }
            
            if (!(correctAnswer.equals(""))) {
                service.declareVariable("correctans", "");
                queryString = "for $correctans in //questionlist//name[text()='" + MemberName + "']/../correct " +
                              "return update replace $correctans with <correct>" + correctAnswer + "</correct>";
                service.query(queryString);
            }
            if (!(incorrectAnswer.equals(""))) {
                service.declareVariable("incorrectans", "");
                queryString = "for $incorrectans in //questionlist//name[text()='" + MemberName + "']/../incorrect " +
                              "return update replace $incorrectans with <incorrect>" + incorrectAnswer + "</incorrect>";
                service.query(queryString);
            }
            
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
        try {

            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            StreamSource stylesheet = new StreamSource(XslFile);

            Transformer transformer = transformerFactory.newTransformer(stylesheet);

            NodeList nameIDNodeList = doc.getElementsByTagName("name");
            int num_products = nameIDNodeList.getLength();
            String prev_id;
            String next_id;

            for (int i=0;i<num_products; i++){

                Node nameIDNode = nameIDNodeList.item(i);

                NodeList nameNodeListChildren = nameIDNode.getChildNodes();
                Node nameTextNode = nameNodeListChildren.item(0);
                String nameIDValue = nameTextNode.getNodeValue();
                 if (MemberName.equals(nameIDValue)) {

                    if (i!=0) {
                        prev_id=nameIDNodeList.item(i-1).getChildNodes().item(0).getNodeValue();
                    } else {
                        prev_id=nameIDNodeList.item(num_products-1).getChildNodes().item(0).getNodeValue();
                    }

                    if (i!=(num_products-1)) {
                        next_id=nameIDNodeList.item(i+1).getChildNodes().item(0).getNodeValue();
                    } else {
                        next_id=nameIDNodeList.item(0).getChildNodes().item(0).getNodeValue();
                    }

                    transformer.setParameter("vMemberName", nameIDValue);
                    transformer.setParameter("vTopicName", nameIDValue);
                    transformer.setParameter("vPrevName", prev_id);
                    transformer.setParameter("vNextName", next_id);

                    transformer.transform(origDocSource,new StreamResult(out));
                }
            }
        } catch (Exception e) {
            out.println("Exception transformation :"+e.getMessage());
            e.printStackTrace(out);
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
