import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

/// 分段加密配置
class ChunkedEncryptConfig {
  const ChunkedEncryptConfig({
    this.chunkSize = 1024 * 100, // 默认 100KB 每段
    this.separator = '|CHUNK|',
  });

  /// 每段最大字节数
  final int chunkSize;

  /// 分段分隔符
  final String separator;

  /// 默认配置
  static const ChunkedEncryptConfig defaultConfig = ChunkedEncryptConfig();
}

/// 加密解密工具类
///
/// 提供常用的加密解密方法，包括：
/// - 哈希：MD5, SHA1, SHA256
/// - 编码：Base64, Base64Url
/// - 对称加密：AES (CBC/CTR 模式)
/// - 分段加密：支持大数据分段加密
///
/// AES 加密配置：
/// - 默认密钥长度：32 字节（AES-256）
/// - 默认 IV 长度：16 字节
/// - 默认模式：CBC
/// - 默认填充：PKCS7
class EncryptUtil {
  EncryptUtil._();

  // ==================== 默认密钥配置 ====================
  // 注意：生产环境应从安全存储或服务端获取密钥

  /// 默认 AES 密钥（32 字节 = AES-256）
  static const String _defaultAesKey = 'YourSecretKey32BytesLongHere!!!';

  /// 默认 AES IV（16 字节）
  static const String _defaultAesIv = 'YourIV16BytesOK!';

  // ==================== 哈希算法 ====================

  /// MD5 加密
  ///
  /// ```dart
  /// EncryptUtil.md5Encode('password'); // 返回 32 位小写 MD5
  /// ```
  static String md5Encode(String content) {
    final bytes = utf8.encode(content);
    final digest = md5.convert(bytes);
    return digest.toString();
  }

  /// SHA1 加密
  static String sha1Encode(String content) {
    final bytes = utf8.encode(content);
    final digest = sha1.convert(bytes);
    return digest.toString();
  }

  /// SHA256 加密
  static String sha256Encode(String content) {
    final bytes = utf8.encode(content);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// HMAC-SHA256 签名
  ///
  /// [content] 待签名内容
  /// [secret] 密钥
  static String hmacSha256(String content, String secret) {
    final key = utf8.encode(secret);
    final bytes = utf8.encode(content);
    final hmacSha256 = Hmac(sha256, key);
    final digest = hmacSha256.convert(bytes);
    return digest.toString();
  }

  // ==================== Base64 编解码 ====================

  /// Base64 编码
  static String base64Encode(String content) {
    final bytes = utf8.encode(content);
    return base64.encode(bytes);
  }

  /// Base64 解码
  static String base64Decode(String encoded) {
    final bytes = base64.decode(encoded);
    return utf8.decode(bytes);
  }

  /// URL 安全的 Base64 编码
  static String base64UrlEncode(String content) {
    final bytes = utf8.encode(content);
    return base64Url.encode(bytes);
  }

  /// URL 安全的 Base64 解码
  static String base64UrlDecode(String encoded) {
    final bytes = base64Url.decode(encoded);
    return utf8.decode(bytes);
  }

  // ==================== AES 加密（CBC 模式） ====================

  /// AES CBC 加密
  ///
  /// [plainText] 明文
  /// [key] 密钥（32 字节），为空则使用默认密钥
  /// [iv] 初始化向量（16 字节），为空则使用默认 IV
  ///
  /// 返回 Base64 编码的密文
  static String aesEncrypt(
    String plainText, {
    String? key,
    String? iv,
  }) {
    final encrypter = _createAesEncrypter(key);
    final ivObj = encrypt.IV.fromUtf8(iv ?? _defaultAesIv);
    final encrypted = encrypter.encrypt(plainText, iv: ivObj);
    return encrypted.base64;
  }

  /// AES CBC 解密
  ///
  /// [encryptedText] Base64 编码的密文
  /// [key] 密钥（32 字节），为空则使用默认密钥
  /// [iv] 初始化向量（16 字节），为空则使用默认 IV
  ///
  /// 返回明文
  static String aesDecrypt(
    String encryptedText, {
    String? key,
    String? iv,
  }) {
    final encrypter = _createAesEncrypter(key);
    final ivObj = encrypt.IV.fromUtf8(iv ?? _defaultAesIv);
    final encrypted = encrypt.Encrypted.fromBase64(encryptedText);
    return encrypter.decrypt(encrypted, iv: ivObj);
  }

  /// AES 加密（字节数组）
  static Uint8List aesEncryptBytes(
    Uint8List data, {
    String? key,
    String? iv,
  }) {
    final encrypter = _createAesEncrypter(key);
    final ivObj = encrypt.IV.fromUtf8(iv ?? _defaultAesIv);
    final encrypted = encrypter.encryptBytes(data, iv: ivObj);
    return encrypted.bytes;
  }

  /// AES 解密（字节数组）
  static Uint8List aesDecryptBytes(
    Uint8List encryptedData, {
    String? key,
    String? iv,
  }) {
    final encrypter = _createAesEncrypter(key);
    final ivObj = encrypt.IV.fromUtf8(iv ?? _defaultAesIv);
    final encrypted = encrypt.Encrypted(encryptedData);
    final decrypted = encrypter.decryptBytes(encrypted, iv: ivObj);
    return Uint8List.fromList(decrypted);
  }

  /// 创建 AES 加密器
  static encrypt.Encrypter _createAesEncrypter(String? key) {
    final keyObj = encrypt.Key.fromUtf8(key ?? _defaultAesKey);
    return encrypt.Encrypter(
      encrypt.AES(keyObj, mode: encrypt.AESMode.cbc),
    );
  }

  // ==================== 分段加密/解密 ====================

  /// 分段 AES 加密
  ///
  /// 当数据过大时自动分段加密，适用于大文件或长字符串
  ///
  /// [plainText] 明文
  /// [key] 密钥
  /// [iv] 初始化向量
  /// [config] 分段配置
  ///
  /// 返回格式：`CHUNKED:段数:段1密文|CHUNK|段2密文|CHUNK|...`
  static String aesEncryptChunked(
    String plainText, {
    String? key,
    String? iv,
    ChunkedEncryptConfig config = ChunkedEncryptConfig.defaultConfig,
  }) {
    final bytes = utf8.encode(plainText);

    // 如果数据量小，直接加密
    if (bytes.length <= config.chunkSize) {
      return aesEncrypt(plainText, key: key, iv: iv);
    }

    // 分段加密
    final chunks = <String>[];
    int offset = 0;

    while (offset < bytes.length) {
      final end = (offset + config.chunkSize).clamp(0, bytes.length);
      final chunkBytes = bytes.sublist(offset, end);
      final chunkText = utf8.decode(chunkBytes, allowMalformed: true);

      // 加密当前段
      final encryptedChunk = aesEncrypt(chunkText, key: key, iv: iv);
      chunks.add(encryptedChunk);

      offset = end;
    }

    // 返回带标识的分段密文
    return 'CHUNKED:${chunks.length}:${chunks.join(config.separator)}';
  }

  /// 分段 AES 解密
  ///
  /// 自动识别是否为分段加密数据
  ///
  /// [encryptedText] 密文（可能是普通密文或分段密文）
  /// [key] 密钥
  /// [iv] 初始化向量
  /// [config] 分段配置
  static String aesDecryptChunked(
    String encryptedText, {
    String? key,
    String? iv,
    ChunkedEncryptConfig config = ChunkedEncryptConfig.defaultConfig,
  }) {
    // 检查是否为分段加密数据
    if (!encryptedText.startsWith('CHUNKED:')) {
      // 普通加密数据，直接解密
      return aesDecrypt(encryptedText, key: key, iv: iv);
    }

    // 解析分段数据
    final parts = encryptedText.split(':');
    if (parts.length < 3) {
      throw FormatException('Invalid chunked encrypted data format');
    }

    final chunkCount = int.parse(parts[1]);
    final chunkedData = parts.sublist(2).join(':');
    final chunks = chunkedData.split(config.separator);

    if (chunks.length != chunkCount) {
      throw FormatException(
        'Chunk count mismatch: expected $chunkCount, got ${chunks.length}',
      );
    }

    // 逐段解密
    final decryptedParts = <String>[];
    for (final chunk in chunks) {
      final decrypted = aesDecrypt(chunk, key: key, iv: iv);
      decryptedParts.add(decrypted);
    }

    return decryptedParts.join();
  }

  /// 分段加密字节数组
  ///
  /// [data] 原始数据
  /// [key] 密钥
  /// [iv] 初始化向量
  /// [chunkSize] 每段大小（字节）
  ///
  /// 返回：List<加密后的段>
  static List<Uint8List> aesEncryptBytesChunked(
    Uint8List data, {
    String? key,
    String? iv,
    int chunkSize = 1024 * 100,
  }) {
    final chunks = <Uint8List>[];
    int offset = 0;

    while (offset < data.length) {
      final end = (offset + chunkSize).clamp(0, data.length);
      final chunkBytes = data.sublist(offset, end);

      // 加密当前段
      final encryptedChunk = aesEncryptBytes(
        Uint8List.fromList(chunkBytes),
        key: key,
        iv: iv,
      );
      chunks.add(encryptedChunk);

      offset = end;
    }

    return chunks;
  }

  /// 分段解密字节数组
  ///
  /// [encryptedChunks] 加密后的分段数据
  /// [key] 密钥
  /// [iv] 初始化向量
  ///
  /// 返回：合并后的原始数据
  static Uint8List aesDecryptBytesChunked(
    List<Uint8List> encryptedChunks, {
    String? key,
    String? iv,
  }) {
    final decryptedChunks = <int>[];

    for (final chunk in encryptedChunks) {
      final decrypted = aesDecryptBytes(chunk, key: key, iv: iv);
      decryptedChunks.addAll(decrypted);
    }

    return Uint8List.fromList(decryptedChunks);
  }

  // ==================== 智能加密（自动选择方案） ====================

  /// 智能加密
  ///
  /// 根据数据大小自动选择普通加密或分段加密
  ///
  /// [plainText] 明文
  /// [key] 密钥
  /// [iv] 初始化向量
  /// [threshold] 分段阈值（字节），超过此值使用分段加密
  static String smartEncrypt(
    String plainText, {
    String? key,
    String? iv,
    int threshold = 1024 * 100, // 默认 100KB
  }) {
    final bytes = utf8.encode(plainText);

    if (bytes.length <= threshold) {
      return aesEncrypt(plainText, key: key, iv: iv);
    } else {
      return aesEncryptChunked(
        plainText,
        key: key,
        iv: iv,
        config: ChunkedEncryptConfig(chunkSize: threshold),
      );
    }
  }

  /// 智能解密
  ///
  /// 自动识别加密方式并解密
  static String smartDecrypt(
    String encryptedText, {
    String? key,
    String? iv,
  }) {
    return aesDecryptChunked(encryptedText, key: key, iv: iv);
  }

  // ==================== JSON 加密/解密 ====================

  /// 加密 JSON 对象
  ///
  /// 将 Map 转为 JSON 字符串后进行 AES 加密
  static String encryptJson(
    Map<String, dynamic> json, {
    String? key,
    String? iv,
    bool useChunked = false,
    int chunkThreshold = 1024 * 100,
  }) {
    final jsonString = jsonEncode(json);

    if (useChunked) {
      return smartEncrypt(
        jsonString,
        key: key,
        iv: iv,
        threshold: chunkThreshold,
      );
    }

    return aesEncrypt(jsonString, key: key, iv: iv);
  }

  /// 解密为 JSON 对象
  ///
  /// 将 AES 密文解密后转为 Map（自动识别分段加密）
  static Map<String, dynamic> decryptJson(
    String encryptedText, {
    String? key,
    String? iv,
  }) {
    final jsonString = smartDecrypt(encryptedText, key: key, iv: iv);
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  // ==================== 请求签名 ====================

  /// 生成请求签名
  ///
  /// 用于接口防篡改验证
  ///
  /// [params] 请求参数
  /// [timestamp] 时间戳
  /// [nonce] 随机数
  /// [secret] 签名密钥
  static String generateSign({
    required Map<String, dynamic> params,
    required String timestamp,
    required String nonce,
    required String secret,
  }) {
    // 1. 参数按 key 排序
    final sortedKeys = params.keys.toList()..sort();

    // 2. 拼接参数字符串
    final paramString = sortedKeys
        .where((key) => params[key] != null)
        .map((key) => '$key=${params[key]}')
        .join('&');

    // 3. 拼接时间戳和随机数
    final signString = '$paramString&timestamp=$timestamp&nonce=$nonce';

    // 4. HMAC-SHA256 签名
    return hmacSha256(signString, secret);
  }

  /// 验证请求签名
  static bool verifySign({
    required Map<String, dynamic> params,
    required String timestamp,
    required String nonce,
    required String secret,
    required String sign,
  }) {
    final expectedSign = generateSign(
      params: params,
      timestamp: timestamp,
      nonce: nonce,
      secret: secret,
    );
    return expectedSign == sign;
  }
}

/// 便捷别名
typedef AppEncrypt = EncryptUtil;
