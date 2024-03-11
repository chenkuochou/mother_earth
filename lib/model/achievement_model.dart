// ignore_for_file: public_member_api_docs, sort_constructors_first
class AchievementModel {
  final String title;
  final String description;
  final String imageUrl;
  final bool? isFirstClicked;

  AchievementModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.isFirstClicked = true,
  });

  AchievementModel copyWith({
    String? title,
    String? description,
    String? imageUrl,
    bool? isFirstClicked,
  }) {
    return AchievementModel(
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isFirstClicked: isFirstClicked ?? this.isFirstClicked,
    );
  }
}
