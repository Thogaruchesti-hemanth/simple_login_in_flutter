import 'package:flutter/material.dart';
import 'package:my_first_app/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool value1 =false;
 String value="";
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Text("Login", style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.07,fontWeight: FontWeight.bold)),
            Padding(
            padding: const EdgeInsets.only(bottom:30,top:50),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Enter UserID",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                prefixIcon: Icon(
                    Icons.person),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 50,
                  minHeight: 50
                )
              )
                      ),
          ),
            Padding(
              padding: const EdgeInsets.only(bottom:15),
              child: TextField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: "Enter Password",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                    prefixIcon: Icon(Icons.lock),
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 50,
                      minHeight: 50
                    ),
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    }, icon: Icon(_obscureText?Icons.visibility_off:Icons.visibility)),
                    suffixIconConstraints: BoxConstraints(
                        minWidth: 50,
                        minHeight: 50
                    ),
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:15),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(value: value1,
                    fillColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.amber;
                      }
                    }),
                      onChanged:(val) {
                        setState(() {
                          value1 = val!;
                        });
                      },
                  ),
                  Text("Remember me", style: TextStyle(color: Colors
                      .black54, fontSize: 18),),
                ],
              )

            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage()));
              },
              borderRadius:BorderRadius.circular(30),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(

                      begin:Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Colors.yellow,Colors.orange,Colors.red
                  ]),

                ),
                child: Center(child: Text("Login",style: TextStyle( fontSize:22,color: Colors.white,fontWeight: FontWeight.w500),)),
              ),
            ),
            SizedBox(height:30,),
            Text("Forget Password?",style: TextStyle(fontSize: 18,color: Colors.black38),),
            // Spacer(),
            SizedBox(height:50,),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text("Not a member? ",style:TextStyle(fontSize: 18,color: Colors.black54)),
                  GestureDetector(
                    onTap: (){
                      //TODO:Navigate to signUp Screen
                    },
                    child: Text("Sign Up Now",style: TextStyle(fontSize: 18, color: Colors.blueAccent, fontWeight: FontWeight.bold),),
                  )
                ]
              ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
