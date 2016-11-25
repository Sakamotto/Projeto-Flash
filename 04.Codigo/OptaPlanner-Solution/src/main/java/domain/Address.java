package domain;

/**
 * Created by danilo on 01/10/16.
 */
public class Address {
    private String neighborhood;
    private String publicPlace;
    private String number;
    private String cep;

    public Address() {}

    public Address(String neighborhood, String publicPlace, String number) {
        this.neighborhood = neighborhood;
        this.publicPlace = publicPlace;
        this.number = number;
    }

    public String getNeighborhood() {
        return neighborhood;
    }

    public void setNeighborhood(String neighborhood) {
        this.neighborhood = neighborhood;
    }

    public String getPublicPlace() {
        return publicPlace;
    }

    public void setPublicPlace(String publicPlace) {
        this.publicPlace = publicPlace;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }
}
