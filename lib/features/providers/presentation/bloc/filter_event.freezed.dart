// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FilterEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FilterEvent()';
}


}

/// @nodoc
class $FilterEventCopyWith<$Res>  {
$FilterEventCopyWith(FilterEvent _, $Res Function(FilterEvent) __);
}


/// Adds pattern-matching-related methods to [FilterEvent].
extension FilterEventPatterns on FilterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FilterStarted value)?  started,TResult Function( FilterCountrySelected value)?  countrySelected,TResult Function( FilterCitySelected value)?  citySelected,TResult Function( FilterCategorySelected value)?  categorySelected,TResult Function( FilterCleared value)?  cleared,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FilterStarted() when started != null:
return started(_that);case FilterCountrySelected() when countrySelected != null:
return countrySelected(_that);case FilterCitySelected() when citySelected != null:
return citySelected(_that);case FilterCategorySelected() when categorySelected != null:
return categorySelected(_that);case FilterCleared() when cleared != null:
return cleared(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FilterStarted value)  started,required TResult Function( FilterCountrySelected value)  countrySelected,required TResult Function( FilterCitySelected value)  citySelected,required TResult Function( FilterCategorySelected value)  categorySelected,required TResult Function( FilterCleared value)  cleared,}){
final _that = this;
switch (_that) {
case FilterStarted():
return started(_that);case FilterCountrySelected():
return countrySelected(_that);case FilterCitySelected():
return citySelected(_that);case FilterCategorySelected():
return categorySelected(_that);case FilterCleared():
return cleared(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FilterStarted value)?  started,TResult? Function( FilterCountrySelected value)?  countrySelected,TResult? Function( FilterCitySelected value)?  citySelected,TResult? Function( FilterCategorySelected value)?  categorySelected,TResult? Function( FilterCleared value)?  cleared,}){
final _that = this;
switch (_that) {
case FilterStarted() when started != null:
return started(_that);case FilterCountrySelected() when countrySelected != null:
return countrySelected(_that);case FilterCitySelected() when citySelected != null:
return citySelected(_that);case FilterCategorySelected() when categorySelected != null:
return categorySelected(_that);case FilterCleared() when cleared != null:
return cleared(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ProviderFilter initial)?  started,TResult Function( String? country)?  countrySelected,TResult Function( String? city)?  citySelected,TResult Function( String? category)?  categorySelected,TResult Function()?  cleared,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FilterStarted() when started != null:
return started(_that.initial);case FilterCountrySelected() when countrySelected != null:
return countrySelected(_that.country);case FilterCitySelected() when citySelected != null:
return citySelected(_that.city);case FilterCategorySelected() when categorySelected != null:
return categorySelected(_that.category);case FilterCleared() when cleared != null:
return cleared();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ProviderFilter initial)  started,required TResult Function( String? country)  countrySelected,required TResult Function( String? city)  citySelected,required TResult Function( String? category)  categorySelected,required TResult Function()  cleared,}) {final _that = this;
switch (_that) {
case FilterStarted():
return started(_that.initial);case FilterCountrySelected():
return countrySelected(_that.country);case FilterCitySelected():
return citySelected(_that.city);case FilterCategorySelected():
return categorySelected(_that.category);case FilterCleared():
return cleared();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ProviderFilter initial)?  started,TResult? Function( String? country)?  countrySelected,TResult? Function( String? city)?  citySelected,TResult? Function( String? category)?  categorySelected,TResult? Function()?  cleared,}) {final _that = this;
switch (_that) {
case FilterStarted() when started != null:
return started(_that.initial);case FilterCountrySelected() when countrySelected != null:
return countrySelected(_that.country);case FilterCitySelected() when citySelected != null:
return citySelected(_that.city);case FilterCategorySelected() when categorySelected != null:
return categorySelected(_that.category);case FilterCleared() when cleared != null:
return cleared();case _:
  return null;

}
}

}

/// @nodoc


class FilterStarted implements FilterEvent {
  const FilterStarted(this.initial);
  

 final  ProviderFilter initial;

/// Create a copy of FilterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterStartedCopyWith<FilterStarted> get copyWith => _$FilterStartedCopyWithImpl<FilterStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterStarted&&(identical(other.initial, initial) || other.initial == initial));
}


@override
int get hashCode => Object.hash(runtimeType,initial);

@override
String toString() {
  return 'FilterEvent.started(initial: $initial)';
}


}

/// @nodoc
abstract mixin class $FilterStartedCopyWith<$Res> implements $FilterEventCopyWith<$Res> {
  factory $FilterStartedCopyWith(FilterStarted value, $Res Function(FilterStarted) _then) = _$FilterStartedCopyWithImpl;
@useResult
$Res call({
 ProviderFilter initial
});


$ProviderFilterCopyWith<$Res> get initial;

}
/// @nodoc
class _$FilterStartedCopyWithImpl<$Res>
    implements $FilterStartedCopyWith<$Res> {
  _$FilterStartedCopyWithImpl(this._self, this._then);

  final FilterStarted _self;
  final $Res Function(FilterStarted) _then;

/// Create a copy of FilterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? initial = null,}) {
  return _then(FilterStarted(
null == initial ? _self.initial : initial // ignore: cast_nullable_to_non_nullable
as ProviderFilter,
  ));
}

/// Create a copy of FilterEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProviderFilterCopyWith<$Res> get initial {
  
  return $ProviderFilterCopyWith<$Res>(_self.initial, (value) {
    return _then(_self.copyWith(initial: value));
  });
}
}

/// @nodoc


class FilterCountrySelected implements FilterEvent {
  const FilterCountrySelected(this.country);
  

 final  String? country;

/// Create a copy of FilterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterCountrySelectedCopyWith<FilterCountrySelected> get copyWith => _$FilterCountrySelectedCopyWithImpl<FilterCountrySelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterCountrySelected&&(identical(other.country, country) || other.country == country));
}


@override
int get hashCode => Object.hash(runtimeType,country);

@override
String toString() {
  return 'FilterEvent.countrySelected(country: $country)';
}


}

/// @nodoc
abstract mixin class $FilterCountrySelectedCopyWith<$Res> implements $FilterEventCopyWith<$Res> {
  factory $FilterCountrySelectedCopyWith(FilterCountrySelected value, $Res Function(FilterCountrySelected) _then) = _$FilterCountrySelectedCopyWithImpl;
@useResult
$Res call({
 String? country
});




}
/// @nodoc
class _$FilterCountrySelectedCopyWithImpl<$Res>
    implements $FilterCountrySelectedCopyWith<$Res> {
  _$FilterCountrySelectedCopyWithImpl(this._self, this._then);

  final FilterCountrySelected _self;
  final $Res Function(FilterCountrySelected) _then;

/// Create a copy of FilterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? country = freezed,}) {
  return _then(FilterCountrySelected(
freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class FilterCitySelected implements FilterEvent {
  const FilterCitySelected(this.city);
  

 final  String? city;

/// Create a copy of FilterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterCitySelectedCopyWith<FilterCitySelected> get copyWith => _$FilterCitySelectedCopyWithImpl<FilterCitySelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterCitySelected&&(identical(other.city, city) || other.city == city));
}


@override
int get hashCode => Object.hash(runtimeType,city);

@override
String toString() {
  return 'FilterEvent.citySelected(city: $city)';
}


}

/// @nodoc
abstract mixin class $FilterCitySelectedCopyWith<$Res> implements $FilterEventCopyWith<$Res> {
  factory $FilterCitySelectedCopyWith(FilterCitySelected value, $Res Function(FilterCitySelected) _then) = _$FilterCitySelectedCopyWithImpl;
@useResult
$Res call({
 String? city
});




}
/// @nodoc
class _$FilterCitySelectedCopyWithImpl<$Res>
    implements $FilterCitySelectedCopyWith<$Res> {
  _$FilterCitySelectedCopyWithImpl(this._self, this._then);

  final FilterCitySelected _self;
  final $Res Function(FilterCitySelected) _then;

/// Create a copy of FilterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? city = freezed,}) {
  return _then(FilterCitySelected(
freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class FilterCategorySelected implements FilterEvent {
  const FilterCategorySelected(this.category);
  

 final  String? category;

/// Create a copy of FilterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterCategorySelectedCopyWith<FilterCategorySelected> get copyWith => _$FilterCategorySelectedCopyWithImpl<FilterCategorySelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterCategorySelected&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'FilterEvent.categorySelected(category: $category)';
}


}

/// @nodoc
abstract mixin class $FilterCategorySelectedCopyWith<$Res> implements $FilterEventCopyWith<$Res> {
  factory $FilterCategorySelectedCopyWith(FilterCategorySelected value, $Res Function(FilterCategorySelected) _then) = _$FilterCategorySelectedCopyWithImpl;
@useResult
$Res call({
 String? category
});




}
/// @nodoc
class _$FilterCategorySelectedCopyWithImpl<$Res>
    implements $FilterCategorySelectedCopyWith<$Res> {
  _$FilterCategorySelectedCopyWithImpl(this._self, this._then);

  final FilterCategorySelected _self;
  final $Res Function(FilterCategorySelected) _then;

/// Create a copy of FilterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = freezed,}) {
  return _then(FilterCategorySelected(
freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class FilterCleared implements FilterEvent {
  const FilterCleared();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterCleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FilterEvent.cleared()';
}


}




// dart format on
