package kz.greetgo.testtask.test;

import kz.greetgo.testtask.model.Student;
import kz.greetgo.testtask.service.StudentService;
import kz.greetgo.testtask.service.StudentServiceImpl;
import org.junit.jupiter.api.Test;
import org.testng.Assert;


public class StudentServiceTest {

    StudentService studentService = new StudentServiceImpl();

    @Test
    public void testInsertStudent() throws Exception{
        Student student = new Student();
        student.setStudentClass("11A");
        student.setSchoolId(1);
        student.setStudentName("Random Name");

        Assert.assertEquals(1,studentService.insertStudent(student));
    }
}
