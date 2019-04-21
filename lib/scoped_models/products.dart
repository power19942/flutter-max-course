import 'package:max_app/models/product.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductsModel extends Model{
  List<Product> _products = [];
  List<Product> get products => List.from(_products);
  
  void addProducts(Product product){
     _products.add(product); 
  }

  void updateProduct(int index,Product product){
     _products[index]=product; 
  }

  void deleteProduct(int index){
      _products.removeAt(index);
  }
  
}