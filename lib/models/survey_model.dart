import 'dart:convert';

import 'package:flutter/foundation.dart';

class Survey {
  String question;
  int selectionIndex;
  List<String> options;
  Survey({
    required this.question,
    required this.selectionIndex,
    required this.options,
  });

  Survey copyWith({
    String? question,
    int? selectionIndex,
    List<String>? options,
  }) {
    return Survey(
      question: question ?? this.question,
      selectionIndex: selectionIndex ?? this.selectionIndex,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'selectionIndex': selectionIndex,
      'options': options,
    };
  }

  factory Survey.fromMap(Map<String, dynamic> map) {
    return Survey(
        question: map['question'] as String,
        selectionIndex: map['selectionIndex'] as int,
        options: List<String>.from(
          (map['options'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Survey.fromJson(String source) =>
      Survey.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Survey(question: $question, selectionIndex: $selectionIndex, options: $options)';

  @override
  bool operator ==(covariant Survey other) {
    if (identical(this, other)) return true;

    return other.question == question &&
        other.selectionIndex == selectionIndex &&
        listEquals(other.options, options);
  }

  @override
  int get hashCode =>
      question.hashCode ^ selectionIndex.hashCode ^ options.hashCode;
}
