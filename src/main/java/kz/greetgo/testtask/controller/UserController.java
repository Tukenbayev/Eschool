package kz.greetgo.testtask.controller;

import kz.greetgo.testtask.model.User;
import kz.greetgo.testtask.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(){
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String verifyLogin(@RequestParam String userName, @RequestParam String password,
                              HttpSession session, Model model){

        User user = userService.getUserByLoginPassword(userName,password);

        if (user != null && user.getPassword().equals(password)) {
            session.setAttribute("loggedUser", user);
            return "redirect:/main";
        }else {
            model.addAttribute("logginError","Неправильный логин или пароль");
            return "login";
        }
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session){
        session.removeAttribute("loggedUser");
        return "redirect:/";
    }

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String main(HttpSession session){
        if (session.getAttribute("loggedUser") == null)
            return "redirect:/";
        return "main";
    }

    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public ModelAndView signup(){
         return new ModelAndView("signup","newUser", new User());
    }

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String register(@ModelAttribute("newUser") User user, Model model){
        if (userService.isUserExist(user.getLogin())){
            model.addAttribute("emailUsed","Этот адресс уже зарегистрирован. Попробуйте другой");
        }else{
            userService.insertUser(user);
            model.addAttribute("registrationSuccess","Регистрация прошла успешно! Войдите чтобы продолжить работу");
        }

        return "signup";
    }


}
