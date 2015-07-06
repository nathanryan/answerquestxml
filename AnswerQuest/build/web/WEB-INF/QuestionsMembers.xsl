<?xml version="1.0" encoding="UTF-8" ?>
<!-- BSHC2A Team OBCT Nathan Ryan x13448212 Keith Lok x13323161 Jefferson Tolentino x13452702 Daniel Benhamou x13341086 Usman Akhtar x13358421 -->
<!--*
*
* @reference http://getbootstrap.com/
* @author Nathan Ryan, x13448212
* @author Daniel Benhamou x13341086
*-->
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:include href="topinclude.xsl"/>
    <xsl:param name="vTopicName"/>
	
    <xsl:template match="*">
        <xsl:apply-templates select="topic"/>
    </xsl:template>
        
    <xsl:template match="topic">
        <xsl:if test="topicname=$vTopicName">
            <xsl:apply-templates select="questionmembers"/>
        </xsl:if>
    </xsl:template>
          
    <xsl:template match="questionmembers">
        <html> 
            <head>
                <title> Questions </title>
                <link href="css/bootstrap.min.css" rel="stylesheet"/>
                <link href="css/style.css" rel="stylesheet"/>
            </head>
            <body> 
                <!-- CONTENT --> 
                <center>
                    <h1>Select a Question to Begin !</h1>
                </center>
                <xsl:for-each select="question"> 
                    <div class="col-md-3">
				<!-- FOR SPACING -->
			</div>
                          
                    <div class="col-md-8">
                        <div class="panel panel-success">
                            <div class="panel-heading" >
                                <xsl:element name="a">
                                    <xsl:attribute name="href">QuestionMemberServlet?name=<xsl:value-of select="name"/></xsl:attribute>
                                    <xsl:value-of select="name"/>
                                </xsl:element>
                            </div>
                        
                        </div>
                    </div>
                </xsl:for-each>
                    
                    
                        
                        
                      
                    
                
                <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                <!-- Include all compiled plugins (below), or include individual files as needed -->
                <script src="js/bootstrap.min.js"></script>
                <script src="js/bootstrap.js"></script>
            </body> 
        </html>
    </xsl:template>
</xsl:transform>