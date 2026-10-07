// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CachedHymnsTable extends CachedHymns
    with TableInfo<$CachedHymnsTable, CachedHymn> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedHymnsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hymnNumberMeta = const VerificationMeta(
    'hymnNumber',
  );
  @override
  late final GeneratedColumn<int> hymnNumber = GeneratedColumn<int>(
    'hymn_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleEnMeta = const VerificationMeta(
    'titleEn',
  );
  @override
  late final GeneratedColumn<String> titleEn = GeneratedColumn<String>(
    'title_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleNeMeta = const VerificationMeta(
    'titleNe',
  );
  @override
  late final GeneratedColumn<String> titleNe = GeneratedColumn<String>(
    'title_ne',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lyricsEnMeta = const VerificationMeta(
    'lyricsEn',
  );
  @override
  late final GeneratedColumn<String> lyricsEn = GeneratedColumn<String>(
    'lyrics_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lyricsNeMeta = const VerificationMeta(
    'lyricsNe',
  );
  @override
  late final GeneratedColumn<String> lyricsNe = GeneratedColumn<String>(
    'lyrics_ne',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _audioUrlMeta = const VerificationMeta(
    'audioUrl',
  );
  @override
  late final GeneratedColumn<String> audioUrl = GeneratedColumn<String>(
    'audio_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _videoUrlMeta = const VerificationMeta(
    'videoUrl',
  );
  @override
  late final GeneratedColumn<String> videoUrl = GeneratedColumn<String>(
    'video_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isBookmarkedMeta = const VerificationMeta(
    'isBookmarked',
  );
  @override
  late final GeneratedColumn<bool> isBookmarked = GeneratedColumn<bool>(
    'is_bookmarked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_bookmarked" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _tenantKeyMeta = const VerificationMeta(
    'tenantKey',
  );
  @override
  late final GeneratedColumn<String> tenantKey = GeneratedColumn<String>(
    'tenant_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    hymnNumber,
    titleEn,
    titleNe,
    lyricsEn,
    lyricsNe,
    audioUrl,
    videoUrl,
    isBookmarked,
    tenantKey,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_hymns';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedHymn> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('hymn_number')) {
      context.handle(
        _hymnNumberMeta,
        hymnNumber.isAcceptableOrUnknown(data['hymn_number']!, _hymnNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_hymnNumberMeta);
    }
    if (data.containsKey('title_en')) {
      context.handle(
        _titleEnMeta,
        titleEn.isAcceptableOrUnknown(data['title_en']!, _titleEnMeta),
      );
    } else if (isInserting) {
      context.missing(_titleEnMeta);
    }
    if (data.containsKey('title_ne')) {
      context.handle(
        _titleNeMeta,
        titleNe.isAcceptableOrUnknown(data['title_ne']!, _titleNeMeta),
      );
    } else if (isInserting) {
      context.missing(_titleNeMeta);
    }
    if (data.containsKey('lyrics_en')) {
      context.handle(
        _lyricsEnMeta,
        lyricsEn.isAcceptableOrUnknown(data['lyrics_en']!, _lyricsEnMeta),
      );
    } else if (isInserting) {
      context.missing(_lyricsEnMeta);
    }
    if (data.containsKey('lyrics_ne')) {
      context.handle(
        _lyricsNeMeta,
        lyricsNe.isAcceptableOrUnknown(data['lyrics_ne']!, _lyricsNeMeta),
      );
    } else if (isInserting) {
      context.missing(_lyricsNeMeta);
    }
    if (data.containsKey('audio_url')) {
      context.handle(
        _audioUrlMeta,
        audioUrl.isAcceptableOrUnknown(data['audio_url']!, _audioUrlMeta),
      );
    }
    if (data.containsKey('video_url')) {
      context.handle(
        _videoUrlMeta,
        videoUrl.isAcceptableOrUnknown(data['video_url']!, _videoUrlMeta),
      );
    }
    if (data.containsKey('is_bookmarked')) {
      context.handle(
        _isBookmarkedMeta,
        isBookmarked.isAcceptableOrUnknown(
          data['is_bookmarked']!,
          _isBookmarkedMeta,
        ),
      );
    }
    if (data.containsKey('tenant_key')) {
      context.handle(
        _tenantKeyMeta,
        tenantKey.isAcceptableOrUnknown(data['tenant_key']!, _tenantKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_tenantKeyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, tenantKey};
  @override
  CachedHymn map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedHymn(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      hymnNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hymn_number'],
      )!,
      titleEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title_en'],
      )!,
      titleNe: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title_ne'],
      )!,
      lyricsEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lyrics_en'],
      )!,
      lyricsNe: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lyrics_ne'],
      )!,
      audioUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio_url'],
      ),
      videoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}video_url'],
      ),
      isBookmarked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_bookmarked'],
      )!,
      tenantKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_key'],
      )!,
    );
  }

  @override
  $CachedHymnsTable createAlias(String alias) {
    return $CachedHymnsTable(attachedDatabase, alias);
  }
}

class CachedHymn extends DataClass implements Insertable<CachedHymn> {
  final int id;
  final int hymnNumber;
  final String titleEn;
  final String titleNe;
  final String lyricsEn;
  final String lyricsNe;
  final String? audioUrl;
  final String? videoUrl;
  final bool isBookmarked;
  final String tenantKey;
  const CachedHymn({
    required this.id,
    required this.hymnNumber,
    required this.titleEn,
    required this.titleNe,
    required this.lyricsEn,
    required this.lyricsNe,
    this.audioUrl,
    this.videoUrl,
    required this.isBookmarked,
    required this.tenantKey,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['hymn_number'] = Variable<int>(hymnNumber);
    map['title_en'] = Variable<String>(titleEn);
    map['title_ne'] = Variable<String>(titleNe);
    map['lyrics_en'] = Variable<String>(lyricsEn);
    map['lyrics_ne'] = Variable<String>(lyricsNe);
    if (!nullToAbsent || audioUrl != null) {
      map['audio_url'] = Variable<String>(audioUrl);
    }
    if (!nullToAbsent || videoUrl != null) {
      map['video_url'] = Variable<String>(videoUrl);
    }
    map['is_bookmarked'] = Variable<bool>(isBookmarked);
    map['tenant_key'] = Variable<String>(tenantKey);
    return map;
  }

  CachedHymnsCompanion toCompanion(bool nullToAbsent) {
    return CachedHymnsCompanion(
      id: Value(id),
      hymnNumber: Value(hymnNumber),
      titleEn: Value(titleEn),
      titleNe: Value(titleNe),
      lyricsEn: Value(lyricsEn),
      lyricsNe: Value(lyricsNe),
      audioUrl: audioUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(audioUrl),
      videoUrl: videoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(videoUrl),
      isBookmarked: Value(isBookmarked),
      tenantKey: Value(tenantKey),
    );
  }

  factory CachedHymn.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedHymn(
      id: serializer.fromJson<int>(json['id']),
      hymnNumber: serializer.fromJson<int>(json['hymnNumber']),
      titleEn: serializer.fromJson<String>(json['titleEn']),
      titleNe: serializer.fromJson<String>(json['titleNe']),
      lyricsEn: serializer.fromJson<String>(json['lyricsEn']),
      lyricsNe: serializer.fromJson<String>(json['lyricsNe']),
      audioUrl: serializer.fromJson<String?>(json['audioUrl']),
      videoUrl: serializer.fromJson<String?>(json['videoUrl']),
      isBookmarked: serializer.fromJson<bool>(json['isBookmarked']),
      tenantKey: serializer.fromJson<String>(json['tenantKey']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'hymnNumber': serializer.toJson<int>(hymnNumber),
      'titleEn': serializer.toJson<String>(titleEn),
      'titleNe': serializer.toJson<String>(titleNe),
      'lyricsEn': serializer.toJson<String>(lyricsEn),
      'lyricsNe': serializer.toJson<String>(lyricsNe),
      'audioUrl': serializer.toJson<String?>(audioUrl),
      'videoUrl': serializer.toJson<String?>(videoUrl),
      'isBookmarked': serializer.toJson<bool>(isBookmarked),
      'tenantKey': serializer.toJson<String>(tenantKey),
    };
  }

  CachedHymn copyWith({
    int? id,
    int? hymnNumber,
    String? titleEn,
    String? titleNe,
    String? lyricsEn,
    String? lyricsNe,
    Value<String?> audioUrl = const Value.absent(),
    Value<String?> videoUrl = const Value.absent(),
    bool? isBookmarked,
    String? tenantKey,
  }) => CachedHymn(
    id: id ?? this.id,
    hymnNumber: hymnNumber ?? this.hymnNumber,
    titleEn: titleEn ?? this.titleEn,
    titleNe: titleNe ?? this.titleNe,
    lyricsEn: lyricsEn ?? this.lyricsEn,
    lyricsNe: lyricsNe ?? this.lyricsNe,
    audioUrl: audioUrl.present ? audioUrl.value : this.audioUrl,
    videoUrl: videoUrl.present ? videoUrl.value : this.videoUrl,
    isBookmarked: isBookmarked ?? this.isBookmarked,
    tenantKey: tenantKey ?? this.tenantKey,
  );
  CachedHymn copyWithCompanion(CachedHymnsCompanion data) {
    return CachedHymn(
      id: data.id.present ? data.id.value : this.id,
      hymnNumber: data.hymnNumber.present
          ? data.hymnNumber.value
          : this.hymnNumber,
      titleEn: data.titleEn.present ? data.titleEn.value : this.titleEn,
      titleNe: data.titleNe.present ? data.titleNe.value : this.titleNe,
      lyricsEn: data.lyricsEn.present ? data.lyricsEn.value : this.lyricsEn,
      lyricsNe: data.lyricsNe.present ? data.lyricsNe.value : this.lyricsNe,
      audioUrl: data.audioUrl.present ? data.audioUrl.value : this.audioUrl,
      videoUrl: data.videoUrl.present ? data.videoUrl.value : this.videoUrl,
      isBookmarked: data.isBookmarked.present
          ? data.isBookmarked.value
          : this.isBookmarked,
      tenantKey: data.tenantKey.present ? data.tenantKey.value : this.tenantKey,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedHymn(')
          ..write('id: $id, ')
          ..write('hymnNumber: $hymnNumber, ')
          ..write('titleEn: $titleEn, ')
          ..write('titleNe: $titleNe, ')
          ..write('lyricsEn: $lyricsEn, ')
          ..write('lyricsNe: $lyricsNe, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('isBookmarked: $isBookmarked, ')
          ..write('tenantKey: $tenantKey')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    hymnNumber,
    titleEn,
    titleNe,
    lyricsEn,
    lyricsNe,
    audioUrl,
    videoUrl,
    isBookmarked,
    tenantKey,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedHymn &&
          other.id == this.id &&
          other.hymnNumber == this.hymnNumber &&
          other.titleEn == this.titleEn &&
          other.titleNe == this.titleNe &&
          other.lyricsEn == this.lyricsEn &&
          other.lyricsNe == this.lyricsNe &&
          other.audioUrl == this.audioUrl &&
          other.videoUrl == this.videoUrl &&
          other.isBookmarked == this.isBookmarked &&
          other.tenantKey == this.tenantKey);
}

class CachedHymnsCompanion extends UpdateCompanion<CachedHymn> {
  final Value<int> id;
  final Value<int> hymnNumber;
  final Value<String> titleEn;
  final Value<String> titleNe;
  final Value<String> lyricsEn;
  final Value<String> lyricsNe;
  final Value<String?> audioUrl;
  final Value<String?> videoUrl;
  final Value<bool> isBookmarked;
  final Value<String> tenantKey;
  final Value<int> rowid;
  const CachedHymnsCompanion({
    this.id = const Value.absent(),
    this.hymnNumber = const Value.absent(),
    this.titleEn = const Value.absent(),
    this.titleNe = const Value.absent(),
    this.lyricsEn = const Value.absent(),
    this.lyricsNe = const Value.absent(),
    this.audioUrl = const Value.absent(),
    this.videoUrl = const Value.absent(),
    this.isBookmarked = const Value.absent(),
    this.tenantKey = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedHymnsCompanion.insert({
    required int id,
    required int hymnNumber,
    required String titleEn,
    required String titleNe,
    required String lyricsEn,
    required String lyricsNe,
    this.audioUrl = const Value.absent(),
    this.videoUrl = const Value.absent(),
    this.isBookmarked = const Value.absent(),
    required String tenantKey,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       hymnNumber = Value(hymnNumber),
       titleEn = Value(titleEn),
       titleNe = Value(titleNe),
       lyricsEn = Value(lyricsEn),
       lyricsNe = Value(lyricsNe),
       tenantKey = Value(tenantKey);
  static Insertable<CachedHymn> custom({
    Expression<int>? id,
    Expression<int>? hymnNumber,
    Expression<String>? titleEn,
    Expression<String>? titleNe,
    Expression<String>? lyricsEn,
    Expression<String>? lyricsNe,
    Expression<String>? audioUrl,
    Expression<String>? videoUrl,
    Expression<bool>? isBookmarked,
    Expression<String>? tenantKey,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hymnNumber != null) 'hymn_number': hymnNumber,
      if (titleEn != null) 'title_en': titleEn,
      if (titleNe != null) 'title_ne': titleNe,
      if (lyricsEn != null) 'lyrics_en': lyricsEn,
      if (lyricsNe != null) 'lyrics_ne': lyricsNe,
      if (audioUrl != null) 'audio_url': audioUrl,
      if (videoUrl != null) 'video_url': videoUrl,
      if (isBookmarked != null) 'is_bookmarked': isBookmarked,
      if (tenantKey != null) 'tenant_key': tenantKey,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedHymnsCompanion copyWith({
    Value<int>? id,
    Value<int>? hymnNumber,
    Value<String>? titleEn,
    Value<String>? titleNe,
    Value<String>? lyricsEn,
    Value<String>? lyricsNe,
    Value<String?>? audioUrl,
    Value<String?>? videoUrl,
    Value<bool>? isBookmarked,
    Value<String>? tenantKey,
    Value<int>? rowid,
  }) {
    return CachedHymnsCompanion(
      id: id ?? this.id,
      hymnNumber: hymnNumber ?? this.hymnNumber,
      titleEn: titleEn ?? this.titleEn,
      titleNe: titleNe ?? this.titleNe,
      lyricsEn: lyricsEn ?? this.lyricsEn,
      lyricsNe: lyricsNe ?? this.lyricsNe,
      audioUrl: audioUrl ?? this.audioUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      tenantKey: tenantKey ?? this.tenantKey,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (hymnNumber.present) {
      map['hymn_number'] = Variable<int>(hymnNumber.value);
    }
    if (titleEn.present) {
      map['title_en'] = Variable<String>(titleEn.value);
    }
    if (titleNe.present) {
      map['title_ne'] = Variable<String>(titleNe.value);
    }
    if (lyricsEn.present) {
      map['lyrics_en'] = Variable<String>(lyricsEn.value);
    }
    if (lyricsNe.present) {
      map['lyrics_ne'] = Variable<String>(lyricsNe.value);
    }
    if (audioUrl.present) {
      map['audio_url'] = Variable<String>(audioUrl.value);
    }
    if (videoUrl.present) {
      map['video_url'] = Variable<String>(videoUrl.value);
    }
    if (isBookmarked.present) {
      map['is_bookmarked'] = Variable<bool>(isBookmarked.value);
    }
    if (tenantKey.present) {
      map['tenant_key'] = Variable<String>(tenantKey.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedHymnsCompanion(')
          ..write('id: $id, ')
          ..write('hymnNumber: $hymnNumber, ')
          ..write('titleEn: $titleEn, ')
          ..write('titleNe: $titleNe, ')
          ..write('lyricsEn: $lyricsEn, ')
          ..write('lyricsNe: $lyricsNe, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('isBookmarked: $isBookmarked, ')
          ..write('tenantKey: $tenantKey, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedDailyQuotesTable extends CachedDailyQuotes
    with TableInfo<$CachedDailyQuotesTable, CachedDailyQuote> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedDailyQuotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _authorNameMeta = const VerificationMeta(
    'authorName',
  );
  @override
  late final GeneratedColumn<String> authorName = GeneratedColumn<String>(
    'author_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateStrMeta = const VerificationMeta(
    'dateStr',
  );
  @override
  late final GeneratedColumn<String> dateStr = GeneratedColumn<String>(
    'date_str',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    content,
    authorName,
    dateStr,
    imageUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_daily_quotes';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedDailyQuote> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('author_name')) {
      context.handle(
        _authorNameMeta,
        authorName.isAcceptableOrUnknown(data['author_name']!, _authorNameMeta),
      );
    }
    if (data.containsKey('date_str')) {
      context.handle(
        _dateStrMeta,
        dateStr.isAcceptableOrUnknown(data['date_str']!, _dateStrMeta),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedDailyQuote map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedDailyQuote(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      authorName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author_name'],
      ),
      dateStr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date_str'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
    );
  }

  @override
  $CachedDailyQuotesTable createAlias(String alias) {
    return $CachedDailyQuotesTable(attachedDatabase, alias);
  }
}

class CachedDailyQuote extends DataClass
    implements Insertable<CachedDailyQuote> {
  final int id;
  final String content;
  final String? authorName;
  final String? dateStr;
  final String? imageUrl;
  const CachedDailyQuote({
    required this.id,
    required this.content,
    this.authorName,
    this.dateStr,
    this.imageUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || authorName != null) {
      map['author_name'] = Variable<String>(authorName);
    }
    if (!nullToAbsent || dateStr != null) {
      map['date_str'] = Variable<String>(dateStr);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    return map;
  }

  CachedDailyQuotesCompanion toCompanion(bool nullToAbsent) {
    return CachedDailyQuotesCompanion(
      id: Value(id),
      content: Value(content),
      authorName: authorName == null && nullToAbsent
          ? const Value.absent()
          : Value(authorName),
      dateStr: dateStr == null && nullToAbsent
          ? const Value.absent()
          : Value(dateStr),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
    );
  }

  factory CachedDailyQuote.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedDailyQuote(
      id: serializer.fromJson<int>(json['id']),
      content: serializer.fromJson<String>(json['content']),
      authorName: serializer.fromJson<String?>(json['authorName']),
      dateStr: serializer.fromJson<String?>(json['dateStr']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'content': serializer.toJson<String>(content),
      'authorName': serializer.toJson<String?>(authorName),
      'dateStr': serializer.toJson<String?>(dateStr),
      'imageUrl': serializer.toJson<String?>(imageUrl),
    };
  }

  CachedDailyQuote copyWith({
    int? id,
    String? content,
    Value<String?> authorName = const Value.absent(),
    Value<String?> dateStr = const Value.absent(),
    Value<String?> imageUrl = const Value.absent(),
  }) => CachedDailyQuote(
    id: id ?? this.id,
    content: content ?? this.content,
    authorName: authorName.present ? authorName.value : this.authorName,
    dateStr: dateStr.present ? dateStr.value : this.dateStr,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
  );
  CachedDailyQuote copyWithCompanion(CachedDailyQuotesCompanion data) {
    return CachedDailyQuote(
      id: data.id.present ? data.id.value : this.id,
      content: data.content.present ? data.content.value : this.content,
      authorName: data.authorName.present
          ? data.authorName.value
          : this.authorName,
      dateStr: data.dateStr.present ? data.dateStr.value : this.dateStr,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedDailyQuote(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('authorName: $authorName, ')
          ..write('dateStr: $dateStr, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, content, authorName, dateStr, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedDailyQuote &&
          other.id == this.id &&
          other.content == this.content &&
          other.authorName == this.authorName &&
          other.dateStr == this.dateStr &&
          other.imageUrl == this.imageUrl);
}

class CachedDailyQuotesCompanion extends UpdateCompanion<CachedDailyQuote> {
  final Value<int> id;
  final Value<String> content;
  final Value<String?> authorName;
  final Value<String?> dateStr;
  final Value<String?> imageUrl;
  const CachedDailyQuotesCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.authorName = const Value.absent(),
    this.dateStr = const Value.absent(),
    this.imageUrl = const Value.absent(),
  });
  CachedDailyQuotesCompanion.insert({
    this.id = const Value.absent(),
    required String content,
    this.authorName = const Value.absent(),
    this.dateStr = const Value.absent(),
    this.imageUrl = const Value.absent(),
  }) : content = Value(content);
  static Insertable<CachedDailyQuote> custom({
    Expression<int>? id,
    Expression<String>? content,
    Expression<String>? authorName,
    Expression<String>? dateStr,
    Expression<String>? imageUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
      if (authorName != null) 'author_name': authorName,
      if (dateStr != null) 'date_str': dateStr,
      if (imageUrl != null) 'image_url': imageUrl,
    });
  }

  CachedDailyQuotesCompanion copyWith({
    Value<int>? id,
    Value<String>? content,
    Value<String?>? authorName,
    Value<String?>? dateStr,
    Value<String?>? imageUrl,
  }) {
    return CachedDailyQuotesCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
      authorName: authorName ?? this.authorName,
      dateStr: dateStr ?? this.dateStr,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (authorName.present) {
      map['author_name'] = Variable<String>(authorName.value);
    }
    if (dateStr.present) {
      map['date_str'] = Variable<String>(dateStr.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedDailyQuotesCompanion(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('authorName: $authorName, ')
          ..write('dateStr: $dateStr, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }
}

class $CachedBulletinsTable extends CachedBulletins
    with TableInfo<$CachedBulletinsTable, CachedBulletin> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedBulletinsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _publicationDateMeta = const VerificationMeta(
    'publicationDate',
  );
  @override
  late final GeneratedColumn<DateTime> publicationDate =
      GeneratedColumn<DateTime>(
        'publication_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _pdfUrlMeta = const VerificationMeta('pdfUrl');
  @override
  late final GeneratedColumn<String> pdfUrl = GeneratedColumn<String>(
    'pdf_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentHtmlMeta = const VerificationMeta(
    'contentHtml',
  );
  @override
  late final GeneratedColumn<String> contentHtml = GeneratedColumn<String>(
    'content_html',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tenantKeyMeta = const VerificationMeta(
    'tenantKey',
  );
  @override
  late final GeneratedColumn<String> tenantKey = GeneratedColumn<String>(
    'tenant_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    publicationDate,
    pdfUrl,
    contentHtml,
    tenantKey,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_bulletins';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedBulletin> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('publication_date')) {
      context.handle(
        _publicationDateMeta,
        publicationDate.isAcceptableOrUnknown(
          data['publication_date']!,
          _publicationDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_publicationDateMeta);
    }
    if (data.containsKey('pdf_url')) {
      context.handle(
        _pdfUrlMeta,
        pdfUrl.isAcceptableOrUnknown(data['pdf_url']!, _pdfUrlMeta),
      );
    }
    if (data.containsKey('content_html')) {
      context.handle(
        _contentHtmlMeta,
        contentHtml.isAcceptableOrUnknown(
          data['content_html']!,
          _contentHtmlMeta,
        ),
      );
    }
    if (data.containsKey('tenant_key')) {
      context.handle(
        _tenantKeyMeta,
        tenantKey.isAcceptableOrUnknown(data['tenant_key']!, _tenantKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_tenantKeyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, tenantKey};
  @override
  CachedBulletin map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedBulletin(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      publicationDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}publication_date'],
      )!,
      pdfUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pdf_url'],
      ),
      contentHtml: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_html'],
      ),
      tenantKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_key'],
      )!,
    );
  }

  @override
  $CachedBulletinsTable createAlias(String alias) {
    return $CachedBulletinsTable(attachedDatabase, alias);
  }
}

class CachedBulletin extends DataClass implements Insertable<CachedBulletin> {
  final int id;
  final String title;
  final DateTime publicationDate;
  final String? pdfUrl;
  final String? contentHtml;
  final String tenantKey;
  const CachedBulletin({
    required this.id,
    required this.title,
    required this.publicationDate,
    this.pdfUrl,
    this.contentHtml,
    required this.tenantKey,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['publication_date'] = Variable<DateTime>(publicationDate);
    if (!nullToAbsent || pdfUrl != null) {
      map['pdf_url'] = Variable<String>(pdfUrl);
    }
    if (!nullToAbsent || contentHtml != null) {
      map['content_html'] = Variable<String>(contentHtml);
    }
    map['tenant_key'] = Variable<String>(tenantKey);
    return map;
  }

  CachedBulletinsCompanion toCompanion(bool nullToAbsent) {
    return CachedBulletinsCompanion(
      id: Value(id),
      title: Value(title),
      publicationDate: Value(publicationDate),
      pdfUrl: pdfUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(pdfUrl),
      contentHtml: contentHtml == null && nullToAbsent
          ? const Value.absent()
          : Value(contentHtml),
      tenantKey: Value(tenantKey),
    );
  }

  factory CachedBulletin.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedBulletin(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      publicationDate: serializer.fromJson<DateTime>(json['publicationDate']),
      pdfUrl: serializer.fromJson<String?>(json['pdfUrl']),
      contentHtml: serializer.fromJson<String?>(json['contentHtml']),
      tenantKey: serializer.fromJson<String>(json['tenantKey']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'publicationDate': serializer.toJson<DateTime>(publicationDate),
      'pdfUrl': serializer.toJson<String?>(pdfUrl),
      'contentHtml': serializer.toJson<String?>(contentHtml),
      'tenantKey': serializer.toJson<String>(tenantKey),
    };
  }

  CachedBulletin copyWith({
    int? id,
    String? title,
    DateTime? publicationDate,
    Value<String?> pdfUrl = const Value.absent(),
    Value<String?> contentHtml = const Value.absent(),
    String? tenantKey,
  }) => CachedBulletin(
    id: id ?? this.id,
    title: title ?? this.title,
    publicationDate: publicationDate ?? this.publicationDate,
    pdfUrl: pdfUrl.present ? pdfUrl.value : this.pdfUrl,
    contentHtml: contentHtml.present ? contentHtml.value : this.contentHtml,
    tenantKey: tenantKey ?? this.tenantKey,
  );
  CachedBulletin copyWithCompanion(CachedBulletinsCompanion data) {
    return CachedBulletin(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      publicationDate: data.publicationDate.present
          ? data.publicationDate.value
          : this.publicationDate,
      pdfUrl: data.pdfUrl.present ? data.pdfUrl.value : this.pdfUrl,
      contentHtml: data.contentHtml.present
          ? data.contentHtml.value
          : this.contentHtml,
      tenantKey: data.tenantKey.present ? data.tenantKey.value : this.tenantKey,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedBulletin(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('publicationDate: $publicationDate, ')
          ..write('pdfUrl: $pdfUrl, ')
          ..write('contentHtml: $contentHtml, ')
          ..write('tenantKey: $tenantKey')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, publicationDate, pdfUrl, contentHtml, tenantKey);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedBulletin &&
          other.id == this.id &&
          other.title == this.title &&
          other.publicationDate == this.publicationDate &&
          other.pdfUrl == this.pdfUrl &&
          other.contentHtml == this.contentHtml &&
          other.tenantKey == this.tenantKey);
}

class CachedBulletinsCompanion extends UpdateCompanion<CachedBulletin> {
  final Value<int> id;
  final Value<String> title;
  final Value<DateTime> publicationDate;
  final Value<String?> pdfUrl;
  final Value<String?> contentHtml;
  final Value<String> tenantKey;
  final Value<int> rowid;
  const CachedBulletinsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.publicationDate = const Value.absent(),
    this.pdfUrl = const Value.absent(),
    this.contentHtml = const Value.absent(),
    this.tenantKey = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedBulletinsCompanion.insert({
    required int id,
    required String title,
    required DateTime publicationDate,
    this.pdfUrl = const Value.absent(),
    this.contentHtml = const Value.absent(),
    required String tenantKey,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       publicationDate = Value(publicationDate),
       tenantKey = Value(tenantKey);
  static Insertable<CachedBulletin> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<DateTime>? publicationDate,
    Expression<String>? pdfUrl,
    Expression<String>? contentHtml,
    Expression<String>? tenantKey,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (publicationDate != null) 'publication_date': publicationDate,
      if (pdfUrl != null) 'pdf_url': pdfUrl,
      if (contentHtml != null) 'content_html': contentHtml,
      if (tenantKey != null) 'tenant_key': tenantKey,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedBulletinsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<DateTime>? publicationDate,
    Value<String?>? pdfUrl,
    Value<String?>? contentHtml,
    Value<String>? tenantKey,
    Value<int>? rowid,
  }) {
    return CachedBulletinsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      publicationDate: publicationDate ?? this.publicationDate,
      pdfUrl: pdfUrl ?? this.pdfUrl,
      contentHtml: contentHtml ?? this.contentHtml,
      tenantKey: tenantKey ?? this.tenantKey,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (publicationDate.present) {
      map['publication_date'] = Variable<DateTime>(publicationDate.value);
    }
    if (pdfUrl.present) {
      map['pdf_url'] = Variable<String>(pdfUrl.value);
    }
    if (contentHtml.present) {
      map['content_html'] = Variable<String>(contentHtml.value);
    }
    if (tenantKey.present) {
      map['tenant_key'] = Variable<String>(tenantKey.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedBulletinsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('publicationDate: $publicationDate, ')
          ..write('pdfUrl: $pdfUrl, ')
          ..write('contentHtml: $contentHtml, ')
          ..write('tenantKey: $tenantKey, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedEventsTable extends CachedEvents
    with TableInfo<$CachedEventsTable, CachedEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startsAtMeta = const VerificationMeta(
    'startsAt',
  );
  @override
  late final GeneratedColumn<DateTime> startsAt = GeneratedColumn<DateTime>(
    'starts_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endsAtMeta = const VerificationMeta('endsAt');
  @override
  late final GeneratedColumn<DateTime> endsAt = GeneratedColumn<DateTime>(
    'ends_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sectionMeta = const VerificationMeta(
    'section',
  );
  @override
  late final GeneratedColumn<String> section = GeneratedColumn<String>(
    'section',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('community'),
  );
  static const VerificationMeta _rsvpCountMeta = const VerificationMeta(
    'rsvpCount',
  );
  @override
  late final GeneratedColumn<int> rsvpCount = GeneratedColumn<int>(
    'rsvp_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _tenantKeyMeta = const VerificationMeta(
    'tenantKey',
  );
  @override
  late final GeneratedColumn<String> tenantKey = GeneratedColumn<String>(
    'tenant_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    startsAt,
    endsAt,
    location,
    section,
    rsvpCount,
    tenantKey,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('starts_at')) {
      context.handle(
        _startsAtMeta,
        startsAt.isAcceptableOrUnknown(data['starts_at']!, _startsAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startsAtMeta);
    }
    if (data.containsKey('ends_at')) {
      context.handle(
        _endsAtMeta,
        endsAt.isAcceptableOrUnknown(data['ends_at']!, _endsAtMeta),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('section')) {
      context.handle(
        _sectionMeta,
        section.isAcceptableOrUnknown(data['section']!, _sectionMeta),
      );
    }
    if (data.containsKey('rsvp_count')) {
      context.handle(
        _rsvpCountMeta,
        rsvpCount.isAcceptableOrUnknown(data['rsvp_count']!, _rsvpCountMeta),
      );
    }
    if (data.containsKey('tenant_key')) {
      context.handle(
        _tenantKeyMeta,
        tenantKey.isAcceptableOrUnknown(data['tenant_key']!, _tenantKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_tenantKeyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, tenantKey};
  @override
  CachedEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      startsAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}starts_at'],
      )!,
      endsAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ends_at'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      section: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}section'],
      )!,
      rsvpCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rsvp_count'],
      )!,
      tenantKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_key'],
      )!,
    );
  }

  @override
  $CachedEventsTable createAlias(String alias) {
    return $CachedEventsTable(attachedDatabase, alias);
  }
}

class CachedEvent extends DataClass implements Insertable<CachedEvent> {
  final int id;
  final String title;
  final String? description;
  final DateTime startsAt;
  final DateTime? endsAt;
  final String? location;
  final String section;
  final int rsvpCount;
  final String tenantKey;
  const CachedEvent({
    required this.id,
    required this.title,
    this.description,
    required this.startsAt,
    this.endsAt,
    this.location,
    required this.section,
    required this.rsvpCount,
    required this.tenantKey,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['starts_at'] = Variable<DateTime>(startsAt);
    if (!nullToAbsent || endsAt != null) {
      map['ends_at'] = Variable<DateTime>(endsAt);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    map['section'] = Variable<String>(section);
    map['rsvp_count'] = Variable<int>(rsvpCount);
    map['tenant_key'] = Variable<String>(tenantKey);
    return map;
  }

  CachedEventsCompanion toCompanion(bool nullToAbsent) {
    return CachedEventsCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      startsAt: Value(startsAt),
      endsAt: endsAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endsAt),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      section: Value(section),
      rsvpCount: Value(rsvpCount),
      tenantKey: Value(tenantKey),
    );
  }

  factory CachedEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedEvent(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      startsAt: serializer.fromJson<DateTime>(json['startsAt']),
      endsAt: serializer.fromJson<DateTime?>(json['endsAt']),
      location: serializer.fromJson<String?>(json['location']),
      section: serializer.fromJson<String>(json['section']),
      rsvpCount: serializer.fromJson<int>(json['rsvpCount']),
      tenantKey: serializer.fromJson<String>(json['tenantKey']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'startsAt': serializer.toJson<DateTime>(startsAt),
      'endsAt': serializer.toJson<DateTime?>(endsAt),
      'location': serializer.toJson<String?>(location),
      'section': serializer.toJson<String>(section),
      'rsvpCount': serializer.toJson<int>(rsvpCount),
      'tenantKey': serializer.toJson<String>(tenantKey),
    };
  }

  CachedEvent copyWith({
    int? id,
    String? title,
    Value<String?> description = const Value.absent(),
    DateTime? startsAt,
    Value<DateTime?> endsAt = const Value.absent(),
    Value<String?> location = const Value.absent(),
    String? section,
    int? rsvpCount,
    String? tenantKey,
  }) => CachedEvent(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    startsAt: startsAt ?? this.startsAt,
    endsAt: endsAt.present ? endsAt.value : this.endsAt,
    location: location.present ? location.value : this.location,
    section: section ?? this.section,
    rsvpCount: rsvpCount ?? this.rsvpCount,
    tenantKey: tenantKey ?? this.tenantKey,
  );
  CachedEvent copyWithCompanion(CachedEventsCompanion data) {
    return CachedEvent(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      startsAt: data.startsAt.present ? data.startsAt.value : this.startsAt,
      endsAt: data.endsAt.present ? data.endsAt.value : this.endsAt,
      location: data.location.present ? data.location.value : this.location,
      section: data.section.present ? data.section.value : this.section,
      rsvpCount: data.rsvpCount.present ? data.rsvpCount.value : this.rsvpCount,
      tenantKey: data.tenantKey.present ? data.tenantKey.value : this.tenantKey,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedEvent(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('startsAt: $startsAt, ')
          ..write('endsAt: $endsAt, ')
          ..write('location: $location, ')
          ..write('section: $section, ')
          ..write('rsvpCount: $rsvpCount, ')
          ..write('tenantKey: $tenantKey')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    startsAt,
    endsAt,
    location,
    section,
    rsvpCount,
    tenantKey,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedEvent &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.startsAt == this.startsAt &&
          other.endsAt == this.endsAt &&
          other.location == this.location &&
          other.section == this.section &&
          other.rsvpCount == this.rsvpCount &&
          other.tenantKey == this.tenantKey);
}

class CachedEventsCompanion extends UpdateCompanion<CachedEvent> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<DateTime> startsAt;
  final Value<DateTime?> endsAt;
  final Value<String?> location;
  final Value<String> section;
  final Value<int> rsvpCount;
  final Value<String> tenantKey;
  final Value<int> rowid;
  const CachedEventsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.startsAt = const Value.absent(),
    this.endsAt = const Value.absent(),
    this.location = const Value.absent(),
    this.section = const Value.absent(),
    this.rsvpCount = const Value.absent(),
    this.tenantKey = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedEventsCompanion.insert({
    required int id,
    required String title,
    this.description = const Value.absent(),
    required DateTime startsAt,
    this.endsAt = const Value.absent(),
    this.location = const Value.absent(),
    this.section = const Value.absent(),
    this.rsvpCount = const Value.absent(),
    required String tenantKey,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       startsAt = Value(startsAt),
       tenantKey = Value(tenantKey);
  static Insertable<CachedEvent> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? startsAt,
    Expression<DateTime>? endsAt,
    Expression<String>? location,
    Expression<String>? section,
    Expression<int>? rsvpCount,
    Expression<String>? tenantKey,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (startsAt != null) 'starts_at': startsAt,
      if (endsAt != null) 'ends_at': endsAt,
      if (location != null) 'location': location,
      if (section != null) 'section': section,
      if (rsvpCount != null) 'rsvp_count': rsvpCount,
      if (tenantKey != null) 'tenant_key': tenantKey,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedEventsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String?>? description,
    Value<DateTime>? startsAt,
    Value<DateTime?>? endsAt,
    Value<String?>? location,
    Value<String>? section,
    Value<int>? rsvpCount,
    Value<String>? tenantKey,
    Value<int>? rowid,
  }) {
    return CachedEventsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      startsAt: startsAt ?? this.startsAt,
      endsAt: endsAt ?? this.endsAt,
      location: location ?? this.location,
      section: section ?? this.section,
      rsvpCount: rsvpCount ?? this.rsvpCount,
      tenantKey: tenantKey ?? this.tenantKey,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (startsAt.present) {
      map['starts_at'] = Variable<DateTime>(startsAt.value);
    }
    if (endsAt.present) {
      map['ends_at'] = Variable<DateTime>(endsAt.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (section.present) {
      map['section'] = Variable<String>(section.value);
    }
    if (rsvpCount.present) {
      map['rsvp_count'] = Variable<int>(rsvpCount.value);
    }
    if (tenantKey.present) {
      map['tenant_key'] = Variable<String>(tenantKey.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedEventsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('startsAt: $startsAt, ')
          ..write('endsAt: $endsAt, ')
          ..write('location: $location, ')
          ..write('section: $section, ')
          ..write('rsvpCount: $rsvpCount, ')
          ..write('tenantKey: $tenantKey, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedThemesTable extends CachedThemes
    with TableInfo<$CachedThemesTable, CachedTheme> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedThemesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tenantKeyMeta = const VerificationMeta(
    'tenantKey',
  );
  @override
  late final GeneratedColumn<String> tenantKey = GeneratedColumn<String>(
    'tenant_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _themeJsonMeta = const VerificationMeta(
    'themeJson',
  );
  @override
  late final GeneratedColumn<String> themeJson = GeneratedColumn<String>(
    'theme_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fetchedAtMeta = const VerificationMeta(
    'fetchedAt',
  );
  @override
  late final GeneratedColumn<DateTime> fetchedAt = GeneratedColumn<DateTime>(
    'fetched_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [tenantKey, themeJson, fetchedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_themes';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedTheme> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tenant_key')) {
      context.handle(
        _tenantKeyMeta,
        tenantKey.isAcceptableOrUnknown(data['tenant_key']!, _tenantKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_tenantKeyMeta);
    }
    if (data.containsKey('theme_json')) {
      context.handle(
        _themeJsonMeta,
        themeJson.isAcceptableOrUnknown(data['theme_json']!, _themeJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_themeJsonMeta);
    }
    if (data.containsKey('fetched_at')) {
      context.handle(
        _fetchedAtMeta,
        fetchedAt.isAcceptableOrUnknown(data['fetched_at']!, _fetchedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_fetchedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tenantKey};
  @override
  CachedTheme map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedTheme(
      tenantKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_key'],
      )!,
      themeJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}theme_json'],
      )!,
      fetchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fetched_at'],
      )!,
    );
  }

  @override
  $CachedThemesTable createAlias(String alias) {
    return $CachedThemesTable(attachedDatabase, alias);
  }
}

class CachedTheme extends DataClass implements Insertable<CachedTheme> {
  final String tenantKey;
  final String themeJson;
  final DateTime fetchedAt;
  const CachedTheme({
    required this.tenantKey,
    required this.themeJson,
    required this.fetchedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['tenant_key'] = Variable<String>(tenantKey);
    map['theme_json'] = Variable<String>(themeJson);
    map['fetched_at'] = Variable<DateTime>(fetchedAt);
    return map;
  }

  CachedThemesCompanion toCompanion(bool nullToAbsent) {
    return CachedThemesCompanion(
      tenantKey: Value(tenantKey),
      themeJson: Value(themeJson),
      fetchedAt: Value(fetchedAt),
    );
  }

  factory CachedTheme.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedTheme(
      tenantKey: serializer.fromJson<String>(json['tenantKey']),
      themeJson: serializer.fromJson<String>(json['themeJson']),
      fetchedAt: serializer.fromJson<DateTime>(json['fetchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tenantKey': serializer.toJson<String>(tenantKey),
      'themeJson': serializer.toJson<String>(themeJson),
      'fetchedAt': serializer.toJson<DateTime>(fetchedAt),
    };
  }

  CachedTheme copyWith({
    String? tenantKey,
    String? themeJson,
    DateTime? fetchedAt,
  }) => CachedTheme(
    tenantKey: tenantKey ?? this.tenantKey,
    themeJson: themeJson ?? this.themeJson,
    fetchedAt: fetchedAt ?? this.fetchedAt,
  );
  CachedTheme copyWithCompanion(CachedThemesCompanion data) {
    return CachedTheme(
      tenantKey: data.tenantKey.present ? data.tenantKey.value : this.tenantKey,
      themeJson: data.themeJson.present ? data.themeJson.value : this.themeJson,
      fetchedAt: data.fetchedAt.present ? data.fetchedAt.value : this.fetchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedTheme(')
          ..write('tenantKey: $tenantKey, ')
          ..write('themeJson: $themeJson, ')
          ..write('fetchedAt: $fetchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(tenantKey, themeJson, fetchedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedTheme &&
          other.tenantKey == this.tenantKey &&
          other.themeJson == this.themeJson &&
          other.fetchedAt == this.fetchedAt);
}

class CachedThemesCompanion extends UpdateCompanion<CachedTheme> {
  final Value<String> tenantKey;
  final Value<String> themeJson;
  final Value<DateTime> fetchedAt;
  final Value<int> rowid;
  const CachedThemesCompanion({
    this.tenantKey = const Value.absent(),
    this.themeJson = const Value.absent(),
    this.fetchedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedThemesCompanion.insert({
    required String tenantKey,
    required String themeJson,
    required DateTime fetchedAt,
    this.rowid = const Value.absent(),
  }) : tenantKey = Value(tenantKey),
       themeJson = Value(themeJson),
       fetchedAt = Value(fetchedAt);
  static Insertable<CachedTheme> custom({
    Expression<String>? tenantKey,
    Expression<String>? themeJson,
    Expression<DateTime>? fetchedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (tenantKey != null) 'tenant_key': tenantKey,
      if (themeJson != null) 'theme_json': themeJson,
      if (fetchedAt != null) 'fetched_at': fetchedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedThemesCompanion copyWith({
    Value<String>? tenantKey,
    Value<String>? themeJson,
    Value<DateTime>? fetchedAt,
    Value<int>? rowid,
  }) {
    return CachedThemesCompanion(
      tenantKey: tenantKey ?? this.tenantKey,
      themeJson: themeJson ?? this.themeJson,
      fetchedAt: fetchedAt ?? this.fetchedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tenantKey.present) {
      map['tenant_key'] = Variable<String>(tenantKey.value);
    }
    if (themeJson.present) {
      map['theme_json'] = Variable<String>(themeJson.value);
    }
    if (fetchedAt.present) {
      map['fetched_at'] = Variable<DateTime>(fetchedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedThemesCompanion(')
          ..write('tenantKey: $tenantKey, ')
          ..write('themeJson: $themeJson, ')
          ..write('fetchedAt: $fetchedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedServiceTimesTable extends CachedServiceTimes
    with TableInfo<$CachedServiceTimesTable, CachedServiceTime> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedServiceTimesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tenantKeyMeta = const VerificationMeta(
    'tenantKey',
  );
  @override
  late final GeneratedColumn<String> tenantKey = GeneratedColumn<String>(
    'tenant_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serviceTimesJsonMeta = const VerificationMeta(
    'serviceTimesJson',
  );
  @override
  late final GeneratedColumn<String> serviceTimesJson = GeneratedColumn<String>(
    'service_times_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fetchedAtMeta = const VerificationMeta(
    'fetchedAt',
  );
  @override
  late final GeneratedColumn<DateTime> fetchedAt = GeneratedColumn<DateTime>(
    'fetched_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    tenantKey,
    serviceTimesJson,
    fetchedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_service_times';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedServiceTime> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tenant_key')) {
      context.handle(
        _tenantKeyMeta,
        tenantKey.isAcceptableOrUnknown(data['tenant_key']!, _tenantKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_tenantKeyMeta);
    }
    if (data.containsKey('service_times_json')) {
      context.handle(
        _serviceTimesJsonMeta,
        serviceTimesJson.isAcceptableOrUnknown(
          data['service_times_json']!,
          _serviceTimesJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_serviceTimesJsonMeta);
    }
    if (data.containsKey('fetched_at')) {
      context.handle(
        _fetchedAtMeta,
        fetchedAt.isAcceptableOrUnknown(data['fetched_at']!, _fetchedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_fetchedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tenantKey};
  @override
  CachedServiceTime map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedServiceTime(
      tenantKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_key'],
      )!,
      serviceTimesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}service_times_json'],
      )!,
      fetchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fetched_at'],
      )!,
    );
  }

  @override
  $CachedServiceTimesTable createAlias(String alias) {
    return $CachedServiceTimesTable(attachedDatabase, alias);
  }
}

class CachedServiceTime extends DataClass
    implements Insertable<CachedServiceTime> {
  final String tenantKey;
  final String serviceTimesJson;
  final DateTime fetchedAt;
  const CachedServiceTime({
    required this.tenantKey,
    required this.serviceTimesJson,
    required this.fetchedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['tenant_key'] = Variable<String>(tenantKey);
    map['service_times_json'] = Variable<String>(serviceTimesJson);
    map['fetched_at'] = Variable<DateTime>(fetchedAt);
    return map;
  }

  CachedServiceTimesCompanion toCompanion(bool nullToAbsent) {
    return CachedServiceTimesCompanion(
      tenantKey: Value(tenantKey),
      serviceTimesJson: Value(serviceTimesJson),
      fetchedAt: Value(fetchedAt),
    );
  }

  factory CachedServiceTime.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedServiceTime(
      tenantKey: serializer.fromJson<String>(json['tenantKey']),
      serviceTimesJson: serializer.fromJson<String>(json['serviceTimesJson']),
      fetchedAt: serializer.fromJson<DateTime>(json['fetchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tenantKey': serializer.toJson<String>(tenantKey),
      'serviceTimesJson': serializer.toJson<String>(serviceTimesJson),
      'fetchedAt': serializer.toJson<DateTime>(fetchedAt),
    };
  }

  CachedServiceTime copyWith({
    String? tenantKey,
    String? serviceTimesJson,
    DateTime? fetchedAt,
  }) => CachedServiceTime(
    tenantKey: tenantKey ?? this.tenantKey,
    serviceTimesJson: serviceTimesJson ?? this.serviceTimesJson,
    fetchedAt: fetchedAt ?? this.fetchedAt,
  );
  CachedServiceTime copyWithCompanion(CachedServiceTimesCompanion data) {
    return CachedServiceTime(
      tenantKey: data.tenantKey.present ? data.tenantKey.value : this.tenantKey,
      serviceTimesJson: data.serviceTimesJson.present
          ? data.serviceTimesJson.value
          : this.serviceTimesJson,
      fetchedAt: data.fetchedAt.present ? data.fetchedAt.value : this.fetchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedServiceTime(')
          ..write('tenantKey: $tenantKey, ')
          ..write('serviceTimesJson: $serviceTimesJson, ')
          ..write('fetchedAt: $fetchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(tenantKey, serviceTimesJson, fetchedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedServiceTime &&
          other.tenantKey == this.tenantKey &&
          other.serviceTimesJson == this.serviceTimesJson &&
          other.fetchedAt == this.fetchedAt);
}

class CachedServiceTimesCompanion extends UpdateCompanion<CachedServiceTime> {
  final Value<String> tenantKey;
  final Value<String> serviceTimesJson;
  final Value<DateTime> fetchedAt;
  final Value<int> rowid;
  const CachedServiceTimesCompanion({
    this.tenantKey = const Value.absent(),
    this.serviceTimesJson = const Value.absent(),
    this.fetchedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedServiceTimesCompanion.insert({
    required String tenantKey,
    required String serviceTimesJson,
    required DateTime fetchedAt,
    this.rowid = const Value.absent(),
  }) : tenantKey = Value(tenantKey),
       serviceTimesJson = Value(serviceTimesJson),
       fetchedAt = Value(fetchedAt);
  static Insertable<CachedServiceTime> custom({
    Expression<String>? tenantKey,
    Expression<String>? serviceTimesJson,
    Expression<DateTime>? fetchedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (tenantKey != null) 'tenant_key': tenantKey,
      if (serviceTimesJson != null) 'service_times_json': serviceTimesJson,
      if (fetchedAt != null) 'fetched_at': fetchedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedServiceTimesCompanion copyWith({
    Value<String>? tenantKey,
    Value<String>? serviceTimesJson,
    Value<DateTime>? fetchedAt,
    Value<int>? rowid,
  }) {
    return CachedServiceTimesCompanion(
      tenantKey: tenantKey ?? this.tenantKey,
      serviceTimesJson: serviceTimesJson ?? this.serviceTimesJson,
      fetchedAt: fetchedAt ?? this.fetchedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tenantKey.present) {
      map['tenant_key'] = Variable<String>(tenantKey.value);
    }
    if (serviceTimesJson.present) {
      map['service_times_json'] = Variable<String>(serviceTimesJson.value);
    }
    if (fetchedAt.present) {
      map['fetched_at'] = Variable<DateTime>(fetchedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedServiceTimesCompanion(')
          ..write('tenantKey: $tenantKey, ')
          ..write('serviceTimesJson: $serviceTimesJson, ')
          ..write('fetchedAt: $fetchedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CachedHymnsTable cachedHymns = $CachedHymnsTable(this);
  late final $CachedDailyQuotesTable cachedDailyQuotes =
      $CachedDailyQuotesTable(this);
  late final $CachedBulletinsTable cachedBulletins = $CachedBulletinsTable(
    this,
  );
  late final $CachedEventsTable cachedEvents = $CachedEventsTable(this);
  late final $CachedThemesTable cachedThemes = $CachedThemesTable(this);
  late final $CachedServiceTimesTable cachedServiceTimes =
      $CachedServiceTimesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    cachedHymns,
    cachedDailyQuotes,
    cachedBulletins,
    cachedEvents,
    cachedThemes,
    cachedServiceTimes,
  ];
}

typedef $$CachedHymnsTableCreateCompanionBuilder =
    CachedHymnsCompanion Function({
      required int id,
      required int hymnNumber,
      required String titleEn,
      required String titleNe,
      required String lyricsEn,
      required String lyricsNe,
      Value<String?> audioUrl,
      Value<String?> videoUrl,
      Value<bool> isBookmarked,
      required String tenantKey,
      Value<int> rowid,
    });
typedef $$CachedHymnsTableUpdateCompanionBuilder =
    CachedHymnsCompanion Function({
      Value<int> id,
      Value<int> hymnNumber,
      Value<String> titleEn,
      Value<String> titleNe,
      Value<String> lyricsEn,
      Value<String> lyricsNe,
      Value<String?> audioUrl,
      Value<String?> videoUrl,
      Value<bool> isBookmarked,
      Value<String> tenantKey,
      Value<int> rowid,
    });

class $$CachedHymnsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedHymnsTable> {
  $$CachedHymnsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hymnNumber => $composableBuilder(
    column: $table.hymnNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titleEn => $composableBuilder(
    column: $table.titleEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titleNe => $composableBuilder(
    column: $table.titleNe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lyricsEn => $composableBuilder(
    column: $table.lyricsEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lyricsNe => $composableBuilder(
    column: $table.lyricsNe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get audioUrl => $composableBuilder(
    column: $table.audioUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get videoUrl => $composableBuilder(
    column: $table.videoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantKey => $composableBuilder(
    column: $table.tenantKey,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedHymnsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedHymnsTable> {
  $$CachedHymnsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hymnNumber => $composableBuilder(
    column: $table.hymnNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titleEn => $composableBuilder(
    column: $table.titleEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titleNe => $composableBuilder(
    column: $table.titleNe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lyricsEn => $composableBuilder(
    column: $table.lyricsEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lyricsNe => $composableBuilder(
    column: $table.lyricsNe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get audioUrl => $composableBuilder(
    column: $table.audioUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get videoUrl => $composableBuilder(
    column: $table.videoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantKey => $composableBuilder(
    column: $table.tenantKey,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedHymnsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedHymnsTable> {
  $$CachedHymnsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get hymnNumber => $composableBuilder(
    column: $table.hymnNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get titleEn =>
      $composableBuilder(column: $table.titleEn, builder: (column) => column);

  GeneratedColumn<String> get titleNe =>
      $composableBuilder(column: $table.titleNe, builder: (column) => column);

  GeneratedColumn<String> get lyricsEn =>
      $composableBuilder(column: $table.lyricsEn, builder: (column) => column);

  GeneratedColumn<String> get lyricsNe =>
      $composableBuilder(column: $table.lyricsNe, builder: (column) => column);

  GeneratedColumn<String> get audioUrl =>
      $composableBuilder(column: $table.audioUrl, builder: (column) => column);

  GeneratedColumn<String> get videoUrl =>
      $composableBuilder(column: $table.videoUrl, builder: (column) => column);

  GeneratedColumn<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tenantKey =>
      $composableBuilder(column: $table.tenantKey, builder: (column) => column);
}

class $$CachedHymnsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedHymnsTable,
          CachedHymn,
          $$CachedHymnsTableFilterComposer,
          $$CachedHymnsTableOrderingComposer,
          $$CachedHymnsTableAnnotationComposer,
          $$CachedHymnsTableCreateCompanionBuilder,
          $$CachedHymnsTableUpdateCompanionBuilder,
          (
            CachedHymn,
            BaseReferences<_$AppDatabase, $CachedHymnsTable, CachedHymn>,
          ),
          CachedHymn,
          PrefetchHooks Function()
        > {
  $$CachedHymnsTableTableManager(_$AppDatabase db, $CachedHymnsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedHymnsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedHymnsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedHymnsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> hymnNumber = const Value.absent(),
                Value<String> titleEn = const Value.absent(),
                Value<String> titleNe = const Value.absent(),
                Value<String> lyricsEn = const Value.absent(),
                Value<String> lyricsNe = const Value.absent(),
                Value<String?> audioUrl = const Value.absent(),
                Value<String?> videoUrl = const Value.absent(),
                Value<bool> isBookmarked = const Value.absent(),
                Value<String> tenantKey = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedHymnsCompanion(
                id: id,
                hymnNumber: hymnNumber,
                titleEn: titleEn,
                titleNe: titleNe,
                lyricsEn: lyricsEn,
                lyricsNe: lyricsNe,
                audioUrl: audioUrl,
                videoUrl: videoUrl,
                isBookmarked: isBookmarked,
                tenantKey: tenantKey,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
                required int hymnNumber,
                required String titleEn,
                required String titleNe,
                required String lyricsEn,
                required String lyricsNe,
                Value<String?> audioUrl = const Value.absent(),
                Value<String?> videoUrl = const Value.absent(),
                Value<bool> isBookmarked = const Value.absent(),
                required String tenantKey,
                Value<int> rowid = const Value.absent(),
              }) => CachedHymnsCompanion.insert(
                id: id,
                hymnNumber: hymnNumber,
                titleEn: titleEn,
                titleNe: titleNe,
                lyricsEn: lyricsEn,
                lyricsNe: lyricsNe,
                audioUrl: audioUrl,
                videoUrl: videoUrl,
                isBookmarked: isBookmarked,
                tenantKey: tenantKey,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedHymnsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedHymnsTable,
      CachedHymn,
      $$CachedHymnsTableFilterComposer,
      $$CachedHymnsTableOrderingComposer,
      $$CachedHymnsTableAnnotationComposer,
      $$CachedHymnsTableCreateCompanionBuilder,
      $$CachedHymnsTableUpdateCompanionBuilder,
      (
        CachedHymn,
        BaseReferences<_$AppDatabase, $CachedHymnsTable, CachedHymn>,
      ),
      CachedHymn,
      PrefetchHooks Function()
    >;
typedef $$CachedDailyQuotesTableCreateCompanionBuilder =
    CachedDailyQuotesCompanion Function({
      Value<int> id,
      required String content,
      Value<String?> authorName,
      Value<String?> dateStr,
      Value<String?> imageUrl,
    });
typedef $$CachedDailyQuotesTableUpdateCompanionBuilder =
    CachedDailyQuotesCompanion Function({
      Value<int> id,
      Value<String> content,
      Value<String?> authorName,
      Value<String?> dateStr,
      Value<String?> imageUrl,
    });

class $$CachedDailyQuotesTableFilterComposer
    extends Composer<_$AppDatabase, $CachedDailyQuotesTable> {
  $$CachedDailyQuotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get authorName => $composableBuilder(
    column: $table.authorName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dateStr => $composableBuilder(
    column: $table.dateStr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedDailyQuotesTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedDailyQuotesTable> {
  $$CachedDailyQuotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get authorName => $composableBuilder(
    column: $table.authorName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dateStr => $composableBuilder(
    column: $table.dateStr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedDailyQuotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedDailyQuotesTable> {
  $$CachedDailyQuotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get authorName => $composableBuilder(
    column: $table.authorName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dateStr =>
      $composableBuilder(column: $table.dateStr, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);
}

class $$CachedDailyQuotesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedDailyQuotesTable,
          CachedDailyQuote,
          $$CachedDailyQuotesTableFilterComposer,
          $$CachedDailyQuotesTableOrderingComposer,
          $$CachedDailyQuotesTableAnnotationComposer,
          $$CachedDailyQuotesTableCreateCompanionBuilder,
          $$CachedDailyQuotesTableUpdateCompanionBuilder,
          (
            CachedDailyQuote,
            BaseReferences<
              _$AppDatabase,
              $CachedDailyQuotesTable,
              CachedDailyQuote
            >,
          ),
          CachedDailyQuote,
          PrefetchHooks Function()
        > {
  $$CachedDailyQuotesTableTableManager(
    _$AppDatabase db,
    $CachedDailyQuotesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedDailyQuotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedDailyQuotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedDailyQuotesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<String?> authorName = const Value.absent(),
                Value<String?> dateStr = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
              }) => CachedDailyQuotesCompanion(
                id: id,
                content: content,
                authorName: authorName,
                dateStr: dateStr,
                imageUrl: imageUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String content,
                Value<String?> authorName = const Value.absent(),
                Value<String?> dateStr = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
              }) => CachedDailyQuotesCompanion.insert(
                id: id,
                content: content,
                authorName: authorName,
                dateStr: dateStr,
                imageUrl: imageUrl,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedDailyQuotesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedDailyQuotesTable,
      CachedDailyQuote,
      $$CachedDailyQuotesTableFilterComposer,
      $$CachedDailyQuotesTableOrderingComposer,
      $$CachedDailyQuotesTableAnnotationComposer,
      $$CachedDailyQuotesTableCreateCompanionBuilder,
      $$CachedDailyQuotesTableUpdateCompanionBuilder,
      (
        CachedDailyQuote,
        BaseReferences<
          _$AppDatabase,
          $CachedDailyQuotesTable,
          CachedDailyQuote
        >,
      ),
      CachedDailyQuote,
      PrefetchHooks Function()
    >;
typedef $$CachedBulletinsTableCreateCompanionBuilder =
    CachedBulletinsCompanion Function({
      required int id,
      required String title,
      required DateTime publicationDate,
      Value<String?> pdfUrl,
      Value<String?> contentHtml,
      required String tenantKey,
      Value<int> rowid,
    });
typedef $$CachedBulletinsTableUpdateCompanionBuilder =
    CachedBulletinsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<DateTime> publicationDate,
      Value<String?> pdfUrl,
      Value<String?> contentHtml,
      Value<String> tenantKey,
      Value<int> rowid,
    });

class $$CachedBulletinsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedBulletinsTable> {
  $$CachedBulletinsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get publicationDate => $composableBuilder(
    column: $table.publicationDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pdfUrl => $composableBuilder(
    column: $table.pdfUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentHtml => $composableBuilder(
    column: $table.contentHtml,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantKey => $composableBuilder(
    column: $table.tenantKey,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedBulletinsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedBulletinsTable> {
  $$CachedBulletinsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get publicationDate => $composableBuilder(
    column: $table.publicationDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pdfUrl => $composableBuilder(
    column: $table.pdfUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentHtml => $composableBuilder(
    column: $table.contentHtml,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantKey => $composableBuilder(
    column: $table.tenantKey,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedBulletinsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedBulletinsTable> {
  $$CachedBulletinsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get publicationDate => $composableBuilder(
    column: $table.publicationDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pdfUrl =>
      $composableBuilder(column: $table.pdfUrl, builder: (column) => column);

  GeneratedColumn<String> get contentHtml => $composableBuilder(
    column: $table.contentHtml,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tenantKey =>
      $composableBuilder(column: $table.tenantKey, builder: (column) => column);
}

class $$CachedBulletinsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedBulletinsTable,
          CachedBulletin,
          $$CachedBulletinsTableFilterComposer,
          $$CachedBulletinsTableOrderingComposer,
          $$CachedBulletinsTableAnnotationComposer,
          $$CachedBulletinsTableCreateCompanionBuilder,
          $$CachedBulletinsTableUpdateCompanionBuilder,
          (
            CachedBulletin,
            BaseReferences<
              _$AppDatabase,
              $CachedBulletinsTable,
              CachedBulletin
            >,
          ),
          CachedBulletin,
          PrefetchHooks Function()
        > {
  $$CachedBulletinsTableTableManager(
    _$AppDatabase db,
    $CachedBulletinsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedBulletinsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedBulletinsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedBulletinsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<DateTime> publicationDate = const Value.absent(),
                Value<String?> pdfUrl = const Value.absent(),
                Value<String?> contentHtml = const Value.absent(),
                Value<String> tenantKey = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedBulletinsCompanion(
                id: id,
                title: title,
                publicationDate: publicationDate,
                pdfUrl: pdfUrl,
                contentHtml: contentHtml,
                tenantKey: tenantKey,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
                required String title,
                required DateTime publicationDate,
                Value<String?> pdfUrl = const Value.absent(),
                Value<String?> contentHtml = const Value.absent(),
                required String tenantKey,
                Value<int> rowid = const Value.absent(),
              }) => CachedBulletinsCompanion.insert(
                id: id,
                title: title,
                publicationDate: publicationDate,
                pdfUrl: pdfUrl,
                contentHtml: contentHtml,
                tenantKey: tenantKey,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedBulletinsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedBulletinsTable,
      CachedBulletin,
      $$CachedBulletinsTableFilterComposer,
      $$CachedBulletinsTableOrderingComposer,
      $$CachedBulletinsTableAnnotationComposer,
      $$CachedBulletinsTableCreateCompanionBuilder,
      $$CachedBulletinsTableUpdateCompanionBuilder,
      (
        CachedBulletin,
        BaseReferences<_$AppDatabase, $CachedBulletinsTable, CachedBulletin>,
      ),
      CachedBulletin,
      PrefetchHooks Function()
    >;
typedef $$CachedEventsTableCreateCompanionBuilder =
    CachedEventsCompanion Function({
      required int id,
      required String title,
      Value<String?> description,
      required DateTime startsAt,
      Value<DateTime?> endsAt,
      Value<String?> location,
      Value<String> section,
      Value<int> rsvpCount,
      required String tenantKey,
      Value<int> rowid,
    });
typedef $$CachedEventsTableUpdateCompanionBuilder =
    CachedEventsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String?> description,
      Value<DateTime> startsAt,
      Value<DateTime?> endsAt,
      Value<String?> location,
      Value<String> section,
      Value<int> rsvpCount,
      Value<String> tenantKey,
      Value<int> rowid,
    });

class $$CachedEventsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedEventsTable> {
  $$CachedEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startsAt => $composableBuilder(
    column: $table.startsAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endsAt => $composableBuilder(
    column: $table.endsAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get section => $composableBuilder(
    column: $table.section,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rsvpCount => $composableBuilder(
    column: $table.rsvpCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantKey => $composableBuilder(
    column: $table.tenantKey,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedEventsTable> {
  $$CachedEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startsAt => $composableBuilder(
    column: $table.startsAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endsAt => $composableBuilder(
    column: $table.endsAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get section => $composableBuilder(
    column: $table.section,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rsvpCount => $composableBuilder(
    column: $table.rsvpCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantKey => $composableBuilder(
    column: $table.tenantKey,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedEventsTable> {
  $$CachedEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startsAt =>
      $composableBuilder(column: $table.startsAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endsAt =>
      $composableBuilder(column: $table.endsAt, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get section =>
      $composableBuilder(column: $table.section, builder: (column) => column);

  GeneratedColumn<int> get rsvpCount =>
      $composableBuilder(column: $table.rsvpCount, builder: (column) => column);

  GeneratedColumn<String> get tenantKey =>
      $composableBuilder(column: $table.tenantKey, builder: (column) => column);
}

class $$CachedEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedEventsTable,
          CachedEvent,
          $$CachedEventsTableFilterComposer,
          $$CachedEventsTableOrderingComposer,
          $$CachedEventsTableAnnotationComposer,
          $$CachedEventsTableCreateCompanionBuilder,
          $$CachedEventsTableUpdateCompanionBuilder,
          (
            CachedEvent,
            BaseReferences<_$AppDatabase, $CachedEventsTable, CachedEvent>,
          ),
          CachedEvent,
          PrefetchHooks Function()
        > {
  $$CachedEventsTableTableManager(_$AppDatabase db, $CachedEventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> startsAt = const Value.absent(),
                Value<DateTime?> endsAt = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String> section = const Value.absent(),
                Value<int> rsvpCount = const Value.absent(),
                Value<String> tenantKey = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedEventsCompanion(
                id: id,
                title: title,
                description: description,
                startsAt: startsAt,
                endsAt: endsAt,
                location: location,
                section: section,
                rsvpCount: rsvpCount,
                tenantKey: tenantKey,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
                required String title,
                Value<String?> description = const Value.absent(),
                required DateTime startsAt,
                Value<DateTime?> endsAt = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String> section = const Value.absent(),
                Value<int> rsvpCount = const Value.absent(),
                required String tenantKey,
                Value<int> rowid = const Value.absent(),
              }) => CachedEventsCompanion.insert(
                id: id,
                title: title,
                description: description,
                startsAt: startsAt,
                endsAt: endsAt,
                location: location,
                section: section,
                rsvpCount: rsvpCount,
                tenantKey: tenantKey,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedEventsTable,
      CachedEvent,
      $$CachedEventsTableFilterComposer,
      $$CachedEventsTableOrderingComposer,
      $$CachedEventsTableAnnotationComposer,
      $$CachedEventsTableCreateCompanionBuilder,
      $$CachedEventsTableUpdateCompanionBuilder,
      (
        CachedEvent,
        BaseReferences<_$AppDatabase, $CachedEventsTable, CachedEvent>,
      ),
      CachedEvent,
      PrefetchHooks Function()
    >;
typedef $$CachedThemesTableCreateCompanionBuilder =
    CachedThemesCompanion Function({
      required String tenantKey,
      required String themeJson,
      required DateTime fetchedAt,
      Value<int> rowid,
    });
typedef $$CachedThemesTableUpdateCompanionBuilder =
    CachedThemesCompanion Function({
      Value<String> tenantKey,
      Value<String> themeJson,
      Value<DateTime> fetchedAt,
      Value<int> rowid,
    });

class $$CachedThemesTableFilterComposer
    extends Composer<_$AppDatabase, $CachedThemesTable> {
  $$CachedThemesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get tenantKey => $composableBuilder(
    column: $table.tenantKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get themeJson => $composableBuilder(
    column: $table.themeJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedThemesTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedThemesTable> {
  $$CachedThemesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get tenantKey => $composableBuilder(
    column: $table.tenantKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get themeJson => $composableBuilder(
    column: $table.themeJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedThemesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedThemesTable> {
  $$CachedThemesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get tenantKey =>
      $composableBuilder(column: $table.tenantKey, builder: (column) => column);

  GeneratedColumn<String> get themeJson =>
      $composableBuilder(column: $table.themeJson, builder: (column) => column);

  GeneratedColumn<DateTime> get fetchedAt =>
      $composableBuilder(column: $table.fetchedAt, builder: (column) => column);
}

class $$CachedThemesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedThemesTable,
          CachedTheme,
          $$CachedThemesTableFilterComposer,
          $$CachedThemesTableOrderingComposer,
          $$CachedThemesTableAnnotationComposer,
          $$CachedThemesTableCreateCompanionBuilder,
          $$CachedThemesTableUpdateCompanionBuilder,
          (
            CachedTheme,
            BaseReferences<_$AppDatabase, $CachedThemesTable, CachedTheme>,
          ),
          CachedTheme,
          PrefetchHooks Function()
        > {
  $$CachedThemesTableTableManager(_$AppDatabase db, $CachedThemesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedThemesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedThemesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedThemesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> tenantKey = const Value.absent(),
                Value<String> themeJson = const Value.absent(),
                Value<DateTime> fetchedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedThemesCompanion(
                tenantKey: tenantKey,
                themeJson: themeJson,
                fetchedAt: fetchedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String tenantKey,
                required String themeJson,
                required DateTime fetchedAt,
                Value<int> rowid = const Value.absent(),
              }) => CachedThemesCompanion.insert(
                tenantKey: tenantKey,
                themeJson: themeJson,
                fetchedAt: fetchedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedThemesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedThemesTable,
      CachedTheme,
      $$CachedThemesTableFilterComposer,
      $$CachedThemesTableOrderingComposer,
      $$CachedThemesTableAnnotationComposer,
      $$CachedThemesTableCreateCompanionBuilder,
      $$CachedThemesTableUpdateCompanionBuilder,
      (
        CachedTheme,
        BaseReferences<_$AppDatabase, $CachedThemesTable, CachedTheme>,
      ),
      CachedTheme,
      PrefetchHooks Function()
    >;
typedef $$CachedServiceTimesTableCreateCompanionBuilder =
    CachedServiceTimesCompanion Function({
      required String tenantKey,
      required String serviceTimesJson,
      required DateTime fetchedAt,
      Value<int> rowid,
    });
typedef $$CachedServiceTimesTableUpdateCompanionBuilder =
    CachedServiceTimesCompanion Function({
      Value<String> tenantKey,
      Value<String> serviceTimesJson,
      Value<DateTime> fetchedAt,
      Value<int> rowid,
    });

class $$CachedServiceTimesTableFilterComposer
    extends Composer<_$AppDatabase, $CachedServiceTimesTable> {
  $$CachedServiceTimesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get tenantKey => $composableBuilder(
    column: $table.tenantKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serviceTimesJson => $composableBuilder(
    column: $table.serviceTimesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedServiceTimesTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedServiceTimesTable> {
  $$CachedServiceTimesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get tenantKey => $composableBuilder(
    column: $table.tenantKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serviceTimesJson => $composableBuilder(
    column: $table.serviceTimesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedServiceTimesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedServiceTimesTable> {
  $$CachedServiceTimesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get tenantKey =>
      $composableBuilder(column: $table.tenantKey, builder: (column) => column);

  GeneratedColumn<String> get serviceTimesJson => $composableBuilder(
    column: $table.serviceTimesJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fetchedAt =>
      $composableBuilder(column: $table.fetchedAt, builder: (column) => column);
}

class $$CachedServiceTimesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedServiceTimesTable,
          CachedServiceTime,
          $$CachedServiceTimesTableFilterComposer,
          $$CachedServiceTimesTableOrderingComposer,
          $$CachedServiceTimesTableAnnotationComposer,
          $$CachedServiceTimesTableCreateCompanionBuilder,
          $$CachedServiceTimesTableUpdateCompanionBuilder,
          (
            CachedServiceTime,
            BaseReferences<
              _$AppDatabase,
              $CachedServiceTimesTable,
              CachedServiceTime
            >,
          ),
          CachedServiceTime,
          PrefetchHooks Function()
        > {
  $$CachedServiceTimesTableTableManager(
    _$AppDatabase db,
    $CachedServiceTimesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedServiceTimesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedServiceTimesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedServiceTimesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> tenantKey = const Value.absent(),
                Value<String> serviceTimesJson = const Value.absent(),
                Value<DateTime> fetchedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedServiceTimesCompanion(
                tenantKey: tenantKey,
                serviceTimesJson: serviceTimesJson,
                fetchedAt: fetchedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String tenantKey,
                required String serviceTimesJson,
                required DateTime fetchedAt,
                Value<int> rowid = const Value.absent(),
              }) => CachedServiceTimesCompanion.insert(
                tenantKey: tenantKey,
                serviceTimesJson: serviceTimesJson,
                fetchedAt: fetchedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedServiceTimesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedServiceTimesTable,
      CachedServiceTime,
      $$CachedServiceTimesTableFilterComposer,
      $$CachedServiceTimesTableOrderingComposer,
      $$CachedServiceTimesTableAnnotationComposer,
      $$CachedServiceTimesTableCreateCompanionBuilder,
      $$CachedServiceTimesTableUpdateCompanionBuilder,
      (
        CachedServiceTime,
        BaseReferences<
          _$AppDatabase,
          $CachedServiceTimesTable,
          CachedServiceTime
        >,
      ),
      CachedServiceTime,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CachedHymnsTableTableManager get cachedHymns =>
      $$CachedHymnsTableTableManager(_db, _db.cachedHymns);
  $$CachedDailyQuotesTableTableManager get cachedDailyQuotes =>
      $$CachedDailyQuotesTableTableManager(_db, _db.cachedDailyQuotes);
  $$CachedBulletinsTableTableManager get cachedBulletins =>
      $$CachedBulletinsTableTableManager(_db, _db.cachedBulletins);
  $$CachedEventsTableTableManager get cachedEvents =>
      $$CachedEventsTableTableManager(_db, _db.cachedEvents);
  $$CachedThemesTableTableManager get cachedThemes =>
      $$CachedThemesTableTableManager(_db, _db.cachedThemes);
  $$CachedServiceTimesTableTableManager get cachedServiceTimes =>
      $$CachedServiceTimesTableTableManager(_db, _db.cachedServiceTimes);
}
