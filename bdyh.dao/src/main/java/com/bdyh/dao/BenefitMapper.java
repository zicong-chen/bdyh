package com.bdyh.dao;

import com.bdyh.entity.*;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

public interface BenefitMapper {
    int countByExample(BenefitExample example);

    int deleteByExample(BenefitExample example);

    int deleteByPrimaryKey(String orderId);

    int insert(Benefit record);

    int insertSelective(Benefit record);

    List<Benefit> selectByExample(BenefitExample example);

    Benefit selectByPrimaryKey(String orderId);

    int updateByExampleSelective(@Param("record") Benefit record, @Param("example") BenefitExample example);

    int updateByExample(@Param("record") Benefit record, @Param("example") BenefitExample example);

    int updateByPrimaryKeySelective(Benefit record);

    int updateByPrimaryKey(Benefit record);


    IncomeStatisticsVo selectBenefitByOrderId(@Param("orderIds") List<String> orderIds);

    @Select("select * from benefit where agent_id = #{agentId}")
    List<Benefit> selectBenefitByAgentId(@Param("agentId") Integer agentId);


    @Select(" select SUM(teacher_benefit) teacher_benefit ,SUM(agent_benefit) agent_benefit " +
            "      from benefit " +
            "       where teacher_id = #{teacherId} ")
    AgentStatistics findStatisticsByTeacherId(@Param("teacherId") Integer teacherId);


    @Select("select * from benefit where teacher_id= #{teacherId} ORDER By date ASC")
    List<TeacherIncome> findTeacherByMonth(@Param("teacherId") Integer teacherId);

    //根据代理商ID找到对应的订单收入
    @Select("select b.date,b.agent_benefit from benefit b where  b.agent_id =#{agentId}  ORDER By date ASC")
    List<AgentIncome> findAgentIncomeByTime(Integer agentId);

    @Select("select SUM(teacher_benefit) teacher_benefit from benefit where teacher_id = #{teacherId}")
    BigDecimal findTeacherAllIncome(@Param("teacherId") Integer teacherId);



    //找到每个代理商的总收入
    @Select("select  SUM(agent_benefit) agent_benefit  from  benefit b  where  b.agent_id  =#{agentId}")
    BigDecimal findAgentIncome(@Param("agentId") Integer agentId);


}