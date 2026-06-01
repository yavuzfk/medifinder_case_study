// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provider_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProviderFilter {

 String get query; String? get country; String? get city; String? get category;
/// Create a copy of ProviderFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProviderFilterCopyWith<ProviderFilter> get copyWith => _$ProviderFilterCopyWithImpl<ProviderFilter>(this as ProviderFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderFilter&&(identical(other.query, query) || other.query == query)&&(identical(other.country, country) || other.country == country)&&(identical(other.city, city) || other.city == city)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,query,country,city,category);

@override
String toString() {
  return 'ProviderFilter(query: $query, country: $country, city: $city, category: $category)';
}


}

/// @nodoc
abstract mixin class $ProviderFilterCopyWith<$Res>  {
  factory $ProviderFilterCopyWith(ProviderFilter value, $Res Function(ProviderFilter) _then) = _$ProviderFilterCopyWithImpl;
@useResult
$Res call({
 String query, String? country, String? city, String? category
});




}
/// @nodoc
class _$ProviderFilterCopyWithImpl<$Res>
    implements $ProviderFilterCopyWith<$Res> {
  _$ProviderFilterCopyWithImpl(this._self, this._then);

  final ProviderFilter _self;
  final $Res Function(ProviderFilter) _then;

/// Create a copy of ProviderFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? country = freezed,Object? city = freezed,Object? category = freezed,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProviderFilter].
extension ProviderFilterPatterns on ProviderFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProviderFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProviderFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProviderFilter value)  $default,){
final _that = this;
switch (_that) {
case _ProviderFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProviderFilter value)?  $default,){
final _that = this;
switch (_that) {
case _ProviderFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  String? country,  String? city,  String? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProviderFilter() when $default != null:
return $default(_that.query,_that.country,_that.city,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  String? country,  String? city,  String? category)  $default,) {final _that = this;
switch (_that) {
case _ProviderFilter():
return $default(_that.query,_that.country,_that.city,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  String? country,  String? city,  String? category)?  $default,) {final _that = this;
switch (_that) {
case _ProviderFilter() when $default != null:
return $default(_that.query,_that.country,_that.city,_that.category);case _:
  return null;

}
}

}

/// @nodoc


class _ProviderFilter implements ProviderFilter {
  const _ProviderFilter({this.query = '', this.country, this.city, this.category});
  

@override@JsonKey() final  String query;
@override final  String? country;
@override final  String? city;
@override final  String? category;

/// Create a copy of ProviderFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProviderFilterCopyWith<_ProviderFilter> get copyWith => __$ProviderFilterCopyWithImpl<_ProviderFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProviderFilter&&(identical(other.query, query) || other.query == query)&&(identical(other.country, country) || other.country == country)&&(identical(other.city, city) || other.city == city)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,query,country,city,category);

@override
String toString() {
  return 'ProviderFilter(query: $query, country: $country, city: $city, category: $category)';
}


}

/// @nodoc
abstract mixin class _$ProviderFilterCopyWith<$Res> implements $ProviderFilterCopyWith<$Res> {
  factory _$ProviderFilterCopyWith(_ProviderFilter value, $Res Function(_ProviderFilter) _then) = __$ProviderFilterCopyWithImpl;
@override @useResult
$Res call({
 String query, String? country, String? city, String? category
});




}
/// @nodoc
class __$ProviderFilterCopyWithImpl<$Res>
    implements _$ProviderFilterCopyWith<$Res> {
  __$ProviderFilterCopyWithImpl(this._self, this._then);

  final _ProviderFilter _self;
  final $Res Function(_ProviderFilter) _then;

/// Create a copy of ProviderFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? country = freezed,Object? city = freezed,Object? category = freezed,}) {
  return _then(_ProviderFilter(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
