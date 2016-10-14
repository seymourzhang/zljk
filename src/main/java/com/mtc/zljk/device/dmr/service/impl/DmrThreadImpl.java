package com.mtc.zljk.device.dmr.service.impl;

import com.mtc.zljk.device.dmr.entity.DmrQuota;
import com.mtc.zljk.util.common.PageData;
import com.mtc.zljk.util.dao.impl.DaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 大牧人线程类
 * Created by LeLe on 7/30/2016.
 */
public class DmrThreadImpl extends Thread {

    DmrServiceImpl dmrService;

    DmrQuota dq;


    /**
     * 构造函数
     */
    public DmrThreadImpl(DmrQuota dq,DmrServiceImpl dmrService){
        this.dq = dq;
        this.dmrService = dmrService;
    }

    /**
     * 线程执行方法
     */
    public void run() {
        PageData tmp = dq.getPageData();
        try {
            //查询是否已存在记录
            List<PageData> list = (List<PageData>)dmrService.dao().findForList("SDDeviceDataCurMapper.findById",tmp);
            if(list.size()>0) {
                //移动数据至历史表
                dmrService.moveToHistory(tmp);
                //更新已有数据
                dmrService.update(tmp);
            } else{
                //插入新数据
                dmrService.insert(tmp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
