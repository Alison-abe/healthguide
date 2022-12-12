import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:healthguide/account.dart';
import 'package:healthguide/db/functions/db_functions1.dart';
import 'package:healthguide/signin.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

final mailcontroller = TextEditingController();
final passwordcontroller = TextEditingController();

String lemail='',lpassword='';

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 240, 198),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: mailcontroller,
              decoration: const InputDecoration(
                  hintText: 'email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      borderSide: BorderSide())),
            ),
            const SizedBox(height: 30),
            TextFormField(
              obscureText: true,
              controller: passwordcontroller,
              decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      borderSide: BorderSide())),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () async {
                  lemail=mailcontroller.text;
                  lpassword=passwordcontroller.text;
                  if(await checkPassword(lemail, lpassword)==0){
                    showDialog(context: context, builder: (context){
                    return const Dialog(child:Text('Invalid credentials',style: TextStyle(color: Colors.red),),
                      );
                    });
                    mailcontroller.clear();
                    passwordcontroller.clear();
                  }
                  else{
                    loadPage(lemail, context);
                  }
                },
                child:const Text(
                  "Login",
                )),
            const SizedBox(height: 30),
            Row(
              children: [
                const Text("Don't have an account?"),
              TextButton(onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx)=>SignIn())
                );
              }, 
              child: const Text("Sign In"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
