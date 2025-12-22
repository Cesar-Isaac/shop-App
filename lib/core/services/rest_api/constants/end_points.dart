// ignore_for_file: constant_identifier_names, non_constant_identifier_names

abstract class EndPoints {
  //##########  Base Url  ##########
  static const String baseUrl = 'https://fakestoreapi.com/';

  //Auth
  static const login = "auth/login";
  static const register = "users";
  static const users = "users";
  static const addToCart = "carts";
  static  carts (int id)=>"carts/$id";


  
  static const products = "products";
  static product(int id) => "products/$id";
}
