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
import Com.MyCompany.Dvdlibraryweb.Dto.Note;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.validation.Valid;
import Com.MyCompany.Dvdlibraryweb.ViewModel.ShowDVDViewModel;
import org.springframework.stereotype.Controller;
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
@RequestMapping(value = "/DVD")
public class DVDController {

    DVDDao dvdDao;
    NoteDao noteDao;

    @Inject
    public DVDController(DVDDao dvdDao, NoteDao noteDao) {
        this.dvdDao = dvdDao;
        this.noteDao = noteDao;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ShowDVDViewModel show(@PathVariable("id") Integer dvdId) {

        DVD d = dvdDao.read(dvdId);

        List<Note> dvdNotes = noteDao.findByDVD(d);

        ShowDVDViewModel showData = new ShowDVDViewModel();

        showData.setDvd(d);
        showData.setDvdNoteList(dvdNotes);

        return showData;

    }

//    @RequestMapping(value = "create", method = RequestMethod.GET)
//    public String create(Map model) {
//
//        model.put("addDVDCommand", new AddDVDCommand());
//
//        return "create";
//
//    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    @ResponseBody //binds return method
    public DVD create(@Valid @RequestBody AddDVDCommand commandObject) {

        DVD dvd = GetDvdInfoFromAddDVDCommand(commandObject);
        DVD d = dvdDao.create(dvd);

        if (commandObject.getNoteText().trim() != "") {

            Note note = getNoteFromAddDVDCommand(commandObject);
            note.setDvd(d);
            Note n = noteDao.create(note);
        }

        return d;

    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") Integer dvdId, Map model) {

        DVD d = dvdDao.read(dvdId);

        List<Note> dvdNotes = noteDao.findByDVD(d);
        d.setUserNotes(dvdNotes);

        model.put("dvd", d);

        return "edit";

    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public DVD edit(@Valid @RequestBody DVD dvd) {

        dvdDao.update(dvd);

        return dvd;

    }

    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") Integer dvdId, Map model) {

        DVD d = dvdDao.read(dvdId);

        List<Note> dvdNotes = noteDao.findByDVD(d);
        d.setUserNotes(dvdNotes);

        model.put("dvd", d);

        return "delete";

    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public DVD delete(@PathVariable("id") Integer id) {

        DVD dvd = dvdDao.read(id);

        List<Note> dvdNoteList = noteDao.findByDVD(dvd);

        for (Note n : dvdNoteList) {
            noteDao.delete(n);
        }

        dvdDao.delete(dvd);

        return dvd;

    }

    private DVD GetDvdInfoFromAddDVDCommand(AddDVDCommand commandObject) {

        DVD dvd = new DVD();

        dvd.setTitle(commandObject.getTitle());
        dvd.setReleaseDate(commandObject.getReleaseDate());
        dvd.setMpaaRating(commandObject.getMpaaRating());
        dvd.setDirector(commandObject.getDirector());
        dvd.setStudio(commandObject.getStudio());
        dvd.setUserRating(commandObject.getUserRating());

        return dvd;

    }

    private Note getNoteFromAddDVDCommand(AddDVDCommand commandObject) {

        Note note = new Note();
        note.setNoteText(commandObject.getNoteText());

        return note;

    }

}
