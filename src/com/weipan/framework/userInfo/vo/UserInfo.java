package com.weipan.framework.userInfo.vo;

import java.util.Date;

public class UserInfo {
	private Integer user_id;
    private String account;
    private String phone;
    private String password;
    private String user_name;
    private Integer vip_type;
    private Date reg_date;
    private Integer status;
    private String photo;
    private Date login_date;
    private String ip_address;
    private String remark;
    //增加
    private String type_name;
    
    public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public Integer getUser_id(){
        return this.user_id;
    }
    public void setUser_id(Integer user_id){
        this.user_id=user_id;
    }
    public String getAccount(){
        return this.account;
    }
    public void setAccount(String account){
        this.account=account;
    }
    public String getPhone(){
        return this.phone;
    }
    public void setPhone(String phone){
        this.phone=phone;
    }
    public String getPassword(){
        return this.password;
    }
    public void setPassword(String password){
        this.password=password;
    }
    public String getUser_name(){
        return this.user_name;
    }
    public void setUser_name(String user_name){
        this.user_name=user_name;
    }
    public Integer getVip_type(){
        return this.vip_type;
    }
    public void setVip_type(Integer vip_type){
        this.vip_type=vip_type;
    }
    public Date getReg_date(){
        return this.reg_date;
    }
    public void setReg_date(Date reg_date){
        this.reg_date=reg_date;
    }
    public Integer getStatus(){
        return this.status;
    }
    public void setStatus(Integer status){
        this.status=status;
    }
    public String getPhoto(){
        return this.photo;
    }
    public void setPhoto(String photo){
        this.photo=photo;
    }
    public Date getLogin_date(){
        return this.login_date;
    }
    public void setLogin_date(Date login_date){
        this.login_date=login_date;
    }
    public String getIp_address(){
        return this.ip_address;
    }
    public void setIp_address(String ip_address){
        this.ip_address=ip_address;
    }
    public String getRemark(){
        return this.remark;
    }
    public void setRemark(String remark){
        this.remark=remark;
    }
	@Override
	public String toString() {
		return "UserInfo [user_id=" + user_id + ", account=" + account + ", phone=" + phone + ", password=" + password
				+ ", user_name=" + user_name + ", vip_type=" + vip_type + ", reg_date=" + reg_date + ", status="
				+ status + ", photo=" + photo + ", login_date=" + login_date + ", ip_address=" + ip_address
				+ ", remark=" + remark + ", type_name=" + type_name + "]";
	}
}
