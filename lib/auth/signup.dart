import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/notes.png", height: 100),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                    border:
                    OutlineInputBorder(borderSide: BorderSide(width: 1)),
                    label: Text("username"),
                    prefixIcon: Icon(Icons.person)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                    border:
                    OutlineInputBorder(borderSide: BorderSide(width: 1)),
                    label: Text("email"),
                    prefixIcon: Icon(Icons.person)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                    border:
                    OutlineInputBorder(borderSide: BorderSide(width: 1)),
                    label: Text("password"),
                    prefixIcon: Icon(Icons.password)),
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(" do you have an account ? "),
                  InkWell(child: Text("click here",style: TextStyle(color: Colors.blue),),onTap: (){
                    Navigator.of(context).pop();
                  }),
                ],
              ),
            ),
            ElevatedButton(onPressed: (){}, child: Text("تسجيل حساب جديد"),),
          ],
        ),
      ),
    );
  }
}
