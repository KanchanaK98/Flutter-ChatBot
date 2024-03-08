part of 'chat_bloc_bloc.dart';

@immutable
sealed class ChatBlocState {}

final class ChatBlocInitial extends ChatBlocState {}


class ChatSuccessState extends ChatBlocState {
  final List<ChatMessageModel> messages;
  ChatSuccessState({
    required this.messages,
  });
}
class ChatFalseState extends ChatBlocState {
  final List<ChatMessageModel> messages;
  ChatFalseState({
    required this.messages,
  });
}