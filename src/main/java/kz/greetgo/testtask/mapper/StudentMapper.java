package kz.greetgo.testtask.mapper;


import kz.greetgo.testtask.model.Student;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface StudentMapper {

    String GET_ALL_STUDENTS_QUERY = "SELECT * FROM students WHERE school_id = #{school_id} ORDER BY name";
    String INSERT_STUDENT_QUERY = "INSERT INTO students (name, class, school_id) VALUES (#{studentName},"+
            "#{studentClass},#{schoolId})";
    String DELETE_STUDENT_QUERY = "DELETE FROM students WHERE student_id = #{studentId}";

    @Insert(INSERT_STUDENT_QUERY)
    @SelectKey(statement="SELECT LAST_INSERT_ID()", keyProperty = "schoolId", resultType = int.class,
            keyColumn = "student_id", before = false)
    int insertStudent(Student student);

    @Delete(DELETE_STUDENT_QUERY)
    void deleteStudent(int studentId);

    @Select(GET_ALL_STUDENTS_QUERY)
    @Results(value = {
            @Result(property = "studentId", column = "student_id"),
            @Result(property = "studentName", column = "name"),
            @Result(property = "studentClass", column = "class"),
            @Result(property = "schoolId", column = "school_id")
    })
    List<Student> getAllStudents(int school_id);
}
