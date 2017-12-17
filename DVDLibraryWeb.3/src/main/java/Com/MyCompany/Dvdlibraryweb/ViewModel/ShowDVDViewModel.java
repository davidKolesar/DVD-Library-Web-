package Com.MyCompany.Dvdlibraryweb.ViewModel;

import Com.MyCompany.Dvdlibraryweb.Dto.DVD;
import Com.MyCompany.Dvdlibraryweb.Dto.Note;

import java.util.List;

/**
 * Created by David Kolesar
 */

public class ShowDVDViewModel {

    private DVD dvd;
    private List<Note> dvdNoteList;

    public DVD getDvd() {
        return dvd;
    }

    public void setDvd(DVD dvd) {
        this.dvd = dvd;
    }

    public List<Note> getDvdNoteList() {
        return dvdNoteList;
    }

    public void setDvdNoteList(List<Note> dvdNoteList) {
        this.dvdNoteList = dvdNoteList;
    }
}
