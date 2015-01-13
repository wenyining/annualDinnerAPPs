/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oracle.annual.web;

import java.util.ArrayList;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Jacky
 */

@Controller
@RequestMapping("/comments")
public class DanmuService {
    @Autowired
    ServletContext servletContext;

    /**
     *
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)    
    public @ResponseBody ArrayList<byte[]> getComments() {
        System.out.println("get into getComments");
        return FileReader.readFile(servletContext.getRealPath("/resources/danmuSample.xml"));
    }

    @RequestMapping(method = RequestMethod.POST)    
    public void appendComments(String comments){
        FileReader.writeMethod1("danmuSample.xml", comments);
    }
}