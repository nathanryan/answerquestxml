<?xml version="1.0" encoding="UTF-8" ?>
<!-- BSHC2A Team OBCT Nathan Ryan x13448212 Keith Lok x13323161 Jefferson Tolentino x13452702 Daniel Benhamou x13341086 Usman Akhtar x13358421 -->
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
        <html>
            <head>
                <title>ANSWERQUEST</title>
                <!-- Bootstrap -->
                <link href="css/bootstrap.min.css" rel="stylesheet"/>
                <link href="css/style.css" rel="stylesheet"/>
            </head>
            <body>
                <div class="navbar navbar-inverse navbar-static-top">
                    <div class="container">
                        <a href="home" class="navbar-brand">ANSWERQUEST, THE QUEST FOR ANSWERS!</a>
                        <button class="navbar-toggle" data-toggle="collapse" data-target=".navHeaderCollapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <div class="collapse navbar-collapse navHeaderCollapse">
                            <ul class="nav navbar-nav navbar-right">		
                                <li>
                                    <a href="profile.php">Profile</a>
                                </li>
                                <li>
                                    <a href="topics">Topics</a>
                                </li>
                                <li>
                                    <a href="logout.php">Log Out</a>
                                </li> 
                            </ul>
                        </div>
                    </div>
                </div>
                <xsl:apply-templates select="*"/>
              
            </body>
        </html>
    </xsl:template>

</xsl:transform>