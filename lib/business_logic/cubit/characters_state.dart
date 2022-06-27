part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class DataLoaded extends CharactersState {
  final List<Results> data;

  DataLoaded(this.data);
}
