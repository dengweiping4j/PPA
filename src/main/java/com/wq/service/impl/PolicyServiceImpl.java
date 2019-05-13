package com.wq.service.impl;

import com.wq.entity.Person;
import com.wq.entity.Policy;
import com.wq.mapper.PersonMapper;
import com.wq.mapper.PolicyMapper;
import com.wq.service.PersonService;
import com.wq.service.PolicyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service("policyService")
public class PolicyServiceImpl implements PolicyService {
    @Resource
    private PolicyMapper mapper;

    @Override
    public int addSave(Policy policy) {
        if (policy.getPkid() == null || policy.getPkid() == "") {
            policy.setPkid(UUID.randomUUID().toString());
        }
        return mapper.insert(policy);
    }

    @Override
    public int update(Policy policy) {
        return mapper.updateByPrimaryKey(policy);
    }

    @Override
    public int delete(String[] pkids) {
        return mapper.deleteByPrimaryKey(pkids);
    }

    @Override
    public List<Map<String, Object>> getPolicyList() {
        return mapper.getPolicyList();
    }
}
