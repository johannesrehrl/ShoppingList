package dev.ahwii.shoppinglist.models;

import javax.persistence.*;
import java.util.Date;

@Table(name = "purchase")
@Entity
public class Purchase {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer purchase_id;

    private Integer shopping_list_id;

    private Integer article_id;

    private Boolean in_cart;

    @Basic
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date created_at;

    public Integer getPurchase_id() {
        return purchase_id;
    }

    public void setPurchase_id(Integer purchase_id) {
        this.purchase_id = purchase_id;
    }

    public Integer getShopping_list_id() {
        return shopping_list_id;
    }

    public void setShopping_list_id(Integer shopping_list_id) {
        this.shopping_list_id = shopping_list_id;
    }

    public Integer getArticle_id() {
        return article_id;
    }

    public void setArticle_id(Integer article_id) {
        this.article_id = article_id;
    }

    public Boolean getIn_cart() {
        return in_cart;
    }

    public void setIn_cart(Boolean in_cart) {
        this.in_cart = in_cart;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }
}
