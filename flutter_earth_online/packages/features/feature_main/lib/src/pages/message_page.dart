import 'package:flutter/material.dart';

/// 消息页
class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('消息'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildSystemMessages(),
          const Divider(height: 1),
          _buildChatList(),
        ],
      ),
    );
  }

  Widget _buildSystemMessages() {
    final systemItems = [
      {'icon': Icons.notifications_outlined, 'label': '通知', 'badge': 3, 'color': Colors.blue},
      {'icon': Icons.campaign_outlined, 'label': '公告', 'badge': 0, 'color': Colors.orange},
      {'icon': Icons.people_outline, 'label': '好友', 'badge': 5, 'color': Colors.green},
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: systemItems.map((item) {
          return Column(
            children: [
              Badge(
                isLabelVisible: (item['badge'] as int) > 0,
                label: Text('${item['badge']}'),
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: (item['color'] as Color).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    item['icon'] as IconData,
                    color: item['color'] as Color,
                    size: 28,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item['label'] as String,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildChatList() {
    return Column(
      children: List.generate(10, (index) {
        final hasUnread = index < 3;
        return ListTile(
          leading: Badge(
            isLabelVisible: hasUnread,
            label: Text('${index + 1}'),
            child: CircleAvatar(
              backgroundColor: Colors.primaries[index % Colors.primaries.length].shade100,
              child: Text(
                '用户${index + 1}'.substring(0, 1),
                style: TextStyle(
                  color: Colors.primaries[index % Colors.primaries.length],
                ),
              ),
            ),
          ),
          title: Text('用户 ${index + 1}'),
          subtitle: Text(
            '这是最近一条消息的内容预览...',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${10 + index}:${30 + index}',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 12,
                ),
              ),
              if (hasUnread)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Icon(
                    Icons.circle,
                    size: 8,
                    color: Colors.blue,
                  ),
                ),
            ],
          ),
          onTap: () {},
        );
      }),
    );
  }
}
