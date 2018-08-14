package com.jk.zs.controller;

import com.alibaba.fastjson.JSONObject;
import com.jk.zs.pojo.Order;
import com.jk.zs.service.OrderManagementService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 10432
 * @Title: OrderManagement
 * @ProjectName backstage_management
 * @Description: TODO
 * @date 2018-08-1119:44
 */
@Controller
@RequestMapping("OrderManagement")
public class OrderManagement {
  @Resource
  private OrderManagementService orderManagementService;

    /**
     * 订单管理分页
     * @param offset
     * @param limit
     * @param order
     * @return
     */
    @RequestMapping("queryOrderList")
    @ResponseBody
    public JSONObject queryOrderList(int offset, int limit,Order order){
         String  typeid=order.getTypeid();
        JSONObject json  = orderManagementService.queryOrderList(offset,limit,typeid,order);

        return json;

    }

    /**
     *查询每种商品类型的数量
     * @return
     */
    @RequestMapping("proportionalStatistics")
    @ResponseBody
    public  List<Order> queryProportionalStatistics(){
        List<Order> list=orderManagementService.queryProportionalStatistics();

        return list;
    }

    /**
     * 查询生成报表所需数据
     */
    @RequestMapping("queryOrderReportData")
    @ResponseBody
    public Map<String, Object> queryOrderReportData(){
        Map<String, Object>  map=new HashMap<>();
       //全部订单数据报表
        List<Integer> allCount=new ArrayList<>();
        List<Order> allOrder=orderManagementService.queryTotalOrderData();
        for (int i = 0; i < 12; i++) {
            allCount.add(0);
            for (int j = 0; j < allOrder.size(); j++) {
                   if((i+1)==allOrder.get(j).getAllMounth()){
                       allCount.add(i,allOrder.get(j).getAllCount());

                   }
            }   
            
        }
        //已付款订单数据
        List<Integer> completeCount=new ArrayList<>();
        List<Order> completeOrder=orderManagementService.querycompleteOrderData();
        for (int i = 0; i < 12; i++) {
            completeCount.add(0);
            for (int j = 0; j < completeOrder.size(); j++) {
                if((i+1)==completeOrder.get(j).getCompleteMounth()){
                    completeCount.add(i,completeOrder.get(j).getCompleteCount());

                }
            }

        }
        //待付款订单数据
        List<Integer> uncompleteCount=new ArrayList<>();
        List<Order> uncompleteOrder=orderManagementService.queryuncompleteOrderData();
        for (int i = 0; i < 12; i++) {
            uncompleteCount.add(0);
            for (int j = 0; j < uncompleteOrder.size(); j++) {
                if((i+1)==uncompleteOrder.get(j).getUncompleteMounth()){
                    uncompleteCount.add(i,uncompleteOrder.get(j).getUncompleteCount());

                }
            }

        }
        //退款订单数据
        List<Integer> refundAmount=new ArrayList<>();
        List<Order> refundAmountList=orderManagementService.queryrefundAmountData();
        for (int i = 0; i < 12; i++) {
            refundAmount.add(0);
            for (int j = 0; j < refundAmountList.size(); j++) {
                if((i+1)==refundAmountList.get(j).getRefundCount()){
                    refundAmount.add(i,refundAmountList.get(j).getRefundCount());

                }
            }

        }

        map.put("allCount",allCount);
        map.put("completeCount",completeCount);
        map.put("uncompleteCount",uncompleteCount);
        map.put("refundAmount",refundAmount);

        return map;
    }

    /**
     * 查询交易信息
     * @return
     */
    @RequestMapping("queryTransactionInformation")
    @ResponseBody
    public Map<String, Object> queryTransactionInformation(){

        Map<String, Object>  map=new HashMap<>();
        //交易金额，订单数量
        Order transacTionamount=orderManagementService.queryTransacTionamount();
        map.put("allCount",transacTionamount.getAllCount());
        map.put("transacTionamount",transacTionamount.getTransacTionamount());

        //退款金额，订单数量
        Order refundAmount=orderManagementService.queryRefundAmount();
        map.put("refundAmount",refundAmount.getRefundAmount());
        map.put("refundCount",refundAmount.getRefundCount());

        //待付款金额，订单数量
        Order pendingPayment=orderManagementService.querypendingPayment();
        map.put("uncompleteCount",pendingPayment.getUncompleteCount());
        map.put("pendingPayment",pendingPayment.getPendingPayment());

        //已付款金额，订单数量
        Order alreadyPaid=orderManagementService.queryAlreadyPaid();
        map.put("completeCount",alreadyPaid.getCompleteCount());
        map.put("alreadyPaid",alreadyPaid.getAlreadyPaid());


        return map;

    }

}
