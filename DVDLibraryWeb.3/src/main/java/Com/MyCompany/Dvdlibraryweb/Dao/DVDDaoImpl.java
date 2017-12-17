/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Com.MyCompany.Dvdlibraryweb.Dao;

import Com.MyCompany.Dvdlibraryweb.Dto.DVD;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

/**
 *
 * @author David Kolesar
 */
public class DVDDaoImpl implements DVDDao {

    private static final String FILENAME = "DVDLibraryStorage.txt";
    private static final String TOKEN = "::";
    Integer currentYear = Calendar.getInstance().get(Calendar.YEAR);
    List<DVD> dvdLibrary = null;
    Integer nextId = 1;

    public DVDDaoImpl() {

        dvdLibrary = decode();

        for (DVD d : dvdLibrary) {
            if (d.getDvdId() >= nextId) {
                nextId = d.getDvdId() + 1;
            }
        }

    }

    @Override
    public DVD create(DVD dvd) {

        dvd.setDvdId(nextId);

        dvdLibrary.add(dvd);

        nextId++;

        encode();

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

        encode();

    }

    @Override
    public void delete(DVD dvd) {

        for (DVD d : dvdLibrary) {
            if (d.getDvdId().equals(dvd.getDvdId())) {
                dvdLibrary.remove(d);
                break;
            }
        }

        encode();

    }

    @Override
    public List<DVD> list() {

        Collections.sort(dvdLibrary);

        return new ArrayList(dvdLibrary);

    }

    private void encode() {

        PrintWriter out = null;

        try {

            out = new PrintWriter(new FileWriter(FILENAME));

            for (DVD d : dvdLibrary) {

                out.print(d.getDvdId());
                out.print(TOKEN);

                out.print(d.getTitle());
                out.print(TOKEN);

                String releaseDate = DateToString(d.getReleaseDate());
                out.print(releaseDate);
                out.print(TOKEN);

                out.print(d.getMpaaRating());
                out.print(TOKEN);

                out.print(d.getDirector());
                out.print(TOKEN);

                out.print(d.getStudio());
                out.print(TOKEN);

                out.print(d.getUserRating());
                out.print("\n");

            }

        } catch (IOException ex) {

        } finally {

            out.close();

        }

    }

    private List<DVD> decode() {

        List<DVD> tempDVDList = new ArrayList();

        try {

            Scanner sc = new Scanner(new BufferedReader(new FileReader(FILENAME)));

            while (sc.hasNextLine()) {

                String currentLine = sc.nextLine();

                String[] stringParts = currentLine.split(TOKEN);

                DVD myDVD = new DVD();

                int dvdId = Integer.parseInt(stringParts[0]);

                String monthString;
                if (stringParts[2].length() >= 2) {
                    monthString = stringParts[2].substring(0, 2);
                } else {
                    monthString = "MM";
                }

                String dayString;
                if (stringParts[2].length() >= 5) {
                    dayString = stringParts[2].substring(3, 5);
                } else {
                    dayString = "DD";
                }

                String yearString;
                if (stringParts[2].length() >= 10) {
                    yearString = stringParts[2].substring(6, 10);
                } else {
                    yearString = "YYYY";
                }
                
                Date dvdReleaseDate = new Date();

                Integer month;
                try {

                    month = Integer.parseInt(monthString);
                    dvdReleaseDate.setMonth(month - 1);
                } catch (NumberFormatException ex) {
                    month = 00;
                }

                Integer day;
                try {

                    day = Integer.parseInt(dayString);
                    dvdReleaseDate.setDate(day);
                } catch (NumberFormatException ex) {
                    day = 00;
                }

                Integer year;
                try {

                    year = Integer.parseInt(yearString);
                    dvdReleaseDate.setYear(year - 1900);
                } catch (NumberFormatException ex) {
                    year = 0000;
                }

               
                myDVD.setDvdId(dvdId);
                myDVD.setTitle(stringParts[1]);
                myDVD.setReleaseDate(dvdReleaseDate);
                myDVD.setMpaaRating(stringParts[3]);
                myDVD.setDirector(stringParts[4]);
                myDVD.setStudio(stringParts[5]);
                myDVD.setUserRating(stringParts[6]);

                tempDVDList.add(myDVD);

            }

        } catch (FileNotFoundException ex) {

        }

        return tempDVDList;

    }

     
    public static String DateToString(Date dateToString) {

        DateFormat date = new SimpleDateFormat("MM/dd/YYYY");

        String dateString = date.format(dateToString);

        return dateString;

    }
    
    
}
