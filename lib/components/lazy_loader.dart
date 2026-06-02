import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";

@immutable
class LazyLoader extends StatelessComponent {
  const LazyLoader({super.key});

  @override
  Component build(BuildContext context) => const script(
    content: """
document.addEventListener('lazybeforeunveil', function(e){
  const bg = e.target.getAttribute('data-bg');
  if(bg){
    e.target.style.backgroundImage = 'url('+bg+')';
  }
});""",
  );
}