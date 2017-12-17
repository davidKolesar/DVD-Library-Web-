/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Com.MyCompany.Dvdlibraryweb.Controllers;

import Com.MyCompany.Dvdlibraryweb.Dao.DVDDao;
import Com.MyCompany.Dvdlibraryweb.Dao.NoteDao;
import Com.MyCompany.Dvdlibraryweb.Dto.DVD;
import Com.MyCompany.Dvdlibraryweb.Dto.Note;
import java.util.Map;
import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author David Kolesar
 */
@Controller
@RequestMapping(value="/Note")
public class NoteController {
    
    DVDDao dvdDao;
    NoteDao noteDao;
    
    @Inject
    public NoteController(DVDDao dvdDao, NoteDao noteDao) {
        this.dvdDao = dvdDao;
        this.noteDao = noteDao;
    }
    
    @RequestMapping(value="/{id}", method=RequestMethod.GET)
    @ResponseBody
    public Note show(@PathVariable("id") Integer noteId) {
        
        Note n = noteDao.read(noteId);
        
        return n;
        
    }
    
    @RequestMapping(value="add/{dvdId}", method=RequestMethod.GET)
    public String addNote(@PathVariable("dvdId") Integer dvdId, Map model) {
        
        DVD d = dvdDao.read(dvdId);
        
        model.put("dvd", d);
        
        return "addNote";
        
    }
    
    @RequestMapping(value="", method=RequestMethod.POST)
    @ResponseBody
    public Note addNote(@Valid @RequestBody Note note) {
        
        Note n = noteDao.create(note);
        
        return n;
        
    }
    
    @RequestMapping(value="edit/{id}", method=RequestMethod.GET)
    public String edit(@PathVariable("id") Integer noteId, Map model) {
        
        Note n = noteDao.read(noteId);
        
        model.put("note", n);
        
        return "editNote";
        
    }
    
    @RequestMapping(value="/{id}", method=RequestMethod.PUT)
    @ResponseBody
    public Note edit(@Valid @RequestBody Note note) {
        
        noteDao.update(note);
        
        return note;
        
    }
    
    @RequestMapping(value="delete/{id}", method=RequestMethod.GET)
    public String delete(@PathVariable("id") Integer id, Map model) {
        
        Note n = noteDao.read(id);
        
        model.put("note", n);
        
        return "deleteNote";
        
    }
    
    @RequestMapping(value="/{id}", method=RequestMethod.DELETE)
    @ResponseBody
    public Note delete(@RequestBody Note note) {
        
        noteDao.delete(note);
        
        return note;
        
    }
    
}
