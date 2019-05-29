import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app/utilities/api_utilities.dart';

import 'package:news_app/models/category.dart';

class CategoriesAPI {

  Future< List<Category> > fetchCategories() async {
    List<Category> categories = List<Category>();
    String categoriesUrl = base_api + all_categories_api;
    var response = await http.get( categoriesUrl );
    if( response.statusCode == 200 ){
      var jsondata = jsonDecode( response.body );
      var data = jsondata["data"];
      for( var item in data ){
        Category category = Category( item["id"].toString() , item["title"].toString());
        categories.add( category );
        print( category.title );
      }
    }
    return categories;
  }

}