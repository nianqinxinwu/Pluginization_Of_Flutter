import 'package:flutter/material.dart';

/// 更多功能面板
class MorePanel extends StatelessWidget {
  /// 功能项列表
  final List<MorePanelItem> items;

  /// 每行数量
  final int crossAxisCount;

  /// 背景颜色
  final Color? backgroundColor;

  const MorePanel({
    super.key,
    required this.items,
    this.crossAxisCount = 4,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? const Color(0xFFF7F7F7),
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _MorePanelItemWidget(item: items[index]);
        },
      ),
    );
  }
}

/// 更多面板功能项
class MorePanelItem {
  final String id;
  final String label;
  final IconData icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final VoidCallback onTap;

  const MorePanelItem({
    required this.id,
    required this.label,
    required this.icon,
    this.iconColor,
    this.backgroundColor,
    required this.onTap,
  });

  /// 相册
  factory MorePanelItem.album({required VoidCallback onTap}) {
    return MorePanelItem(
      id: 'album',
      label: '相册',
      icon: Icons.photo_library,
      onTap: onTap,
    );
  }

  /// 拍照
  factory MorePanelItem.camera({required VoidCallback onTap}) {
    return MorePanelItem(
      id: 'camera',
      label: '拍照',
      icon: Icons.camera_alt,
      onTap: onTap,
    );
  }

  /// 视频
  factory MorePanelItem.video({required VoidCallback onTap}) {
    return MorePanelItem(
      id: 'video',
      label: '视频',
      icon: Icons.videocam,
      onTap: onTap,
    );
  }

  /// 文件
  factory MorePanelItem.file({required VoidCallback onTap}) {
    return MorePanelItem(
      id: 'file',
      label: '文件',
      icon: Icons.insert_drive_file,
      onTap: onTap,
    );
  }

  /// 位置
  factory MorePanelItem.location({required VoidCallback onTap}) {
    return MorePanelItem(
      id: 'location',
      label: '位置',
      icon: Icons.location_on,
      onTap: onTap,
    );
  }

  /// 名片
  factory MorePanelItem.card({required VoidCallback onTap}) {
    return MorePanelItem(
      id: 'card',
      label: '名片',
      icon: Icons.person,
      onTap: onTap,
    );
  }

  /// 红包
  factory MorePanelItem.redPacket({required VoidCallback onTap}) {
    return MorePanelItem(
      id: 'redPacket',
      label: '红包',
      icon: Icons.card_giftcard,
      iconColor: Colors.red,
      onTap: onTap,
    );
  }

  /// 转账
  factory MorePanelItem.transfer({required VoidCallback onTap}) {
    return MorePanelItem(
      id: 'transfer',
      label: '转账',
      icon: Icons.monetization_on,
      iconColor: Colors.orange,
      onTap: onTap,
    );
  }

  /// 语音通话
  factory MorePanelItem.voiceCall({required VoidCallback onTap}) {
    return MorePanelItem(
      id: 'voiceCall',
      label: '语音通话',
      icon: Icons.phone,
      iconColor: Colors.green,
      onTap: onTap,
    );
  }

  /// 视频通话
  factory MorePanelItem.videoCall({required VoidCallback onTap}) {
    return MorePanelItem(
      id: 'videoCall',
      label: '视频通话',
      icon: Icons.videocam,
      iconColor: Colors.blue,
      onTap: onTap,
    );
  }
}

/// 更多面板功能项组件
class _MorePanelItemWidget extends StatelessWidget {
  final MorePanelItem item;

  const _MorePanelItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: item.backgroundColor ?? Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              item.icon,
              size: 28,
              color: item.iconColor ?? const Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF666666),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
