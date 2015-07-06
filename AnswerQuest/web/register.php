<?PHP
require_once("./include/membersite_config.php");

if (isset($_POST['submitted'])) {
    if ($fgmembersite->RegisterUser()) {
        $fgmembersite->RedirectToURL("thank-you.html");
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
<!-- BSHC2A Team OBCT Nathan Ryan x13448212 Keith Lok x13323161 Jefferson Tolentino x13452702 Daniel Benhamou x13341086 Usman Akhtar x13358421 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US">
    <head>
        <meta http-equiv='Content-Type' content='text/html; charset=utf-8'/>
        <title>Register</title>
        <link rel="STYLESHEET" type="text/css" href="css/fg_membersite.css" />
        <script type='text/javascript' src='js/gen_validatorv31.js'></script>
        <link rel="STYLESHEET" type="text/css" href="css/pwdwidget.css" />
        <script src="js/pwdwidget.js" type="text/javascript"></script>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
            <link href="css/style.css" rel="stylesheet" type="text/css">	
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
                    <div class="container">
                        <form id='register' action='<?php echo $fgmembersite->GetSelfScript(); ?>' method='post' accept-charset='UTF-8'>

                            <legend>Register</legend>

                            <input type='hidden' name='submitted' id='submitted' value='1'/>

                            <div class='short_explanation'>* required fields</div>

                            <div><span class='error'><?php echo $fgmembersite->GetErrorMessage(); ?></span></div>
                            <div class='form-group'>
                                <label for='name' >Your Full Name*: </label><br/>
                                <input type='text' class='form-control' name='name' id='name' placeholder="Please enter your full name" value='<?php echo $fgmembersite->SafeDisplay('name') ?>' maxlength="50" /><br/>
                            </div>
                            <div class='form-group'>
                                <label for='email' >Email Address*:</label><br/>
                                <input type='text' class='form-control' name='email' id='email' placeholder="Enter email" value='<?php echo $fgmembersite->SafeDisplay('email') ?>' maxlength="50" /><br/>
                            </div>
                            <div class='form-group'>
                                <label for='username' >User Name*:</label><br/>
                                <input type='text' class='form-control' name='username' id='username' placeholder="Please choose a user name" value='<?php echo $fgmembersite->SafeDisplay('username') ?>' maxlength="50" /><br/>
                            </div>
                            <div class='form-group'>
                                <label for='password' >Password*:</label><br/>
                                <input type='password' class='form-control' name='password' id='password' placeholder="Enter password" maxlength="50" />
                            </div>

                            <button type="submit" class="btn btn-default">Submit</button>

                        </form>
                    </div>
                    <!-- client-side Form Validations:
                    Uses the excellent form validation script from JavaScript-coder.com-->

                    <script type='text/javascript'>
                        // <![CDATA[
                        var pwdwidget = new PasswordWidget('thepwddiv', 'password');
                        pwdwidget.MakePWDWidget();

                        var frmvalidator = new Validator("register");
                        frmvalidator.EnableOnPageErrorDisplay();
                        frmvalidator.EnableMsgsTogether();
                        frmvalidator.addValidation("name", "req", "Please provide your name");

                        frmvalidator.addValidation("email", "req", "Please provide your email address");

                        frmvalidator.addValidation("email", "email", "Please provide a valid email address");

                        frmvalidator.addValidation("username", "req", "Please provide a username");

                        frmvalidator.addValidation("password", "req", "Please provide a password");

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