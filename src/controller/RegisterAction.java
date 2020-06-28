package controller;
import com.opensymphony.xwork2.ActionContext;
import model.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import dao.Mysql;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;

public class RegisterAction extends ActionSupport implements ModelDriven<User> {
    private User user = new User();//模型驱动
    private Connection conn;
    private ResultSet n = null;
    private PreparedStatement stmt = null;
    private ResultSet rs;
    private Map<String, Object> session;

    public String register() throws Exception{
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String sql = "select * from users where uname = '"+user.getUsername()+"'";
        ResultSet rs = Mysql.getRs(sql);
        System.out.println(sql);
        if (rs.next()){
            out.print("<script>alert('用户已注册！！！')</script>");
            out.print("<script>window.location.href='/Book_Information_System/register.jsp'</script>");
            out.close();
            return "error";
        }else{
            sql = "insert into users(uname,upwd) values('"+user.getUsername()+"','"+user.getPassword()+"')";
            System.out.println(sql);
            int flag = Mysql.executeUpdate(sql);
            if (flag == 1){
                return "success";
            }
            else {
                out.print("<script>alert('注册失败！！！')</script>");
                out.print("<script>window.location.href='/Book_Information_System/register.jsp'</script>");
                out.close();
                return "error";
            }
        }
    }

    @Override
    public User getModel() {
        return user;
    }
}
