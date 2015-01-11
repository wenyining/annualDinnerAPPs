/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oracle.annual.web;

import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Jacky
 */

@Controller
@RequestMapping("/danmu")
public class DanmuService {
    
    @RequestMapping(method = RequestMethod.GET)    
    public ArrayList<String> getComments() {
        return FileReader.readFile("danmuSample.xml");
    }
    
    public void appendComments(String comments){
        FileReader.writeMethod1("danmuSample.xml", comments);
    }
}