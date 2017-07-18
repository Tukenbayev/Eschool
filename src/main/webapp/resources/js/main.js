$(function () {
    var rowTemplate = $('#student-row').html();
    var tableBody = $('#tbody');
    var dialogDiv = $('#dialog');
    var schoolId = $('#schoolId').html();
    var studentName = $('#studentName');
    var studentClass = $('#clazz');
    var deleteStudents = $('#deleteStudents');
    var emptyerr = $('#emptyerr');
    var maxlength = $('#maxlength');
    getAllStudents();

   $('#addNewStudent').click(function () {
      dialogDiv.dialog('open');
   });

   dialogDiv.dialog({
       autoOpen: false,
       modal: true,
       height: 280,
       width: 400,
       resizable: false,
       draggable: false,
       buttons: {
           "Добавить": function () {
               if(!studentClass.val() || !studentName.val()) {
                    emptyerr.show();
                    return;
               }else if(studentClass.val().length >3){
                   maxlength.addClass('err');
                   return;
               }else{
                   var newStudent = {
                       studentName : studentName.val(),
                       studentClass : studentClass.val(),
                       schoolId : schoolId
                   };

                   $.ajax({
                       type:"POST",
                       contentType: "application/json",
                       url:"/insert-student",
                       data:JSON.stringify(newStudent),
                       dataType:'json',
                       success: function (data) {
                           deleteAllStudents();
                           getAllStudents();
                       }
                   });
                   studentName.val('');
                   studentClass.val('');
                   emptyerr.hide();
                   maxlength.removeClass('err');
                   dialogDiv.dialog('close');
               }
           },
           "Отмена": function () {
                dialogDiv.dialog('close');
                studentName.val('');
                studentClass.val('');
           }
       }

   });

   deleteStudents.click(function () {
       var ids = [];
       var checkedStudents = $('input[type=checkbox]:checked');

       $.each(checkedStudents, function (i,student) {
          ids.push($(this).attr('datafld'));
       });

       if(ids.length !== 0){
           $.ajax({
               type:"POST",
               contentType: "application/json",
               url:"/delete-students",
               data:JSON.stringify(ids),
               dataType:'json'
           });

           checkedStudents.parent().parent().fadeOut(500, function () {
              $(this).remove();
           });
       }

   });

   tableBody.delegate('.dlt','click',function () {
       var currTableRow = $(this).closest('tr');
        $.ajax({
            url: '/delete-student/'+$(this).attr('datafld'),
            type: 'POST',
            success: function () {
                currTableRow.fadeOut(500,function () {
                   $(this).remove();
                });
            }
        });
   });

   function addStudent(student){
       tableBody.append(Mustache.render(rowTemplate,student));
   }

   function getAllStudents(){
        $.ajax({
            url: "/get-all-students/"+schoolId,
            type: 'GET',
            success: function (students) {
                $.each(students,function (i, student) {
                    addStudent(student);
                });
            }
        });
   }

   function deleteAllStudents(){
       tableBody.empty();
   }

});
