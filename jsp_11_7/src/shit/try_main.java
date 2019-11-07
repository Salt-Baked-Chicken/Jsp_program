package shit;

public class try_main {
        public static void main(String args[]){
                jdbc_select_limitpage b = new jdbc_select_limitpage();
                b.a(1);
                System.out.println(
                        b.a(0).get(0).getId());
        }
}
