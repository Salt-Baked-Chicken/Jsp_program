<%@ page import="shit.jdbc_select" %>
<%@ page import="shit.page_bean" %>
<%@ page import="shit.jdbc_select_limitpage" %>
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
        <form action="login_control.jsp" method="post">
          <input class="s" value="shit" name="name">
          <input class="s" value="shit" name="psw">
          <button class="btn" type="submit">登陆</button>
        </form>
      </div>
    </div>

    <p>// 已知bug1，第一次打开页面没有问题，但是在尾页关闭后，再次打开，余页值会为null无法被向下转型，导致报错页面爆炸</p>
    <p>// 已知bug2，开启页直接点末页会导致null值爆炸，通过末页page_control4做判断解决</p>
    <p>// bug1已解决，方法是做尾页判断，现在有三个检测，页数超了，等于尾页，和不等于尾页时</p>
    <div>
      <p id="p" style="padding: 30px">
        <%  //建对象并初始化当前页面值
            jdbc_select a = new jdbc_select();
            jdbc_select_limitpage sl = new jdbc_select_limitpage();
            page_bean p = new page_bean();
            if (p.getCurr_page_no() == 0){
                p.setCurr_page_no(1);
            }
            // 利用全查询计算当前新闻条目数量
            // 利用计算出的条目数，计算总共页数
            // 在下方通过总页数计算输出条目
            p.setNews_size(a.a().size()+1);
            p.setTotal_Page_Count(p.getNews_size());

            // 检测账户登陆
            if (session.getAttribute("name") != null) {
                if (session.getAttribute("name").equals("shit") && session.getAttribute("psw").equals("shit")) {

                    // 页数作为下标传入limit限制数num计算
                    int num;
                    if (p.getCurr_page_no() == 1) {
                        num = p.getCurr_page_no() - 1;
                    } else {
                        num = (p.getCurr_page_no() - 1) * 4;
                    }
                    // 防止尾页数组越界检测,如果整数正常输出，余数则在余数页用余数作为for的i下标
                    if(p.getCurr_page_no() > p.getTotal_page_count() | p.getNews_size()==0) {
                        out.println("那不行，你页数超了，或者数据库没有新闻，点击首页返回");
                    }else if (p.getCurr_page_no() != p.getTotal_page_count()) {
                        for (int i = 0; i < p.getPage_size(); i++) {
                            out.println(sl.a(num).get(i).getId());
                            out.println(sl.a(num).get(i).gettopic());
                            out.println("</br>");
                            out.println("</br>");
                        }
                    }else if (p.getCurr_page_no() == p.getTotal_page_count()) {
                        if (session.getAttribute("p") == null){

                        }
                        int abb = Integer.parseInt(String.valueOf(session.getAttribute("p")));
                        p.setLast_page_news(abb);
                        for (int i = 0; i < p.getLast_page_news() - 1; i++) {
                            System.out.println(p.getLast_page_news());
                            out.println(sl.a(num).get(i).getId());
                            out.println(sl.a(num).get(i).gettopic());
                            out.println("</br>");
                            out.println("</br>");
                        }
                    }
                }
            }else {
                out.println("未登录，不让你查看内容，嘿嘿！");
            }
        %>
      </p>
    </div>

    <div id="control_page">
        <div>
            <a class="page_m">当前页数
                <%
                    out.println(p.getCurr_page_no());
                %>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </a>
            <a class="page_m">每页显示条目
                <%
                    out.println(p.getPage_size());
                %>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </a>
            <a class="page_m">新闻总条目
                <%//设置新闻总数目
                    out.println(p.getNews_size());
                %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </a>
            <a class="page_m">总共页数
                <%  //设置总共页数
                    out.println(p.getTotal_page_count());
                %>
            </a>
        </div>

        <div id="pcbtn">
            <button onclick="window.location='page_control1.jsp'" class="bttn">首页</button>
            <button onclick="window.location='page_control2.jsp'" class="bttn">上一页</button>
            <button onclick="window.location='page_control3.jsp'" class="bttn">下一页</button>
            <button onclick="window.location='page_control4.jsp'" class="bttn">末页</button>
        </div>
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