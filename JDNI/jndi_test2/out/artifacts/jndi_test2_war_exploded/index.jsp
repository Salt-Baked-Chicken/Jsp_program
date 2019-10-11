<%@ page language="java" import="java.util.*,java.sql.*,dao.*" pageEncoding="UTF-8"%>
<%@ page import="dao.BaseDao" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>测试数据源连接池</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    <%
    BaseDao baseDao = new BaseDao();
    Connection conn = baseDao.getConnection();
    if(conn==null)
    	out.print("获取数据库连接失败");
    else {
    	out.print("获取数据库连接成功");
    	baseDao.closeAll(conn, null, null);

    }
    %>
  </body>
</html>
