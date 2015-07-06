<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- BSHC2A Team OBCT Nathan Ryan x13448212 Keith Lok x13323161 Jefferson Tolentino x13452702 Daniel Benhamou x13341086 Usman Akhtar x13358421 -->
<!--*
*
* @reference http://getbootstrap.com/
* @author Nathan Ryan, x13448212
*
*-->   
    <xsl:template match="/">
        <html>
            <head>
                <title>AnswerQuest</title>
                
                <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
                <link rel="stylesheet" type="text/css" href="css/style.css"/>
                
                <script type="text/javascript" src="js/bootstrap.min.js"></script>
            
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
                           
                        </div>
                    </div>
                </div>
        
                <!-- Main jumbotron for a primary marketing message or call to action -->
                <div class="container">
                    <div class="jumbotron" style="background-image: url(img/colour.jpg);">
                        <h1>WELCOME TO ANSWERQUEST !</h1>
                        <p>HAVE FUN LEARNING !</p>
                    </div>
      

                    <div class="btn-group-vertical" role="group" aria-label="...">
                        
                        <a href="register.php">
                            <div class="btn-group btn-group-lg" role="group">
                                <button type="button" class="btn btn-primary">Student Register</button>
                            </div>
                        </a>
                    </div>
                    <div class="btn-group-vertical" role="group" aria-label="...">
                        
                        <a href="login.php">
                            <div class="btn-group btn-group-lg" role="group">
                                <button type="button" class="btn btn-primary">Student Log In</button>
                            </div>
                        </a>
                    </div>
                    
                   
            
                    <div class="btn-group-vertical" role="group" aria-label="...">
                        
                        <a href="adminregister.php">
                            <div class="btn-group btn-group-lg" role="group">
                                <button type="button" class="btn btn-info">Teacher Register</button>
                            </div>
                        </a>
                    </div>
                    
                    <div class="btn-group-vertical" role="group" aria-label="...">
                        
                        <a href="adminlogin.php">
                            <div class="btn-group btn-group-lg" role="group">
                                <button type="button" class="btn btn-info">Teacher Log In</button>
                            </div>
                        </a>
                    </div>
                    <br />
                    <br />
                   <div class="col-md-12">
                     <div class="panel panel-default">
                        
                         <div class="panel-body">
                             <p>Welcome to AnswerQuest ! Here you can revise content learned in school and play quizzes to test your knowledge.</p>
                         <p>Compare results with your friends on the leaderboard to see who's top of the class !  </p> 
                     </div>
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


