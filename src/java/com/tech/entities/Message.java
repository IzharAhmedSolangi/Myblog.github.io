
package com.tech.entities;


public class Message
{
private String content;
private String type;
private String msgClass;

    public Message(String content, String type, String msgClass) {
        this.content = content;
        this.type = type;
        this.msgClass = msgClass;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMsgClass() {
        return msgClass;
    }

    public void setMsgClass(String msgClass) {
        this.msgClass = msgClass;
    }
    
}
