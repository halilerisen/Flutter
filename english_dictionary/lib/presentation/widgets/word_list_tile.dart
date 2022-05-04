import 'package:flutter/material.dart';

import '../../data/model/model_word_explanation.dart';

class WordListTile extends StatelessWidget {
  const WordListTile({
    required ModelWordExplanation wordExplanation,
    Key? key,
  })  : _wordExplanation = wordExplanation,
        super(key: key);

  final ModelWordExplanation _wordExplanation;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _WordTitleWithExplanation(
            title: 'Definition',
            explanation: _wordExplanation.definition,
          ),
          _WordTitleWithExplanation(
            title: 'Thumbs Up',
            explanation: _wordExplanation.thumbsUp.toString(),
          ),
          _WordTitleWithExplanation(
            title: 'Author',
            explanation: _wordExplanation.author,
          ),
          _WordTitleWithExplanation(
            title: 'Defid',
            explanation: _wordExplanation.defid.toString(),
          ),
          _WordTitleWithExplanation(
            title: 'current Vote',
            explanation: _wordExplanation.currentVote,
          ),
          _WordTitleWithExplanation(
            title: 'written On',
            explanation: _wordExplanation.writtenOn.toString(),
          ),
          _WordTitleWithExplanation(
            title: 'Example',
            explanation: _wordExplanation.example,
          ),
          _WordTitleWithExplanation(
            title: 'thumbs Down',
            explanation: _wordExplanation.thumbsDown.toString(),
          ),
        ],
      );
}

class _WordTitleWithExplanation extends StatelessWidget {
  const _WordTitleWithExplanation({
    required this.title,
    required this.explanation,
    Key? key,
  }) : super(key: key);

  final String title;
  final String explanation;

  @override
  Widget build(BuildContext context) => RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: '$title : ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: explanation,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.green,
              ),
            ),
          ],
        ),
      );
}
