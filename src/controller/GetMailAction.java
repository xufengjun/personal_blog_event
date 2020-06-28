package controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import dao.Mysql;
import model.MailMessage;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

public class GetMailAction extends ActionSupport implements ModelDriven<MailMessage> {
    private MailMessage mailMessage = new MailMessage();//模型驱动
    private Connection conn;
    private ResultSet n = null;
    private PreparedStatement stmt = null;
    private ResultSet rs;
    private Map<String, Object> session;

    public String getmail() throws IOException {
        Date day=new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(df.format(day));
        String sql = "insert into MailMessage(name,email,data,message) values('"+mailMessage.getName()+"','"+mailMessage.getEmail()+"','"+df.format(day)+"','"+mailMessage.getMessage()+"')";
        System.out.println(sql);
        int flag = Mysql.executeUpdate(sql);
        if (flag == 1){
            return "success";
        }else{
            return "error";
        }
    }

    @Override
    public MailMessage getModel() {
        return mailMessage;
    }
}
