package oracle.annual.web;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/**
 *
 * @author JAWEN
 */
@Controller
public class EmployeeController {
    @RequestMapping("/employee")
   public ModelAndView employee() {
      return new ModelAndView("employee", "command", new Employee());
   }
   
   @RequestMapping("/employee/addresult")
   public ModelAndView addEmployee(@ModelAttribute Employee employee) {
      ModelAndView modelAndView = new ModelAndView();
      modelAndView.setViewName("addresult");
      modelAndView.addObject("emps",employee);      
      return modelAndView;
   }
}
