package controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import dao.Mysql;
import model.Message;
import model.User;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ShowAction extends ActionSupport implements SessionAware {
    private User user = new User();
    private ResultSet rs = null;
    private int id;
    private Map<String,Object> session;
    private Message message=new Message();


    private int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String showmessage() throws Exception{
        String sql = "select * from themessage";
        List<Message> list = new ArrayList<>();
        System.out.println(sql);
        rs = Mysql.getRs(sql);
        while(rs.next()){
            Message tempt=new Message();
            tempt.setId(rs.getInt(1));
            tempt.setName(rs.getString(2));
            tempt.setMessage(rs.getString(3));
            list.add(tempt);
        }
        for (Message message1 : list) {
            System.out.println(message1.toString());

        }
        session.put("messagelist",list);

        return "success";
    }
    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }
}
