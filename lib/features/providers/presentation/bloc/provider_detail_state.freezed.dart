// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provider_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProviderDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProviderDetailState()';
}


}

/// @nodoc
class $ProviderDetailStateCopyWith<$Res>  {
$ProviderDetailStateCopyWith(ProviderDetailState _, $Res Function(ProviderDetailState) __);
}


/// Adds pattern-matching-related methods to [ProviderDetailState].
extension ProviderDetailStatePatterns on ProviderDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProviderDetailLoading value)?  loading,TResult Function( ProviderDetailError value)?  error,TResult Function( ProviderDetailLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProviderDetailLoading() when loading != null:
return loading(_that);case ProviderDetailError() when error != null:
return error(_that);case ProviderDetailLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProviderDetailLoading value)  loading,required TResult Function( ProviderDetailError value)  error,required TResult Function( ProviderDetailLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case ProviderDetailLoading():
return loading(_that);case ProviderDetailError():
return error(_that);case ProviderDetailLoaded():
return loaded(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProviderDetailLoading value)?  loading,TResult? Function( ProviderDetailError value)?  error,TResult? Function( ProviderDetailLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case ProviderDetailLoading() when loading != null:
return loading(_that);case ProviderDetailError() when error != null:
return error(_that);case ProviderDetailLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String message)?  error,TResult Function( Provider provider)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProviderDetailLoading() when loading != null:
return loading();case ProviderDetailError() when error != null:
return error(_that.message);case ProviderDetailLoaded() when loaded != null:
return loaded(_that.provider);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function( Provider provider)  loaded,}) {final _that = this;
switch (_that) {
case ProviderDetailLoading():
return loading();case ProviderDetailError():
return error(_that.message);case ProviderDetailLoaded():
return loaded(_that.provider);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function( Provider provider)?  loaded,}) {final _that = this;
switch (_that) {
case ProviderDetailLoading() when loading != null:
return loading();case ProviderDetailError() when error != null:
return error(_that.message);case ProviderDetailLoaded() when loaded != null:
return loaded(_that.provider);case _:
  return null;

}
}

}

/// @nodoc


class ProviderDetailLoading implements ProviderDetailState {
  const ProviderDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProviderDetailState.loading()';
}


}




/// @nodoc


class ProviderDetailError implements ProviderDetailState {
  const ProviderDetailError(this.message);
  

 final  String message;

/// Create a copy of ProviderDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProviderDetailErrorCopyWith<ProviderDetailError> get copyWith => _$ProviderDetailErrorCopyWithImpl<ProviderDetailError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderDetailError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProviderDetailState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProviderDetailErrorCopyWith<$Res> implements $ProviderDetailStateCopyWith<$Res> {
  factory $ProviderDetailErrorCopyWith(ProviderDetailError value, $Res Function(ProviderDetailError) _then) = _$ProviderDetailErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProviderDetailErrorCopyWithImpl<$Res>
    implements $ProviderDetailErrorCopyWith<$Res> {
  _$ProviderDetailErrorCopyWithImpl(this._self, this._then);

  final ProviderDetailError _self;
  final $Res Function(ProviderDetailError) _then;

/// Create a copy of ProviderDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProviderDetailError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProviderDetailLoaded implements ProviderDetailState {
  const ProviderDetailLoaded(this.provider);
  

 final  Provider provider;

/// Create a copy of ProviderDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProviderDetailLoadedCopyWith<ProviderDetailLoaded> get copyWith => _$ProviderDetailLoadedCopyWithImpl<ProviderDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderDetailLoaded&&(identical(other.provider, provider) || other.provider == provider));
}


@override
int get hashCode => Object.hash(runtimeType,provider);

@override
String toString() {
  return 'ProviderDetailState.loaded(provider: $provider)';
}


}

/// @nodoc
abstract mixin class $ProviderDetailLoadedCopyWith<$Res> implements $ProviderDetailStateCopyWith<$Res> {
  factory $ProviderDetailLoadedCopyWith(ProviderDetailLoaded value, $Res Function(ProviderDetailLoaded) _then) = _$ProviderDetailLoadedCopyWithImpl;
@useResult
$Res call({
 Provider provider
});


$ProviderCopyWith<$Res> get provider;

}
/// @nodoc
class _$ProviderDetailLoadedCopyWithImpl<$Res>
    implements $ProviderDetailLoadedCopyWith<$Res> {
  _$ProviderDetailLoadedCopyWithImpl(this._self, this._then);

  final ProviderDetailLoaded _self;
  final $Res Function(ProviderDetailLoaded) _then;

/// Create a copy of ProviderDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? provider = null,}) {
  return _then(ProviderDetailLoaded(
null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as Provider,
  ));
}

/// Create a copy of ProviderDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProviderCopyWith<$Res> get provider {
  
  return $ProviderCopyWith<$Res>(_self.provider, (value) {
    return _then(_self.copyWith(provider: value));
  });
}
}

// dart format on
