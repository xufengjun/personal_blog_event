package controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import dao.Mysql;
import model.BlogArtical;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;

public class WriteBlogAction extends ActionSupport implements ModelDriven<BlogArtical> {
    private BlogArtical blogArtical = new BlogArtical();
    private Connection conn;
    private ResultSet n = null;
    private PreparedStatement stmt = null;
    private ResultSet rs;
    private Map<String, Object> session;
    public String writeblog(){
        String sql = "insert into blogartical(title, text) values('"+blogArtical.getTitle()+"','"+blogArtical.getBlogtext()+"')";
        System.out.println(sql);
        int flag = Mysql.executeUpdate(sql);
        if (flag == 1){
            return "success";
        }else{
            return "error";
        }
    }

    @Override
    public BlogArtical getModel() {
        return blogArtical;
    }
}
