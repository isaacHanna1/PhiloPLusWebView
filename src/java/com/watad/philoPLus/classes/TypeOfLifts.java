
package com.watad.philoPLus.classes;

public class TypeOfLifts {

private int id ; 
private String typeOfLift ;
private String note ;

    public TypeOfLifts(int id, String typeOfLift) {
        this.id = id;
        this.typeOfLift = typeOfLift;
    }

    public TypeOfLifts(int id, String typeOfLift, String note) {
        this.id = id;
        this.typeOfLift = typeOfLift;
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTypeOfLift() {
        return typeOfLift;
    }

    public void setTypeOfLift(String typeOfLift) {
        this.typeOfLift = typeOfLift;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}
