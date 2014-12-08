/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oracle.annual.web;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author JAWEN
 */
@Controller
@RequestMapping("/game")
public class GameController {

    private String user;

    public ModelAndView gameCenter(@RequestParam("user") String userid) {
        System.out.println("userid=" + userid);
        user=userid;
        ModelAndView modelAndView = new ModelAndView("game", "command", null);
        modelAndView.addObject("user", user);
        return modelAndView;
    }
    
    @RequestMapping(value ="/{id}", method = RequestMethod.GET)
    public ModelAndView gamedisplay(@PathVariable("gameid") int gameid) {
        ModelAndView modelAndView = new ModelAndView("game"+gameid, "command", null);
        modelAndView.addObject("user", user);
        return modelAndView;
    }

    @RequestMapping(value = "/bet", method = RequestMethod.GET)
    public ModelAndView betdisplay() {
        ModelAndView modelAndView = new ModelAndView("bet", "command", new BetData());
        modelAndView.addObject("user", user);
        return modelAndView;
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView login() {
        return new ModelAndView("bet", "command", new BetData());
    }

    @RequestMapping(value = "/bet", method = RequestMethod.POST)
    public ModelAndView afterbet(@ModelAttribute BetData bdobj) {
        System.out.println("welcome to afterbet");
        System.out.println(bdobj.getCal());
        BetData bd = new BetData();
        bd.setCoins(bdobj.getCoins());
        bd.setEmailAddr(user);
        bd.setGameid(bdobj.getGameid());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("afterbet");
        modelAndView.addObject("betdata",bd);
        return modelAndView;
    }
}
