// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingState()';
}


}

/// @nodoc
class $OnboardingStateCopyWith<$Res>  {
$OnboardingStateCopyWith(OnboardingState _, $Res Function(OnboardingState) __);
}


/// Adds pattern-matching-related methods to [OnboardingState].
extension OnboardingStatePatterns on OnboardingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnboardingInProgress value)?  inProgress,TResult Function( OnboardingCompleted value)?  completed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnboardingInProgress() when inProgress != null:
return inProgress(_that);case OnboardingCompleted() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnboardingInProgress value)  inProgress,required TResult Function( OnboardingCompleted value)  completed,}){
final _that = this;
switch (_that) {
case OnboardingInProgress():
return inProgress(_that);case OnboardingCompleted():
return completed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnboardingInProgress value)?  inProgress,TResult? Function( OnboardingCompleted value)?  completed,}){
final _that = this;
switch (_that) {
case OnboardingInProgress() when inProgress != null:
return inProgress(_that);case OnboardingCompleted() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<OnboardingSlide> slides,  int index)?  inProgress,TResult Function()?  completed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnboardingInProgress() when inProgress != null:
return inProgress(_that.slides,_that.index);case OnboardingCompleted() when completed != null:
return completed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<OnboardingSlide> slides,  int index)  inProgress,required TResult Function()  completed,}) {final _that = this;
switch (_that) {
case OnboardingInProgress():
return inProgress(_that.slides,_that.index);case OnboardingCompleted():
return completed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<OnboardingSlide> slides,  int index)?  inProgress,TResult? Function()?  completed,}) {final _that = this;
switch (_that) {
case OnboardingInProgress() when inProgress != null:
return inProgress(_that.slides,_that.index);case OnboardingCompleted() when completed != null:
return completed();case _:
  return null;

}
}

}

/// @nodoc


class OnboardingInProgress implements OnboardingState {
  const OnboardingInProgress({required final  List<OnboardingSlide> slides, required this.index}): _slides = slides;
  

 final  List<OnboardingSlide> _slides;
 List<OnboardingSlide> get slides {
  if (_slides is EqualUnmodifiableListView) return _slides;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slides);
}

 final  int index;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingInProgressCopyWith<OnboardingInProgress> get copyWith => _$OnboardingInProgressCopyWithImpl<OnboardingInProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingInProgress&&const DeepCollectionEquality().equals(other._slides, _slides)&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_slides),index);

@override
String toString() {
  return 'OnboardingState.inProgress(slides: $slides, index: $index)';
}


}

/// @nodoc
abstract mixin class $OnboardingInProgressCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory $OnboardingInProgressCopyWith(OnboardingInProgress value, $Res Function(OnboardingInProgress) _then) = _$OnboardingInProgressCopyWithImpl;
@useResult
$Res call({
 List<OnboardingSlide> slides, int index
});




}
/// @nodoc
class _$OnboardingInProgressCopyWithImpl<$Res>
    implements $OnboardingInProgressCopyWith<$Res> {
  _$OnboardingInProgressCopyWithImpl(this._self, this._then);

  final OnboardingInProgress _self;
  final $Res Function(OnboardingInProgress) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? slides = null,Object? index = null,}) {
  return _then(OnboardingInProgress(
slides: null == slides ? _self._slides : slides // ignore: cast_nullable_to_non_nullable
as List<OnboardingSlide>,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class OnboardingCompleted implements OnboardingState {
  const OnboardingCompleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingCompleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingState.completed()';
}


}




// dart format on
