import 'package:bloc/bloc.dart';

class UpdatesBloc extends Bloc<UpdateEvent, UpdatedState> {
  UpdatesBloc() : super(SubjectInitial());

  @override
  Stream<UpdatedState> mapEventToState(UpdateEvent event) async* {
    // TODO: implement mapEventToState
  }
}

class SubjectInitial extends UpdatedState {}

class UpdatedState {}

class UpdateEvent {}
