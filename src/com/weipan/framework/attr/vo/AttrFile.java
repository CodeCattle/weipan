package com.weipan.framework.attr.vo;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class AttrFile {
	private String id;
    private String file_name;
    private String server_name;
    private Integer user_id;
    private Integer dir_id;
    private Integer file_size;
    private String file_type;
    @JSONField(format = "yyyy0-MM-dd HH:mm:ss ")
    private Date upload_date;
    private Integer download_count;
    private String dir_name;
    private long share_count;
    
    public long getShare_count() {
		return share_count;
	}
	public void setShare_count(long share_count) {
		this.share_count = share_count;
	}
	public String getDir_name() {
		return dir_name;
	}
	public void setDir_name(String dir_name) {
		this.dir_name = dir_name;
	}
	public String getId(){
        return this.id;
    }
    public void setId(String id){
        this.id=id;
    }
    public String getFile_name(){
        return this.file_name;
    }
    public void setFile_name(String file_name){
        this.file_name=file_name;
    }
    public String getServer_name(){
        return this.server_name;
    }
    public void setServer_name(String server_name){
        this.server_name=server_name;
    }
    public Integer getUser_id(){
        return this.user_id;
    }
    public void setUser_id(Integer user_id){
        this.user_id=user_id;
    }
    public Integer getDir_id(){
        return this.dir_id;
    }
    public void setDir_id(Integer dir_id){
        this.dir_id=dir_id;
    }
    public Integer getFile_size(){
        return this.file_size;
    }
    public void setFile_size(Integer file_size){
        this.file_size=file_size;
    }
    public String getFile_type(){
        return this.file_type;
    }
    public void setFile_type(String file_type){
        this.file_type=file_type;
    }
    public Date getUpload_date(){
        return this.upload_date;
    }
    public void setUpload_date(Date upload_date){
        this.upload_date=upload_date;
    }
    public Integer getDownload_count(){
        return this.download_count;
    }
    public void setDownload_count(Integer download_count){
        this.download_count=download_count;
    }
    
}
