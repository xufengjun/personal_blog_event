package controller;

import com.opensymphony.xwork2.ActionSupport;
import dao.Mysql;
import model.User;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class SelectAction extends ActionSupport implements SessionAware {
    private ResultSet rs = null;
    private Statement stmt=null;

    private int id;
    private Map<String,Object> session;
    private User user = new User();
    public String select() throws Exception{
        String sql = "select * from users;";
        List<User> list = new ArrayList<>();  //集合的泛型
        rs = Mysql.getRs(sql);

        while (rs.next()){
            User temp = new User();
            temp.setId(rs.getInt(1));
            temp.setUsername(rs.getString(2));
            list.add(temp);
        }
        session.put("userlist",list);
        return "show" ;

    }

    private int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String delete() throws Exception{
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String sql3="delete from users where uid='"+getId()+"'";
        int flag = Mysql.executeUpdate(sql3);
        ResultSet rs = Mysql.getRs(sql3);
        System.out.println(sql3);
        if (flag==1){
            return "success";
        }
        else {
            return "error";
        }
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }
}
