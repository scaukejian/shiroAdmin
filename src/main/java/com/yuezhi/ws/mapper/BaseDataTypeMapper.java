package com.yuezhi.ws.mapper;

import com.yuezhi.ws.domain.BaseDataType;
import com.yuezhi.ws.domain.BaseDataTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BaseDataTypeMapper {
    int deleteByExample(BaseDataTypeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(BaseDataType record);

    int insertSelective(BaseDataType record);

    List<BaseDataType> selectByExample(BaseDataTypeExample example);

    BaseDataType selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") BaseDataType record, @Param("example") BaseDataTypeExample example);

    int updateByExample(@Param("record") BaseDataType record, @Param("example") BaseDataTypeExample example);

    int updateByPrimaryKeySelective(BaseDataType record);

    int updateByPrimaryKey(BaseDataType record);
}