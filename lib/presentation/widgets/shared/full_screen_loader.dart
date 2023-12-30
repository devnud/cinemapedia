import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessage()  {
    final messages = <String>[
    'Cargarndo peliculas...',
    'Comprando palomitas de maíz',
    'Cargando populares',
    'Ya mismo',
    'Esto esta tardando mucho :)',
  ];

    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere por favor...'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: getLoadingMessage(),
            builder: (context, snapshot) {
              return Text(snapshot.data ?? '');
            },
          ),
        ],
      ),
    );
  }
}
