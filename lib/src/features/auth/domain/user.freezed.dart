// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

 int get id;@JsonKey(name: 'tenant_id') int get tenantId;@JsonKey(name: 'full_name') String get fullName; String get email; String? get phone; UserRole get role;@JsonKey(name: 'language_preference') String get languagePreference;@JsonKey(name: 'privacy_settings') PrivacySettings get privacySettings;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role)&&(identical(other.languagePreference, languagePreference) || other.languagePreference == languagePreference)&&(identical(other.privacySettings, privacySettings) || other.privacySettings == privacySettings)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tenantId,fullName,email,phone,role,languagePreference,privacySettings,isActive,createdAt);

@override
String toString() {
  return 'User(id: $id, tenantId: $tenantId, fullName: $fullName, email: $email, phone: $phone, role: $role, languagePreference: $languagePreference, privacySettings: $privacySettings, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'tenant_id') int tenantId,@JsonKey(name: 'full_name') String fullName, String email, String? phone, UserRole role,@JsonKey(name: 'language_preference') String languagePreference,@JsonKey(name: 'privacy_settings') PrivacySettings privacySettings,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt
});


$PrivacySettingsCopyWith<$Res> get privacySettings;

}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tenantId = null,Object? fullName = null,Object? email = null,Object? phone = freezed,Object? role = null,Object? languagePreference = null,Object? privacySettings = null,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,languagePreference: null == languagePreference ? _self.languagePreference : languagePreference // ignore: cast_nullable_to_non_nullable
as String,privacySettings: null == privacySettings ? _self.privacySettings : privacySettings // ignore: cast_nullable_to_non_nullable
as PrivacySettings,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrivacySettingsCopyWith<$Res> get privacySettings {
  
  return $PrivacySettingsCopyWith<$Res>(_self.privacySettings, (value) {
    return _then(_self.copyWith(privacySettings: value));
  });
}
}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'tenant_id')  int tenantId, @JsonKey(name: 'full_name')  String fullName,  String email,  String? phone,  UserRole role, @JsonKey(name: 'language_preference')  String languagePreference, @JsonKey(name: 'privacy_settings')  PrivacySettings privacySettings, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.tenantId,_that.fullName,_that.email,_that.phone,_that.role,_that.languagePreference,_that.privacySettings,_that.isActive,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'tenant_id')  int tenantId, @JsonKey(name: 'full_name')  String fullName,  String email,  String? phone,  UserRole role, @JsonKey(name: 'language_preference')  String languagePreference, @JsonKey(name: 'privacy_settings')  PrivacySettings privacySettings, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.tenantId,_that.fullName,_that.email,_that.phone,_that.role,_that.languagePreference,_that.privacySettings,_that.isActive,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'tenant_id')  int tenantId, @JsonKey(name: 'full_name')  String fullName,  String email,  String? phone,  UserRole role, @JsonKey(name: 'language_preference')  String languagePreference, @JsonKey(name: 'privacy_settings')  PrivacySettings privacySettings, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.tenantId,_that.fullName,_that.email,_that.phone,_that.role,_that.languagePreference,_that.privacySettings,_that.isActive,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.id, @JsonKey(name: 'tenant_id') required this.tenantId, @JsonKey(name: 'full_name') required this.fullName, required this.email, this.phone, required this.role, @JsonKey(name: 'language_preference') required this.languagePreference, @JsonKey(name: 'privacy_settings') required this.privacySettings, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'created_at') required this.createdAt});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  int id;
@override@JsonKey(name: 'tenant_id') final  int tenantId;
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String email;
@override final  String? phone;
@override final  UserRole role;
@override@JsonKey(name: 'language_preference') final  String languagePreference;
@override@JsonKey(name: 'privacy_settings') final  PrivacySettings privacySettings;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role)&&(identical(other.languagePreference, languagePreference) || other.languagePreference == languagePreference)&&(identical(other.privacySettings, privacySettings) || other.privacySettings == privacySettings)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tenantId,fullName,email,phone,role,languagePreference,privacySettings,isActive,createdAt);

@override
String toString() {
  return 'User(id: $id, tenantId: $tenantId, fullName: $fullName, email: $email, phone: $phone, role: $role, languagePreference: $languagePreference, privacySettings: $privacySettings, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'tenant_id') int tenantId,@JsonKey(name: 'full_name') String fullName, String email, String? phone, UserRole role,@JsonKey(name: 'language_preference') String languagePreference,@JsonKey(name: 'privacy_settings') PrivacySettings privacySettings,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt
});


@override $PrivacySettingsCopyWith<$Res> get privacySettings;

}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tenantId = null,Object? fullName = null,Object? email = null,Object? phone = freezed,Object? role = null,Object? languagePreference = null,Object? privacySettings = null,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,languagePreference: null == languagePreference ? _self.languagePreference : languagePreference // ignore: cast_nullable_to_non_nullable
as String,privacySettings: null == privacySettings ? _self.privacySettings : privacySettings // ignore: cast_nullable_to_non_nullable
as PrivacySettings,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrivacySettingsCopyWith<$Res> get privacySettings {
  
  return $PrivacySettingsCopyWith<$Res>(_self.privacySettings, (value) {
    return _then(_self.copyWith(privacySettings: value));
  });
}
}


/// @nodoc
mixin _$PrivacySettings {

@JsonKey(name: 'show_email') bool get showEmail;@JsonKey(name: 'show_phone') bool get showPhone;@JsonKey(name: 'show_in_directory') bool get showInDirectory;@JsonKey(name: 'give_anonymously') bool get giveAnonymously;
/// Create a copy of PrivacySettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrivacySettingsCopyWith<PrivacySettings> get copyWith => _$PrivacySettingsCopyWithImpl<PrivacySettings>(this as PrivacySettings, _$identity);

  /// Serializes this PrivacySettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrivacySettings&&(identical(other.showEmail, showEmail) || other.showEmail == showEmail)&&(identical(other.showPhone, showPhone) || other.showPhone == showPhone)&&(identical(other.showInDirectory, showInDirectory) || other.showInDirectory == showInDirectory)&&(identical(other.giveAnonymously, giveAnonymously) || other.giveAnonymously == giveAnonymously));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showEmail,showPhone,showInDirectory,giveAnonymously);

@override
String toString() {
  return 'PrivacySettings(showEmail: $showEmail, showPhone: $showPhone, showInDirectory: $showInDirectory, giveAnonymously: $giveAnonymously)';
}


}

/// @nodoc
abstract mixin class $PrivacySettingsCopyWith<$Res>  {
  factory $PrivacySettingsCopyWith(PrivacySettings value, $Res Function(PrivacySettings) _then) = _$PrivacySettingsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'show_email') bool showEmail,@JsonKey(name: 'show_phone') bool showPhone,@JsonKey(name: 'show_in_directory') bool showInDirectory,@JsonKey(name: 'give_anonymously') bool giveAnonymously
});




}
/// @nodoc
class _$PrivacySettingsCopyWithImpl<$Res>
    implements $PrivacySettingsCopyWith<$Res> {
  _$PrivacySettingsCopyWithImpl(this._self, this._then);

  final PrivacySettings _self;
  final $Res Function(PrivacySettings) _then;

/// Create a copy of PrivacySettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? showEmail = null,Object? showPhone = null,Object? showInDirectory = null,Object? giveAnonymously = null,}) {
  return _then(_self.copyWith(
showEmail: null == showEmail ? _self.showEmail : showEmail // ignore: cast_nullable_to_non_nullable
as bool,showPhone: null == showPhone ? _self.showPhone : showPhone // ignore: cast_nullable_to_non_nullable
as bool,showInDirectory: null == showInDirectory ? _self.showInDirectory : showInDirectory // ignore: cast_nullable_to_non_nullable
as bool,giveAnonymously: null == giveAnonymously ? _self.giveAnonymously : giveAnonymously // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PrivacySettings].
extension PrivacySettingsPatterns on PrivacySettings {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrivacySettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrivacySettings() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrivacySettings value)  $default,){
final _that = this;
switch (_that) {
case _PrivacySettings():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrivacySettings value)?  $default,){
final _that = this;
switch (_that) {
case _PrivacySettings() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'show_email')  bool showEmail, @JsonKey(name: 'show_phone')  bool showPhone, @JsonKey(name: 'show_in_directory')  bool showInDirectory, @JsonKey(name: 'give_anonymously')  bool giveAnonymously)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrivacySettings() when $default != null:
return $default(_that.showEmail,_that.showPhone,_that.showInDirectory,_that.giveAnonymously);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'show_email')  bool showEmail, @JsonKey(name: 'show_phone')  bool showPhone, @JsonKey(name: 'show_in_directory')  bool showInDirectory, @JsonKey(name: 'give_anonymously')  bool giveAnonymously)  $default,) {final _that = this;
switch (_that) {
case _PrivacySettings():
return $default(_that.showEmail,_that.showPhone,_that.showInDirectory,_that.giveAnonymously);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'show_email')  bool showEmail, @JsonKey(name: 'show_phone')  bool showPhone, @JsonKey(name: 'show_in_directory')  bool showInDirectory, @JsonKey(name: 'give_anonymously')  bool giveAnonymously)?  $default,) {final _that = this;
switch (_that) {
case _PrivacySettings() when $default != null:
return $default(_that.showEmail,_that.showPhone,_that.showInDirectory,_that.giveAnonymously);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrivacySettings implements PrivacySettings {
  const _PrivacySettings({@JsonKey(name: 'show_email') required this.showEmail, @JsonKey(name: 'show_phone') required this.showPhone, @JsonKey(name: 'show_in_directory') required this.showInDirectory, @JsonKey(name: 'give_anonymously') required this.giveAnonymously});
  factory _PrivacySettings.fromJson(Map<String, dynamic> json) => _$PrivacySettingsFromJson(json);

@override@JsonKey(name: 'show_email') final  bool showEmail;
@override@JsonKey(name: 'show_phone') final  bool showPhone;
@override@JsonKey(name: 'show_in_directory') final  bool showInDirectory;
@override@JsonKey(name: 'give_anonymously') final  bool giveAnonymously;

/// Create a copy of PrivacySettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrivacySettingsCopyWith<_PrivacySettings> get copyWith => __$PrivacySettingsCopyWithImpl<_PrivacySettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrivacySettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrivacySettings&&(identical(other.showEmail, showEmail) || other.showEmail == showEmail)&&(identical(other.showPhone, showPhone) || other.showPhone == showPhone)&&(identical(other.showInDirectory, showInDirectory) || other.showInDirectory == showInDirectory)&&(identical(other.giveAnonymously, giveAnonymously) || other.giveAnonymously == giveAnonymously));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showEmail,showPhone,showInDirectory,giveAnonymously);

@override
String toString() {
  return 'PrivacySettings(showEmail: $showEmail, showPhone: $showPhone, showInDirectory: $showInDirectory, giveAnonymously: $giveAnonymously)';
}


}

/// @nodoc
abstract mixin class _$PrivacySettingsCopyWith<$Res> implements $PrivacySettingsCopyWith<$Res> {
  factory _$PrivacySettingsCopyWith(_PrivacySettings value, $Res Function(_PrivacySettings) _then) = __$PrivacySettingsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'show_email') bool showEmail,@JsonKey(name: 'show_phone') bool showPhone,@JsonKey(name: 'show_in_directory') bool showInDirectory,@JsonKey(name: 'give_anonymously') bool giveAnonymously
});




}
/// @nodoc
class __$PrivacySettingsCopyWithImpl<$Res>
    implements _$PrivacySettingsCopyWith<$Res> {
  __$PrivacySettingsCopyWithImpl(this._self, this._then);

  final _PrivacySettings _self;
  final $Res Function(_PrivacySettings) _then;

/// Create a copy of PrivacySettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? showEmail = null,Object? showPhone = null,Object? showInDirectory = null,Object? giveAnonymously = null,}) {
  return _then(_PrivacySettings(
showEmail: null == showEmail ? _self.showEmail : showEmail // ignore: cast_nullable_to_non_nullable
as bool,showPhone: null == showPhone ? _self.showPhone : showPhone // ignore: cast_nullable_to_non_nullable
as bool,showInDirectory: null == showInDirectory ? _self.showInDirectory : showInDirectory // ignore: cast_nullable_to_non_nullable
as bool,giveAnonymously: null == giveAnonymously ? _self.giveAnonymously : giveAnonymously // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
