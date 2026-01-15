// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$InputState {
  // 文本内容
  String get text => throw _privateConstructorUsedError; // 当前面板类型
  InputPanelType get panelType => throw _privateConstructorUsedError; // 键盘是否显示
  bool get isKeyboardVisible => throw _privateConstructorUsedError; // 键盘高度
  double get keyboardHeight =>
      throw _privateConstructorUsedError; // 面板高度 (表情/更多面板)
  double get panelHeight => throw _privateConstructorUsedError; // 录音状态
  RecordingState get recordingState =>
      throw _privateConstructorUsedError; // 录音时长 (秒)
  int get recordingDuration => throw _privateConstructorUsedError; // 录音分贝
  double get recordingDecibel => throw _privateConstructorUsedError; // 草稿
  String? get draft => throw _privateConstructorUsedError; // @提及的用户列表
  List<String> get mentionedUsers =>
      throw _privateConstructorUsedError; // 回复的消息ID
  String? get replyMessageId => throw _privateConstructorUsedError; // 回复的消息内容预览
  String? get replyMessagePreview =>
      throw _privateConstructorUsedError; // 是否正在编辑消息
  bool get isEditing => throw _privateConstructorUsedError; // 正在编辑的消息ID
  String? get editingMessageId => throw _privateConstructorUsedError;

  /// Create a copy of InputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InputStateCopyWith<InputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputStateCopyWith<$Res> {
  factory $InputStateCopyWith(
    InputState value,
    $Res Function(InputState) then,
  ) = _$InputStateCopyWithImpl<$Res, InputState>;
  @useResult
  $Res call({
    String text,
    InputPanelType panelType,
    bool isKeyboardVisible,
    double keyboardHeight,
    double panelHeight,
    RecordingState recordingState,
    int recordingDuration,
    double recordingDecibel,
    String? draft,
    List<String> mentionedUsers,
    String? replyMessageId,
    String? replyMessagePreview,
    bool isEditing,
    String? editingMessageId,
  });
}

/// @nodoc
class _$InputStateCopyWithImpl<$Res, $Val extends InputState>
    implements $InputStateCopyWith<$Res> {
  _$InputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? panelType = null,
    Object? isKeyboardVisible = null,
    Object? keyboardHeight = null,
    Object? panelHeight = null,
    Object? recordingState = null,
    Object? recordingDuration = null,
    Object? recordingDecibel = null,
    Object? draft = freezed,
    Object? mentionedUsers = null,
    Object? replyMessageId = freezed,
    Object? replyMessagePreview = freezed,
    Object? isEditing = null,
    Object? editingMessageId = freezed,
  }) {
    return _then(
      _value.copyWith(
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            panelType: null == panelType
                ? _value.panelType
                : panelType // ignore: cast_nullable_to_non_nullable
                      as InputPanelType,
            isKeyboardVisible: null == isKeyboardVisible
                ? _value.isKeyboardVisible
                : isKeyboardVisible // ignore: cast_nullable_to_non_nullable
                      as bool,
            keyboardHeight: null == keyboardHeight
                ? _value.keyboardHeight
                : keyboardHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            panelHeight: null == panelHeight
                ? _value.panelHeight
                : panelHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            recordingState: null == recordingState
                ? _value.recordingState
                : recordingState // ignore: cast_nullable_to_non_nullable
                      as RecordingState,
            recordingDuration: null == recordingDuration
                ? _value.recordingDuration
                : recordingDuration // ignore: cast_nullable_to_non_nullable
                      as int,
            recordingDecibel: null == recordingDecibel
                ? _value.recordingDecibel
                : recordingDecibel // ignore: cast_nullable_to_non_nullable
                      as double,
            draft: freezed == draft
                ? _value.draft
                : draft // ignore: cast_nullable_to_non_nullable
                      as String?,
            mentionedUsers: null == mentionedUsers
                ? _value.mentionedUsers
                : mentionedUsers // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            replyMessageId: freezed == replyMessageId
                ? _value.replyMessageId
                : replyMessageId // ignore: cast_nullable_to_non_nullable
                      as String?,
            replyMessagePreview: freezed == replyMessagePreview
                ? _value.replyMessagePreview
                : replyMessagePreview // ignore: cast_nullable_to_non_nullable
                      as String?,
            isEditing: null == isEditing
                ? _value.isEditing
                : isEditing // ignore: cast_nullable_to_non_nullable
                      as bool,
            editingMessageId: freezed == editingMessageId
                ? _value.editingMessageId
                : editingMessageId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InputStateImplCopyWith<$Res>
    implements $InputStateCopyWith<$Res> {
  factory _$$InputStateImplCopyWith(
    _$InputStateImpl value,
    $Res Function(_$InputStateImpl) then,
  ) = __$$InputStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String text,
    InputPanelType panelType,
    bool isKeyboardVisible,
    double keyboardHeight,
    double panelHeight,
    RecordingState recordingState,
    int recordingDuration,
    double recordingDecibel,
    String? draft,
    List<String> mentionedUsers,
    String? replyMessageId,
    String? replyMessagePreview,
    bool isEditing,
    String? editingMessageId,
  });
}

/// @nodoc
class __$$InputStateImplCopyWithImpl<$Res>
    extends _$InputStateCopyWithImpl<$Res, _$InputStateImpl>
    implements _$$InputStateImplCopyWith<$Res> {
  __$$InputStateImplCopyWithImpl(
    _$InputStateImpl _value,
    $Res Function(_$InputStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? panelType = null,
    Object? isKeyboardVisible = null,
    Object? keyboardHeight = null,
    Object? panelHeight = null,
    Object? recordingState = null,
    Object? recordingDuration = null,
    Object? recordingDecibel = null,
    Object? draft = freezed,
    Object? mentionedUsers = null,
    Object? replyMessageId = freezed,
    Object? replyMessagePreview = freezed,
    Object? isEditing = null,
    Object? editingMessageId = freezed,
  }) {
    return _then(
      _$InputStateImpl(
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        panelType: null == panelType
            ? _value.panelType
            : panelType // ignore: cast_nullable_to_non_nullable
                  as InputPanelType,
        isKeyboardVisible: null == isKeyboardVisible
            ? _value.isKeyboardVisible
            : isKeyboardVisible // ignore: cast_nullable_to_non_nullable
                  as bool,
        keyboardHeight: null == keyboardHeight
            ? _value.keyboardHeight
            : keyboardHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        panelHeight: null == panelHeight
            ? _value.panelHeight
            : panelHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        recordingState: null == recordingState
            ? _value.recordingState
            : recordingState // ignore: cast_nullable_to_non_nullable
                  as RecordingState,
        recordingDuration: null == recordingDuration
            ? _value.recordingDuration
            : recordingDuration // ignore: cast_nullable_to_non_nullable
                  as int,
        recordingDecibel: null == recordingDecibel
            ? _value.recordingDecibel
            : recordingDecibel // ignore: cast_nullable_to_non_nullable
                  as double,
        draft: freezed == draft
            ? _value.draft
            : draft // ignore: cast_nullable_to_non_nullable
                  as String?,
        mentionedUsers: null == mentionedUsers
            ? _value._mentionedUsers
            : mentionedUsers // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        replyMessageId: freezed == replyMessageId
            ? _value.replyMessageId
            : replyMessageId // ignore: cast_nullable_to_non_nullable
                  as String?,
        replyMessagePreview: freezed == replyMessagePreview
            ? _value.replyMessagePreview
            : replyMessagePreview // ignore: cast_nullable_to_non_nullable
                  as String?,
        isEditing: null == isEditing
            ? _value.isEditing
            : isEditing // ignore: cast_nullable_to_non_nullable
                  as bool,
        editingMessageId: freezed == editingMessageId
            ? _value.editingMessageId
            : editingMessageId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$InputStateImpl extends _InputState {
  const _$InputStateImpl({
    this.text = '',
    this.panelType = InputPanelType.none,
    this.isKeyboardVisible = false,
    this.keyboardHeight = 0.0,
    this.panelHeight = 260.0,
    this.recordingState = RecordingState.idle,
    this.recordingDuration = 0,
    this.recordingDecibel = 0.0,
    this.draft,
    final List<String> mentionedUsers = const [],
    this.replyMessageId,
    this.replyMessagePreview,
    this.isEditing = false,
    this.editingMessageId,
  }) : _mentionedUsers = mentionedUsers,
       super._();

  // 文本内容
  @override
  @JsonKey()
  final String text;
  // 当前面板类型
  @override
  @JsonKey()
  final InputPanelType panelType;
  // 键盘是否显示
  @override
  @JsonKey()
  final bool isKeyboardVisible;
  // 键盘高度
  @override
  @JsonKey()
  final double keyboardHeight;
  // 面板高度 (表情/更多面板)
  @override
  @JsonKey()
  final double panelHeight;
  // 录音状态
  @override
  @JsonKey()
  final RecordingState recordingState;
  // 录音时长 (秒)
  @override
  @JsonKey()
  final int recordingDuration;
  // 录音分贝
  @override
  @JsonKey()
  final double recordingDecibel;
  // 草稿
  @override
  final String? draft;
  // @提及的用户列表
  final List<String> _mentionedUsers;
  // @提及的用户列表
  @override
  @JsonKey()
  List<String> get mentionedUsers {
    if (_mentionedUsers is EqualUnmodifiableListView) return _mentionedUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mentionedUsers);
  }

  // 回复的消息ID
  @override
  final String? replyMessageId;
  // 回复的消息内容预览
  @override
  final String? replyMessagePreview;
  // 是否正在编辑消息
  @override
  @JsonKey()
  final bool isEditing;
  // 正在编辑的消息ID
  @override
  final String? editingMessageId;

  @override
  String toString() {
    return 'InputState(text: $text, panelType: $panelType, isKeyboardVisible: $isKeyboardVisible, keyboardHeight: $keyboardHeight, panelHeight: $panelHeight, recordingState: $recordingState, recordingDuration: $recordingDuration, recordingDecibel: $recordingDecibel, draft: $draft, mentionedUsers: $mentionedUsers, replyMessageId: $replyMessageId, replyMessagePreview: $replyMessagePreview, isEditing: $isEditing, editingMessageId: $editingMessageId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputStateImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.panelType, panelType) ||
                other.panelType == panelType) &&
            (identical(other.isKeyboardVisible, isKeyboardVisible) ||
                other.isKeyboardVisible == isKeyboardVisible) &&
            (identical(other.keyboardHeight, keyboardHeight) ||
                other.keyboardHeight == keyboardHeight) &&
            (identical(other.panelHeight, panelHeight) ||
                other.panelHeight == panelHeight) &&
            (identical(other.recordingState, recordingState) ||
                other.recordingState == recordingState) &&
            (identical(other.recordingDuration, recordingDuration) ||
                other.recordingDuration == recordingDuration) &&
            (identical(other.recordingDecibel, recordingDecibel) ||
                other.recordingDecibel == recordingDecibel) &&
            (identical(other.draft, draft) || other.draft == draft) &&
            const DeepCollectionEquality().equals(
              other._mentionedUsers,
              _mentionedUsers,
            ) &&
            (identical(other.replyMessageId, replyMessageId) ||
                other.replyMessageId == replyMessageId) &&
            (identical(other.replyMessagePreview, replyMessagePreview) ||
                other.replyMessagePreview == replyMessagePreview) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing) &&
            (identical(other.editingMessageId, editingMessageId) ||
                other.editingMessageId == editingMessageId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    text,
    panelType,
    isKeyboardVisible,
    keyboardHeight,
    panelHeight,
    recordingState,
    recordingDuration,
    recordingDecibel,
    draft,
    const DeepCollectionEquality().hash(_mentionedUsers),
    replyMessageId,
    replyMessagePreview,
    isEditing,
    editingMessageId,
  );

  /// Create a copy of InputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InputStateImplCopyWith<_$InputStateImpl> get copyWith =>
      __$$InputStateImplCopyWithImpl<_$InputStateImpl>(this, _$identity);
}

abstract class _InputState extends InputState {
  const factory _InputState({
    final String text,
    final InputPanelType panelType,
    final bool isKeyboardVisible,
    final double keyboardHeight,
    final double panelHeight,
    final RecordingState recordingState,
    final int recordingDuration,
    final double recordingDecibel,
    final String? draft,
    final List<String> mentionedUsers,
    final String? replyMessageId,
    final String? replyMessagePreview,
    final bool isEditing,
    final String? editingMessageId,
  }) = _$InputStateImpl;
  const _InputState._() : super._();

  // 文本内容
  @override
  String get text; // 当前面板类型
  @override
  InputPanelType get panelType; // 键盘是否显示
  @override
  bool get isKeyboardVisible; // 键盘高度
  @override
  double get keyboardHeight; // 面板高度 (表情/更多面板)
  @override
  double get panelHeight; // 录音状态
  @override
  RecordingState get recordingState; // 录音时长 (秒)
  @override
  int get recordingDuration; // 录音分贝
  @override
  double get recordingDecibel; // 草稿
  @override
  String? get draft; // @提及的用户列表
  @override
  List<String> get mentionedUsers; // 回复的消息ID
  @override
  String? get replyMessageId; // 回复的消息内容预览
  @override
  String? get replyMessagePreview; // 是否正在编辑消息
  @override
  bool get isEditing; // 正在编辑的消息ID
  @override
  String? get editingMessageId;

  /// Create a copy of InputState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InputStateImplCopyWith<_$InputStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MessageListState {
  // 是否正在加载
  bool get isLoading => throw _privateConstructorUsedError; // 是否正在加载更多
  bool get isLoadingMore => throw _privateConstructorUsedError; // 是否有更多数据
  bool get hasMore => throw _privateConstructorUsedError; // 错误信息
  String? get error => throw _privateConstructorUsedError; // 是否滚动到底部
  bool get isAtBottom => throw _privateConstructorUsedError; // 新消息数量 (未读)
  int get newMessageCount => throw _privateConstructorUsedError;

  /// Create a copy of MessageListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageListStateCopyWith<MessageListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageListStateCopyWith<$Res> {
  factory $MessageListStateCopyWith(
    MessageListState value,
    $Res Function(MessageListState) then,
  ) = _$MessageListStateCopyWithImpl<$Res, MessageListState>;
  @useResult
  $Res call({
    bool isLoading,
    bool isLoadingMore,
    bool hasMore,
    String? error,
    bool isAtBottom,
    int newMessageCount,
  });
}

/// @nodoc
class _$MessageListStateCopyWithImpl<$Res, $Val extends MessageListState>
    implements $MessageListStateCopyWith<$Res> {
  _$MessageListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? hasMore = null,
    Object? error = freezed,
    Object? isAtBottom = null,
    Object? newMessageCount = null,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isLoadingMore: null == isLoadingMore
                ? _value.isLoadingMore
                : isLoadingMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasMore: null == hasMore
                ? _value.hasMore
                : hasMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            isAtBottom: null == isAtBottom
                ? _value.isAtBottom
                : isAtBottom // ignore: cast_nullable_to_non_nullable
                      as bool,
            newMessageCount: null == newMessageCount
                ? _value.newMessageCount
                : newMessageCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MessageListStateImplCopyWith<$Res>
    implements $MessageListStateCopyWith<$Res> {
  factory _$$MessageListStateImplCopyWith(
    _$MessageListStateImpl value,
    $Res Function(_$MessageListStateImpl) then,
  ) = __$$MessageListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    bool isLoadingMore,
    bool hasMore,
    String? error,
    bool isAtBottom,
    int newMessageCount,
  });
}

/// @nodoc
class __$$MessageListStateImplCopyWithImpl<$Res>
    extends _$MessageListStateCopyWithImpl<$Res, _$MessageListStateImpl>
    implements _$$MessageListStateImplCopyWith<$Res> {
  __$$MessageListStateImplCopyWithImpl(
    _$MessageListStateImpl _value,
    $Res Function(_$MessageListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MessageListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? hasMore = null,
    Object? error = freezed,
    Object? isAtBottom = null,
    Object? newMessageCount = null,
  }) {
    return _then(
      _$MessageListStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isLoadingMore: null == isLoadingMore
            ? _value.isLoadingMore
            : isLoadingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasMore: null == hasMore
            ? _value.hasMore
            : hasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        isAtBottom: null == isAtBottom
            ? _value.isAtBottom
            : isAtBottom // ignore: cast_nullable_to_non_nullable
                  as bool,
        newMessageCount: null == newMessageCount
            ? _value.newMessageCount
            : newMessageCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$MessageListStateImpl extends _MessageListState {
  const _$MessageListStateImpl({
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasMore = true,
    this.error,
    this.isAtBottom = true,
    this.newMessageCount = 0,
  }) : super._();

  // 是否正在加载
  @override
  @JsonKey()
  final bool isLoading;
  // 是否正在加载更多
  @override
  @JsonKey()
  final bool isLoadingMore;
  // 是否有更多数据
  @override
  @JsonKey()
  final bool hasMore;
  // 错误信息
  @override
  final String? error;
  // 是否滚动到底部
  @override
  @JsonKey()
  final bool isAtBottom;
  // 新消息数量 (未读)
  @override
  @JsonKey()
  final int newMessageCount;

  @override
  String toString() {
    return 'MessageListState(isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, error: $error, isAtBottom: $isAtBottom, newMessageCount: $newMessageCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageListStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isAtBottom, isAtBottom) ||
                other.isAtBottom == isAtBottom) &&
            (identical(other.newMessageCount, newMessageCount) ||
                other.newMessageCount == newMessageCount));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    isLoadingMore,
    hasMore,
    error,
    isAtBottom,
    newMessageCount,
  );

  /// Create a copy of MessageListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageListStateImplCopyWith<_$MessageListStateImpl> get copyWith =>
      __$$MessageListStateImplCopyWithImpl<_$MessageListStateImpl>(
        this,
        _$identity,
      );
}

abstract class _MessageListState extends MessageListState {
  const factory _MessageListState({
    final bool isLoading,
    final bool isLoadingMore,
    final bool hasMore,
    final String? error,
    final bool isAtBottom,
    final int newMessageCount,
  }) = _$MessageListStateImpl;
  const _MessageListState._() : super._();

  // 是否正在加载
  @override
  bool get isLoading; // 是否正在加载更多
  @override
  bool get isLoadingMore; // 是否有更多数据
  @override
  bool get hasMore; // 错误信息
  @override
  String? get error; // 是否滚动到底部
  @override
  bool get isAtBottom; // 新消息数量 (未读)
  @override
  int get newMessageCount;

  /// Create a copy of MessageListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageListStateImplCopyWith<_$MessageListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
