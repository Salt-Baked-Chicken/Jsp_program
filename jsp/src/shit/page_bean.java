package shit;

import java.util.List;

public class page_bean {
    public static int curr_page_no; //当前页数
    public static int total_page_count; //总页数
    private int page_size = 4; //每页显示数量
    private int news_size; //新闻总数目

    public int getLast_page_news() {
        return last_page_news;
    }

    public void setLast_page_news(int last_page_news) {
        this.last_page_news = last_page_news;
    }

    private int last_page_news;//余页数

    public int getNews_size() {
        return news_size;
    }

    public void setNews_size(int news_size) {
        this.news_size = news_size;
    }

    List<topic_bean> news_list; //接收集合

    public int getCurr_page_no() {
        return curr_page_no;
    }

    public void setCurr_page_no(int curr_page_no) {
        this.curr_page_no = curr_page_no;
    }

    public int getPage_size() {
        return page_size;
    }

    public void setPage_size(int page_size) {
        this.page_size = page_size;
    }

    public int getTotal_page_count() {
        return total_page_count;
    }

    public void setTotal_Page_Count(int news_size) {
        // 总页计算
        // news_size
        if (news_size > 0) {
            this.news_size = news_size;
            // 三元表达式，？前的第一项为判断条件，
            // 返回true则执行冒号前一项代码，返回false执行冒号后一项代码
            total_page_count = (this.news_size % page_size == 0) ?
            (this.news_size / page_size) : ((this.news_size / page_size) + 1);
        }
    }

    public List<topic_bean> getNews_list() {
        return news_list;
    }

    public void setNews_list(List<topic_bean> news_list) {
        this.news_list = news_list;
    }
}
