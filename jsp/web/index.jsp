<%@ page import="shit.test" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <link rel="stylesheet" type="text/css" href="refresh_css.css">
    <link rel="stylesheet" type="text/css" href="index_css.css">
  </head>
  <body>
    <div id="b">
      <a id="h">newsomething</a>
      <div id="ss">
        <form action="topic_control.jsp" method="post">
          <input class="s" value="shit" name="name">
          <input class="s" value="shit" name="psw">
          <button class="btn" type="submit">登陆</button>
        </form>
      </div>
    </div>

    <div id="n">
      <p id="p" style="padding: 30px">
        <%
            if (session.getAttribute("name") != null){
                if (session.getAttribute("name").equals("shit") && session.getAttribute("psw").equals("shit")) {
                    test a = new test();
                    out.println(a.a().get(0).getId());
                    out.println(a.a().get(0).gettopic());
                    out.println("</br>");
                    out.println("</br>");
                    out.println(a.a().get(1).getId());
                    out.println(a.a().get(1).gettopic());
                    out.println("</br>");
                    out.println("</br>");
                    out.println(a.a().get(2).getId());
                    out.println(a.a().get(2).gettopic());
                    out.println("</br>");
                    out.println("</br>");
                    out.println(a.a().get(3).getId());
                    out.println(a.a().get(3).gettopic());
                }
            }else{
                out.println("未登录，不让你查看内容，嘿嘿！");
            }
        %>
      </p>
    </div>

    <div id="jure">
        <p>========================================================================================================</p></br>
        <p>管理员账户的功能区</p></br>
        <a class="c" href="#" onclick="">1.增加新闻标题：</a>
            <input class="s" placeholder="要增加的序号" type="text">
            <input class="s" placeholder="要增加的新闻标题" type="text">
            <button class="bttn">走着！</button>
            </br></br>

        <a class="c" href="#">2.删除新闻标题：</a>
            <input style="margin-right: 175px;" placeholder="要删除的序号" class="s" type="text">
            <button class="bttn">走着！</button>
            </br></br>
        <a class="c" href="#">3.修改新闻标题：</a>
            <input class="s" placeholder="要修改的序号" type="text">
            <input class="s" placeholder="要修改的新闻标题" type="text">
            <button class="bttn">走着！</button>
            </br></br>
    </div>
    <div id="ft">
    </div>
  </body>
</html>