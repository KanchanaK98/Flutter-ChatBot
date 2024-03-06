import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatbot_geminiai/models/chat_message_model.dart';
import 'package:chatbot_geminiai/repos/chat_repo.dart';
import 'package:meta/meta.dart';

part 'chat_bloc_event.dart';
part 'chat_bloc_state.dart';

class ChatBlocBloc extends Bloc<ChatBlocEvent, ChatBlocState> {
  ChatBlocBloc() : super(ChatSuccessState(messages: [])) {
    on<ChatGenerateNewTextMessageEvent>(chatGenerateNewTextMessageEvent);
    
  }
List<ChatMessageModel> messages = [];
  FutureOr<void> chatGenerateNewTextMessageEvent(ChatGenerateNewTextMessageEvent event, Emitter<ChatBlocState> emit) async {
    messages.add(ChatMessageModel(role: "user", parts: [
      ChatPartModel(text: event.inputMessage)
    ]));
    emit(ChatSuccessState(messages: messages));
     await ChatRepo.chatTextGenerationRepo(messages);
  }
}
