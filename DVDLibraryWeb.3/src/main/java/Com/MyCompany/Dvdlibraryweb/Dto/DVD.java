/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Com.MyCompany.Dvdlibraryweb.Dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author David Kolesar
 */
public class DVD implements Comparator, Comparable {

    private Integer dvdId;
    
    @NotEmpty(message="Title is a required field")
    private String title;
    
    @NotNull(message="You must give a release date for the movie.")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd", timezone="America/Phoenix")
    private Date releaseDate;
    
    @NotEmpty(message="You must give a release date")
    private String mpaaRating;
    
    @NotEmpty(message="Director is a required field")
    private String director;
    
    @NotEmpty(message="Studio is a required field")
    private String studio;
    
    @NotEmpty(message="Your rating is a required field")
    private String userRating;
    
    private List<Note> userNotes;

    public DVD() {

    }

    public DVD(DVD dvd) {
        this.dvdId = dvd.getDvdId();
        this.title = dvd.getTitle();
        this.releaseDate = dvd.getReleaseDate();
        this.mpaaRating = dvd.getMpaaRating();
        this.director = dvd.getDirector();
        this.studio = dvd.getStudio();
        this.userRating = dvd.getUserRating();
        this.userNotes = dvd.getUserNotes();
    }

    public Integer getDvdId() {
        return dvdId;
    }

    public void setDvdId(Integer dvdId) {
        this.dvdId = dvdId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getMpaaRating() {
        return mpaaRating;
    }

    public void setMpaaRating(String mpaaRating) {
        this.mpaaRating = mpaaRating;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getStudio() {
        return studio;
    }

    public void setStudio(String studio) {
        this.studio = studio;
    }

    public String getUserRating() {
        return userRating;
    }

    public void setUserRating(String userRating) {
        this.userRating = userRating;
    }

    public List<Note> getUserNotes() {
        return userNotes;
    }

    public void setUserNotes(List<Note> userNotes) {
        this.userNotes = userNotes;
    }

    @Override
    public int compare(Object o1, Object o2) {

            return 1;
    }

    @Override
    public int compareTo(Object o) {
        
        return this.title.compareToIgnoreCase(( (DVD) o ).getTitle() );
        
    }

}
