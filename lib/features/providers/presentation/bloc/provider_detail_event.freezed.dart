// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provider_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProviderDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProviderDetailEvent()';
}


}

/// @nodoc
class $ProviderDetailEventCopyWith<$Res>  {
$ProviderDetailEventCopyWith(ProviderDetailEvent _, $Res Function(ProviderDetailEvent) __);
}


/// Adds pattern-matching-related methods to [ProviderDetailEvent].
extension ProviderDetailEventPatterns on ProviderDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProviderDetailStarted value)?  started,TResult Function( ProviderDetailRetried value)?  retried,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProviderDetailStarted() when started != null:
return started(_that);case ProviderDetailRetried() when retried != null:
return retried(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProviderDetailStarted value)  started,required TResult Function( ProviderDetailRetried value)  retried,}){
final _that = this;
switch (_that) {
case ProviderDetailStarted():
return started(_that);case ProviderDetailRetried():
return retried(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProviderDetailStarted value)?  started,TResult? Function( ProviderDetailRetried value)?  retried,}){
final _that = this;
switch (_that) {
case ProviderDetailStarted() when started != null:
return started(_that);case ProviderDetailRetried() when retried != null:
return retried(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id)?  started,TResult Function()?  retried,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProviderDetailStarted() when started != null:
return started(_that.id);case ProviderDetailRetried() when retried != null:
return retried();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id)  started,required TResult Function()  retried,}) {final _that = this;
switch (_that) {
case ProviderDetailStarted():
return started(_that.id);case ProviderDetailRetried():
return retried();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id)?  started,TResult? Function()?  retried,}) {final _that = this;
switch (_that) {
case ProviderDetailStarted() when started != null:
return started(_that.id);case ProviderDetailRetried() when retried != null:
return retried();case _:
  return null;

}
}

}

/// @nodoc


class ProviderDetailStarted implements ProviderDetailEvent {
  const ProviderDetailStarted(this.id);
  

 final  String id;

/// Create a copy of ProviderDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProviderDetailStartedCopyWith<ProviderDetailStarted> get copyWith => _$ProviderDetailStartedCopyWithImpl<ProviderDetailStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderDetailStarted&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ProviderDetailEvent.started(id: $id)';
}


}

/// @nodoc
abstract mixin class $ProviderDetailStartedCopyWith<$Res> implements $ProviderDetailEventCopyWith<$Res> {
  factory $ProviderDetailStartedCopyWith(ProviderDetailStarted value, $Res Function(ProviderDetailStarted) _then) = _$ProviderDetailStartedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$ProviderDetailStartedCopyWithImpl<$Res>
    implements $ProviderDetailStartedCopyWith<$Res> {
  _$ProviderDetailStartedCopyWithImpl(this._self, this._then);

  final ProviderDetailStarted _self;
  final $Res Function(ProviderDetailStarted) _then;

/// Create a copy of ProviderDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(ProviderDetailStarted(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProviderDetailRetried implements ProviderDetailEvent {
  const ProviderDetailRetried();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderDetailRetried);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProviderDetailEvent.retried()';
}


}




// dart format on
