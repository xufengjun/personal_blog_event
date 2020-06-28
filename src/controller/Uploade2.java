package controller;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;

public class Uploade2 extends ActionSupport {
    //接收上传文件的参数  使用struts2框架进行 文件上传 接收的参数必须是 upload
    private File upload;
    //动态获取上传文件的名称 ：获取文件上传的原始名称   表单元素name属性的值+FileName
    private String uploadFileName;
    //指定目录
    private String directory;
    public File getUpload() {
        return upload;
    }
    public void setUpload(File upload) {
        this.upload = upload;
    }
    public String getUploadFileName() {
        return uploadFileName;
    }
    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }
    public String getDirectory() {
        return directory;
    }
    public void setDirectory(String directory) {
        this.directory = directory;
    }

    public String execute() throws IOException{
        ServletContext servletContext = ServletActionContext.getServletContext();
        String realPath = servletContext.getRealPath("/directory/"+"/"+uploadFileName);
        System.out.println("相对路径="+realPath);
        //第一个参数表示 前台  传过来原始文件，第二个参数是存储文件的相对路径
        FileUtils.copyFile(upload, new File(realPath));
        return "load";
    }
}
