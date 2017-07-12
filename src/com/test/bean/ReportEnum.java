package com.test.bean;

import com.jfinal.mybatis.bean.BaseBean;


public class ReportEnum extends BaseBean {
    private static final long serialVersionUID = 1L;

    private String code;

    private String name;

    private Integer orderNum;

    private Boolean pauseFlag;

    private Integer clickedTotalNum;

    private String remark;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    public Boolean getPauseFlag() {
        return pauseFlag;
    }

    public void setPauseFlag(Boolean pauseFlag) {
        this.pauseFlag = pauseFlag;
    }

    public Integer getClickedTotalNum() {
        return clickedTotalNum;
    }

    public void setClickedTotalNum(Integer clickedTotalNum) {
        this.clickedTotalNum = clickedTotalNum;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", code=").append(code);
        sb.append(", name=").append(name);
        sb.append(", orderNum=").append(orderNum);
        sb.append(", pauseFlag=").append(pauseFlag);
        sb.append(", clickedTotalNum=").append(clickedTotalNum);
        sb.append(", remark=").append(remark);
        sb.append(", createUser=").append(createUser);
        sb.append(", createDate=").append(createDate);
        sb.append(", updateUser=").append(updateUser);
        sb.append(", updateDate=").append(updateDate);
        sb.append(", deleteFlag=").append(deleteFlag);
        sb.append("]");
        return sb.toString();
    }
}