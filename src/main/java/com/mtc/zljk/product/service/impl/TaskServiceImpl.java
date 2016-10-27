package com.mtc.zljk.product.service.impl;

import com.mtc.zljk.product.service.TaskService;
import com.mtc.zljk.util.common.PageData;
import com.mtc.zljk.util.dao.impl.DaoSupport;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Seymour on 2016/10/24.
 */
@Service
public class TaskServiceImpl implements TaskService {
    @Resource(name = "daoSupport")
    private DaoSupport dao;

    public List<PageData> getTaskTypeName() throws Exception{
        return (List<PageData>) dao.findForList("SDTaskMapper.getTaskTypeName", null);
    }

    public List<PageData> getTaskCodeName(PageData pd) throws Exception{
        return (List<PageData>) dao.findForList("SDTaskMapper.getTaskCodeName", pd);
    }

    public List<PageData> getDateTypeName() throws Exception{
        return (List<PageData>) dao.findForList("SDTaskMapper.getDateTypeName", null);
    }
}
