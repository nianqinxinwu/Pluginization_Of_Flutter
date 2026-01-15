import 'package:flutter/services.dart';

/// Channel Manager - 统一管理原生端 Channel
/// 负责 channel 的创建、释放、消息订阅等功能
class ChannelManager {
  ChannelManager._();

  static ChannelManager? _instance;
  final Map<String, MethodChannel> _methodChannels = {};
  final Map<String, EventChannel> _eventChannels = {};
  final Map<String, BasicMessageChannel> _messageChannels = {};

  static ChannelManager get instance {
    _instance ??= ChannelManager._();
    return _instance!;
  }

  /// 创建 MethodChannel
  MethodChannel createMethodChannel(String name) {
    if (_methodChannels.containsKey(name)) {
      return _methodChannels[name]!;
    }
    final channel = MethodChannel(name);
    _methodChannels[name] = channel;
    return channel;
  }

  /// 创建 EventChannel
  EventChannel createEventChannel(String name) {
    if (_eventChannels.containsKey(name)) {
      return _eventChannels[name]!;
    }
    final channel = EventChannel(name);
    _eventChannels[name] = channel;
    return channel;
  }

  /// 创建 BasicMessageChannel
  BasicMessageChannel<dynamic> createMessageChannel(
    String name,
    MessageCodec<dynamic> codec,
  ) {
    if (_messageChannels.containsKey(name)) {
      return _messageChannels[name]!;
    }
    final channel = BasicMessageChannel<dynamic>(name, codec);
    _messageChannels[name] = channel;
    return channel;
  }

  /// 释放 MethodChannel
  void disposeMethodChannel(String name) {
    _methodChannels.remove(name);
  }

  /// 释放 EventChannel
  void disposeEventChannel(String name) {
    _eventChannels.remove(name);
  }

  /// 释放 BasicMessageChannel
  void disposeMessageChannel(String name) {
    _messageChannels.remove(name);
  }

  /// 释放所有 Channel
  void disposeAll() {
    _methodChannels.clear();
    _eventChannels.clear();
    _messageChannels.clear();
  }

  // TODO: Add message subscription methods
}
