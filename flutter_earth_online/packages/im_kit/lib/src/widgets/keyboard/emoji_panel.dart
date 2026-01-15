import 'package:flutter/material.dart';
import '../../models/keyboard/emoji_data.dart';

/// 表情面板
class EmojiPanel extends StatefulWidget {
  /// 表情分类列表
  final List<EmojiCategory> categories;

  /// 选中表情回调
  final ValueChanged<EmojiItem> onEmojiSelected;

  /// 删除回调
  final VoidCallback? onDeleteTap;

  /// 发送回调
  final VoidCallback? onSendTap;

  /// 是否显示删除按钮
  final bool showDeleteButton;

  /// 是否显示发送按钮
  final bool showSendButton;

  /// 每行表情数量
  final int crossAxisCount;

  /// 背景颜色
  final Color? backgroundColor;

  const EmojiPanel({
    super.key,
    required this.categories,
    required this.onEmojiSelected,
    this.onDeleteTap,
    this.onSendTap,
    this.showDeleteButton = true,
    this.showSendButton = false,
    this.crossAxisCount = 8,
    this.backgroundColor,
  });

  @override
  State<EmojiPanel> createState() => _EmojiPanelState();
}

class _EmojiPanelState extends State<EmojiPanel> {
  int _selectedCategoryIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onCategorySelected(int index) {
    setState(() {
      _selectedCategoryIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor ?? const Color(0xFFF7F7F7),
      child: Column(
        children: [
          // 表情内容区域
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.categories.length,
              onPageChanged: (index) {
                setState(() {
                  _selectedCategoryIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return _buildEmojiGrid(widget.categories[index]);
              },
            ),
          ),

          // 底部分类栏
          _buildCategoryBar(),
        ],
      ),
    );
  }

  Widget _buildEmojiGrid(EmojiCategory category) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemCount: category.emojis.length,
      itemBuilder: (context, index) {
        final emoji = category.emojis[index];
        return _EmojiItem(
          emoji: emoji,
          onTap: () => widget.onEmojiSelected(emoji),
        );
      },
    );
  }

  Widget _buildCategoryBar() {
    return Container(
      height: 44,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFE5E5E5), width: 0.5),
        ),
      ),
      child: Row(
        children: [
          // 分类标签
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.categories.length,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context, index) {
                final category = widget.categories[index];
                final isSelected = index == _selectedCategoryIndex;
                return GestureDetector(
                  onTap: () => _onCategorySelected(index),
                  child: Container(
                    width: 44,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFE8E8E8)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 2,
                      vertical: 6,
                    ),
                    child: Text(
                      category.icon,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
            ),
          ),

          // 删除按钮
          if (widget.showDeleteButton)
            GestureDetector(
              onTap: widget.onDeleteTap,
              child: Container(
                width: 48,
                height: 44,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Color(0xFFE5E5E5), width: 0.5),
                  ),
                ),
                child: const Icon(
                  Icons.backspace_outlined,
                  size: 22,
                  color: Color(0xFF666666),
                ),
              ),
            ),

          // 发送按钮
          if (widget.showSendButton)
            GestureDetector(
              onTap: widget.onSendTap,
              child: Container(
                width: 56,
                height: 44,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color(0xFF07C160),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                  ),
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
            ),
        ],
      ),
    );
  }
}

/// 单个表情项
class _EmojiItem extends StatelessWidget {
  final EmojiItem emoji;
  final VoidCallback onTap;

  const _EmojiItem({
    required this.emoji,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: emoji.isImageEmoji
            ? Image.network(
                emoji.imageUrl!,
                width: 28,
                height: 28,
                fit: BoxFit.contain,
              )
            : Text(
                emoji.emoji,
                style: const TextStyle(fontSize: 26),
              ),
      ),
    );
  }
}
