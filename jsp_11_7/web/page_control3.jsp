<%@ page import="shit.page_bean" %>
<%@ page import="shit.jdbc_select" %><%--
  Created by IntelliJ IDEA.
  User: yanru
  Date: 2019/10/10
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    jdbc_select s = new jdbc_select();
    page_bean p = new page_bean();
    p.setCurr_page_no(p.getCurr_page_no()+1);

    if (p.getCurr_page_no() == p.getTotal_page_count()){
        p.setNews_size(s.a().size()+1);
        p.setLast_page_news(p.getNews_size() % p.getPage_size());
        session.setAttribute("p",p.getLast_page_news());
    }
    response.sendRedirect("index.jsp");
%>
</body>
</html>
