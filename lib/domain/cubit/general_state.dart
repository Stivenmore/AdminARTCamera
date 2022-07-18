part of 'general_cubit.dart';

abstract class GeneralState extends Equatable {
  const GeneralState();

  @override
  List<Object> get props => [];
}

class GeneralLoading extends GeneralState {}

class GeneralLoaded extends GeneralState {
  final List<DocumentModel> docs;
  const GeneralLoaded({required this.docs});

  @override
  List<Object> get props => [docs];
}

class GeneralError extends GeneralState {
  final String error;
  const GeneralError({required this.error});

  @override
  List<Object> get props => [error];
}
