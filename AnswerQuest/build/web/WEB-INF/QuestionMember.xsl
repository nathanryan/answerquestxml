<?xml version="1.0" encoding="UTF-8" ?>
<!-- BSHC2A Team OBCT Nathan Ryan x13448212 Keith Lok x13323161 Jefferson Tolentino x13452702 Daniel Benhamou x13341086 Usman Akhtar x13358421 -->
<!--*
*
* @reference http://getbootstrap.com/
* @author Nathan Ryan, x13448212
* @author Keith Lok, x13323161
* @author Daniel Benhamou x13341086
*-->
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:include href="topinclude.xsl"/>
	
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
                        <center>
                            <h4>Enter Player Name To Save Your Score !</h4>
                            <input type="text" name="username" placeholder="" />
                            <br/>           
                        </center>
                        <!--Score-->
                        <center>
                            <label for="scr">
                                <abbr title="Score">Score</abbr>
                            </label>
                        </center>
                        <center>
                            <p>Your score is: <a id="score"></a></p>
                            
                            <button type="button" class="start" onclick="scoreMessage()"> Save Score </button>
                            <button  onClick="tweetscore()"> Tweet Score </button>
                            <br />
                            <p id="scoremessage" ></p>
                        </center>
                        <!--Score-->
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
                                        <xsl:attribute name="href">QuestionMemberServlet?name=<xsl:value-of select="$vPrevName"/></xsl:attribute>
                                        <button type="button" class="btn btn-default" > Previous Question </button>
                                    </xsl:element>
                                    | <xsl:element name="a">
                                        <xsl:attribute name="href">QuestionMemberServlet?name=<xsl:value-of select="$vNextName"/></xsl:attribute>
                                        <button type="button" class="btn btn-default" > Next Question </button>
                                    </xsl:element>
                                    | <a href="profile.php"><button type="button" class="btn btn-default start" onclick="scoreMessage()" > Quit Quiz </button></a>
                                
                                </div>
                            </div>
                        </div> 
                        <!-- CONTENT -->
                        <div class="container answers">
                            <div class="row">
                                <div class="col-md-3">
                                    <!-- FOR SPACING -->
                                </div>
                                <div class="col-md-3 answer" id="DivA">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">Answer</div>
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
                                                    <button type="button" class="btn btn-default" onClick="addScore()" >Select Answer</button>
                                                    <br />
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                         
                                <div class="col-md-3 answer" id="DivB">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">Answer</div>
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
                                                    <button type="button" class="btn btn-default" >Select Answer</button>
                                                    <br />
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
                        <script src="js/scripts.js"></script>
                        <script src="js/randomize.js"></script>
                        
        	
                    </xsl:if>
                </xsl:for-each>
            </body>
                
        </html>
            
    </xsl:template>
	
</xsl:transform>