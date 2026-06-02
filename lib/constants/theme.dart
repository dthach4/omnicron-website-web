import "package:jaspr/dom.dart";

const FontFamily textFontFamily = FontFamily.list([
  FontFamily("Roboto"),
  FontFamilies.sansSerif,
]);

const FontFamily fancyFontFamily = FontFamily.list([
  FontFamily("Comfortaa"),
  FontFamilies.sansSerif,
]);

const FontFamily titleFontFamily = fancyFontFamily;
const FontFamily logoFontFamily = fancyFontFamily;

const FontWeight textFontWeight = FontWeight.w300;
const FontWeight boldFontWeight = FontWeight.w500;
const FontWeight titleFontWeight = FontWeight.w700;
const FontWeight logoFontWeight = FontWeight.w300;

const Unit logoFontSize = Unit.rem(1.75);
const Unit containerSize = Unit.pixels(1300.0);