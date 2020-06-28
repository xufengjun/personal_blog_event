package controller;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletContext;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

public class DownLoadAction extends ActionSupport {
    //接收参数 接收需要下载文件的名称
    private String name;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public InputStream getInputStream() throws FileNotFoundException{
        //获取服务器上需下载文件的路径
        ServletContext sc = ServletActionContext.getServletContext();
        System.out.println(sc.getRealPath("/directory"));

        InputStream is = new FileInputStream(sc.getRealPath("/directory"+"/"+name));
        //返回流
        return is;
    }
}

