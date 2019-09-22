package com.weipan.framework.userType.vo;

public class UserType {
	private Integer type_id;
    private String type_name;
    private Integer file_size;
    private Integer max_size;
    private Integer money;

    public Integer getType_id(){
        return this.type_id;
    }
    public void setType_id(Integer type_id){
        this.type_id=type_id;
    }
    public String getType_name(){
        return this.type_name;
    }
    public void setType_name(String type_name){
        this.type_name=type_name;
    }
    public Integer getFile_size(){
        return this.file_size;
    }
    public void setFile_size(Integer file_size){
        this.file_size=file_size;
    }
    public Integer getMax_size(){
        return this.max_size;
    }
    public void setMax_size(Integer max_size){
        this.max_size=max_size;
    }
    public Integer getMoney(){
        return this.money;
    }
    public void setMoney(Integer money){
        this.money=money;
    }
	@Override
	public String toString() {
		return "UserType [type_id=" + type_id + ", type_name=" + type_name + ", file_size=" + file_size + ", max_size="
				+ max_size + ", money=" + money + "]";
	}
}
