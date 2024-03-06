import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatbot_geminiai/models/chat_message_model.dart';
import 'package:meta/meta.dart';

part 'chat_bloc_event.dart';
part 'chat_bloc_state.dart';

class ChatBlocBloc extends Bloc<ChatBlocEvent, ChatBlocState> {
  ChatBlocBloc() : super(ChatBlocInitial()) {
    on<ChatGenerateNewTextMessageEvent>(chatGenerateNewTextMessageEvent);
    
  }
List<ChatMessageModel> messages = [];
  FutureOr<void> chatGenerateNewTextMessageEvent(ChatGenerateNewTextMessageEvent event, Emitter<ChatBlocState> emit) {
    messages.add(ChatMessageModel(role: "user", parts: [
      ChatPartModel(text: event.inputMessage)
    ]))
  }
}
