import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static String name = 'infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final controller = ScrollController();
  final List<int?> imageIds = [1, 2, 3, 4, 5];
  bool loading = false;

  void addImageIds(int lastId) {
    imageIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      final currentPositionPixel = controller.position.pixels;
      final lastPositionPixel = controller.position.maxScrollExtent;

      if (!loading && lastPositionPixel - currentPositionPixel <= 100) {
        setState(() {
          loading = true;
        });
        loadNextImages();
      }
    });
  }

  Future<void> loadNextImages({bool? cleanPreview}) async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    final int lastId = imageIds.last ?? 0;
    if (cleanPreview == true) imageIds.clear();
    addImageIds(lastId);

    await Future.delayed(const Duration(microseconds: 300));
    if (!mounted) return;
    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    final ScrollPosition position = controller.position;

    if (position.maxScrollExtent - position.pixels <= 100) {
      controller.animateTo(position.pixels + 100,
          duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
    }
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
        right: false,
        left: false,
        bottom: false,
        child: Stack(
          children: [
            RefreshIndicator(
              edgeOffset: 10,
              strokeWidth: 2,
              onRefresh: () => loadNextImages(cleanPreview: true),
              child: ListView.builder(
                controller: controller,
                itemCount: imageIds.length,
                itemBuilder: (context, index) {
                  return FadeInImage(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                    placeholder:
                        const AssetImage('assets/images/jar-loading.gif'),
                    image: NetworkImage(
                        'https://picsum.photos/id/${imageIds[index]}/500/300'),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Container(
                          padding: const EdgeInsets.all(20),
                          height: 300,
                          child: const Center(child: Text('No disponible')));
                    },
                  );
                },
              ),
            ),
            _Loading(loading)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: context.pop, child: const Icon(Icons.arrow_back_ios)),
    );
  }
}

class _Loading extends StatelessWidget {
  final bool loading;
  const _Loading(bool? pLoading) : loading = pLoading == true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: FadeInUp(
                animate: loading,
                child: const CircularProgressIndicator(strokeWidth: 2))),
      ),
    );
  }
}
