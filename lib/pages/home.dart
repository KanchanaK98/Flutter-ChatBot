import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/bg.jpg"),fit: BoxFit.cover)
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Chat App",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'MadimiOne'),)
                ],
              ),
            ),
            Expanded(child: ListView()),
            Container(padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
            child: Row(children: [
              Expanded(child: TextField(
                // style: TextStyle(color: Colors.black),
                // cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(labelText: 'Chatting...',border: OutlineInputBorder(borderRadius: BorderRadius.circular(120)),focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 176, 237, 11)),borderRadius: BorderRadius.circular(120)),fillColor: Colors.white10,filled: true),
              )),
              const SizedBox(width: 10),
              const CircleAvatar(radius: 28,backgroundColor: Colors.white,child: CircleAvatar(radius: 25,backgroundColor: Colors.blue,child: Center(child: Icon(Icons.send,color: Colors.white,),),))
            ],),)
          ],
        ),
        ),
    );
  }
}