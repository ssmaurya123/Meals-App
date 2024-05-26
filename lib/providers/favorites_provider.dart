// idea is to store all these fav meals in list of fav meals
import'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal){
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state=state.where((m)=> m.id != meal.id).toList();
      //with where we filter a list and get a new list.....
      return false; // if item was removed
    }else{
      state=[...state,meal];
      return true;

    }
    
  }

}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier,List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
