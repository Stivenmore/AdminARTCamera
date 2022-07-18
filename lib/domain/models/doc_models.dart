class DocumentModel {
  final String? file0;
  final String? file1;
  final String? file2;
  final String? file3;
  final String? id;

  DocumentModel(
      {required this.file0,
      required this.file1,
      required this.file2,
      required this.file3,
      required this.id});

  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
      file0: json['File0'] ?? "", 
      file1: json['File1'] ?? "", 
      file2: json['File2'] ?? "", 
      file3: json['File3'] ?? "", 
      id: json['Id']);
  }
}
