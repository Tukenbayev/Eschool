$(function(){
    var $email = $('#email');
    var $signupBtn = $('#signup');
    var $pass1 = $('#password1');
    var $pass2 = $('#password2');
    var $passnoteq = $('#noteq');
    var $emptypass = $('#emptyerr');

    $email.val('');
    $pass1.val('');



    $signupBtn.click(function () {
        $passnoteq.hide();
        $emptypass.hide();
        var $pass1val = $pass1.val().trim();
        var $pass2val = $pass2.val().trim();

        console.log($pass1val);
        console.log($pass2val);

        if($pass1val !== $pass2val){
            $passnoteq.show();
            return false;
        }else if(!$pass1val || !$pass2val){
            $emptypass.show();
            return false;
        }
    });
});
