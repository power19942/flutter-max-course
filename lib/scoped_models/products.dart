import 'package:max_app/models/product.dart';
import 'package:scoped_model/scoped_model.dart';

mixin ProductsModel on Model{
  List<Product> _products = [];
  int _selectedProductIndex;
  bool _showFavorites = false;

  List<Product> get products => List.from(_products);
  List<Product> get displayedProducts {
    if(_showFavorites == false)
      return List.from(_products);
    return List.from(_products.where((p)=>p.isFavorite).toList());
  }
  bool get displayFavoritesOnly => _showFavorites;
  int get selectedProductIndex => _selectedProductIndex;
  Product get selectedProduct => _selectedProductIndex == null ? null
  : products[_selectedProductIndex];
  
  void addProducts(Product product){
     _products.add(product); 
     _selectedProductIndex = null;
     notifyListeners();
  }

  void updateProduct(Product product){
     _products[_selectedProductIndex]=product; 
     _selectedProductIndex = null;
    notifyListeners();
  }

  void deleteProduct(){
      _products.removeAt(_selectedProductIndex);
     _selectedProductIndex = null;
    notifyListeners();
  }

  void toggleProductFavoriteStatus(){
    final bool isCurrentlyFavorite = _products[_selectedProductIndex].isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updatedProduct = Product(
      title: selectedProduct.title,
      description: selectedProduct.description,
      image: selectedProduct.image,
      price: selectedProduct.price,
      isFavorite: newFavoriteStatus);
     _products[_selectedProductIndex]=updatedProduct; 
     _selectedProductIndex = null;
     notifyListeners();
  }

  void selectProduct(int index){
    _selectedProductIndex = index;
    notifyListeners();
  }

  void toggleDisplayMode(){
    _showFavorites = !_showFavorites;
    notifyListeners();
  } 
}

