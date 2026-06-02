import "dart:math";

import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";

@immutable
class AtfBackgroundStar extends StatelessComponent {
  final double x;
  final double y;
  final double size;
  final double time;
  final double timeIncrease;
  final double opacity;

  const AtfBackgroundStar._({
    required this.x,
    required this.y,
    required this.size,
    required this.time,
    required this.timeIncrease,
    required this.opacity,
  });

  factory AtfBackgroundStar.generateRandom({
    required double canvasWidth,
    required double canvasHeight,
    Random? random,
  }) {
    final Random realRandom = random ?? Random();
    final int duration = 60 + realRandom.nextInt(120);
    return AtfBackgroundStar._(
      x           : realRandom.nextDouble() * canvasWidth,
      y           : realRandom.nextDouble() * canvasHeight,
      size        : 4.0 + realRandom.nextDouble() * 20.0,
      time        : 0.0,
      timeIncrease: 1 / duration,
      opacity     : 0.0,
    );
  }

  @override
  Component build(BuildContext context) => div(
    classes: "atf-background-star",
    styles: Styles(
      position: .absolute(
        left: x.px,
        top: y.px,
      ),
      width: size.px,
      height: size.px,
      opacity: opacity,
    ),
    [],
  );

  AtfBackgroundStar step(double dt) {
    final double speed = dt * 60 / 1000;
    return ._(
      x           : x,
      y           : y,
      size        : size,
      time        : time + timeIncrease * speed,
      timeIncrease: timeIncrease,
      opacity     : 4 * time * (1-time),
    );
  }

  @css
  static List<StyleRule> get styles => [
    css(".atf-background-star").styles(
      position: const .absolute(),
      radius: .circular(50.0.percent),
      backgroundColor: const .value(0xFFFFFF),
    ),
  ];
}