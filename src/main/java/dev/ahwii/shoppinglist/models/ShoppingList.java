package dev.ahwii.shoppinglist.models;

import javax.persistence.*;
import java.util.Date;

@Table(name = "shopping_list")
@Entity
public class ShoppingList {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer shopping_list_id;

    private String name;

    private String comment;

    private Integer household_id;

    @Basic
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date created_at;

    public Integer getShopping_list_id() {
        return shopping_list_id;
    }

    public void setShopping_list_id(Integer shopping_list_id) {
        this.shopping_list_id = shopping_list_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Integer getHousehold_id() {
        return household_id;
    }

    public void setHousehold_id(Integer household_id) {
        this.household_id = household_id;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }
}
