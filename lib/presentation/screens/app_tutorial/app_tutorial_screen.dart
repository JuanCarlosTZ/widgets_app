import 'package:flutter/material.dart';

class AppTutorialScreen extends StatelessWidget {
  static String name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          children: slides
              .map((e) => _Slide(
                    title: e.title,
                    caption: e.caption,
                    imageUrl: e.imageUrl,
                  ))
              .toList()),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 10),
            Text(
              title,
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text(
              caption,
              style: textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

final List<SlideInfo> slides = [
  SlideInfo(
      title: 'Buscar plato preferido',
      caption: 'Dolor consequat aute laboris ut.',
      imageUrl: 'assets/images/1.png'),
  SlideInfo(
      title: 'Entrega del pedido',
      caption:
          'Labore culpa eiusmod consectetur non dolor ullamco ad veniam anim ullamco aute enim fugiat ipsum.',
      imageUrl: 'assets/images/2.png'),
  SlideInfo(
      title: 'Disfrute su producto',
      caption: 'Non veniam anim consequat id aliquip dolore cupidatat.',
      imageUrl: 'assets/images/3.png'),
];
