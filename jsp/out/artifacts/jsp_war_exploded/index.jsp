<%@ page import="shit.test" %>
<%@ page import="shit.topic_bean" %>
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

    <div>
      <p id="p" style="padding: 30px">
        <%
            if (session.getAttribute("name") != null){
                if (session.getAttribute("name").equals("shit") && session.getAttribute("psw").equals("shit")) {
                    test a = new test();
                    for (int i = 0; i < a.a().size();i++){
                        out.println(a.a().get(i).getId());
                        out.println(a.a().get(i).gettopic());
                        out.println("</br>");
                        out.println("</br>");
                    }
                }
            }else{
                out.println("未登录，不让你查看内容，嘿嘿！");
            }
        %>
      </p>
    </div>

    <div id="sl"></div>

    <div id="cure">
        <form action="curd.jsp" method="get">
            <p>管理员账户的功能区</p></br>
            <a class="c" href="#" onclick="">1.增加新闻标题：</a>
                <input class="s" name="add" placeholder="要增加的序号" type="text" />
                <input class="s" name="title" placeholder="要增加的新闻标题" type="text" />
                <button class="bttn">走着！</button>
                </br></br>

            <a class="c" href="#">2.删除新闻标题：</a>
                <input style="margin-right: 175px;" name="delete" placeholder="要删除的序号" class="s" type="text" />
                <button class="bttn">走着！</button>
                </br></br>
            <a class="c" href="#">3.修改新闻标题：</a>
                <input class="s" name="change" placeholder="要修改的序号" type="text" />
                <input class="s" name="alter_content" placeholder="要修改的新闻标题" type="text" />
                <button class="bttn">走着！</button>
            </br></br>
        </form>
    </div>
    <div id="ft">
    </div>
  </body>
</html>