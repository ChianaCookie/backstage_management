package com.jk.zs.pojo;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author 10432
 * @Title: Order
 * @ProjectName backstage_management
 * @Description: TODO
 * @date 2018-08-1120:04
 */
public class Order implements Serializable{

    private     String      id;
    //订单编号
    private     String      ordernumber;
    //价格
    private     BigDecimal  productprice;
    //产品名称
    private     String      productname;
    //订单时间
    @JSONField(format = "yyyy-MM-dd")
    private     Date        ordertime;
    //所属类型
    private     String      producttype;
    //状态
    private     String      orderstatus;

    private     String      typeid;
    //统计数量
    private     Integer     courseTotal;

    //全部订单数据数据
    private     Integer     allCount;
    private     Integer     allMounth;
    private     BigDecimal  transacTionamount;
    //已付款订单数据
    private     Integer     completeCount;
    private     Integer     completeMounth;
    private     BigDecimal  alreadyPaid;
    //未付款订单数据
    private     Integer     uncompleteCount;
    private     Integer     uncompleteMounth;
    private     BigDecimal  pendingPayment;
    //退款订单数据
    private     BigDecimal  refundAmount;
    private     Integer     refundCount;
    private     Integer     refundMounth;

    public Integer getRefundMounth() {
        return refundMounth;
    }

    public void setRefundMounth(Integer refundMounth) {
        this.refundMounth = refundMounth;
    }

    public BigDecimal getTransacTionamount() {
        return transacTionamount;
    }

    public void setTransacTionamount(BigDecimal transacTionamount) {
        this.transacTionamount = transacTionamount;
    }

    public BigDecimal getAlreadyPaid() {
        return alreadyPaid;
    }

    public void setAlreadyPaid(BigDecimal alreadyPaid) {
        this.alreadyPaid = alreadyPaid;
    }

    public BigDecimal getPendingPayment() {
        return pendingPayment;
    }

    public void setPendingPayment(BigDecimal pendingPayment) {
        this.pendingPayment = pendingPayment;
    }

    public BigDecimal getRefundAmount() {
        return refundAmount;
    }

    public void setRefundAmount(BigDecimal refundAmount) {
        this.refundAmount = refundAmount;
    }

    public Integer getRefundCount() {
        return refundCount;
    }

    public void setRefundCount(Integer refundCount) {
        this.refundCount = refundCount;
    }

    public Integer getAllCount() {
        return allCount;
    }

    public void setAllCount(Integer allCount) {
        this.allCount = allCount;
    }

    public Integer getCompleteCount() {
        return completeCount;
    }

    public void setCompleteCount(Integer completeCount) {
        this.completeCount = completeCount;
    }

    public Integer getUncompleteCount() {
        return uncompleteCount;
    }

    public void setUncompleteCount(Integer uncompleteCount) {
        this.uncompleteCount = uncompleteCount;
    }

    public Integer getAllMounth() {
        return allMounth;
    }

    public void setAllMounth(Integer allMounth) {
        this.allMounth = allMounth;
    }

    public Integer getCompleteMounth() {
        return completeMounth;
    }

    public void setCompleteMounth(Integer completeMounth) {
        this.completeMounth = completeMounth;
    }

    public Integer getUncompleteMounth() {
        return uncompleteMounth;
    }

    public void setUncompleteMounth(Integer uncompleteMounth) {
        this.uncompleteMounth = uncompleteMounth;
    }

    public Integer getCourseTotal() {
        return courseTotal;
    }

    public void setCourseTotal(Integer courseTotal) {
        this.courseTotal = courseTotal;
    }

    public String getTypeid() {
        return typeid;
    }

    public void setTypeid(String typeid) {
        this.typeid = typeid;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOrdernumber() {
        return ordernumber;
    }

    public void setOrdernumber(String ordernumber) {
        this.ordernumber = ordernumber;
    }

    public BigDecimal getProductprice() {
        return productprice;
    }

    public void setProductprice(BigDecimal productprice) {
        this.productprice = productprice;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public String getProducttype() {
        return producttype;
    }

    public void setProducttype(String producttype) {
        this.producttype = producttype;
    }

    public String getOrderstatus() {
        return orderstatus;
    }

    public void setOrderstatus(String orderstatus) {
        this.orderstatus = orderstatus;
    }
}
