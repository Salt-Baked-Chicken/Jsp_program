<%@ page import="shit.page_bean" %>
<%@ page import="shit.jdbc_select" %><%--
  Created by IntelliJ IDEA.
  User: yanru
  Date: 2019/10/10
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    jdbc_select a = new jdbc_select();
    page_bean p = new page_bean();
    p.setNews_size(a.a().size());
    p.setTotal_Page_Count(p.getNews_size());
    p.setCurr_page_no(p.getTotal_page_count());
    response.sendRedirect("index.jsp");
%>
</body>
</html>
