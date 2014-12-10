/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oracle.annual.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author JAWEN
 */
@Controller
@RequestMapping("/login")
public class LoginController {
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView login() {
        return new ModelAndView("login", "command", new Employee());
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView afterlogin(@ModelAttribute Employee employee, HttpServletRequest  request, HttpServletResponse response) {
        System.out.println("welcome to afterlogin");
        System.out.println(employee.getEmailAddr());
        System.out.println(employee.getEmployeeID());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("game");
        modelAndView.addObject("emp",employee);
        HttpSession session = request.getSession() ;
        session.setAttribute("connected", "true");
        session.setAttribute("login", employee.getEmailAddr());
        return modelAndView;
    }
}
