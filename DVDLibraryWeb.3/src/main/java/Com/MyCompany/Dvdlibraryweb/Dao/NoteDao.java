/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Com.MyCompany.Dvdlibraryweb.Dao;

import Com.MyCompany.Dvdlibraryweb.Dto.DVD;
import Com.MyCompany.Dvdlibraryweb.Dto.Note;
import java.util.List;

/**
 *
 * @author David Kolesar
 */
public interface NoteDao {
    
    public Note create(Note note);
    
    public Note read(Integer id);
    
    public void update(Note note);
    
    public void delete(Note note);
    
    public List<Note> findByDVD(DVD dvd);
    
    public double getAverageNumberOfNotes();
    
}
