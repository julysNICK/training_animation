import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// class LoadingFade extends StatefulWidget {
//   const LoadingFade({super.key});

//   @override
//   State<LoadingFade> createState() => _LoadingFadeState();
// }

// class _LoadingFadeState extends State<LoadingFade> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//         body: FadeInImage(
//       image: NetworkImage(
//           'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/819.png'),
//       placeholder: AssetImage('assets/Loading_icon.gif'),
//     ));
//   }
// }

class Loading extends AnimatedWidget {
  const Loading({
    Key? key,
    required AnimationController controller,
  }) : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    value: _progress.value,
                    strokeWidth: 10,
                    color: Colors.blue,
                  ),
                ),
              ),
              Center(
                child: Text(
                  '${(_progress.value * 100).round()}%',
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedWidgetExample extends StatefulWidget {
  const _AnimatedWidgetExample({Key? key}) : super(key: key);

  @override
  State<_AnimatedWidgetExample> createState() => _AnimatedWidgetExampleState();
}

class _AnimatedWidgetExampleState extends State<_AnimatedWidgetExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat(reverse: true);

  @override
  Widget build(BuildContext context) {
    return Loading(controller: _controller);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const _AnimatedWidgetExample(),
    );
  }
}
