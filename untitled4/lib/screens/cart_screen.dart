import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/screens/seccess_order.dart';
import '../model/cart_model.dart';
import '../utl/constant_value.dart';

class CartScreen extends StatefulWidget {
  var fromMain;

  CartScreen(this.fromMain);

  @override
  State<StatefulWidget> createState() {
    return CartScreenState(fromMain);
  }
}

class CartScreenState extends State<CartScreen> {
  String Id = '';
  var fromMain;
  double totalPrice = 0;

  CartScreenState(this.fromMain);

  List<CartModel> cartList = [
    CartModel(1, "item 1", 25, 3,
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
    CartModel(2, "item 2", 25, 3,
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
    CartModel(3, "item 3", 25, 3,
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
    CartModel(4, "item 4", 25, 3,
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg")
  ];

  @override
  Widget build(BuildContext context) {

    totalPrice = 0;
    for (int x = 0; x < cartList.length; x++) {
      totalPrice = totalPrice + (cartList[x].price * cartList[x].count);
    }
    return Scaffold(
      appBar: fromMain ? null : AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: fromMain
                  ? MediaQuery.of(context).size.height - 300
                  : MediaQuery.of(context).size.height - 300,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.network(
                              cartList[index].image,
                              width: 150,
                              height: 100,
                            ),
                            Column(
                              children: [
                                Text(
                                  cartList[index].name,
                                  style: TextStyle(fontSize: 25),
                                ),
                                Text(cartList[index].price.toString())
                              ],
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: TextButton(
                                onPressed: () {
                                  if (cartList[index].count != 1) {
                                    cartList[index].count =
                                        cartList[index].count - 1;
                                  } else {
                                    cartList.removeAt(index);
                                  }

                                  setState(() {});
                                },
                                child: Text("-",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.black)),
                              ),
                            ),
                            Text(cartList[index].count.toString()),
                            IconButton(
                              onPressed: () {
                                cartList[index].count = cartList[index].count + 1;

                                setState(() {});
                              },
                              icon: Icon(
                                Icons.add,
                                size: 25,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: cartList.length,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 75,
              padding: EdgeInsets.all(10),
              child: Row(
                  children: [Text("Total Price"), Text("$totalPrice")],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 75,
        child: TextButton(onPressed: () {
          addOrder();

        }, child: Text("Add Order")),
      ),
    );
  }


  Future addOrder() async {
    await getId();
    Response response = await http.post(
        Uri.parse("${ConstantValue.URL}AddOrder.php"),
        body: {
          "Id_users": Id,
          "TotalPrice": totalPrice.toString(),
          "Longitude": "",
          "Latitude": "",
          "Note": "",

        });

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      print(jsonBody);
      setState(() {});
      Navigator.push(context, MaterialPageRoute(builder: (_)=> SuccesOrder()));
    }else {
      print("error");
    }
  }

  Future getId()async{
    final prefs = await SharedPreferences.getInstance();
    Id = prefs.getString("Id")!;
    setState(() {

    });
  }

}
