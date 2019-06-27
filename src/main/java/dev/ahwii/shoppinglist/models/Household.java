package dev.ahwii.shoppinglist.models;

import javax.persistence.*;
import java.util.Date;

@Table(name = "household")
@Entity
public class Household {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer houshold_id;//TODO: Fix naming

    private String name;


    @Basic
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date created_at;

    public Integer getHoushold_id() {
        return houshold_id;
    }

    public void setHoushold_id(Integer houshold_id) {
        this.houshold_id = houshold_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }
}