package controller;

import com.opensymphony.xwork2.ActionSupport;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendEmailAction extends ActionSupport {
    private String email;
    private String message;
    public String sendemail() throws AddressException, MessagingException {
        Properties properties = new Properties();
        properties.put("mail.transport.protocol", "smtp");// 连接协议
        properties.put("mail.smtp.host", "smtp.qq.com");// 主机名
        properties.put("mail.smtp.port", 465);// 端口号
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.enable", "true");// 设置是否使用ssl安全连接 ---一般都使用
        properties.put("mail.debug", "true");// 设置是否显示debug信息 true 会在控制台显示相关信息
        // 得到回话对象
        Session session = Session.getInstance(properties);
        // 获取邮件对象
        Message message = new MimeMessage(session);
        // 设置发件人邮箱地址
        message.setFrom(new InternetAddress("2065423432@qq.com"));
        // 设置收件人邮箱地址
//        message.setRecipients(Message.RecipientType.TO, new InternetAddress[]{new InternetAddress("2805274695@qq.com"),new InternetAddress("2805274695@qq.com"),new InternetAddress("2805274695@qq.com")});
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(getEmail()));//一个收件人
        // 设置邮件标题
        message.setSubject("韩德昕博客的消息");
        // 设置邮件内容
        message.setText(getMessage());
        // 得到邮差对象
        Transport transport = session.getTransport();
        // 连接自己的邮箱账户
        transport.connect("2065423432@qq.com", "dotdgifpcbbhbcef");// 密码为QQ邮箱开通的stmp服务后得到的客户端授权码
        // 发送邮件
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
        return SUCCESS;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
