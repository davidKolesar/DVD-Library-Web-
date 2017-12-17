/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Com.MyCompany.Dvdlibraryweb.Dao;

import Com.MyCompany.Dvdlibraryweb.Dto.DVD;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 *
 * @author David Kolesar
 */
public class DVDDaoInMemoryImpl implements DVDDao {

    List<DVD> dvdLibrary = new ArrayList();
    Integer currentYear = Calendar.getInstance().get(Calendar.YEAR);
    Integer nextId = 1;

    public DVDDaoInMemoryImpl() {

    }

    @Override
    public DVD create(DVD dvd) {

        dvd.setDvdId(nextId);

        dvdLibrary.add(dvd);

        nextId++;

        return new DVD(dvd);
    }

    @Override
    public DVD read(Integer id) {

        for (DVD d : dvdLibrary) {
            if (d.getDvdId() == id) {
                return new DVD(d);
            }
        }

        return null;
    }

    @Override
    public void update(DVD dvd) {

        for (int i = 0; i < dvdLibrary.size(); i++) {
            if (dvdLibrary.get(i).getDvdId().equals( dvd.getDvdId() )) {
                dvdLibrary.set(i, dvd);
                break;

            }

        }

    }

    @Override
    public void delete(DVD dvd) {

        for (DVD d : dvdLibrary) {
            if (d.getDvdId() == dvd.getDvdId()) {
                dvdLibrary.remove(d);
                break;
            }
        }

    }

    @Override
    public List<DVD> list() {

        Collections.sort(dvdLibrary);

        return new ArrayList( dvdLibrary );

    }

}
