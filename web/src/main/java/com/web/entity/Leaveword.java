package com.web.entity;

/**
 * Created by Administrator on 2017/2/8 0008.
 */
public class Leaveword {
    private int id;                 //留言表id
    private int fromid=0;             //留言者      0:默认
    private int toid=0;               //被留言者    0:默认
    private int isreply=0;            //是否回复    0:默认 -1:不是回复 其他:用主留言id作为值
    private String content;         //内容
    private String createdate;      //发布时间

    public Leaveword(){}

    public Leaveword(int id, int fromid, int toid, int isreply, String content, String createdate) {
        this.id = id;
        this.fromid = fromid;
        this.toid = toid;
        this.isreply = isreply;
        this.content = content;
        this.createdate = createdate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFromid() {
        return fromid;
    }

    public void setFromid(int fromid) {
        this.fromid = fromid;
    }

    public int getToid() {
        return toid;
    }

    public void setToid(int toid) {
        this.toid = toid;
    }

    public int getIsreply() {
        return isreply;
    }

    public void setIsreply(int isreply) {
        this.isreply = isreply;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }
}
