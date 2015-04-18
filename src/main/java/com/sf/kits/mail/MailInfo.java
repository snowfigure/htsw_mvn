package com.sf.kits.mail;

/**
 * 邮件信息
 * Created by snowfigure on 2015/4/18.
 */
public class MailInfo {
    private String host;
    private String username;
    private String password;
    private String mail_subject;
    private String mail_body;
    private String mail_head_name;
    private String mail_head_value;
    private String mail_from;
    private String personalName;
    private String mail_to;

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getMail_subject() {
        return mail_subject;
    }

    public void setMail_subject(String mail_subject) {
        this.mail_subject = mail_subject;
    }

    public String getMail_body() {
        return mail_body;
    }

    public void setMail_body(String mail_body) {
        this.mail_body = mail_body;
    }

    public String getMail_head_name() {
        return mail_head_name;
    }

    public void setMail_head_name(String mail_head_name) {
        this.mail_head_name = mail_head_name;
    }

    public String getMail_head_value() {
        return mail_head_value;
    }

    public void setMail_head_value(String mail_head_value) {
        this.mail_head_value = mail_head_value;
    }

    public String getMail_from() {
        return mail_from;
    }

    public void setMail_from(String mail_from) {
        this.mail_from = mail_from;
    }

    public String getPersonalName() {
        return personalName;
    }

    public void setPersonalName(String personalName) {
        this.personalName = personalName;
    }

    public String getMail_to() {
        return mail_to;
    }

    public void setMail_to(String mail_to) {
        this.mail_to = mail_to;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
