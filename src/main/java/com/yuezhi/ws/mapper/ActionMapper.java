package com.yuezhi.ws.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yuezhi.ws.domain.Action;
import com.yuezhi.ws.domain.ActionExample;

public interface ActionMapper {
    int deleteByExample(ActionExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Action record);

    int insertSelective(Action record);

    List<Action> selectByExample(ActionExample example);

    Action selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Action record, @Param("example") ActionExample example);

    int updateByExample(@Param("record") Action record, @Param("example") ActionExample example);

    int updateByPrimaryKeySelective(Action record);

    int updateByPrimaryKey(Action record);
}