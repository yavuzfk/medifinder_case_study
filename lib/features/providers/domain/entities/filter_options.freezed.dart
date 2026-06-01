// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FilterOptions {

 List<String> get countries; Map<String, List<String>> get citiesByCountry; List<String> get categories;
/// Create a copy of FilterOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterOptionsCopyWith<FilterOptions> get copyWith => _$FilterOptionsCopyWithImpl<FilterOptions>(this as FilterOptions, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterOptions&&const DeepCollectionEquality().equals(other.countries, countries)&&const DeepCollectionEquality().equals(other.citiesByCountry, citiesByCountry)&&const DeepCollectionEquality().equals(other.categories, categories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(countries),const DeepCollectionEquality().hash(citiesByCountry),const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'FilterOptions(countries: $countries, citiesByCountry: $citiesByCountry, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $FilterOptionsCopyWith<$Res>  {
  factory $FilterOptionsCopyWith(FilterOptions value, $Res Function(FilterOptions) _then) = _$FilterOptionsCopyWithImpl;
@useResult
$Res call({
 List<String> countries, Map<String, List<String>> citiesByCountry, List<String> categories
});




}
/// @nodoc
class _$FilterOptionsCopyWithImpl<$Res>
    implements $FilterOptionsCopyWith<$Res> {
  _$FilterOptionsCopyWithImpl(this._self, this._then);

  final FilterOptions _self;
  final $Res Function(FilterOptions) _then;

/// Create a copy of FilterOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? countries = null,Object? citiesByCountry = null,Object? categories = null,}) {
  return _then(_self.copyWith(
countries: null == countries ? _self.countries : countries // ignore: cast_nullable_to_non_nullable
as List<String>,citiesByCountry: null == citiesByCountry ? _self.citiesByCountry : citiesByCountry // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [FilterOptions].
extension FilterOptionsPatterns on FilterOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FilterOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FilterOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FilterOptions value)  $default,){
final _that = this;
switch (_that) {
case _FilterOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FilterOptions value)?  $default,){
final _that = this;
switch (_that) {
case _FilterOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> countries,  Map<String, List<String>> citiesByCountry,  List<String> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FilterOptions() when $default != null:
return $default(_that.countries,_that.citiesByCountry,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> countries,  Map<String, List<String>> citiesByCountry,  List<String> categories)  $default,) {final _that = this;
switch (_that) {
case _FilterOptions():
return $default(_that.countries,_that.citiesByCountry,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> countries,  Map<String, List<String>> citiesByCountry,  List<String> categories)?  $default,) {final _that = this;
switch (_that) {
case _FilterOptions() when $default != null:
return $default(_that.countries,_that.citiesByCountry,_that.categories);case _:
  return null;

}
}

}

/// @nodoc


class _FilterOptions implements FilterOptions {
  const _FilterOptions({required final  List<String> countries, required final  Map<String, List<String>> citiesByCountry, required final  List<String> categories}): _countries = countries,_citiesByCountry = citiesByCountry,_categories = categories;
  

 final  List<String> _countries;
@override List<String> get countries {
  if (_countries is EqualUnmodifiableListView) return _countries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_countries);
}

 final  Map<String, List<String>> _citiesByCountry;
@override Map<String, List<String>> get citiesByCountry {
  if (_citiesByCountry is EqualUnmodifiableMapView) return _citiesByCountry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_citiesByCountry);
}

 final  List<String> _categories;
@override List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of FilterOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterOptionsCopyWith<_FilterOptions> get copyWith => __$FilterOptionsCopyWithImpl<_FilterOptions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterOptions&&const DeepCollectionEquality().equals(other._countries, _countries)&&const DeepCollectionEquality().equals(other._citiesByCountry, _citiesByCountry)&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_countries),const DeepCollectionEquality().hash(_citiesByCountry),const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'FilterOptions(countries: $countries, citiesByCountry: $citiesByCountry, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$FilterOptionsCopyWith<$Res> implements $FilterOptionsCopyWith<$Res> {
  factory _$FilterOptionsCopyWith(_FilterOptions value, $Res Function(_FilterOptions) _then) = __$FilterOptionsCopyWithImpl;
@override @useResult
$Res call({
 List<String> countries, Map<String, List<String>> citiesByCountry, List<String> categories
});




}
/// @nodoc
class __$FilterOptionsCopyWithImpl<$Res>
    implements _$FilterOptionsCopyWith<$Res> {
  __$FilterOptionsCopyWithImpl(this._self, this._then);

  final _FilterOptions _self;
  final $Res Function(_FilterOptions) _then;

/// Create a copy of FilterOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? countries = null,Object? citiesByCountry = null,Object? categories = null,}) {
  return _then(_FilterOptions(
countries: null == countries ? _self._countries : countries // ignore: cast_nullable_to_non_nullable
as List<String>,citiesByCountry: null == citiesByCountry ? _self._citiesByCountry : citiesByCountry // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
