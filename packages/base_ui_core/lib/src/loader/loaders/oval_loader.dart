import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class OvalLoader extends StatefulWidget {
  const OvalLoader({
    Key? key,
    required this.size,
    required this.color,
  }) : super(key: key);

  final double size;
  final Color color;

  @override
  State<OvalLoader> createState() => _OvalLoaderState();
}

class _OvalLoaderState extends State<OvalLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: Container(
                width: widget.size,
                height: widget.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: widget.color.withOpacity(0.5),
                    width: 5,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
              child: RotationTransition(
                turns: _animation,
                child: CustomPaint(
                  size: Size.square(widget.size),
                  painter: _QuarterOvalPainter(
                    color: widget.color,
                    strokeWidth: 5,
                  ),
                ),
            
            ),
          ),
        ],
      ),
    );
  }
}

class _QuarterOvalPainter extends CustomPainter {
  _QuarterOvalPainter({
    required this.color,
    required this.strokeWidth,
  });

  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = color.withOpacity(1);

    // 计算绘制四分之一椭圆的矩形
    final quarterRect = Rect.fromCircle(
      center: Offset((size.width) / 2, (size.height) / 2),
      radius: ((size.width - strokeWidth) / 2),
    );

    // 绘制四分之一的椭圆
    canvas.drawArc(
      quarterRect,
      -math.pi / 2,
      math.pi / 2,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
