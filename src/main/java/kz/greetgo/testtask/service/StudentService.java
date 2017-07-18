package kz.greetgo.testtask.service;


import kz.greetgo.testtask.model.Student;

import java.util.List;

public interface StudentService {

    int insertStudent(Student student);

    void deleteStudent(int studentId);

    List<Student> getAllStudents(int schoolId);
}
