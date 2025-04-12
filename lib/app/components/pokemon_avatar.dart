import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

class PokemonAvatar extends StatefulWidget {
  static const double _originalTileSize = 112; // 原始小图尺寸（物理像素）

  final String imagePath;
  final double displaySize; // 显示尺寸（逻辑像素）
  final String bgPosition;

  const PokemonAvatar({
    super.key,
    this.imagePath = 'assets/images/normal.webp',
    this.displaySize = 84,  // 默认显示尺寸
    this.bgPosition = '0px 0px',
  });

  @override
  State<PokemonAvatar> createState() => _PokemonAvatarState();
}

class _PokemonAvatarState extends State<PokemonAvatar> {
  late Future<ui.Image> _imageFuture;

  @override
  void initState() {
    super.initState();
    _imageFuture = _ImageLoader.load(widget.imagePath);
  }

  Offset _parsePosition() {
    const backendScale = 2; // 缩放比例
    // 使用正则表达式更健壮地解析坐标
    final regex = RegExp(r"(-?\d+)px\s+(-?\d+)px");
    final match = regex.firstMatch(widget.bgPosition);

    if (match != null) {
      final x = double.parse(match.group(1)!).abs();
      final y = double.parse(match.group(2)!).abs();

      return Offset(x * backendScale, y * backendScale);
    }
    return Offset.zero; // 默认值
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
      future: _imageFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(
            width: widget.displaySize,
            height: widget.displaySize,
            child: const CircularProgressIndicator(),
          );
        }

        return SizedBox(
          width: widget.displaySize,
          height: widget.displaySize,
          child: CustomPaint(
            painter: _SpritePainter(
              image: snapshot.data!,
              offset: _parsePosition(),
              srcTileSize: const Size(
                PokemonAvatar._originalTileSize,  // 保持原始小图尺寸
                PokemonAvatar._originalTileSize,
              ),
              displaySize: widget.displaySize,
            ),
          ),
        );
      },
    );
  }
}

class _SpritePainter extends CustomPainter {
  final ui.Image image;
  final Offset offset;
  final Size srcTileSize;  // 源小图尺寸（物理像素）
  final double displaySize;  // 显示尺寸（逻辑像素）

  _SpritePainter({
    required this.image,
    required this.offset,
    required this.srcTileSize,
    required this.displaySize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final srcRect = Rect.fromLTWH(
      offset.dx,    // 直接使用物理像素X
      offset.dy,    // 直接使用物理像素Y
      srcTileSize.width,
      srcTileSize.height,
    );

    final dstRect = Rect.fromLTWH(
      0,
      0,
      displaySize,  // 目标尺寸自动缩放
      displaySize,
    );

    canvas.drawImageRect(image, srcRect, dstRect, Paint()..filterQuality = FilterQuality.high);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _ImageLoader {
  static final Map<String, ui.Image> _cache = {};

  static Future<ui.Image> load(String assetPath) async {
    if (_cache.containsKey(assetPath)) return _cache[assetPath]!;

    final ByteData data = await rootBundle.load(assetPath);
    final codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: 4480,  // 指定原始精灵图尺寸
      targetHeight: 4480,
    );
    final frame = await codec.getNextFrame();
    _cache[assetPath] = frame.image;
    return frame.image;
  }
}