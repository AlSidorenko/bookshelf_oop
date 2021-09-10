package org.example.model.entity;

/**
 * Created on 17.08.2021 13:24.
 *
 * @author Aleks Sidorenko (e-mail: alek.sidorenko@gmail.com).
 * @version Id$.
 * @since 0.1.
 */
public class Book {

    private int idBook;
    private String nameBook;
    private String authorBook;
    private String genreBook;
    private String linkBook;
    private String photoBook;
    private String ratingBook;

    public Book(int idBook, String nameBook, String authorBook, String genreBook, String linkBook,
                String photoBook, String ratingBook) {
        this.idBook = idBook;
        this.nameBook = nameBook;
        this.authorBook = authorBook;
        this.genreBook = genreBook;
        this.linkBook = linkBook;
        this.photoBook = photoBook;
        this.ratingBook = ratingBook;
    }

    public Book(String nameBook, String authorBook, String genreBook, String linkBook,
                String photoBook, String ratingBook) {
        this.nameBook = nameBook;
        this.authorBook = authorBook;
        this.genreBook = genreBook;
        this.linkBook = linkBook;
        this.photoBook = photoBook;
        this.ratingBook = ratingBook;
    }

    public int getIdBook() {
        return idBook;
    }

    public void setIdBook(int idBook) {
        this.idBook = idBook;
    }

    public String getNameBook() {
        return nameBook;
    }

    public void setNameBook(String nameBook) {
        this.nameBook = nameBook;
    }

    public String getAuthorBook() {
        return authorBook;
    }

    public void setAuthorBook(String authorBook) {
        this.authorBook = authorBook;
    }

    public String getGenreBook() {
        return genreBook;
    }

    public void setGenreBook(String genreBook) {
        this.genreBook = genreBook;
    }

    public String getLinkBook() {
        return linkBook;
    }

    public void setLinkBook(String linkBook) {
        this.linkBook = linkBook;
    }

    public String getPhotoBook() {
        return photoBook;
    }

    public void setPhotoBook(String photoBook) {
        this.photoBook = photoBook;
    }

    public String getRatingBook() {
        return ratingBook;
    }

    public void setRatingBook(String ratingBook) {
        this.ratingBook = ratingBook;
    }

    @Override
    public String toString() {
        return "Book{" +
                "idBook=" + idBook +
                ", nameBook='" + nameBook + '\'' +
                ", authorBook=" + authorBook +
                ", genreBook='" + genreBook + '\'' +
                ", linkBook='" + linkBook + '\'' +
                ", photoBook='" + photoBook + '\'' +
                ", ratingBook='" + ratingBook + '\'' +
                '}';
    }
}
