<?PHP
require_once("./include/membersite_config.php");

if (isset($_POST['submitted'])) {
    if ($fgmembersite->Login()) {
        $fgmembersite->RedirectToURL("profile.php");
    }
}
?>
<!-- 
*
* @reference http://www.html-form-guide.com/php-form/php-registration-form.html
* @reference http://www.html-form-guide.com/php-form/php-login-form.html
* @author Nathan Ryan, x13448212
*
*/
-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- BSHC2A Team OBCT Nathan Ryan x13448212 Keith Lok x13323161 Jefferson Tolentino x13452702 Daniel Benhamou x13341086 Usman Akhtar x13358421 -->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US">
    <head>
        <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                    <title>Login</title>
                    <link rel="STYLESHEET" type="text/css" href="css/fg_membersite.css" />
                    <script type='text/javascript' src='js/gen_validatorv31.js'></script>

                    <!-- Bootstrap -->
                    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
                    <link href="css/style.css" rel="stylesheet" type="text/css" />
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
                                            <a href="login.php">Log In</a>
                                        </li>
                                        <li>
                                            <a href="logout.php">Log Out</a>
                                        </li> 
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <!-- Form Code Start -->
                        <div class='container'>
                            <form id='login' action='<?php echo $fgmembersite->GetSelfScript(); ?>' method='post' accept-charset='UTF-8'>

                                <legend>Login</legend>

                                <input type='hidden' name='submitted' id='submitted' value='1'/>

                                <div class='short_explanation'>* required fields</div>

                                <div><span class='error'><?php echo $fgmembersite->GetErrorMessage(); ?></span></div>
                                <div class='form-group'>
                                    <label for='username' >User Name*:</label><br/>
                                    <input type='text' class='form-control' name='username' id='username' placeholder="Enter User Name" value='<?php echo $fgmembersite->SafeDisplay('username') ?>' maxlength="50" /><br/>
                                    <span id='login_username_errorloc' class='error'></span>
                                </div>
                                <div class='form-group'>
                                    <label for='password' >Password*:</label><br/>
                                    <input type='password' class='form-control' name='password' id='password' placeholder="Enter password" maxlength="50" /><br/>
                                    <span id='login_password_errorloc' class='error'></span>
                                </div>

                                <button type="submit" name='submit' class="btn btn-default">Submit</button>

                            </form>
                        </div>
                        <!-- client-side Form Validations:
                        Uses the excellent form validation script from JavaScript-coder.com-->

                        <script type='text/javascript'>
                            // <![CDATA[

                            var frmvalidator = new Validator("login");
                            frmvalidator.EnableOnPageErrorDisplay();
                            frmvalidator.EnableMsgsTogether();

                            frmvalidator.addValidation("username", "req", "Please provide your username");

                            frmvalidator.addValidation("password", "req", "Please provide the password");

                            // ]]>
                        </script>

                        <!--
                        Form Code End (see html-form-guide.com for more info.)
                        -->

                        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                        <!-- Include all compiled plugins (below), or include individual files as needed -->
                        <script src="js/bootstrap.min.js"></script>
                        <script src="js/bootstrap.js"></script>

                    </body>
                    </html>