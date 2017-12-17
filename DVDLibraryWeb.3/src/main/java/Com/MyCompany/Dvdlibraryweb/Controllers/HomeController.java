/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Com.MyCompany.Dvdlibraryweb.Controllers;

import Com.MyCompany.Dvdlibraryweb.Dao.DVDDao;
import Com.MyCompany.Dvdlibraryweb.Dao.NoteDao;
import Com.MyCompany.Dvdlibraryweb.Dto.AddDVDCommand;
import Com.MyCompany.Dvdlibraryweb.Dto.DVD;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author David Kolesar
 */
@Controller
public class HomeController {
    
    private DVDDao dvdDao;
    private NoteDao noteDao;
    
    @Inject
    public HomeController(DVDDao dvdDao, NoteDao noteDao) {
        this.dvdDao = dvdDao;
        this.noteDao = noteDao;
    }
    
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String home(Map model) {
        
        List<DVD> dvdList = dvdDao.list();
        model.put("dvdList", dvdList);
        model.put("addDVDCommand", new AddDVDCommand());
        
        return "home";
        
    }
    
}
