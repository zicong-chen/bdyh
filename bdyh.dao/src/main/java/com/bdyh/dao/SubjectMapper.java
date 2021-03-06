package com.bdyh.dao;

import com.bdyh.entity.Subject;
import com.bdyh.entity.SubjectExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface SubjectMapper {
    int countByExample(SubjectExample example);

    int deleteByExample(SubjectExample example);

    int deleteByPrimaryKey(Integer subjectId);

    int insert(Subject record);

    int insertSelective(Subject record);

    List<Subject> selectByExample(SubjectExample example);

    Subject selectByPrimaryKey(Integer subjectId);

    int updateByExampleSelective(@Param("record") Subject record, @Param("example") SubjectExample example);

    int updateByExample(@Param("record") Subject record, @Param("example") SubjectExample example);

    int updateByPrimaryKeySelective(Subject record);

    int updateByPrimaryKey(Subject record);

    @Select("select DISTINCT subject  from  subject ")
    List<String> findAll();

    @Select("select *  from  subject  where  clazz_id = #{clazzId} and status = 1")
    List<Subject> findOpenSubejct(@Param("clazzId") int clazzId);
}