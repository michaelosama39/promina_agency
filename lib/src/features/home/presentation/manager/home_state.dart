part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetImageState extends HomeState {
  final List<String>? images;
  final RequestState requestState;
  final String? message;

  GetImageState({required this.requestState , this.images , this.message});
}


class UploadImageState extends HomeState {
  final RequestState requestState;
  final String? message;

  UploadImageState({required this.requestState , this.message});
}
