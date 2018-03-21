package com.yuezhi.ws.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yuezhi.ws.domain.RoleActionRelationExample;
import com.yuezhi.ws.domain.RoleActionRelationKey;

public interface RoleActionRelationMapper {
    int deleteByExample(RoleActionRelationExample example);

    int deleteByPrimaryKey(RoleActionRelationKey key);

    int insert(RoleActionRelationKey record);

    int insertSelective(RoleActionRelationKey record);

    List<RoleActionRelationKey> selectByExample(RoleActionRelationExample example);

    int updateByExampleSelective(@Param("record") RoleActionRelationKey record, @Param("example") RoleActionRelationExample example);

    int updateByExample(@Param("record") RoleActionRelationKey record, @Param("example") RoleActionRelationExample example);
}