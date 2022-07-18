import 'package:admin_camera_direct/data/datasource/firebase_datasource.dart';
import 'package:admin_camera_direct/domain/models/doc_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'general_state.dart';

class GeneralCubit extends Cubit<GeneralState> {
  final FirebaseRepository _firebaseRepository;
  GeneralCubit({required FirebaseRepository firebaseRepository})
      : _firebaseRepository = firebaseRepository,
        super(GeneralLoading());

  List<DocumentModel> docs = [];

  Future getFiles() async {
    try {
      emit(GeneralLoading());
      List<QueryDocumentSnapshot<Map<String, dynamic>>> resp =
          await _firebaseRepository.getFiles();
      docs = (resp).map((e) => DocumentModel.fromJson(e.data())).toList();
      emit(GeneralLoaded(docs: docs));
    } catch (e) {
      emit(GeneralError(error: e.toString()));
    }
  }
}
