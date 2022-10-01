import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/screens/home_screen.dart';

import '../utl/constant_value.dart';
import 'image_controller/image_picker_screen.dart';
import 'main_screen.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key, required this.imageFile}) : super(key: key);
  final String imageFile;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool isChoosen = false;

  String Id = '';
  int newId = 0;


  var _imagepath;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xff5a9ea8),
        title: Text("Edit Your Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  widget.imageFile !=null && widget.imageFile != ""  ?  CircleAvatar(
                    backgroundImage: FileImage(File(widget.imageFile)),
                    radius: 66,
                  ) : CircleAvatar(
                    radius: 66,
                  ) ,
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ImagePickerScreen()));
                      },
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.red,
                      ))
                ],
              ),
              //nameControoler
              Container(
                width: 200,
                height: 70,
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: "Name"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //emailControoler
              Container(
                width: 200,
                height: 150,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: "Email"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //phoneControoler
              Container(
                width: 200,
                height: 150,
                child: TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(hintText: "phone"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //passwordControoler
              Container(
                width: 200,
                height: 150,
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(hintText: "password"),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await editProfile();
                    SaveImage(widget.imageFile);
                  },
                  child: Text("Submit"))

            ],
          ),
        ),
      ),
    );
  }

  Future editProfile() async {
    await getId();
    print(nameController.text);
    final response = await http
        .post(Uri.parse("${ConstantValue.URL}UpdateProfile.php"), body: {
      "Id": Id,
      "Name": nameController.text,
      "Email": emailController.text,
      "Phone": phoneController.text,
      "Password": passwordController.text,
    });

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      print(jsonBody);
      setState(() {});
      Navigator.push(context, MaterialPageRoute(builder: (_) => MainScreen()));
    } else {
      print("error");
    }
  }


  Future getId() async {
    final prefs = await SharedPreferences.getInstance();
    Id = prefs.getString("Id")!;
    print("this is id ? ${Id}");
    setState(() {});
  }

  void SaveImage (path) async{
    SharedPreferences saveimage=await SharedPreferences.getInstance();
    saveimage.setString("imagepath", path) ;

  }




}
