package controller;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;

public class Uploade2 extends ActionSupport {
    //�����ϴ��ļ��Ĳ���  ʹ��struts2��ܽ��� �ļ��ϴ� ���յĲ��������� upload
    private File upload;
    //��̬��ȡ�ϴ��ļ������� ����ȡ�ļ��ϴ���ԭʼ����   ��Ԫ��name���Ե�ֵ+FileName
    private String uploadFileName;
    //ָ��Ŀ¼
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
        System.out.println("���·��="+realPath);
        //��һ��������ʾ ǰ̨  ������ԭʼ�ļ����ڶ��������Ǵ洢�ļ������·��
        FileUtils.copyFile(upload, new File(realPath));
        return "load";
    }
}
