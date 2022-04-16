import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'bricks_record.g.dart';

abstract class BricksRecord
    implements Built<BricksRecord, BricksRecordBuilder> {
  static Serializer<BricksRecord> get serializer => _$bricksRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Between')
  String get between;

  @nullable
  @BuiltValueField(wireName: 'Index')
  int get index;

  @nullable
  @BuiltValueField(wireName: 'Inscription')
  String get inscription;

  @nullable
  @BuiltValueField(wireName: 'LatLong')
  LatLng get latLong;

  @nullable
  @BuiltValueField(wireName: 'Latitude')
  double get latitude;

  @nullable
  @BuiltValueField(wireName: 'Located')
  String get located;

  @nullable
  @BuiltValueField(wireName: 'Longitude')
  double get longitude;

  @nullable
  @BuiltValueField(wireName: 'Page')
  int get page;

  @nullable
  @BuiltValueField(wireName: 'Status')
  String get status;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BricksRecordBuilder builder) => builder
    ..between = ''
    ..index = 0
    ..inscription = ''
    ..latitude = 0.0
    ..located = ''
    ..longitude = 0.0
    ..page = 0
    ..status = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bricks');

  static Stream<BricksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BricksRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static BricksRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      BricksRecord(
        (c) => c
          ..between = snapshot.data['Between']
          ..index = snapshot.data['Index']
          ..inscription = snapshot.data['Inscription']
          ..latLong = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..latitude = snapshot.data['Latitude']
          ..located = snapshot.data['Located']
          ..longitude = snapshot.data['Longitude']
          ..page = snapshot.data['Page']
          ..status = snapshot.data['Status']
          ..reference = BricksRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<BricksRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'bricks',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  BricksRecord._();
  factory BricksRecord([void Function(BricksRecordBuilder) updates]) =
      _$BricksRecord;

  static BricksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBricksRecordData({
  String between,
  int index,
  String inscription,
  LatLng latLong,
  double latitude,
  String located,
  double longitude,
  int page,
  String status,
}) =>
    serializers.toFirestore(
        BricksRecord.serializer,
        BricksRecord((b) => b
          ..between = between
          ..index = index
          ..inscription = inscription
          ..latLong = latLong
          ..latitude = latitude
          ..located = located
          ..longitude = longitude
          ..page = page
          ..status = status));
