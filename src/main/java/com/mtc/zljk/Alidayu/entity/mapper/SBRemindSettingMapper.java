package com.mtc.zljk.Alidayu.entity.mapper;

import java.util.List;

import com.mtc.zljk.Alidayu.entity.SBRemindSetting;
import org.apache.ibatis.annotations.Param;

public interface SBRemindSettingMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_b_remind_setting
     *
     * @mbggenerated Fri Jul 01 14:12:36 CST 2016
     */
    int deleteByPrimaryKey(@Param("farmId") Integer farmId, @Param("remindMethod") Integer remindMethod);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_b_remind_setting
     *
     * @mbggenerated Fri Jul 01 14:12:36 CST 2016
     */
    int insert(SBRemindSetting record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_b_remind_setting
     *
     * @mbggenerated Fri Jul 01 14:12:36 CST 2016
     */
    SBRemindSetting selectByPrimaryKey(@Param("farmId") Integer farmId, @Param("remindMethod") Integer remindMethod);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_b_remind_setting
     *
     * @mbggenerated Fri Jul 01 14:12:36 CST 2016
     */
    List<SBRemindSetting> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_b_remind_setting
     *
     * @mbggenerated Fri Jul 01 14:12:36 CST 2016
     */
    int updateByPrimaryKey(SBRemindSetting record);
}