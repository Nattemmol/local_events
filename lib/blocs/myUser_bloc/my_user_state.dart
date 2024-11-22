import 'package:equatable/equatable.dart';

sealed class MyUserBlocState extends Equatable {
  const MyUserBlocState();
  @override
  List<Object> get props => [];
}

final class MyUserBlocInitial extends MyUserBlocState {}
