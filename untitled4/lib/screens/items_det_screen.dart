import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/screens/cart_screen.dart';
import 'package:untitled4/utl/constant_value.dart';

import '../model/images_model.dart';
import 'package:http/http.dart' as http;

class ItemDetScreen extends StatefulWidget {
  var id;
  var name;
  var price;
  var des;

  ItemDetScreen(this.id, this.name, this.price, this.des);

  @override
  State<StatefulWidget> createState() {
    return ItemDetScreenState(id, name, price, des);
  }
}

class ItemDetScreenState extends State<ItemDetScreen> {
  var id;
  var name;
  var price;
  var des;

  ItemDetScreenState(this.id, this.name, this.price, this.des);

  List<ImagesModel> imagelist = [];

  @override
  void initState() {
    super.initState();
    getItemImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imagelist.length,
                itemBuilder: (context, index) {
                  return Image.network(imagelist[index].image);
                },
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            Text(
              '$price',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            Text(
              des,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Amazing items"),
                  content: Text("What Do You Want to Do ?"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartScreen(false)),
                          );
                        },
                        child: Text("View Cart")),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text("Con Shoping"))
                  ],
                );
              },
            );
          },
          child: Text("Add To Cart")),
    );
  }

  Future getItemImages() async {
    final response = await http.post(
        Uri.parse("${ConstantValue.URL}getItemImages.php"),
        body: {"Id_items": id});

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var images = jsonBody["Images"];
      for (Map i in images) {
        imagelist.add(ImagesModel(i["Id"], i["Image"]));
      }
    }
    setState(() {});
  }
}
