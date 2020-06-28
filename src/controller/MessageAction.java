package controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import dao.Mysql;
import model.Message;
import model.User;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class MessageAction extends ActionSupport implements ModelDriven<Message> {
    private User user = new User();
    private ResultSet rs = null;
    private int id;
    private Map<String,Object> session;
    private Message message=new Message();
    public String send() throws Exception{
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String sql = "insert into themessage(username,message) values('"+message.getName()+"','"+message.getMessage()+"')";
        System.out.println(sql);
        int flag = Mysql.executeUpdate(sql);
        if (flag == 1){
//            out.print("<script>alert('发送成功！！！')</script>");
//            out.print("<script>window.location.href='blogartical.jsp'</script>");
//            out.close();
            return "success";
        }

        else {
//            out.print("<script>alert('发送失败！！！')</script>");
//            out.print("<script>window.location.href='blogartical.jsp'</script>");
//            out.close();
            return "error";
        }
    }

    private int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    @Override
    public Message getModel() {
        return message;
    }
}
