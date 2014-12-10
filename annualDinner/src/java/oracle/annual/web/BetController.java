/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oracle.annual.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
@RequestMapping("/bet")
public class BetController {

    private String user;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView betdisplay() {
        ModelAndView modelAndView = new ModelAndView("bet", "command", new BetData());
        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView afterbet(@ModelAttribute BetData bdobj, HttpServletRequest request) {
        System.out.println("welcome to afterbet");
        /*Get username from session object*/
        HttpSession session = request.getSession(false);
        user = (String) session.getAttribute("login");
        /*insert bet object to RankManager*/
        EmployeeKey ekey = RankManager.insertBet(bdobj.getCoins(), bdobj.getGameid(), user);
        BetData bd = new BetData();
        bd.setCoins(bdobj.getCoins());
        bd.setGameid(bdobj.getGameid());
        int rank = ekey.getRank();
        ModelAndView modelAndView = new ModelAndView();
        //already bet
        if (rank == 0) {
            modelAndView.setViewName("alreadybet");
        } else {
            modelAndView.setViewName("afterbet");
        }
        modelAndView.addObject("ekey", ekey);
        return modelAndView;
    }
}
