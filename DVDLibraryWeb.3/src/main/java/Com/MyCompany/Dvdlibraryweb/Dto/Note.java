/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Com.MyCompany.Dvdlibraryweb.Dto;

import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author David Kolesar
 */
public class Note {
    
    private Integer noteId;

    @NotEmpty(message="What's the point of a blank note? Just delete it.")
    private String noteText;

    private DVD dvd;


    public Note() {
        
    }
    
    public Note(Note note) {
        this.noteId = note.getNoteId();
        this.noteText = note.getNoteText();
        this.dvd = note.getDvd();
    }

    public Integer getNoteId() {
        return noteId;
    }

    public void setNoteId(Integer noteId) {
        this.noteId = noteId;
    }

    public String getNoteText() {
        return noteText;
    }

    public void setNoteText(String noteText) {
        this.noteText = noteText;
    }

    public DVD getDvd() {
        return dvd;
    }

    public void setDvd(DVD dvd) {
        this.dvd = dvd;
    }
    
}
