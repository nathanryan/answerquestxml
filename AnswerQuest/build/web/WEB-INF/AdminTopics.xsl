<?xml version="1.0" encoding="UTF-8"?>
<!-- BSHC2A Team OBCT Nathan Ryan x13448212 Keith Lok x13323161 Jefferson Tolentino x13452702 Daniel Benhamou x13341086 Usman Akhtar x13358421 -->
<!--*
*
* @reference http://getbootstrap.com/
* @author Nathan Ryan, x13448212
*
*-->
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:include href="topinclude.xsl"/>

 
    <xsl:param name="vTopicName"/>
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    
    <xsl:template match="*">
        <xsl:apply-templates select="topic"/>
    </xsl:template>
    
    
	
    <xsl:template match="topic"> 
        <html>
            <head> 
                <title> Topics </title> 
                <!-- Bootstrap -->
                <link href="css/bootstrap.min.css" rel="stylesheet"/>
                <link href="css/style.css" rel="stylesheet"/>
                
                <style>
                    img{
                    width: 500px;
                    height: 300px;
                    }
                    
                </style>
            </head>
    
            <body>
                <!-- CONTENT -->    
                <div class="col-md-12">
                    <div class="panel panel-success">
                        <div class="panel-heading" >
                            <xsl:element name="a" >
                                <xsl:attribute name="href">AdminQuestionsMembersServlet?name=<xsl:value-of select="topicname"/></xsl:attribute>
                                         
                                <xsl:value-of select="topicname" />
                            </xsl:element>
                            
                        </div>
                        <div class="panel-body">
                            <xsl:value-of select="topicinfo"/>
                              <br />
                            <xsl:element name="img">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="topicimage"/>
                                </xsl:attribute>
                            </xsl:element>                        
                        </div>
                    </div>
                </div>
                           
                <!-- Bootstrap core JavaScript
                ================================================== -->
                <!-- Placed at the end of the document so the pages load faster -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                <script src="js/bootstrap.min.js"></script>
                <script src="js/docs.min.js"></script>
            </body>
        </html>
    </xsl:template>
</xsl:transform>
