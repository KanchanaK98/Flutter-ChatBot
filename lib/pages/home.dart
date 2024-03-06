import 'package:chatbot_geminiai/bloc/chat_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatbot_geminiai/models/chat_message_model.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ChatBlocBloc chatBloc = ChatBlocBloc();
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatBlocBloc,ChatBlocState>(
        bloc: chatBloc,
        
        listener: (context,state){

        },
        builder: (context,state){
          switch (state.runtimeType) {
            case ChatSuccessState:
            List<ChatMessageModel> messages = (state as ChatSuccessState).messages;
              return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(opacity: 0.5,image: AssetImage("assets/bg.jpg"),fit: BoxFit.cover)
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
                Expanded(child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context,index){
                  return Container(
                    margin: const EdgeInsets.only(bottom: 6,left: 10,right: 10),
                    padding: const EdgeInsets.all(16),decoration: BoxDecoration(borderRadius: BorderRadius.circular(26),color: const Color.fromARGB(255, 219, 207, 172)),child: 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(messages[index].role == 'user'?"User":"Bot",style: TextStyle(fontSize:10,color: messages[index].role == 'user'?Color.fromARGB(255, 18, 71, 125):Colors.purple ),),
                        const SizedBox(height: 12,),
                        Text(messages[index].parts.first.text,style: TextStyle(color: Colors.black,fontSize: 15,height: 1.2),),
                      ],
                    ));
                })),
                if(chatBloc.generating)
                Container(height: 80,width: 80,child: Lottie.asset('assets/loader.json')),
                Container(padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                child: Row(children: [
                  Expanded(child: TextField(
                    controller: textEditingController,
                    // style: TextStyle(color: Colors.black),
                    // cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(labelText: 'Ask Something...',border: OutlineInputBorder(borderRadius: BorderRadius.circular(120)),focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 176, 237, 11)),borderRadius: BorderRadius.circular(120)),fillColor: Colors.white10,filled: true),
                  )),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: (){
                      if(textEditingController.text.isNotEmpty)
                      {
                        String text = textEditingController.text;
                        textEditingController.clear();
                        chatBloc.add(ChatGenerateNewTextMessageEvent(inputMessage: text));
                      }
                    }
                    ,child: const CircleAvatar(radius: 28,backgroundColor: Colors.white,child: CircleAvatar(radius: 25,backgroundColor: Colors.blue,child: Center(child: Icon(Icons.send,color: Colors.white,),),)))
                ],),)
              ],
            ),
            );
            default:
            return SizedBox();
          }
        },
      )
      
    );
  }
}