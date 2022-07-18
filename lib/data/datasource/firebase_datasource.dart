import 'package:admin_camera_direct/data/response/abstract_contract.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRepository implements AbstractContract {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getFiles() async {
    try {
      QuerySnapshot<Map<String, dynamic>> resp =
        await _firestore.collection("Files").get();
    return resp.docs;
    } catch (e) {
      throw Exception(e);
    }
  }
}
