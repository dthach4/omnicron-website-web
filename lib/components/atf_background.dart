import "dart:async";
import "dart:math";

import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:universal_web/js_interop.dart";
import "package:universal_web/web.dart";
import "package:website_jaspr/components/atf_background_icon.dart";
import "package:website_jaspr/components/atf_background_star.dart";

@client
@immutable
class AtfBackground extends StatefulComponent {
  final List<String> iconPaths = const [
    "/dist/app/imgs/atf-icons/icon-1.png",
    "/dist/app/imgs/atf-icons/icon-2.png",
    "/dist/app/imgs/atf-icons/icon-3.png",
    "/dist/app/imgs/atf-icons/icon-4.png",
    "/dist/app/imgs/atf-icons/icon-5.png",
    "/dist/app/imgs/atf-icons/icon-6.png",
    "/dist/app/imgs/atf-icons/icon-7.png",
    "/dist/app/imgs/atf-icons/icon-8.png",
    "/dist/app/imgs/atf-icons/icon-9.png",
    "/dist/app/imgs/atf-icons/icon-10.png",
    "/dist/app/imgs/atf-icons/icon-11.png",
    "/dist/app/imgs/atf-icons/icon-12.png",
    "/dist/app/imgs/atf-icons/icon-13.png",
    "/dist/app/imgs/atf-icons/icon-14.png",
    "/dist/app/imgs/atf-icons/icon-15.png",
    "/dist/app/imgs/atf-icons/icon-16.png",
    "/dist/app/imgs/atf-icons/icon-17.png",
    "/dist/app/imgs/atf-icons/icon-18.png",
  ];

  const AtfBackground({super.key});

  @override
  State<AtfBackground> createState() => _AtfBackgroundState();

  @css
  static List<StyleRule> get styles => [
    css(".atf-background").styles(
      position: const .absolute(
        top: .zero,
        left: .zero,
      ),
      zIndex: const ZIndex(1),
      width: 100.0.percent,
      height: 100.0.percent,
      backgroundColor: const .value(0x000000),
    ),
  ];
}

class _AtfBackgroundState extends State<AtfBackground> {
  final Random random = Random();
  final int maxStarsCount = 15;
  final GlobalNodeKey<HTMLDivElement> backgroundElementKey = GlobalNodeKey();

  List<String> imageUrls = [];
  List<AtfBackgroundIcon> icons = [];
  List<AtfBackgroundStar> stars = [];
  double lastUpdate = 0;
  int maxImageCount = 0;
  double canvasWidth = 0;
  double canvasHeight = 0;

  int getMaxImageCountByCanvasWidth(double canvasWidth) => switch(canvasWidth) {
    < 576.0 => 5,
    < 992.0 => 7,
      _     => 9,
  };

  Future<void> handleBackgroundAnimation() async {
    await preloadIcons();
    context.binding.addPostFrameCallback(() {
      initializeAnimation();
      initializeResizeEvent();
      runAnimation(0);
    });
  }

  Future<void> preloadIcons() async {
    await Future.wait(
      component.iconPaths.map((iconPath) async {
        final Response response = await window.fetch(iconPath.toJS).toDart;
        final Blob blob = await response.blob().toDart;
        imageUrls.add(URL.createObjectURL(blob));
      })
    );
  }

  void initializeAnimation() {
    final HTMLElement backgroundElement = backgroundElementKey.currentNode!;
    maxImageCount = getMaxImageCountByCanvasWidth(window.innerWidth.toDouble());
    canvasWidth = backgroundElement.clientWidth.toDouble();
    canvasHeight = backgroundElement.clientHeight.toDouble();
    setState(() {
      initializeIcons();
      initializeStars();
    });
  }

  void initializeIcons() {
    icons = List.generate(maxImageCount, (int i) => initializeIcon());
  }

  AtfBackgroundIcon initializeIcon() => .createRandom(
    canvasWidth: canvasWidth,
    canvasHeight: canvasHeight,
    validImagePaths: imageUrls,
  );

  void initializeStars() {
    stars = List.generate(maxStarsCount, (int i) => initializeStar());
  }

  AtfBackgroundStar initializeStar() => .generateRandom(
    canvasWidth: canvasWidth,
    canvasHeight: canvasHeight,
  );

  void runAnimation(double time) {
    double dt = time - lastUpdate;
    lastUpdate = time;
    setState(() {
      stepIcons(dt);
      stepStars(dt);
    });
    window.requestAnimationFrame(runAnimation.toJS);
  }

  void stepIcons(double dt) {
    icons = icons
      .map((AtfBackgroundIcon icon) => icon.step(dt))
      .where((AtfBackgroundIcon icon) => icon.isInCanvas(canvasWidth: canvasWidth, canvasHeight: canvasHeight))
      .toList();
    if (icons.length < maxImageCount) {
      final int missingIconsCount = maxImageCount - icons.length;
      icons.addAll(
        List<AtfBackgroundIcon>.generate(missingIconsCount, (int i) => initializeIcon())
      );
    }
  }

  void stepStars(double dt) {
    stars = stars
      .map((AtfBackgroundStar star) => star.step(dt))
      .where((AtfBackgroundStar star) => star.time < 1)
      .toList();
    if (stars.length < maxStarsCount) {
      final int missingStarsCount = maxStarsCount - stars.length;
      stars.addAll(
        List<AtfBackgroundStar>.generate(missingStarsCount, (int i) => initializeStar())
      );
    }
  }

  void initializeResizeEvent() {
    window.addEventListener("resize", () {
      final HTMLElement backgroundElement = backgroundElementKey.currentNode!;
      maxImageCount = getMaxImageCountByCanvasWidth(window.innerWidth.toDouble());
      canvasWidth = backgroundElement.clientWidth.toDouble();
      canvasHeight = backgroundElement.clientHeight.toDouble();
    }.toJS);
  }

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      handleBackgroundAnimation();
    }
  }
  
  @override
  Component build(BuildContext context) => div(
    key: backgroundElementKey,
    classes: "atf-background",
    [
      ...stars,
      ...icons,
    ],
  );
}
