import 'package:equatable/equatable.dart';

class FavItemsModel extends Equatable {
  final String id;
  final String value;
  final bool isDeleting;
  final bool isFavourite;
  const FavItemsModel({
    required this.id,
    required this.value,
    this.isDeleting = false,
    this.isFavourite = false,
  });

  FavItemsModel copyWith({
    String? id,
    String? value,
    bool? isDeleting,
    bool? isFavourite,
  }) {
    return FavItemsModel(
      id: id ?? this.id,
      value: value ?? this.value,
      isDeleting: isDeleting ?? this.isDeleting,
      isFavourite: isDeleting ?? this.isFavourite,
    );
  }

  @override
  List<Object?> get props => [id, value, isDeleting, isFavourite];
}
