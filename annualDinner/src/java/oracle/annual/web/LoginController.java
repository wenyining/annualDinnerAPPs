/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oracle.annual.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    public ModelAndView afterlogin(@ModelAttribute Employee employee) {
        System.out.println("welcome to afterlogin");
        System.out.println(employee.getNickname());
        System.out.println(employee.getComments());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("afterbet");
        modelAndView.addObject("emp",employee);
        return modelAndView;
    }
}
