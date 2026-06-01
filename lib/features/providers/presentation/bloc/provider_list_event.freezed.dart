// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provider_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProviderListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProviderListEvent()';
}


}

/// @nodoc
class $ProviderListEventCopyWith<$Res>  {
$ProviderListEventCopyWith(ProviderListEvent _, $Res Function(ProviderListEvent) __);
}


/// Adds pattern-matching-related methods to [ProviderListEvent].
extension ProviderListEventPatterns on ProviderListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProviderListStarted value)?  started,TResult Function( ProviderListSearchChanged value)?  searchChanged,TResult Function( ProviderListFilterChanged value)?  filterChanged,TResult Function( ProviderListRefreshed value)?  refreshed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProviderListStarted() when started != null:
return started(_that);case ProviderListSearchChanged() when searchChanged != null:
return searchChanged(_that);case ProviderListFilterChanged() when filterChanged != null:
return filterChanged(_that);case ProviderListRefreshed() when refreshed != null:
return refreshed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProviderListStarted value)  started,required TResult Function( ProviderListSearchChanged value)  searchChanged,required TResult Function( ProviderListFilterChanged value)  filterChanged,required TResult Function( ProviderListRefreshed value)  refreshed,}){
final _that = this;
switch (_that) {
case ProviderListStarted():
return started(_that);case ProviderListSearchChanged():
return searchChanged(_that);case ProviderListFilterChanged():
return filterChanged(_that);case ProviderListRefreshed():
return refreshed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProviderListStarted value)?  started,TResult? Function( ProviderListSearchChanged value)?  searchChanged,TResult? Function( ProviderListFilterChanged value)?  filterChanged,TResult? Function( ProviderListRefreshed value)?  refreshed,}){
final _that = this;
switch (_that) {
case ProviderListStarted() when started != null:
return started(_that);case ProviderListSearchChanged() when searchChanged != null:
return searchChanged(_that);case ProviderListFilterChanged() when filterChanged != null:
return filterChanged(_that);case ProviderListRefreshed() when refreshed != null:
return refreshed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String query)?  searchChanged,TResult Function( ProviderFilter filter)?  filterChanged,TResult Function()?  refreshed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProviderListStarted() when started != null:
return started();case ProviderListSearchChanged() when searchChanged != null:
return searchChanged(_that.query);case ProviderListFilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case ProviderListRefreshed() when refreshed != null:
return refreshed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String query)  searchChanged,required TResult Function( ProviderFilter filter)  filterChanged,required TResult Function()  refreshed,}) {final _that = this;
switch (_that) {
case ProviderListStarted():
return started();case ProviderListSearchChanged():
return searchChanged(_that.query);case ProviderListFilterChanged():
return filterChanged(_that.filter);case ProviderListRefreshed():
return refreshed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String query)?  searchChanged,TResult? Function( ProviderFilter filter)?  filterChanged,TResult? Function()?  refreshed,}) {final _that = this;
switch (_that) {
case ProviderListStarted() when started != null:
return started();case ProviderListSearchChanged() when searchChanged != null:
return searchChanged(_that.query);case ProviderListFilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case ProviderListRefreshed() when refreshed != null:
return refreshed();case _:
  return null;

}
}

}

/// @nodoc


class ProviderListStarted implements ProviderListEvent {
  const ProviderListStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderListStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProviderListEvent.started()';
}


}




/// @nodoc


class ProviderListSearchChanged implements ProviderListEvent {
  const ProviderListSearchChanged(this.query);
  

 final  String query;

/// Create a copy of ProviderListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProviderListSearchChangedCopyWith<ProviderListSearchChanged> get copyWith => _$ProviderListSearchChangedCopyWithImpl<ProviderListSearchChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderListSearchChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'ProviderListEvent.searchChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class $ProviderListSearchChangedCopyWith<$Res> implements $ProviderListEventCopyWith<$Res> {
  factory $ProviderListSearchChangedCopyWith(ProviderListSearchChanged value, $Res Function(ProviderListSearchChanged) _then) = _$ProviderListSearchChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$ProviderListSearchChangedCopyWithImpl<$Res>
    implements $ProviderListSearchChangedCopyWith<$Res> {
  _$ProviderListSearchChangedCopyWithImpl(this._self, this._then);

  final ProviderListSearchChanged _self;
  final $Res Function(ProviderListSearchChanged) _then;

/// Create a copy of ProviderListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(ProviderListSearchChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProviderListFilterChanged implements ProviderListEvent {
  const ProviderListFilterChanged(this.filter);
  

 final  ProviderFilter filter;

/// Create a copy of ProviderListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProviderListFilterChangedCopyWith<ProviderListFilterChanged> get copyWith => _$ProviderListFilterChangedCopyWithImpl<ProviderListFilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderListFilterChanged&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'ProviderListEvent.filterChanged(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $ProviderListFilterChangedCopyWith<$Res> implements $ProviderListEventCopyWith<$Res> {
  factory $ProviderListFilterChangedCopyWith(ProviderListFilterChanged value, $Res Function(ProviderListFilterChanged) _then) = _$ProviderListFilterChangedCopyWithImpl;
@useResult
$Res call({
 ProviderFilter filter
});


$ProviderFilterCopyWith<$Res> get filter;

}
/// @nodoc
class _$ProviderListFilterChangedCopyWithImpl<$Res>
    implements $ProviderListFilterChangedCopyWith<$Res> {
  _$ProviderListFilterChangedCopyWithImpl(this._self, this._then);

  final ProviderListFilterChanged _self;
  final $Res Function(ProviderListFilterChanged) _then;

/// Create a copy of ProviderListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(ProviderListFilterChanged(
null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ProviderFilter,
  ));
}

/// Create a copy of ProviderListEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProviderFilterCopyWith<$Res> get filter {
  
  return $ProviderFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

/// @nodoc


class ProviderListRefreshed implements ProviderListEvent {
  const ProviderListRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderListRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProviderListEvent.refreshed()';
}


}




// dart format on
