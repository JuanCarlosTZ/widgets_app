import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppTutorialScreen extends StatefulWidget {
  static String name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController controller = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      final double page = controller.page ?? 0;
      if (!endReached && page >= slides.length - 1) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
                controller: controller,
                children: slides
                    .map((e) => _Slide(
                          title: e.title,
                          caption: e.caption,
                          imageUrl: e.imageUrl,
                        ))
                    .toList()),
            Positioned(
                right: 10,
                child: TextButton.icon(
                  icon: const Icon(Icons.close_outlined),
                  onPressed: context.pop,
                  label: const Text('Salir'),
                )),
            endReached
                ? Positioned(
                    right: 10,
                    bottom: 10,
                    child: FadeInRight(
                      curve: Curves.linearToEaseOut,
                      child: FilledButton(
                          onPressed: () {}, child: const Text('Comenzar')),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
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
    return Padding(
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
