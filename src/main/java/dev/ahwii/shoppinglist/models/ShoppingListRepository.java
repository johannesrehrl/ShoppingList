package dev.ahwii.shoppinglist.models;

import org.springframework.data.repository.CrudRepository;

public interface ShoppingListRepository extends CrudRepository<ShoppingList, Integer> {
}
