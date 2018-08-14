package com.jk.zs.mapper;

import com.jk.zs.pojo.Order;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author 10432
 * @Title: OrderManagementMapper
 * @ProjectName backstage_management
 * @Description: TODO
 * @date 2018-08-1119:46
 */
@Mapper
public interface OrderManagementMapper {
    /**
     * 查询订单总数接口
     * @param typeid
     * @param order
     * @return
     */
    @Select(" <script>"+
              " Select count(*) from zs_order "+
                "<where>" +
                    "<if test='typeid!=null and typeid!=\"\"'>" +
                        " producttype = ${typeid} "+
                    "</if>"+
                    " <if test='order.ordernumber!=null and order.ordernumber!=\"\"'> " +
                       " and  ordernumber = #{order.ordernumber} "+
                    "</if>"+
                "</where>"+
              "</script>")
    Integer queryOrderCount(@Param("typeid") String typeid,@Param("order") Order order);

    /**
     * 查询订单分页数据接口
     * @param offset
     * @param limit
     * @param typeid
     * @param order
     * @return
     */
    @Select(" <script>"+
                " Select * from zs_order "+
                    "<where>" +
                        " <if test='typeid!=null and typeid!=\"\"'> " +
                            " producttype = ${typeid} "+
                        "</if>"+
                        "<if test='order.ordernumber!=null and order.ordernumber!=\"\"'>" +
                            " and ordernumber = #{order.ordernumber} "+
                        "</if>"+
                    "</where>"+
                  " limit ${offset},${limit} "+
            "</script>")
    List<Order> queryOrderList(@Param("offset")int offset, @Param("limit")int limit, @Param("typeid")String typeid, @Param("order")Order order);

    /**
     * 查询
     * @return
     */
    @Select("select producttype,count(producttype) courseTotal from zs_order a GROUP BY a.producttype")
    List<Order> queryProportionalStatistics();

    /**
     * 查询全部订单数据接口
     * @return
     */
    @Select(" SELECT DATE_FORMAT(ordertime,'%m') allMounth ,COUNT(*) allCount from \n " +
            "  zs_order u where DATE_FORMAT(ordertime,'%Y')='2018' GROUP BY DATE_FORMAT(ordertime,'%Y-%m')")
    List<Order> queryTotalOrderData();

    /**
     * 已支付订单数据接口
     * @return
     */
    @Select(" SELECT DATE_FORMAT(ordertime,'%m') completeMounth ,COUNT(*) completeCount from \n " +
            "  zs_order u where DATE_FORMAT(ordertime,'%Y')='2018' and u.orderstatus=2 GROUP BY DATE_FORMAT(ordertime,'%Y-%m')")
    List<Order> querycompleteOrderData();

    /**
     * 未完成订单数据接口
     * @return
     */
    @Select(" SELECT DATE_FORMAT(ordertime,'%m') uncompleteMounth ,COUNT(*) uncompleteCount from \n" +
            "  zs_order u where DATE_FORMAT(ordertime,'%Y')='2018' and u.orderstatus=1 GROUP BY DATE_FORMAT(ordertime,'%Y-%m')")
    List<Order> queryuncompleteOrderData();

    /**
     *  查询交易金额，订单数量接口
     * @return
     */
    @Select("select sum(u.productprice) transacTionamount,count(*) allCount from zs_order u")
    Order queryTransacTionamount();

    /**
     * 查询退款金额，订单数量
     * @return
     */
    @Select("select sum(u.productprice) refundAmount,count(*) refundCount from zs_order u where u.orderstatus =3")
    Order queryRefundAmount();

    /**
     * 查询待付款金额，订单数量
     * @return
     */
    @Select("select sum(u.productprice) pendingPayment,count(*) uncompleteCount from zs_order u where u.orderstatus =1")
    Order querypendingPayment();

    /**
     * 查询已付款金额，订单数量接口
     * @return
     */
    @Select("select sum(u.productprice) alreadyPaid,count(*) completeCount from zs_order u where u.orderstatus =2")
    Order queryAlreadyPaid();

    /**
     * 查询退款订单数据接口
     * @return
     */
    @Select("SELECT DATE_FORMAT(ordertime,'%m')  refundMounth ,COUNT(*) refundCount from \n " +
            "  zs_order u where DATE_FORMAT(ordertime,'%Y')='2018' and u.orderstatus=3 GROUP BY DATE_FORMAT(ordertime,'%Y-%m')")
    List<Order> queryrefundAmountData();
}
