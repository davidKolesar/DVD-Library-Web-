/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Com.MyCompany.Dvdlibraryweb.Dao;

import Com.MyCompany.Dvdlibraryweb.Dto.DVD;
import java.util.List;

/**
 *
 * @author David Kolesar
 */
public interface DVDDao {
    
    DVD create(DVD dvd);
    
    DVD read(Integer id);
    
    void update(DVD dvd);
    
    void delete(DVD dvd);
    
    List<DVD> list();
    
 
}
