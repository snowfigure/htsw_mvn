package com.sf.kits.mail;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 * 发送邮件需要使用的基本信息
 */
public class SimpleMailSendUtil {
   public static final String mailSend(SimpleMailBean mailBean){

       try{
           Properties props = new Properties();
           // 开启debug调试
           props.setProperty("mail.debug", "true");
           // 发送服务器需要身份验证
           props.setProperty("mail.smtp.auth", "true");
           // 设置邮件服务器主机名
           props.setProperty("mail.host", mailBean.getHost() );             //"smtp.126.com"
           // 发送邮件协议名称
           props.setProperty("mail.transport.protocol", "smtp");

           // 设置环境信息
           Session session = Session.getInstance(props);

           // 创建邮件对象
           Message msg = new MimeMessage(session);
           ;
           msg.setSubject(mailBean.getSubject());  //"JavaMail测试"
           // 设置邮件内容
           msg.setText(mailBean.getContent()); //"这是一封由JavaMail发送的邮件！"
           // 设置发件人
           msg.setFrom(new InternetAddress(mailBean.getFrom()));//"fdqlbf@126.com"

           Transport transport = session.getTransport();
           // 连接邮件服务器
           transport.connect(mailBean.getUser(), mailBean.getUpsd()); //"email username", "email password1"
           // 发送邮件
           transport.sendMessage(msg, new Address[]{new InternetAddress(mailBean.getTo())});//"snowfigure@126.com"
           // 关闭连接
           transport.close();


           return "SUCCESS";
       }
       catch (Exception ex){
           ex.printStackTrace();
           return "FALSE";
       }

   }
}