import "dart:math";

import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";

@immutable
class AtfBackgroundIcon extends StatelessComponent {
  static const double tau = 2 * pi;
  
  final String imagePath;
  final double size;
  final double dx;
  final double dy;
  final double torque;
  final double x;
  final double y;
  final double rotation;

  const AtfBackgroundIcon._({
    super.key,
    required this.imagePath,
    required this.size,
    required this.dx,
    required this.dy,
    required this.torque,
    required this.x,
    required this.y,
    required this.rotation,
  });

  factory AtfBackgroundIcon.createRandom({
    required double canvasWidth,
    required double canvasHeight,
    required List<String> validImagePaths,
    Random? random,
  }) {
    final Random realRandom = random ?? Random();
    final _Direction direction = _Direction.random(realRandom);
    final double translationAngle = realRandom.nextDouble()*tau/4 - tau/8 + direction.index*tau/4;
    final double size = 75.0 + realRandom.nextDouble() * 50.0;
    final double speed = 1.0 + realRandom.nextDouble() * 2.0;
    final String imagePath = validImagePaths[realRandom.nextInt(validImagePaths.length)];
    final double x = direction.vertical
      ? realRandom.nextDouble() * canvasWidth
      : (direction.fromStart
        ? -size
        : canvasWidth + size
      );
    final double y = !direction.vertical
      ? realRandom.nextDouble() * canvasHeight
      : (direction.fromStart
        ? -size
        : canvasHeight + size
      );
    return ._(
      imagePath: imagePath,
      size: size,
      dx: speed * cos(translationAngle),
      dy: speed * sin(translationAngle),
      torque: -0.025 + realRandom.nextDouble() * 0.05,
      x: x,
      y: y,
      rotation: realRandom.nextDouble() * tau,
    );
  }

  @override
  Component build(BuildContext context) => img(
    src: imagePath,
    classes: "atf-background-icon",
    styles: Styles(
      position: .absolute(
        left: x.px,
        top: y.px,
      ),
      width: size.px,
      height: size.px,
      transform: .combine([
        .translate(x: (-50.0).percent, y: (-50.0).percent),
        .rotate(rotation.rad),
      ]),
      raw: {
        "object-fit": "contain",
        "transform-origin": "center",
      },
    ),
  );

  bool isInCanvas({required double canvasWidth, required double canvasHeight}) =>
    x > -size &&
    x < canvasWidth + size &&
    y > -size &&
    y < canvasHeight + size;

  AtfBackgroundIcon step(double dt) {
    double speed = dt * 60 / 1000;
    return ._(
      key      : key,
      imagePath: imagePath,
      size     : size,
      dx       : dx,
      dy       : dy,
      torque   : torque,
      x        : x + dx * speed,
      y        : y + dy * speed,
      rotation : rotation + torque * speed,
    );
  }

  @css
  static List<StyleRule> get styles => [
    css(".atf-background-icon").styles(
      position: const .absolute(),
    ),
  ];
}

enum _Direction {
  right,
  down,
  left,
  up;

  bool get vertical => this == up || this == down;
  bool get fromStart => this == right || this == down;

  static _Direction random(Random random) => values[random.nextInt(values.length)];
}