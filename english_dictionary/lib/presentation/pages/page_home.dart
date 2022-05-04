import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/word/word_bloc.dart';
import '../widgets/word_list_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: BlocBuilder<WordBloc, WordState>(
        builder: (BuildContext context, WordState state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: controller,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<WordBloc>().add(
                      WordEvent.fetchWordExplanation(
                        word: controller.text,
                      ),
                    );

                FocusScope.of(context).unfocus();
              },
              child: const Text('Get Word Explanation'),
            ),
            state.map(
              wordLoadInProgress: (_) => const CircularProgressIndicator(),
              wordFetchSuccess: (WordFetchSuccess state) => state.wordResponse != null
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: state.wordResponse!.listOfExplanation.length,
                        itemBuilder: (BuildContext context, int index) => Builder(
                          builder: (BuildContext context) => ExpansionTile(
                            title: Text('$index'),
                            children: <WordListTile>[
                              WordListTile(
                                wordExplanation: state.wordResponse!.listOfExplanation[index],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              wordFetchFailure: (WordFetchFailure state) => Column(
                children: <Widget>[
                  Text(state.errorMessage),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
