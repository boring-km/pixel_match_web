// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pixel_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PixelState {
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  List<Color> get colors => throw _privateConstructorUsedError;
  List<dynamic> get quizList => throw _privateConstructorUsedError;
  List<String> get answers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PixelStateCopyWith<PixelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PixelStateCopyWith<$Res> {
  factory $PixelStateCopyWith(
          PixelState value, $Res Function(PixelState) then) =
      _$PixelStateCopyWithImpl<$Res>;
  $Res call(
      {int width,
      int height,
      List<Color> colors,
      List<dynamic> quizList,
      List<String> answers});
}

/// @nodoc
class _$PixelStateCopyWithImpl<$Res> implements $PixelStateCopyWith<$Res> {
  _$PixelStateCopyWithImpl(this._value, this._then);

  final PixelState _value;
  // ignore: unused_field
  final $Res Function(PixelState) _then;

  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? colors = freezed,
    Object? quizList = freezed,
    Object? answers = freezed,
  }) {
    return _then(_value.copyWith(
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      colors: colors == freezed
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<Color>,
      quizList: quizList == freezed
          ? _value.quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$PixelStateCopyWith<$Res> implements $PixelStateCopyWith<$Res> {
  factory _$PixelStateCopyWith(
          _PixelState value, $Res Function(_PixelState) then) =
      __$PixelStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int width,
      int height,
      List<Color> colors,
      List<dynamic> quizList,
      List<String> answers});
}

/// @nodoc
class __$PixelStateCopyWithImpl<$Res> extends _$PixelStateCopyWithImpl<$Res>
    implements _$PixelStateCopyWith<$Res> {
  __$PixelStateCopyWithImpl(
      _PixelState _value, $Res Function(_PixelState) _then)
      : super(_value, (v) => _then(v as _PixelState));

  @override
  _PixelState get _value => super._value as _PixelState;

  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? colors = freezed,
    Object? quizList = freezed,
    Object? answers = freezed,
  }) {
    return _then(_PixelState(
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      colors: colors == freezed
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<Color>,
      quizList: quizList == freezed
          ? _value.quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_PixelState implements _PixelState {
  const _$_PixelState(
      {required this.width,
      required this.height,
      required final List<Color> colors,
      required final List<dynamic> quizList,
      required final List<String> answers})
      : _colors = colors,
        _quizList = quizList,
        _answers = answers;

  @override
  final int width;
  @override
  final int height;
  final List<Color> _colors;
  @override
  List<Color> get colors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  final List<dynamic> _quizList;
  @override
  List<dynamic> get quizList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizList);
  }

  final List<String> _answers;
  @override
  List<String> get answers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'PixelState(width: $width, height: $height, colors: $colors, quizList: $quizList, answers: $answers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PixelState &&
            const DeepCollectionEquality().equals(other.width, width) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.colors, colors) &&
            const DeepCollectionEquality().equals(other.quizList, quizList) &&
            const DeepCollectionEquality().equals(other.answers, answers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(width),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(colors),
      const DeepCollectionEquality().hash(quizList),
      const DeepCollectionEquality().hash(answers));

  @JsonKey(ignore: true)
  @override
  _$PixelStateCopyWith<_PixelState> get copyWith =>
      __$PixelStateCopyWithImpl<_PixelState>(this, _$identity);
}

abstract class _PixelState implements PixelState {
  const factory _PixelState(
      {required final int width,
      required final int height,
      required final List<Color> colors,
      required final List<dynamic> quizList,
      required final List<String> answers}) = _$_PixelState;

  @override
  int get width => throw _privateConstructorUsedError;
  @override
  int get height => throw _privateConstructorUsedError;
  @override
  List<Color> get colors => throw _privateConstructorUsedError;
  @override
  List<dynamic> get quizList => throw _privateConstructorUsedError;
  @override
  List<String> get answers => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PixelStateCopyWith<_PixelState> get copyWith =>
      throw _privateConstructorUsedError;
}
