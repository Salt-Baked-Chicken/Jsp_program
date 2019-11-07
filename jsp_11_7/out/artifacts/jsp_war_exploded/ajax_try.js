$(document).ready(function(){
    $("button1").click(function(){
        $.get("servlet1.java",function(data,status){
            alert("数据: " + data + "\n状态: " + status);
        });
    });
});