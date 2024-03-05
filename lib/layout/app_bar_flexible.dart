import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mother_earth/app/my_text.dart';
import 'package:mother_earth/providers/resource_provider.dart';

class AppBarFlexible extends ConsumerWidget {
  const AppBarFlexible({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    Widget healthAndLevel() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myText('Health', bold: true),
                    Wrap(
                      children: [
                        const Icon(
                          Icons.trending_up,
                          color: Colors.green,
                          size: 20,
                        ),
                        myText(
                          ' +24',
                          bold: true,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ],
                ),
                LinearProgressIndicator(
                  value: ref.watch(healthProvider),
                  color: Colors.red,
                )
              ],
            ),
            // const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                myText('Level: 5', bold: true),
                const LinearProgressIndicator(
                  value: 0.75,
                  color: Colors.blue,
                ),
                const SizedBox(height: 5),
              ],
            ),
          ],
        );
        
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50, left: 10, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShaderMask(
              blendMode: BlendMode.dstIn,
              shaderCallback: (Rect bounds) {
                return RadialGradient(
                  center: Alignment.topLeft,
                  radius: 1.0,
                  colors: <Color>[Colors.yellow, Colors.deepOrange.shade900],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: Lottie.network(
                  'https://lottie.host/1de15c7c-278e-4751-bd68-54ebedb5d3a3/crNVTBdG5b.json',
                  fit: BoxFit.contain,
                  alignment: Alignment.center),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: healthAndLevel(),
            )),
            // const Flexible(flex: 1, child: Text('data')),
          ],
        ),
      ),
    );
  }

  
}
