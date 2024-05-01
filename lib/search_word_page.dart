import 'package:bloc_search/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWordPage extends StatelessWidget {
  const SearchWordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search")),
      body: Column(
        children: [
          _searchfields(context),
          _words(context),
        ],
      ),
    );
  }

  _searchfields(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Search...",
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        onChanged: (value) {
          context.read<SearchBloc>().add(SearchWord(word: value));
        },
      ),
    );
  }

  _words(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is LoadedWords) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Text(
                    state.words[index],
                    style: const TextStyle(color: Colors.black),
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                      thickness: 0.2,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                itemCount: state.words.length),
          );
        }
        return Container();
      },
    );
  }
}
