package dev.ahwii.shoppinglist.models;

import javax.persistence.*;
import java.util.Date;


@Table(name = "user")
@Entity
public class User {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer user_id;

    private String username;

    private String password;

    @Basic
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date create_time;

    private Integer household_id;

    @Override
    public String toString() {
        return "User{" +
                "user_id=" + user_id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", create_time=" + create_time +
                ", household_id=" + household_id +
                '}';
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Integer getHousehold_id() {
        return household_id;
    }

    public void setHousehold_id(Integer household_id) {
        this.household_id = household_id;
    }
}
