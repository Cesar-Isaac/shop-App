import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shop/features/cart/models/cart_model.dart';
import 'package:shop/features/profile/model/all_user.dart';
import '../../../../core/services/rest_api/constants/end_points.dart';

class FakeStoreService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: EndPoints.baseUrl, responseType: ResponseType.json),
  );

  // ================= Products =================
  Future<List<dynamic>> fetchProducts() async {
    try {
      final response = await _dio.get(EndPoints.products);

      log('Products Status: ${response.statusCode}');
      log('Products Data: ${response.data}');

      if (response.statusCode == 200) {
        return response.data as List;
      } else {
        throw Exception(
          'Failed to fetch products, status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      log('Exception while fetching products: $e');
      throw Exception('Failed to fetch products: $e');
    }
  }

  // ================= Users =================
  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await _dio.get(EndPoints.users);

      log('Users Status: ${response.statusCode}');
      log('Users Data: ${response.data}');

      if (response.statusCode == 200) {
        return UserModel.listFromJson(response.data as List);
      } else {
        throw Exception(
          'Failed to fetch users, status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      log('Exception while fetching users: $e');
      throw Exception('Failed to fetch users: $e');
    }
  }

// ================= Carts =================
Future<CartModel> fetchUserCart(int userId) async {
  try {
    final response = await _dio.get('${EndPoints.carts(userId)}');

    if (response.statusCode == 200) {
      // response.data هنا Map وليس List
      return CartModel.fromJson(response.data as Map<String, dynamic>);
    } else {
      throw Exception(
        'Failed to fetch user cart, status code: ${response.statusCode}',
      );
    }
  } catch (e) {
    throw Exception('Failed to fetch user cart: $e');
  }
}

}
