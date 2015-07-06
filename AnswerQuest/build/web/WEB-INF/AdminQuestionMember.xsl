<?xml version="1.0" encoding="UTF-8" ?>
<!-- BSHC2A Team OBCT Nathan Ryan x13448212 Keith Lok x13323161 Jefferson Tolentino x13452702 Daniel Benhamou x13341086 Usman Akhtar x13358421 -->
<!--*
*
* @reference http://getbootstrap.com/
* @author Nathan Ryan, x13448212
*
*-->
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:include href="admintopinclude.xsl"/>
	
    <xsl:param name="vNextName"/>
    <xsl:param name="vPrevName"/>
    <xsl:param name="vMemberName"/>
        
	
    <xsl:template match="*">
        <xsl:apply-templates select="topic/questionmembers"/>
    </xsl:template>
	
	
    <xsl:template match="questionmembers">
            
        <html> 
            <head> 
                <title> Question </title>
                <!-- Bootstrap -->
                <link href="css/bootstrap.min.css" rel="stylesheet"/>
                <link href="css/style.css" rel="stylesheet"/>
            </head>
            <body>        
                <xsl:for-each select="question">
                    <xsl:if test="./name=$vMemberName">   
                        <div class="container">
                            <div class="panel panel-success">
                                <div class="panel-heading">Question </div>
                                <div class="panel-body">
                            
                                    <b>
                                        <xsl:value-of select="./name"/> :                                     
                                    </b>
                                    
                                    <br/>
                                    <xsl:for-each select="./questiontext">
                                        <xsl:value-of select="."/>
                                    </xsl:for-each>
                                  
                              
			    

                                    <hr/>
                                    <xsl:element name="a">
                                        <xsl:attribute name="href">AdminQuestionMemberServlet?name=<xsl:value-of select="$vPrevName"/></xsl:attribute>
                                        <button type="button" class="btn btn-default" > Previous Question </button>
                                    </xsl:element>
                                    | <xsl:element name="a">
                                        <xsl:attribute name="href">AdminQuestionMemberServlet?name=<xsl:value-of select="$vNextName"/></xsl:attribute>
                                        <button type="button" class="btn btn-default" > Next Question </button>
                                    </xsl:element>
                                    | <xsl:element name="a">
                                        <xsl:attribute name="href">UpdateServlet?name=<xsl:value-of select="$vMemberName"/></xsl:attribute>
                                        <button type="button" id="100h" class="btn btn-default" > Modify Question </button>
                                    </xsl:element>
                                
                                </div>
                            </div>
                        </div> 
                        <!-- CONTENT -->
                        <div class="container">
                            <div class="row">
                                <div class="col-md-3">
                                    <!-- FOR SPACING -->
                                </div>
                                <div class="col-md-3" id="DivA">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">Answer One </div>
                                        <div class="panel-body">
            
                                    
                                            <xsl:if test="./name=$vMemberName">
                                                <b>
                                                    <xsl:value-of select="./correct"/>
                                                </b>    
                                                <br/>
                                            </xsl:if>
                                    
                                    
                                            <div class="btn-group" role="group">
                                                <a href="#">
                                                    <br/>
                                                    <button type="button" id="100h" class="btn btn-default" onClick="addScore()" >Select Answer</button>
                                                    <br />
                                                    <!--POPUP-->    
                                                    <div id="blanket" style="display:none;"></div>
                                                    <div id="popUpDivCorrect" style="display:none;">
                    
                                                    </div>	
                                                    <!-- / POPUP--> 
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                         
                                <div class="col-md-3" id="DivB">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">Answer Two</div>
                                        <div class="panel-body">
                                    
                                        

                                            <xsl:if test="./name=$vMemberName">
                                                <b>
                                                    <xsl:value-of select="./incorrect"/>
                                                </b>
                                                <br/>
                                            </xsl:if>
                                       
                                    
                                            <div class="btn-group" role="group">
                                                <a href="#">
                                                    <br/>
                                                    <button type="button" id="75h" class="btn btn-default" onclick="modify_scr(-50);">Select Answer</button>
                                                    <br />
                                                    <!--POPUP-->    
                                                    <div id="blanket" style="display:none;"></div>
                                                    <div id="popUpDivIncorrect" style="display:none;">
                    
                                                    </div>	
                                                    <!-- / POPUP--> 
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3" id="DivC">
                                    <div class="panel panel-primary">
                                        <div class="panel-body">
                                    
                                            <xsl:if test="./name=$vMemberName">
                      
                                                The correct answer is
                                                <b>
                                                    <xsl:value-of select="./correct"/>
                                                </b>    !
                                                <br/>
                                        
                                            </xsl:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <!-- FOR SPACING -->
                            </div>
                            <div class="col-md-3">
                                <!-- FOR SPACING -->
                            </div>
                        </div>
                        
                       
                
                
                        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                        <!-- Include all compiled plugins (below), or include individual files as needed -->
                        <script src="js/bootstrap.min.js"></script>
                        <script src="js/bootstrap.js"></script>
                        <script src="js/divfade.js"></script>
                        <script src="js/healthbar.js"></script>
                        <script src="js/script.js"></script>
                        <script src="js/scripts.js"></script>
                        
        	
                    </xsl:if>
                </xsl:for-each>
            </body>
                
        </html>
            
    </xsl:template>
	
</xsl:transform>