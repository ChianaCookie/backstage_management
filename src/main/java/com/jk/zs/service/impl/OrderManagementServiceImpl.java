package com.jk.zs.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.zs.mapper.OrderManagementMapper;
import com.jk.zs.pojo.Order;
import com.jk.zs.service.OrderManagementService;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author 10432
 * @Title: OrderManagementServiceImpl
 * @ProjectName backstage_management
 * @Description: TODO
 * @date 2018-08-1119:45
 */
@Service
public class OrderManagementServiceImpl implements OrderManagementService{
    @Resource
    private OrderManagementMapper orderManagementMapper;

    @Override
    @Cacheable(value="thisredis", key="'queryOrderList'")
    public JSONObject queryOrderList(int offset, int limit, String typeid, Order order) {
        Integer total=orderManagementMapper.queryOrderCount(typeid, order);
        List<Order> orderlist=orderManagementMapper.queryOrderList(offset,limit,typeid,order);
        JSONObject json =new JSONObject();
        json.put("total",total);
        json.put("rows",orderlist);
        return json;
    }

    @Override
    @Cacheable(value="thisredis", key="'queryProportionalStatistics'")
    public List<Order> queryProportionalStatistics() {
        HashMap<String, Object> map=new HashMap<>();
        List<Order> countlist=orderManagementMapper.queryProportionalStatistics();
        List<Integer> count=new ArrayList<>();
        List<String> type=new ArrayList<>();
        for (Order order : countlist) {
            count.add(order.getCourseTotal());
            type.add(order.getProducttype());

        }
        map.put("type",type);
        map.put("conut",count);
        return countlist;
    }

    //查询全部订单数据接口
    @Override
    @Cacheable(value="thisredis", key="'queryTotalOrderData'")
    public List<Order> queryTotalOrderData() {

        return orderManagementMapper.queryTotalOrderData();
    }

    //查询已完成订单数据接口
    @Override
    @Cacheable(value="thisredis", key="'querycompleteOrderData'")
    public List<Order> querycompleteOrderData() {
        return orderManagementMapper.querycompleteOrderData();
    }

    //查询未完成订单数据接口
    @Override
    @Cacheable(value="thisredis", key="'queryuncompleteOrderData'")
    public List<Order> queryuncompleteOrderData() {
        return orderManagementMapper.queryuncompleteOrderData();
    }

    // 查询交易金额，订单数量接口
    @Override
    @Cacheable(value="thisredis", key="'queryTransacTionamount'")
    public Order queryTransacTionamount() {
        return orderManagementMapper.queryTransacTionamount();
    }

    //查询退款金额，订单数量
    @Override
    @Cacheable(value="thisredis", key="'queryRefundAmount'")
    public Order queryRefundAmount() {
        return orderManagementMapper.queryRefundAmount();
    }

    //查询待付款金额，订单数量
    @Override
    @Cacheable(value="thisredis", key="'querypendingPayment'")
    public Order querypendingPayment() {
        return orderManagementMapper.querypendingPayment();
    }

    //查询已付款金额，订单数量接口
    @Override
    @Cacheable(value="thisredis", key="'queryAlreadyPaid'")
    public Order queryAlreadyPaid() {
        return orderManagementMapper.queryAlreadyPaid();
    }

    //查询退款订单数据接口
    @Override
    @Cacheable(value="thisredis", key="'queryrefundAmountData'")
    public List<Order> queryrefundAmountData() {
        return orderManagementMapper.queryrefundAmountData();
    }
}
