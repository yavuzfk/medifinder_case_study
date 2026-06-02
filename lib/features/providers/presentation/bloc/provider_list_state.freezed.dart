// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provider_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProviderListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProviderListState()';
}


}

/// @nodoc
class $ProviderListStateCopyWith<$Res>  {
$ProviderListStateCopyWith(ProviderListState _, $Res Function(ProviderListState) __);
}


/// Adds pattern-matching-related methods to [ProviderListState].
extension ProviderListStatePatterns on ProviderListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProviderListInitial value)?  initial,TResult Function( ProviderListLoading value)?  loading,TResult Function( ProviderListLoaded value)?  loaded,TResult Function( ProviderListEmpty value)?  empty,TResult Function( ProviderListError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProviderListInitial() when initial != null:
return initial(_that);case ProviderListLoading() when loading != null:
return loading(_that);case ProviderListLoaded() when loaded != null:
return loaded(_that);case ProviderListEmpty() when empty != null:
return empty(_that);case ProviderListError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProviderListInitial value)  initial,required TResult Function( ProviderListLoading value)  loading,required TResult Function( ProviderListLoaded value)  loaded,required TResult Function( ProviderListEmpty value)  empty,required TResult Function( ProviderListError value)  error,}){
final _that = this;
switch (_that) {
case ProviderListInitial():
return initial(_that);case ProviderListLoading():
return loading(_that);case ProviderListLoaded():
return loaded(_that);case ProviderListEmpty():
return empty(_that);case ProviderListError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProviderListInitial value)?  initial,TResult? Function( ProviderListLoading value)?  loading,TResult? Function( ProviderListLoaded value)?  loaded,TResult? Function( ProviderListEmpty value)?  empty,TResult? Function( ProviderListError value)?  error,}){
final _that = this;
switch (_that) {
case ProviderListInitial() when initial != null:
return initial(_that);case ProviderListLoading() when loading != null:
return loading(_that);case ProviderListLoaded() when loaded != null:
return loaded(_that);case ProviderListEmpty() when empty != null:
return empty(_that);case ProviderListError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Provider> providers,  bool fromCache)?  loaded,TResult Function()?  empty,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProviderListInitial() when initial != null:
return initial();case ProviderListLoading() when loading != null:
return loading();case ProviderListLoaded() when loaded != null:
return loaded(_that.providers,_that.fromCache);case ProviderListEmpty() when empty != null:
return empty();case ProviderListError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Provider> providers,  bool fromCache)  loaded,required TResult Function()  empty,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ProviderListInitial():
return initial();case ProviderListLoading():
return loading();case ProviderListLoaded():
return loaded(_that.providers,_that.fromCache);case ProviderListEmpty():
return empty();case ProviderListError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Provider> providers,  bool fromCache)?  loaded,TResult? Function()?  empty,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ProviderListInitial() when initial != null:
return initial();case ProviderListLoading() when loading != null:
return loading();case ProviderListLoaded() when loaded != null:
return loaded(_that.providers,_that.fromCache);case ProviderListEmpty() when empty != null:
return empty();case ProviderListError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProviderListInitial implements ProviderListState {
  const ProviderListInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderListInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProviderListState.initial()';
}


}




/// @nodoc


class ProviderListLoading implements ProviderListState {
  const ProviderListLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderListLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProviderListState.loading()';
}


}




/// @nodoc


class ProviderListLoaded implements ProviderListState {
  const ProviderListLoaded(final  List<Provider> providers, {this.fromCache = false}): _providers = providers;
  

 final  List<Provider> _providers;
 List<Provider> get providers {
  if (_providers is EqualUnmodifiableListView) return _providers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_providers);
}

@JsonKey() final  bool fromCache;

/// Create a copy of ProviderListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProviderListLoadedCopyWith<ProviderListLoaded> get copyWith => _$ProviderListLoadedCopyWithImpl<ProviderListLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderListLoaded&&const DeepCollectionEquality().equals(other._providers, _providers)&&(identical(other.fromCache, fromCache) || other.fromCache == fromCache));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_providers),fromCache);

@override
String toString() {
  return 'ProviderListState.loaded(providers: $providers, fromCache: $fromCache)';
}


}

/// @nodoc
abstract mixin class $ProviderListLoadedCopyWith<$Res> implements $ProviderListStateCopyWith<$Res> {
  factory $ProviderListLoadedCopyWith(ProviderListLoaded value, $Res Function(ProviderListLoaded) _then) = _$ProviderListLoadedCopyWithImpl;
@useResult
$Res call({
 List<Provider> providers, bool fromCache
});




}
/// @nodoc
class _$ProviderListLoadedCopyWithImpl<$Res>
    implements $ProviderListLoadedCopyWith<$Res> {
  _$ProviderListLoadedCopyWithImpl(this._self, this._then);

  final ProviderListLoaded _self;
  final $Res Function(ProviderListLoaded) _then;

/// Create a copy of ProviderListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? providers = null,Object? fromCache = null,}) {
  return _then(ProviderListLoaded(
null == providers ? _self._providers : providers // ignore: cast_nullable_to_non_nullable
as List<Provider>,fromCache: null == fromCache ? _self.fromCache : fromCache // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ProviderListEmpty implements ProviderListState {
  const ProviderListEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderListEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProviderListState.empty()';
}


}




/// @nodoc


class ProviderListError implements ProviderListState {
  const ProviderListError(this.message);
  

 final  String message;

/// Create a copy of ProviderListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProviderListErrorCopyWith<ProviderListError> get copyWith => _$ProviderListErrorCopyWithImpl<ProviderListError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderListError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProviderListState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProviderListErrorCopyWith<$Res> implements $ProviderListStateCopyWith<$Res> {
  factory $ProviderListErrorCopyWith(ProviderListError value, $Res Function(ProviderListError) _then) = _$ProviderListErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProviderListErrorCopyWithImpl<$Res>
    implements $ProviderListErrorCopyWith<$Res> {
  _$ProviderListErrorCopyWithImpl(this._self, this._then);

  final ProviderListError _self;
  final $Res Function(ProviderListError) _then;

/// Create a copy of ProviderListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProviderListError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
