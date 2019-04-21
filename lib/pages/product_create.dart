import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() => _ProductCreatePageState();
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue;
  String _descriptionValue;
  double _priceValue = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      validator: (String val){
        if(val.isEmpty){
          return 'title is required';
        }
      },
      onSaved: (String val) {
        setState(() {
          _titleValue = val;
        });
      },
      decoration: InputDecoration(
        labelText: "Product Title",
      ),
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      validator: (String val){
        if(val.isEmpty){
          return 'Description is required';
        }
      },
      onSaved: (String val) {
        setState(() {
          _descriptionValue = val;
        });
      },
      decoration: InputDecoration(
        labelText: "Product Description",
      ),
      maxLines: 4,
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      onSaved: (String val) {
        setState(() {
          _priceValue = double.parse(val);
        });
      },
      decoration: InputDecoration(
        labelText: "Product Price",
      ),
      keyboardType: TextInputType.number,
    );
  }

  void _submitForm() {
    //call validator on TextFormField
    if(!_formKey.currentState.validate()){
      return;
    }
    //call onSaved on TextFormField
    _formKey.currentState.save();
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'description': _descriptionValue,
      'price': _priceValue,
      'image': 'assets/food.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final targetWidth = deviceWidth > 550 ? 500 : deviceWidth * .95;
    final double targetPadding = deviceWidth - targetWidth;

    return Container(
        width: targetWidth,
        margin: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
            child: ListView(
          padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
          children: <Widget>[
            Column(
              children: <Widget>[
                _buildTitleTextField(),
                _buildDescriptionTextField(),
                _buildPriceTextField(),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  child: Text("Save"),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: _submitForm,
                )
              ],
            )
          ],
        )));
  }
}
