import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "imageurl" field.
  String? _imageurl;
  String get imageurl => _imageurl ?? '';
  bool hasImageurl() => _imageurl != null;

  // "posted_at" field.
  DateTime? _postedAt;
  DateTime? get postedAt => _postedAt;
  bool hasPostedAt() => _postedAt != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "solved_image_url" field.
  String? _solvedImageUrl;
  String get solvedImageUrl => _solvedImageUrl ?? '';
  bool hasSolvedImageUrl() => _solvedImageUrl != null;

  // "solved" field.
  bool? _solved;
  bool get solved => _solved ?? false;
  bool hasSolved() => _solved != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "uid2" field.
  DocumentReference? _uid2;
  DocumentReference? get uid2 => _uid2;
  bool hasUid2() => _uid2 != null;

  void _initializeFields() {
    _imageurl = snapshotData['imageurl'] as String?;
    _postedAt = snapshotData['posted_at'] as DateTime?;
    _category = snapshotData['category'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _solvedImageUrl = snapshotData['solved_image_url'] as String?;
    _solved = snapshotData['solved'] as bool?;
    _description = snapshotData['description'] as String?;
    _uid2 = snapshotData['uid2'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  String? imageurl,
  DateTime? postedAt,
  String? category,
  LatLng? location,
  String? solvedImageUrl,
  bool? solved,
  String? description,
  DocumentReference? uid2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'imageurl': imageurl,
      'posted_at': postedAt,
      'category': category,
      'location': location,
      'solved_image_url': solvedImageUrl,
      'solved': solved,
      'description': description,
      'uid2': uid2,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    return e1?.imageurl == e2?.imageurl &&
        e1?.postedAt == e2?.postedAt &&
        e1?.category == e2?.category &&
        e1?.location == e2?.location &&
        e1?.solvedImageUrl == e2?.solvedImageUrl &&
        e1?.solved == e2?.solved &&
        e1?.description == e2?.description &&
        e1?.uid2 == e2?.uid2;
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.imageurl,
        e?.postedAt,
        e?.category,
        e?.location,
        e?.solvedImageUrl,
        e?.solved,
        e?.description,
        e?.uid2
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
