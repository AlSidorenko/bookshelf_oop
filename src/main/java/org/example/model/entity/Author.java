package org.example.model.entity;

/**
 * Created on 17.08.2021 13:24.
 *
 * @author Aleks Sidorenko (e-mail: alek.sidorenko@gmail.com).
 * @version Id$.
 * @since 0.1.
 */
public class Author {

    private int idAuthor;
    private String nameAuthor;
    private String country;
    private String datesOfLife;
    private String gender;
    private String photoAuthor;
    private String linkBiography;

    public Author(int idAuthor, String nameAuthor, String country, String datesOfLife,
                  String gender, String photoAuthor, String linkBiography) {
        this.idAuthor = idAuthor;
        this.nameAuthor = nameAuthor;
        this.country = country;
        this.datesOfLife = datesOfLife;
        this.gender = gender;
        this.photoAuthor = photoAuthor;
        this.linkBiography = linkBiography;
    }

    public int getIdAuthor() {
        return idAuthor;
    }

    public String getNameAuthor() {
        return nameAuthor;
    }

    public String getCountry() {
        return country;
    }

    public String getDatesOfLife() {
        return datesOfLife;
    }

    public String getGender() {
        return gender;
    }

    public String getPhotoAuthor() {
        return photoAuthor;
    }

    public String getLinkBiography() {
        return linkBiography;
    }

    @Override
    public String toString() {
        return "Author{" +
                "idAuthor=" + idAuthor +
                ", nameAuthor='" + nameAuthor + '\'' +
                ", country='" + country + '\'' +
                ", datesOfLife='" + datesOfLife + '\'' +
                ", gender='" + gender + '\'' +
                ", photoAuthor='" + photoAuthor + '\'' +
                ", linkBiography='" + linkBiography + '\'' +
                '}';
    }
}
