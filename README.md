[![AnswerQuest home](https://raw.githubusercontent.com/nathanryan/answerquestxml/master/AnswerQuest/screenshots/home.PNG)]

[![AnswerQuest profile](https://raw.githubusercontent.com/nathanryan/answerquestxml/master/AnswerQuest/screenshots/profile.PNG)]

[![AnswerQuest topics](https://raw.githubusercontent.com/nathanryan/answerquestxml/master/AnswerQuest/screenshots/topics.PNG)]

[![AnswerQuest quiz](https://raw.githubusercontent.com/nathanryan/answerquestxml/master/AnswerQuest/screenshots/quiz.PNG)]

[![AnswerQuest edit](https://raw.githubusercontent.com/nathanryan/answerquestxml/master/AnswerQuest/screenshots/edit.PNG)]

[![AnswerQuest leaderboard](https://raw.githubusercontent.com/nathanryan/answerquestxml/master/AnswerQuest/screenshots/leaderboard.PNG)]

-This project uses Apache Server, Jetty Server on Port 8444, Glassfish Server 4.0, eXist Database and MySQL Database on Port 3307.

-To edit the the quiz Questions and Answers, the Questions.xml from the WEB folder is required on eXist Database in a collection called 'AnswerQuest'.
-The user login for the eXist Database is 'admin' and the password is 'password'.

-To interpret the PHP files in Glassfish, Quercus 4.0.39 is required. You can find the steps to install it here --> https://blogs.oracle.com/souvik/entry/how_to_get_php_and

-The application Database in MySQL is called 'answerquest'.
-The application will create the Tables 'fgusers3' and 'teachers' the first time you run register.php but we have also provided an answerquest.sql with the queries provided.

-JAR files are also required to be placed in the library of the app. These JARs are located in a folder called 'JARS' and can be added through NetBeans by right-clicking on the app and clicking 'Properties' and heading to the 'Libraries' tab and choosing the 'Add JAR/Folder' button.



