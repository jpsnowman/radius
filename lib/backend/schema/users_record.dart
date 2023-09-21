import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "location_pin_color" field.
  String? _locationPinColor;
  String get locationPinColor => _locationPinColor ?? '';
  bool hasLocationPinColor() => _locationPinColor != null;

  // "location_on" field.
  bool? _locationOn;
  bool get locationOn => _locationOn ?? false;
  bool hasLocationOn() => _locationOn != null;

  // "focus_user" field.
  String? _focusUser;
  String get focusUser => _focusUser ?? '';
  bool hasFocusUser() => _focusUser != null;

  // "location_timestamp" field.
  DateTime? _locationTimestamp;
  DateTime? get locationTimestamp => _locationTimestamp;
  bool hasLocationTimestamp() => _locationTimestamp != null;

  // "location_default_zoom" field.
  double? _locationDefaultZoom;
  double get locationDefaultZoom => _locationDefaultZoom ?? 0.0;
  bool hasLocationDefaultZoom() => _locationDefaultZoom != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _locationPinColor = snapshotData['location_pin_color'] as String?;
    _locationOn = snapshotData['location_on'] as bool?;
    _focusUser = snapshotData['focus_user'] as String?;
    _locationTimestamp = snapshotData['location_timestamp'] as DateTime?;
    _locationDefaultZoom =
        castToType<double>(snapshotData['location_default_zoom']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  LatLng? location,
  String? firstName,
  String? lastName,
  String? locationPinColor,
  bool? locationOn,
  String? focusUser,
  DateTime? locationTimestamp,
  double? locationDefaultZoom,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'location': location,
      'first_name': firstName,
      'last_name': lastName,
      'location_pin_color': locationPinColor,
      'location_on': locationOn,
      'focus_user': focusUser,
      'location_timestamp': locationTimestamp,
      'location_default_zoom': locationDefaultZoom,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.location == e2?.location &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.locationPinColor == e2?.locationPinColor &&
        e1?.locationOn == e2?.locationOn &&
        e1?.focusUser == e2?.focusUser &&
        e1?.locationTimestamp == e2?.locationTimestamp &&
        e1?.locationDefaultZoom == e2?.locationDefaultZoom;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.location,
        e?.firstName,
        e?.lastName,
        e?.locationPinColor,
        e?.locationOn,
        e?.focusUser,
        e?.locationTimestamp,
        e?.locationDefaultZoom
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
