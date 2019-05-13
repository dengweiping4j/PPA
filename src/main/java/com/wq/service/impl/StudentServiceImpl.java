package com.wq.service.impl;

import com.wq.entity.Student;
import com.wq.mapper.StudentMapper;
import com.wq.service.StudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service("studentService")
public class StudentServiceImpl implements StudentService {
    @Resource
    private StudentMapper studentMapper;

    @Override
    public int updateStudent(Student student) {
        return 0;
    }

    @Override
    public int addStudent(Student student) {
        if (student.getPkid() == null || student.getPkid() == "") {
            student.setPkid(UUID.randomUUID().toString());
        }
        return studentMapper.insert(student);
    }

    @Override
    public int deleteStudent(String[] pkids) {
        return studentMapper.deleteByPrimaryKey(pkids);
    }

    @Override
    public List<Map<String, Object>> getDepartmentList() {
        return studentMapper.getDepartmentList();
    }

    @Override
    public List<Map<String, Object>> getMajorList(String departmentKey) {
        return studentMapper.getMajorList(departmentKey);
    }

    @Override
    public List<Map<String, Object>> getClassList(String majorKey) {
        return studentMapper.getClassList(majorKey);
    }
}
