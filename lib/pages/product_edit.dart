import 'package:flutter/material.dart';

class ProductEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Map<String, dynamic> product;
  final int index;

  ProductEditPage(
      {this.addProduct, this.product, this.updateProduct, this.index});

  @override
  State<StatefulWidget> createState() => _ProductEditPageState();
}

class _ProductEditPageState extends State<ProductEditPage> {
  String _titleValue;
  String _descriptionValue;
  double _priceValue = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      initialValue: widget.product == null ? '' : widget.product['title'],
      validator: (String val) {
        if (val.isEmpty) {
          return 'title is required';
        }
      },
      onSaved: (String val) {
        _titleValue = val;
      },
      decoration: InputDecoration(
        labelText: "Product Title",
      ),
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      initialValue: widget.product == null ? '' : widget.product['description'],
      validator: (String val) {
        if (val.isEmpty) {
          return 'Description is required';
        }
      },
      onSaved: (String val) {
        _descriptionValue = val;
      },
      decoration: InputDecoration(
        labelText: "Product Description",
      ),
      maxLines: 4,
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      initialValue:
          widget.product == null ? '' : widget.product['price'].toString(),
      validator: (String val) {
        if (val.isEmpty) {
          return 'Price is required';
        }
      },
      onSaved: (String val) {
        _priceValue = double.parse(val);
      },
      decoration: InputDecoration(
        labelText: "Product Price",
      ),
      keyboardType: TextInputType.number,
    );
  }

  void _submitForm() {
    //call validator on TextFormField
    if (!_formKey.currentState.validate()) {
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
    if (widget.product == null) {
      widget.addProduct(product);
    } else {
      widget.updateProduct(widget.index, product);
    }

    Navigator.pushReplacementNamed(context, '/');
  }

  _buildPageContent(targetWidth, targetPadding) {
    return GestureDetector(
        onTap: () {
          //close keyboard
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
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
                ))));
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final targetWidth = deviceWidth > 550 ? 500 : deviceWidth * .95;
    final double targetPadding = deviceWidth - targetWidth;
    final Widget pageContent = _buildPageContent(targetWidth, targetPadding);

    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit Product'),
            ),
            body: pageContent,
          );
  }
}
