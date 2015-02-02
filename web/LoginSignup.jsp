<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/LoginSignup.css" />
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:import url="header.jsp">
    <c:param name="title" value="Σύνδεση/Εγγραφή"> </c:param>
</c:import>
<sql:setDataSource var="ds" dataSource="jdbc/findhomedatabase" />
    <body>
        <h1>Παρακαλώ συνδεθείτε ή εγγραφείτε για να προχωρήσετε στην δημιουργία νέας αγγελίας</h1>
        
         <div id="div1">
            <h2>Έίστε ήδη χρήστης;</h2> 
            <h3>Συνδεθείτε παρακάτω:</h3>
            <h4>Όνομα Χρήστη:
            <input id="LoginUsername" type="text">
            </h4>
            <h4>Συνθηματικό:
            <input id="LoginPassword" type="text">
            </h4>
            <h4> <br> </h4>
            <h5><button type="button" onclick="signin()">Είσοδος</button></h5>
            <p id="output"></p>
        </div>
        
        <div id="div2">
            <h2>Πρώτη φορά εδώ;</h2> 
            <h3>Εγγραφείτε στην παρακάτω  φόρμα:</h3>
            <h4>Όνομα Χρήστη
            <input id="NewUsername" type="text">
            </h4>
            <h4>Κωδικός
            <input id="NewPassword" type="text">
            </h4>
            <h4>Επαλήθευση κωδικού
            <input id="ConfirmPassword" type="text">
            </h4>
            <h4>Αριθμός τηλεφώνου (για επικοινωνία με ενδεχόμενους πελάτες, προαιρετικά)
            <input id="Telephone" type="number">
            </h4>
            <h4>E-mail
            <input id="Email" type="text">
            </h4>
            <p id="demo"></p>
            <h5><button type="button" onclick="CreateUser()">Εγγραφή</button></h5>
            
        </div>
        <script>
            function CreateUser() {
                var user;
                var n;
                var pass;
                var confirm;
                var tele;
                var mail;
                user =document.getElementById("NewUsername").value;
                pass=document.getElementById("NewPassword").value;
                confirm=document.getElementById("ConfirmPassword").value;
                tele=document.getElementById("Telephone").value;
                mail=document.getElementById("Email").value;
                n= pass.localeCompare(confirm);
                if (n!==0){
                    document.getElementById("demo").innerHTML = "Οι κωδικοί είναι διαφορετικοί μεταξύ τους";
                }
                else if (pass.toString().length <5){
                    document.getElementById("demo").innerHTML = "Ο κωδικός πρόσβασης πρέπει να είναι τουλάχιστον 5 χαρακτήρες";
                }
                else if (user.toString().length <4){
                    document.getElementById("demo").innerHTML = "Δώστε ένα έγκυρο όνομα χρήστη (τουλάχιστον 4 χαρακτήρες)";
                }
                else if (mail.indexOf("@")=== -1|| mail.indexOf(".")=== -1){
                   document.getElementById("demo").innerHTML = "Δώστε ένα έγκυρο e-mail";
                }
                else if ((tele.toString().length !==10) && (tele.toString().length !==0)){
                    document.getElementById("demo").innerHTML = "Δώστε έναν έγκυρο αριθμό τηλεφώνου";
                }
                else{
                    <sql:update dataSource="${ds}" var="results">
                        INSERT INTO `userdatabase`(`Username`, `Password`, `PhoneNumber`, `Email`) VALUES ( 'user','kodikos',0,'xristis@gmail.com');
                    </sql:update>
                    document.getElementById("demo").innerHTML = "Η εγγραφή ολοκληρώθηκε με επιτυχία";
                }
            }
            function signin(){
                var username;
                username=document.getElementById("LoginUsername").value;
            }
        </script>
     
       
    </body>
