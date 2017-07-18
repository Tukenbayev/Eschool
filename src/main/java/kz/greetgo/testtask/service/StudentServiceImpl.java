package kz.greetgo.testtask.service;

import kz.greetgo.testtask.mapper.StudentMapper;
import kz.greetgo.testtask.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService{

    @Autowired
    private StudentMapper studentMapper;

    @Override
    @Transactional

    public int insertStudent(Student student) {
         return studentMapper.insertStudent(student);
    }

    @Override
    public void deleteStudent(int studentId) {
        studentMapper.deleteStudent(studentId);
    }

    @Override
    public List<Student> getAllStudents(int schoolId) {
        return studentMapper.getAllStudents(schoolId);
    }
}
