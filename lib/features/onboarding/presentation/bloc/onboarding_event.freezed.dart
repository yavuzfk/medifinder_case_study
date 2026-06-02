// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent()';
}


}

/// @nodoc
class $OnboardingEventCopyWith<$Res>  {
$OnboardingEventCopyWith(OnboardingEvent _, $Res Function(OnboardingEvent) __);
}


/// Adds pattern-matching-related methods to [OnboardingEvent].
extension OnboardingEventPatterns on OnboardingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnboardingPageChanged value)?  pageChanged,TResult Function( OnboardingNextPressed value)?  nextPressed,TResult Function( OnboardingSkipped value)?  skipped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnboardingPageChanged() when pageChanged != null:
return pageChanged(_that);case OnboardingNextPressed() when nextPressed != null:
return nextPressed(_that);case OnboardingSkipped() when skipped != null:
return skipped(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnboardingPageChanged value)  pageChanged,required TResult Function( OnboardingNextPressed value)  nextPressed,required TResult Function( OnboardingSkipped value)  skipped,}){
final _that = this;
switch (_that) {
case OnboardingPageChanged():
return pageChanged(_that);case OnboardingNextPressed():
return nextPressed(_that);case OnboardingSkipped():
return skipped(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnboardingPageChanged value)?  pageChanged,TResult? Function( OnboardingNextPressed value)?  nextPressed,TResult? Function( OnboardingSkipped value)?  skipped,}){
final _that = this;
switch (_that) {
case OnboardingPageChanged() when pageChanged != null:
return pageChanged(_that);case OnboardingNextPressed() when nextPressed != null:
return nextPressed(_that);case OnboardingSkipped() when skipped != null:
return skipped(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int index)?  pageChanged,TResult Function()?  nextPressed,TResult Function()?  skipped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnboardingPageChanged() when pageChanged != null:
return pageChanged(_that.index);case OnboardingNextPressed() when nextPressed != null:
return nextPressed();case OnboardingSkipped() when skipped != null:
return skipped();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int index)  pageChanged,required TResult Function()  nextPressed,required TResult Function()  skipped,}) {final _that = this;
switch (_that) {
case OnboardingPageChanged():
return pageChanged(_that.index);case OnboardingNextPressed():
return nextPressed();case OnboardingSkipped():
return skipped();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int index)?  pageChanged,TResult? Function()?  nextPressed,TResult? Function()?  skipped,}) {final _that = this;
switch (_that) {
case OnboardingPageChanged() when pageChanged != null:
return pageChanged(_that.index);case OnboardingNextPressed() when nextPressed != null:
return nextPressed();case OnboardingSkipped() when skipped != null:
return skipped();case _:
  return null;

}
}

}

/// @nodoc


class OnboardingPageChanged implements OnboardingEvent {
  const OnboardingPageChanged(this.index);
  

 final  int index;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingPageChangedCopyWith<OnboardingPageChanged> get copyWith => _$OnboardingPageChangedCopyWithImpl<OnboardingPageChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingPageChanged&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'OnboardingEvent.pageChanged(index: $index)';
}


}

/// @nodoc
abstract mixin class $OnboardingPageChangedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $OnboardingPageChangedCopyWith(OnboardingPageChanged value, $Res Function(OnboardingPageChanged) _then) = _$OnboardingPageChangedCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class _$OnboardingPageChangedCopyWithImpl<$Res>
    implements $OnboardingPageChangedCopyWith<$Res> {
  _$OnboardingPageChangedCopyWithImpl(this._self, this._then);

  final OnboardingPageChanged _self;
  final $Res Function(OnboardingPageChanged) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(OnboardingPageChanged(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class OnboardingNextPressed implements OnboardingEvent {
  const OnboardingNextPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingNextPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.nextPressed()';
}


}




/// @nodoc


class OnboardingSkipped implements OnboardingEvent {
  const OnboardingSkipped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingSkipped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.skipped()';
}


}




// dart format on
