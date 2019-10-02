<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="shit.test" %>
<%@ page import="java.util.Timer" %>
<%@ page import="java.util.TimerTask" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String name = request.getParameter("name");
        String psw = request.getParameter("psw");
        if (name.equals("shit")&& psw.equals("shit")){
            response.sendRedirect("index.jsp");
            session.setAttribute("name",name);
            session.setAttribute("psw",psw);
            session.setMaxInactiveInterval(60*10);
        }else{
            out.println("妈的，你账号不对");
        }
    %>
</body>
</html>
