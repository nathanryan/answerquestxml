<?xml version="1.0" encoding="UTF-8" ?>
<!-- BSHC2A Team OBCT Nathan Ryan x13448212 Keith Lok x13323161 Jefferson Tolentino x13452702 Daniel Benhamou x13341086 Usman Akhtar x13358421 -->
<!--/**
 *
 * @reference Eugene McLaughlin
 * @author Daniel Benhamou, x13341086 
 * 
 */ -->
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
                <title>Update Question member</title>
                <!-- Bootstrap -->
                <link href="css/bootstrap.min.css" rel="stylesheet"/>
                <link href="css/style.css" rel="stylesheet"/>
            </head>
            <body>
                <div class='container'>
                    <xsl:for-each select="question">
                        <xsl:if test="./name=$vMemberName"> 
                            <!-- Generate Qs -->
                            <form name="myform">
                                <select name="optone" size="1" onchange="setOptions(document.myform.optone.options [document.myform.optone.selectedIndex].value);">
                                    <option value=" " selected="selected"> </option>
                                    <option value="1">Geography</option>
                                    <option value="2">History</option>

                                </select>
                                <br /> 
                                <br />
                                <select name="opttwo" size="1">
                                    <option value=" " selected="selected">Please select one of the options above first</option>
                                </select>
                            </form>
                    
                            <input type="button" onclick="setText()" value="Generate Question" />
                            <!-- Generate Qs -->
                            <center>
                                <b>Question Number :</b> 
                                <xsl:value-of select="./name"/>
                            </center>
                            <br />
                            <form method="post" action="AdminQuestionMemberServlet" id="form1" name="form1">
                            
                            
                                <xsl:element name="input">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="./name"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="type">hidden</xsl:attribute>
                                    <xsl:attribute name="name">name</xsl:attribute>
                                </xsl:element>
                                
                                <label for='questiontext' >Question Text:</label>
                                <input name="input" type="text" class="form-control" id="myText" >
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="./questiontext"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="type">text</xsl:attribute>
                                    <xsl:attribute name="size">100</xsl:attribute>
                                    <xsl:attribute name="name">questiontext</xsl:attribute>
                                </input>
                                        
                                 <label for='correctans' >Correct Answer:</label>
                                <input type="usr" class="form-control" id="text2">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="./correct"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="type">text</xsl:attribute>
                                    <xsl:attribute name="size">100</xsl:attribute>
                                    <xsl:attribute name="name">correct</xsl:attribute>
                                </input>
                                
                                <label for='incorrectans' >Incorrect Answer:</label>
                                <input type="usr" class="form-control" id="text3">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="./incorrect"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="type">text</xsl:attribute>
                                    <xsl:attribute name="size">100</xsl:attribute>
                                    <xsl:attribute name="name">incorrect</xsl:attribute>
                                </input>
                                <br />
                                <input type="submit" value="Update Question" />
                                <xsl:element name="a">
                                    <xsl:attribute name="href">AdminQuestionMemberServlet?name=<xsl:value-of select="$vMemberName"/></xsl:attribute>
                                    <input type="button" value="Cancel"/>
                                </xsl:element>
                            </form>
        
                            <hr />

                            <xsl:element name="a">
                                <xsl:attribute name="href">AdminQuestionMemberServlet?name=<xsl:value-of select="$vMemberName"/></xsl:attribute>
                                Back to Question
                            </xsl:element>
                        </xsl:if>
                    </xsl:for-each>
                    
                </div>
                <!-- Bootstrap core JavaScript
                ================================================== -->
                <!-- Placed at the end of the document so the pages load faster -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                <script src="js/bootstrap.min.js"></script>
                <script src="js/docs.min.js"></script>
                <script src="js/generate.js"></script>
                    
               
            </body>
        </html>	
    </xsl:template>
	
</xsl:transform>