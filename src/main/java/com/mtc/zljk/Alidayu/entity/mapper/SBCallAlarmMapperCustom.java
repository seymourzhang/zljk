package com.mtc.zljk.Alidayu.entity.mapper;

import com.mtc.zljk.Alidayu.entity.SBCallAlarm;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SBCallAlarmMapperCustom {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_b_call_alarm
     *
     * @mbggenerated Fri Jul 01 14:12:36 CST 2016
     */
    int deleteByPrimaryKey(@Param("mainId") Integer mainId, @Param("alarmId") Integer alarmId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_b_call_alarm
     *
     * @mbggenerated Fri Jul 01 14:12:36 CST 2016
     */
    int insert(SBCallAlarm record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_b_call_alarm
     *
     * @mbggenerated Fri Jul 01 14:12:36 CST 2016
     */
    SBCallAlarm selectByPrimaryKey(@Param("mainId") Integer mainId, @Param("alarmId") Integer alarmId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_b_call_alarm
     *
     * @mbggenerated Fri Jul 01 14:12:36 CST 2016
     */
    List<SBCallAlarm> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_b_call_alarm
     *
     * @mbggenerated Fri Jul 01 14:12:36 CST 2016
     */
    int updateByPrimaryKey(SBCallAlarm record);

	List<SBCallAlarm> getSBCallAlarmByMainId(int mainId);

	int insertCallAlarmBatch(List<SBCallAlarm> list);
}