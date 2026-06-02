// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FilterState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FilterState()';
}


}

/// @nodoc
class $FilterStateCopyWith<$Res>  {
$FilterStateCopyWith(FilterState _, $Res Function(FilterState) __);
}


/// Adds pattern-matching-related methods to [FilterState].
extension FilterStatePatterns on FilterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FilterLoading value)?  loading,TResult Function( FilterError value)?  error,TResult Function( FilterReady value)?  ready,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FilterLoading() when loading != null:
return loading(_that);case FilterError() when error != null:
return error(_that);case FilterReady() when ready != null:
return ready(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FilterLoading value)  loading,required TResult Function( FilterError value)  error,required TResult Function( FilterReady value)  ready,}){
final _that = this;
switch (_that) {
case FilterLoading():
return loading(_that);case FilterError():
return error(_that);case FilterReady():
return ready(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FilterLoading value)?  loading,TResult? Function( FilterError value)?  error,TResult? Function( FilterReady value)?  ready,}){
final _that = this;
switch (_that) {
case FilterLoading() when loading != null:
return loading(_that);case FilterError() when error != null:
return error(_that);case FilterReady() when ready != null:
return ready(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String message)?  error,TResult Function( FilterOptions options,  String? country,  String? city,  String? category)?  ready,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FilterLoading() when loading != null:
return loading();case FilterError() when error != null:
return error(_that.message);case FilterReady() when ready != null:
return ready(_that.options,_that.country,_that.city,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function( FilterOptions options,  String? country,  String? city,  String? category)  ready,}) {final _that = this;
switch (_that) {
case FilterLoading():
return loading();case FilterError():
return error(_that.message);case FilterReady():
return ready(_that.options,_that.country,_that.city,_that.category);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function( FilterOptions options,  String? country,  String? city,  String? category)?  ready,}) {final _that = this;
switch (_that) {
case FilterLoading() when loading != null:
return loading();case FilterError() when error != null:
return error(_that.message);case FilterReady() when ready != null:
return ready(_that.options,_that.country,_that.city,_that.category);case _:
  return null;

}
}

}

/// @nodoc


class FilterLoading implements FilterState {
  const FilterLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FilterState.loading()';
}


}




/// @nodoc


class FilterError implements FilterState {
  const FilterError(this.message);
  

 final  String message;

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterErrorCopyWith<FilterError> get copyWith => _$FilterErrorCopyWithImpl<FilterError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'FilterState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $FilterErrorCopyWith<$Res> implements $FilterStateCopyWith<$Res> {
  factory $FilterErrorCopyWith(FilterError value, $Res Function(FilterError) _then) = _$FilterErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FilterErrorCopyWithImpl<$Res>
    implements $FilterErrorCopyWith<$Res> {
  _$FilterErrorCopyWithImpl(this._self, this._then);

  final FilterError _self;
  final $Res Function(FilterError) _then;

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(FilterError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FilterReady implements FilterState {
  const FilterReady({required this.options, this.country, this.city, this.category});
  

 final  FilterOptions options;
 final  String? country;
 final  String? city;
 final  String? category;

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterReadyCopyWith<FilterReady> get copyWith => _$FilterReadyCopyWithImpl<FilterReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterReady&&(identical(other.options, options) || other.options == options)&&(identical(other.country, country) || other.country == country)&&(identical(other.city, city) || other.city == city)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,options,country,city,category);

@override
String toString() {
  return 'FilterState.ready(options: $options, country: $country, city: $city, category: $category)';
}


}

/// @nodoc
abstract mixin class $FilterReadyCopyWith<$Res> implements $FilterStateCopyWith<$Res> {
  factory $FilterReadyCopyWith(FilterReady value, $Res Function(FilterReady) _then) = _$FilterReadyCopyWithImpl;
@useResult
$Res call({
 FilterOptions options, String? country, String? city, String? category
});


$FilterOptionsCopyWith<$Res> get options;

}
/// @nodoc
class _$FilterReadyCopyWithImpl<$Res>
    implements $FilterReadyCopyWith<$Res> {
  _$FilterReadyCopyWithImpl(this._self, this._then);

  final FilterReady _self;
  final $Res Function(FilterReady) _then;

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? options = null,Object? country = freezed,Object? city = freezed,Object? category = freezed,}) {
  return _then(FilterReady(
options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as FilterOptions,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FilterOptionsCopyWith<$Res> get options {
  
  return $FilterOptionsCopyWith<$Res>(_self.options, (value) {
    return _then(_self.copyWith(options: value));
  });
}
}

// dart format on
