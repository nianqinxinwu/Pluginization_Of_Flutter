import 'package:flutter/material.dart';
import '../../models/keyboard/input_state.dart';
import '../../models/keyboard/emoji_data.dart';
import 'text_input.dart';
import 'emoji_panel.dart';
import 'voice_recorder.dart';
import 'more_panel.dart';

/// IM 键盘输入组件
class IMKeyboard extends StatefulWidget {
  /// 发送文本消息回调
  final ValueChanged<String>? onSendText;

  /// 发送语音消息回调
  final void Function(String path, int duration)? onSendVoice;

  /// 发送图片回调
  final ValueChanged<List<String>>? onSendImages;

  /// 发送视频回调
  final ValueChanged<String>? onSendVideo;

  /// 发送文件回调
  final ValueChanged<String>? onSendFile;

  /// 发送位置回调
  final void Function(double lat, double lng, String address)? onSendLocation;

  /// @用户回调
  final VoidCallback? onMention;

  /// 输入变化回调
  final ValueChanged<String>? onTextChanged;

  /// 焦点变化回调
  final ValueChanged<bool>? onFocusChanged;

  /// 输入框提示文字
  final String hintText;

  /// 是否显示语音按钮
  final bool showVoiceButton;

  /// 是否显示表情按钮
  final bool showEmojiButton;

  /// 是否显示更多按钮
  final bool showMoreButton;

  /// 更多面板功能项
  final List<MorePanelItem>? morePanelItems;

  /// 自定义表情数据
  final List<EmojiCategory>? customEmojis;

  /// 输入框最大行数
  final int maxLines;

  /// 最大录音时长 (秒)
  final int maxRecordDuration;

  /// 输入框装饰
  final InputDecoration? inputDecoration;

  /// 工具栏背景色
  final Color? toolbarBackgroundColor;

  /// 面板背景色
  final Color? panelBackgroundColor;

  /// 输入框控制器
  final TextEditingController? controller;

  /// 焦点控制器
  final FocusNode? focusNode;

  /// 是否启用
  final bool enabled;

  const IMKeyboard({
    super.key,
    this.onSendText,
    this.onSendVoice,
    this.onSendImages,
    this.onSendVideo,
    this.onSendFile,
    this.onSendLocation,
    this.onMention,
    this.onTextChanged,
    this.onFocusChanged,
    this.hintText = '请输入消息...',
    this.showVoiceButton = true,
    this.showEmojiButton = true,
    this.showMoreButton = true,
    this.morePanelItems,
    this.customEmojis,
    this.maxLines = 4,
    this.maxRecordDuration = 60,
    this.inputDecoration,
    this.toolbarBackgroundColor,
    this.panelBackgroundColor,
    this.controller,
    this.focusNode,
    this.enabled = true,
  });

  /// 仅文字输入
  factory IMKeyboard.textOnly({
    Key? key,
    required ValueChanged<String> onSendText,
    ValueChanged<String>? onTextChanged,
    String hintText = '请输入消息...',
    int maxLines = 4,
    InputDecoration? inputDecoration,
    TextEditingController? controller,
    FocusNode? focusNode,
  }) {
    return IMKeyboard(
      key: key,
      onSendText: onSendText,
      onTextChanged: onTextChanged,
      hintText: hintText,
      showVoiceButton: false,
      showEmojiButton: false,
      showMoreButton: false,
      maxLines: maxLines,
      inputDecoration: inputDecoration,
      controller: controller,
      focusNode: focusNode,
    );
  }

  /// 完整功能键盘
  factory IMKeyboard.full({
    Key? key,
    required ValueChanged<String> onSendText,
    void Function(String path, int duration)? onSendVoice,
    ValueChanged<List<String>>? onSendImages,
    ValueChanged<String>? onSendVideo,
    ValueChanged<String>? onSendFile,
    void Function(double lat, double lng, String address)? onSendLocation,
    VoidCallback? onMention,
    List<MorePanelItem>? morePanelItems,
    List<EmojiCategory>? customEmojis,
    TextEditingController? controller,
    FocusNode? focusNode,
  }) {
    return IMKeyboard(
      key: key,
      onSendText: onSendText,
      onSendVoice: onSendVoice,
      onSendImages: onSendImages,
      onSendVideo: onSendVideo,
      onSendFile: onSendFile,
      onSendLocation: onSendLocation,
      onMention: onMention,
      morePanelItems: morePanelItems,
      customEmojis: customEmojis,
      controller: controller,
      focusNode: focusNode,
    );
  }

  @override
  State<IMKeyboard> createState() => _IMKeyboardState();
}

class _IMKeyboardState extends State<IMKeyboard> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  InputPanelType _panelType = InputPanelType.none;
  bool _isVoiceMode = false;
  double _keyboardHeight = 0;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();

    _focusNode.addListener(_onFocusChanged);
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChanged() {
    if (_focusNode.hasFocus) {
      setState(() {
        _panelType = InputPanelType.none;
      });
    }
    widget.onFocusChanged?.call(_focusNode.hasFocus);
  }

  void _onTextChanged() {
    widget.onTextChanged?.call(_controller.text);
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      widget.onSendText?.call(text);
      _controller.clear();
    }
  }

  void _toggleVoiceMode() {
    setState(() {
      _isVoiceMode = !_isVoiceMode;
      if (_isVoiceMode) {
        _focusNode.unfocus();
        _panelType = InputPanelType.voice;
      } else {
        _panelType = InputPanelType.none;
        _focusNode.requestFocus();
      }
    });
  }

  void _toggleEmojiPanel() {
    setState(() {
      if (_panelType == InputPanelType.emoji) {
        _panelType = InputPanelType.none;
        _focusNode.requestFocus();
      } else {
        _focusNode.unfocus();
        _panelType = InputPanelType.emoji;
        _isVoiceMode = false;
      }
    });
  }

  void _toggleMorePanel() {
    setState(() {
      if (_panelType == InputPanelType.more) {
        _panelType = InputPanelType.none;
        _focusNode.requestFocus();
      } else {
        _focusNode.unfocus();
        _panelType = InputPanelType.more;
        _isVoiceMode = false;
      }
    });
  }

  void _onEmojiSelected(EmojiItem emoji) {
    final text = _controller.text;
    final selection = _controller.selection;
    final newText = text.replaceRange(
      selection.start,
      selection.end,
      emoji.emoji,
    );
    _controller.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(
        offset: selection.start + emoji.emoji.length,
      ),
    );
  }

  void _onVoiceRecorded(String path, int duration) {
    widget.onSendVoice?.call(path, duration);
    setState(() {
      _isVoiceMode = false;
      _panelType = InputPanelType.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 监听键盘高度
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    if (bottomInset > 0 && bottomInset != _keyboardHeight) {
      _keyboardHeight = bottomInset;
    }

    final panelHeight = _keyboardHeight > 0 ? _keyboardHeight : 260.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 工具栏
        _buildToolbar(),

        // 面板区域
        _buildPanel(panelHeight),
      ],
    );
  }

  Widget _buildToolbar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: widget.toolbarBackgroundColor ?? const Color(0xFFF7F7F7),
        border: const Border(
          top: BorderSide(color: Color(0xFFE5E5E5), width: 0.5),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // 语音/键盘切换按钮
            if (widget.showVoiceButton)
              _ToolbarButton(
                icon: _isVoiceMode ? Icons.keyboard : Icons.mic,
                onTap: _toggleVoiceMode,
              ),

            const SizedBox(width: 8),

            // 输入区域
            Expanded(
              child: _isVoiceMode
                  ? VoiceRecorderButton(
                      onRecorded: _onVoiceRecorded,
                      maxDuration: widget.maxRecordDuration,
                    )
                  : IMTextInput(
                      controller: _controller,
                      focusNode: _focusNode,
                      hintText: widget.hintText,
                      maxLines: widget.maxLines,
                      decoration: widget.inputDecoration,
                      enabled: widget.enabled,
                      onSubmitted: (_) => _sendMessage(),
                    ),
            ),

            const SizedBox(width: 8),

            // 表情按钮
            if (widget.showEmojiButton)
              _ToolbarButton(
                icon: _panelType == InputPanelType.emoji
                    ? Icons.keyboard
                    : Icons.emoji_emotions_outlined,
                onTap: _toggleEmojiPanel,
              ),

            const SizedBox(width: 8),

            // 更多/发送按钮
            if (_controller.text.trim().isNotEmpty)
              _SendButton(onTap: _sendMessage)
            else if (widget.showMoreButton)
              _ToolbarButton(
                icon: Icons.add_circle_outline,
                onTap: _toggleMorePanel,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPanel(double height) {
    if (_panelType == InputPanelType.none) {
      return const SizedBox.shrink();
    }

    return Container(
      height: height,
      color: widget.panelBackgroundColor ?? const Color(0xFFF7F7F7),
      child: _buildPanelContent(),
    );
  }

  Widget _buildPanelContent() {
    switch (_panelType) {
      case InputPanelType.emoji:
        return EmojiPanel(
          categories: widget.customEmojis ?? EmojiCategory.defaultCategories(),
          onEmojiSelected: _onEmojiSelected,
          onDeleteTap: () {
            if (_controller.text.isNotEmpty) {
              final text = _controller.text;
              final selection = _controller.selection;
              if (selection.start > 0) {
                final newText = text.replaceRange(
                  selection.start - 1,
                  selection.end,
                  '',
                );
                _controller.value = TextEditingValue(
                  text: newText,
                  selection: TextSelection.collapsed(
                    offset: selection.start - 1,
                  ),
                );
              }
            }
          },
        );

      case InputPanelType.more:
        return MorePanel(
          items: widget.morePanelItems ?? _defaultMoreItems(),
        );

      default:
        return const SizedBox.shrink();
    }
  }

  List<MorePanelItem> _defaultMoreItems() {
    return [
      if (widget.onSendImages != null)
        MorePanelItem.album(
          onTap: () {
            // TODO: 实现相册选择
          },
        ),
      if (widget.onSendImages != null)
        MorePanelItem.camera(
          onTap: () {
            // TODO: 实现拍照
          },
        ),
      if (widget.onSendVideo != null)
        MorePanelItem.video(
          onTap: () {
            // TODO: 实现视频
          },
        ),
      if (widget.onSendFile != null)
        MorePanelItem.file(
          onTap: () {
            // TODO: 实现文件选择
          },
        ),
      if (widget.onSendLocation != null)
        MorePanelItem.location(
          onTap: () {
            // TODO: 实现位置选择
          },
        ),
    ];
  }
}

/// 工具栏按钮
class _ToolbarButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ToolbarButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 24,
          color: const Color(0xFF666666),
        ),
      ),
    );
  }
}

/// 发送按钮
class _SendButton extends StatelessWidget {
  final VoidCallback onTap;

  const _SendButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF07C160),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Text(
          '发送',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
