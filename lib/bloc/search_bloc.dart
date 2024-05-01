import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(LoadedWords(words: words)) {
    on<SearchWord>(
      (event, emit) {
        List<String> searchTitles = [];
        for (var element in words) {
          if (element.contains(event.word)) {
            searchTitles.add(element);
          }
        }
        emit(LoadedWords(words: searchTitles));
      },
    );
  }
  static List<String> words = [
    'Flutter',
    'Google',
    'Flutter Guys',
    'Tutorial',
    'Bloc Tutirial',
    'Project'
  ];
}

//state inst
abstract class SearchState {}

//event inst
abstract class SearchEvent {}

//states impl
class InitialState extends SearchState {}

class LoaderState extends SearchState {}

class LoadedWords extends SearchState {
  final List<String> words;

  LoadedWords({required this.words});
}

//events impl
class SearchWord extends SearchEvent {
  final String word;
  SearchWord({required this.word});
}
