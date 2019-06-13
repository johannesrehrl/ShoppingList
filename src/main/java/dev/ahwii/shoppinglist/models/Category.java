package dev.ahwii.shoppinglist.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "user")
@Entity
public class Category {
	
	@Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer category_id;

    private String name;

    
	
}
