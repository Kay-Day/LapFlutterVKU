class Question {
  final String kanji;
  final String hiragana;
  final String meaning;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.kanji,
    required this.hiragana,
    required this.meaning,
    required this.options,
    required this.correctAnswerIndex,
  });
}

List<Question> questionList = [
  Question(
    kanji: "環境",
    hiragana: "かんきょう",
    meaning: "Môi trường",
    options: ["Môi trường", "Nhiệt độ", "Khí hậu", "Hệ sinh thái"],
    correctAnswerIndex: 0,
  ),
  Question(
    kanji: "可能",
    hiragana: "かのう",
    meaning: "Khả năng",
    options: ["Không thể", "Khả năng", "Tương lai", "Hiện tại"],
    correctAnswerIndex: 1,
  ),
  Question(
    kanji: "価値",
    hiragana: "かち",
    meaning: "Giá trị",
    options: ["Lợi ích", "Tiền bạc", "Giá trị", "Chất lượng"],
    correctAnswerIndex: 2,
  ),
  // Thêm nhiều câu hỏi khác...
];
