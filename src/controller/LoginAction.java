package controller;
import com.opensymphony.xwork2.ActionContext;


import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import model.User;
import dao.Mysql;
public class LoginAction extends ActionSupport implements ModelDriven<User> {
    private ResultSet rs = null;
    private int id;
    private Map<String,Object> session;
    private User user = new User();
    public String login() throws Exception{
        ActionContext ac = ActionContext.getContext();
        String sql = "select * from users where uname = '" + user.getUsername() + "' and upwd = '" + user.getPassword() + "'";
        ResultSet rs = Mysql.getRs(sql);
//        System.out.println(sql);
        if (rs.next()){
            ac.getSession().put("user",user);//把user放进session
            return SUCCESS;
        }else {
            return ERROR;
        }
    }


    public String judge() throws Exception{    //判断是否为管理员
       if(user.getUsername().trim().equalsIgnoreCase("root") && user.getPassword().equals("123")){
           return "success";
        }
        else{
            return "error";
        }

    }



    @Override
    public User getModel() {
        return user;
    }


}
