import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/model/items_model.dart';
import 'package:untitled4/screens/items_det_screen.dart';
import 'package:http/http.dart' as http;
import 'package:untitled4/utl/constant_value.dart';

class ItemsScreen extends StatefulWidget {
  var categId;
  var categName;

  ItemsScreen(this.categId, this.categName);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ItemsScreenState(categId, categName);
  }
}

class ItemsScreenState extends State<ItemsScreen> {
  var categId;
  var categName;

  ItemsScreenState(this.categId, this.categName);

  List<Items> itemsList = [];

  @override
  void initState() {
    super.initState();
    getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categName),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ItemDetScreen(
                        itemsList[index].id,
                        itemsList[index].name,
                        itemsList[index].price,
                        itemsList[index].des)),
              );
            },
            child: Column(
              children: [
                Image.network(itemsList[index].image),
                Text(itemsList[index].name),
                Text(itemsList[index].price.toString())
              ],
            ),
          );
        },
        itemCount: itemsList.length,
      ),
    );
  }

  Future getItems() async {
    final response = await http.post(
        Uri.parse("${ConstantValue.URL}GetItemscat.php"),
        body: {"Id_categories": categId}
    );

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var items = jsonBody["items"];
      for (Map i in items) {
        itemsList.add(
            Items(i["Id"], i["Name"], i["HomeImage"], i["Price"], i["Des"]));
      }
      setState(() {});
    }
  }
}
