package kz.greetgo.testtask.controller;

import kz.greetgo.testtask.model.Student;
import kz.greetgo.testtask.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.util.List;


@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    @RequestMapping(value = "/get-all-students/{schoolId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Student> getAllStudents(@PathVariable("schoolId")int schoolId){
        return studentService.getAllStudents(schoolId);
    }

    @RequestMapping(value = "/insert-student", method = RequestMethod.POST,produces = "application/json",
            consumes = "application/json")
    @ResponseBody
    public String insertStudent(@RequestBody Student student){
        int response = studentService.insertStudent(student);
        return "{\"studentId\":"+response+"}";
    }

    @RequestMapping(value = "/delete-student/{id}", method = RequestMethod.POST)
    public ResponseEntity<String> deleteStudent(@PathVariable("id") int studentId){
        studentService.deleteStudent(studentId);
        return new ResponseEntity<String>(HttpStatus.OK);
    }

    @RequestMapping(value = "delete-students", method = RequestMethod.POST, consumes = "application/json")
    public ResponseEntity<String> deleteStudents(@RequestBody List<String> ids){
        for (String id : ids){
            studentService.deleteStudent(Integer.parseInt(id));
        }
        return new ResponseEntity<String>(HttpStatus.OK);
    }

}
