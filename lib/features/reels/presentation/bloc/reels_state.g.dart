// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reels_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReelsState extends ReelsState {
  @override
  final bool isLoading;
  @override
  final PaginationStateData<Reel> reels;
  @override
  final BuiltList<VideoPlayerController> videoControllers;

  factory _$ReelsState([void Function(ReelsStateBuilder)? updates]) =>
      (new ReelsStateBuilder()..update(updates))._build();

  _$ReelsState._(
      {required this.isLoading,
      required this.reels,
      required this.videoControllers})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'ReelsState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(reels, r'ReelsState', 'reels');
    BuiltValueNullFieldError.checkNotNull(
        videoControllers, r'ReelsState', 'videoControllers');
  }

  @override
  ReelsState rebuild(void Function(ReelsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReelsStateBuilder toBuilder() => new ReelsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReelsState &&
        isLoading == other.isLoading &&
        reels == other.reels &&
        videoControllers == other.videoControllers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, reels.hashCode);
    _$hash = $jc(_$hash, videoControllers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReelsState')
          ..add('isLoading', isLoading)
          ..add('reels', reels)
          ..add('videoControllers', videoControllers))
        .toString();
  }
}

class ReelsStateBuilder implements Builder<ReelsState, ReelsStateBuilder> {
  _$ReelsState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  PaginationStateDataBuilder<Reel>? _reels;
  PaginationStateDataBuilder<Reel> get reels =>
      _$this._reels ??= new PaginationStateDataBuilder<Reel>();
  set reels(PaginationStateDataBuilder<Reel>? reels) => _$this._reels = reels;

  ListBuilder<VideoPlayerController>? _videoControllers;
  ListBuilder<VideoPlayerController> get videoControllers =>
      _$this._videoControllers ??= new ListBuilder<VideoPlayerController>();
  set videoControllers(ListBuilder<VideoPlayerController>? videoControllers) =>
      _$this._videoControllers = videoControllers;

  ReelsStateBuilder();

  ReelsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _reels = $v.reels.toBuilder();
      _videoControllers = $v.videoControllers.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReelsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReelsState;
  }

  @override
  void update(void Function(ReelsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReelsState build() => _build();

  _$ReelsState _build() {
    _$ReelsState _$result;
    try {
      _$result = _$v ??
          new _$ReelsState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'ReelsState', 'isLoading'),
            reels: reels.build(),
            videoControllers: videoControllers.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'reels';
        reels.build();
        _$failedField = 'videoControllers';
        videoControllers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ReelsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
