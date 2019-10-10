<%@ page import="shit.page_bean" %><%--
  Created by IntelliJ IDEA.
  User: yanru
  Date: 2019/10/10
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    page_bean p = new page_bean();
    p.setCurr_page_no(p.getCurr_page_no()-1);
    response.sendRedirect("index.jsp");
%>
</body>
</html>
