package com.mtc.zljk.Alidayu.entity.mapper;

import com.mtc.zljk.Alidayu.entity.SBRemindAlarmcode;

import java.util.List;

public interface SBRemindAlarmcodeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_b_remind_alarmcode
     *
     * @mbggenerated Fri Jul 01 14:12:36 CST 2016
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_b_remind_alarmcode
     *
     * @mbggenerated Fri Jul 01 14:12:36 CST 2016
     */
    int insert(SBRemindAlarmcode record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_b_remind_alarmcode
     *
     * @mbggenerated Fri Jul 01 14:12:36 CST 2016
     */
    SBRemindAlarmcode selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_b_remind_alarmcode
     *
     * @mbggenerated Fri Jul 01 14:12:36 CST 2016
     */
    List<SBRemindAlarmcode> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_b_remind_alarmcode
     *
     * @mbggenerated Fri Jul 01 14:12:36 CST 2016
     */
    int updateByPrimaryKey(SBRemindAlarmcode record);
}