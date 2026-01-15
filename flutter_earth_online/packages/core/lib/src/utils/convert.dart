/// 转换工具类
///
/// 提供常用的数据转换方法
class Convert {
  Convert._();

  /// 阿里云 OSS 图片尺寸调整
  ///
  /// [url] 原始图片 URL
  /// [width] 目标宽度
  /// [maxHeight] 最大高度（可选，设置后会裁剪）
  ///
  /// 示例：
  /// ```dart
  /// Convert.aliImageResize(
  ///   'https://example.oss.com/image.jpg',
  ///   width: 300,
  ///   maxHeight: 200,
  /// );
  /// // 返回: https://example.oss.com/image.jpg?X-oss-process=image/resize,w_300,m_lfit/crop,h_200,g_center
  /// ```
  static String aliImageResize(
    String url, {
    double width = 300,
    double? maxHeight,
  }) {
    if (url.isEmpty) return url;

    final width0 = width.toInt();
    var crop = '';

    if (maxHeight != null) {
      final maxHeight0 = maxHeight.toInt();
      crop = '/crop,h_$maxHeight0,g_center';
    }

    return '$url?X-oss-process=image/resize,w_$width0,m_lfit$crop';
  }

  /// 七牛云图片尺寸调整
  ///
  /// [url] 原始图片 URL
  /// [width] 目标宽度
  /// [height] 目标高度（可选）
  /// [mode] 缩放模式 (0-5)
  static String qiniuImageResize(
    String url, {
    int? width,
    int? height,
    int mode = 2,
  }) {
    if (url.isEmpty) return url;

    final params = <String>[];
    if (width != null) params.add('w/$width');
    if (height != null) params.add('h/$height');

    if (params.isEmpty) return url;

    return '$url?imageView2/$mode/${params.join('/')}';
  }

  /// 腾讯云 COS 图片尺寸调整
  ///
  /// [url] 原始图片 URL
  /// [width] 目标宽度
  /// [height] 目标高度（可选）
  static String cosImageResize(
    String url, {
    int? width,
    int? height,
  }) {
    if (url.isEmpty) return url;

    final params = <String>[];
    if (width != null) params.add('w/$width');
    if (height != null) params.add('h/$height');

    if (params.isEmpty) return url;

    return '$url?imageMogr2/thumbnail/${params.join('/')}';
  }

  /// 字节转可读大小
  ///
  /// ```dart
  /// Convert.formatBytes(1024); // "1.0 KB"
  /// Convert.formatBytes(1048576); // "1.0 MB"
  /// ```
  static String formatBytes(int bytes, {int decimals = 1}) {
    if (bytes <= 0) return '0 B';

    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];
    var i = 0;
    var size = bytes.toDouble();

    while (size >= 1024 && i < suffixes.length - 1) {
      size /= 1024;
      i++;
    }

    return '${size.toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  /// 秒数转时间格式
  ///
  /// ```dart
  /// Convert.formatDuration(3661); // "1:01:01"
  /// Convert.formatDuration(61); // "1:01"
  /// ```
  static String formatDuration(int seconds) {
    if (seconds <= 0) return '0:00';

    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final secs = seconds % 60;

    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
    }
    return '$minutes:${secs.toString().padLeft(2, '0')}';
  }

  /// 数字转中文大写
  ///
  /// ```dart
  /// Convert.toChineseNumber(123.45); // "壹佰贰拾叁元肆角伍分"
  /// ```
  static String toChineseNumber(double number) {
    const cnNums = ['零', '壹', '贰', '叁', '肆', '伍', '陆', '柒', '捌', '玖'];
    const cnIntRadice = ['', '拾', '佰', '仟'];
    const cnIntUnits = ['', '万', '亿', '兆'];
    const cnDecUnits = ['角', '分', '毫', '厘'];
    const cnInteger = '整';
    const cnIntLast = '元';

    if (number == 0) return '零元$cnInteger';

    var integerNum = number.truncate();
    var decimalNum = ((number - integerNum) * 100).round();
    var chineseStr = '';

    // 整数部分
    if (integerNum > 0) {
      var zeroCount = 0;
      var intLen = integerNum.toString().length;

      for (var i = 0; i < intLen; i++) {
        var n = integerNum.toString()[i];
        var p = intLen - i - 1;
        var q = p ~/ 4;
        var m = p % 4;

        if (n == '0') {
          zeroCount++;
        } else {
          if (zeroCount > 0) chineseStr += cnNums[0];
          zeroCount = 0;
          chineseStr += cnNums[int.parse(n)] + cnIntRadice[m];
        }

        if (m == 0 && zeroCount < 4) {
          chineseStr += cnIntUnits[q];
        }
      }
      chineseStr += cnIntLast;
    }

    // 小数部分
    if (decimalNum > 0) {
      var decStr = decimalNum.toString().padLeft(2, '0');
      for (var i = 0; i < decStr.length && i < cnDecUnits.length; i++) {
        var n = int.parse(decStr[i]);
        if (n != 0) {
          chineseStr += cnNums[n] + cnDecUnits[i];
        }
      }
    } else {
      chineseStr += cnInteger;
    }

    return chineseStr;
  }

  /// 手机号脱敏
  ///
  /// ```dart
  /// Convert.maskPhone('13812345678'); // "138****5678"
  /// ```
  static String maskPhone(String phone) {
    if (phone.length != 11) return phone;
    return '${phone.substring(0, 3)}****${phone.substring(7)}';
  }

  /// 邮箱脱敏
  ///
  /// ```dart
  /// Convert.maskEmail('example@gmail.com'); // "exa***@gmail.com"
  /// ```
  static String maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;

    final name = parts[0];
    final domain = parts[1];

    if (name.length <= 3) {
      return '${name[0]}***@$domain';
    }
    return '${name.substring(0, 3)}***@$domain';
  }

  /// 身份证号脱敏
  ///
  /// ```dart
  /// Convert.maskIdCard('110101199001011234'); // "1101**********1234"
  /// ```
  static String maskIdCard(String idCard) {
    if (idCard.length < 8) return idCard;
    return '${idCard.substring(0, 4)}${'*' * (idCard.length - 8)}${idCard.substring(idCard.length - 4)}';
  }
}

/// 便捷别名
typedef AppConvert = Convert;
