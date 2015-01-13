/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oracle.annual.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

/**
 *
 * @author JAWEN
 */

@Controller
public class LogoutController {
    
    @RequestMapping("/logout")
    public String logout(SessionStatus status) {
        status.setComplete();
        return "logout";
    }
}
