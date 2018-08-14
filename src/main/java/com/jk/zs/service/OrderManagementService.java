package com.jk.zs.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.zs.pojo.Order;

import java.util.List;

/**
 * @author 10432
 * @Title: OrderManagementService
 * @ProjectName backstage_management
 * @Description: TODO
 * @date 2018-08-1119:44
 */
public interface OrderManagementService {

    /**
     * 订单管理分页
     * @param offset
     * @param limit
     * @param typeid
     * @param order
     * @return
     */
    JSONObject queryOrderList(int offset, int limit, String typeid, Order order);

    /**
     * 查询每种商品类型的数量
     * @return
     */
    List<Order> queryProportionalStatistics();

    /**
     * 查询全部订单数据接口
     * @return
     */
    List<Order> queryTotalOrderData();
    /**
     * 查询已完成订单数据接口
     * @return
     */
    List<Order> querycompleteOrderData();
    /**
     * 查询未完成订单数据接口
     * @return
     */
    List<Order> queryuncompleteOrderData();

    /**
     * 查询交易金额，订单数量接口
     * @return
     */
    Order queryTransacTionamount();

    /**
     * 查询退款金额，订单数量接口
     * @return
     */
    Order queryRefundAmount();

    /**
     * 查询待付款金额，订单数量接口
     * @return
     */
    Order querypendingPayment();

    /**
     * 查询已付款金额，订单数量接口
     * @return
     */
    Order queryAlreadyPaid();

    /**
     * 查询退款订单数据接口
     * @return
     */
    List<Order> queryrefundAmountData();
}
