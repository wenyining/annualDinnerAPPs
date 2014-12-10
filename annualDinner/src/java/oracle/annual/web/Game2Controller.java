/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oracle.annual.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author JAWEN
 */

@Controller
public class Game2Controller {

    @RequestMapping("/game2")
    public ModelAndView gamedisplay() {
        ModelAndView modelAndView = new ModelAndView("game2", "command", null);
        return modelAndView;
    }
}
