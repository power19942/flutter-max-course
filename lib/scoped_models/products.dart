import 'package:max_app/models/product.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductsModel extends Model{
  List<Product> _products = [];
  int _selectedProductIndex;

  List<Product> get products => List.from(_products);
  int get selectedProductIndex => _selectedProductIndex;
  Product get selectedProduct => _selectedProductIndex == null ? null
  : products[_selectedProductIndex];
  
  void addProducts(Product product){
     _products.add(product); 
     _selectedProductIndex = null;
  }

  void updateProduct(Product product){
     _products[_selectedProductIndex]=product; 
     _selectedProductIndex = null;

  }

  void deleteProduct(){
      _products.removeAt(_selectedProductIndex);
     _selectedProductIndex = null;

  }

  void selectProduct(int index){
    _selectedProductIndex = index;
  }
  
}