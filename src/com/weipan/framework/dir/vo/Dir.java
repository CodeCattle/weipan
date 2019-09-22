package com.weipan.framework.dir.vo;

public class Dir {
	private Integer id;
    private Integer user_id;
    private String dir_name;
    private String remark;
    private long fileNum;
    private String account;

    public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public long getFileNum() {
		return fileNum;
	}
	public void setFileNum(long fileNum) {
		this.fileNum = fileNum;
	}
	public Integer getId(){
        return this.id;
    }
    public void setId(Integer id){
        this.id=id;
    }
    public Integer getUser_id(){
        return this.user_id;
    }
    public void setUser_id(Integer user_id){
        this.user_id=user_id;
    }
    public String getDir_name(){
        return this.dir_name;
    }
    public void setDir_name(String dir_name){
        this.dir_name=dir_name;
    }
    public String getRemark(){
        return this.remark;
    }
    public void setRemark(String remark){
        this.remark=remark;
    }
}
