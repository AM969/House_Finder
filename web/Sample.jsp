<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/index.css" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource var="ds" dataSource="jdbc/webshop" />
<!-- this is from context.xml and web.xml in Configurations files, we take the code from here: http://tomcat.apache.org/tomcat-7.0-doc/jndi-datasource-examples-howto.html -->

<sql:query dataSource="${ds}" sql="select * from images order by average_ranking desc" var="results" />
<!-- ${ds} is from var="ds" from sql:setDataSource -->

<!DOCTYPE html>
<c:import url="header.jsp">
    <c:param name="title" value="Picture Squirrel Home"></c:param>
</c:import>
<html>
    
    <body>
        
    </body>
</html>

mysql_query("INSERT INTO userdatabase VALUES ('$user', '$pass', '$tele', '$mail')") or die(mysql_error());
<sql:update dataSource="${ds}" var="results">
      INSERT INTO userdatabase VALUES ( user, pass, tele, mail);
</sql:update>

sql= "UPDATE `userdatabase` VALUES ( $user, $pass, $tele, $mail)";

function signin(){
                var username;
                username=document.getElementById("LoginUsername").value;
                <sql:query dataSource="${ds}" var="result1"> 
                        sql= "select * from userdatabase order_by Username";
                </sql:query>
                <table class="images">

                <c:set var="tablewidth" value="4" />
            }