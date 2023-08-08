import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  

  Stream<String> getLoadingMesseges(){

    final message = <String>[
    'Cargando peliculas',
    'Comprando canchitas',
    'Cargando Peliculas Populares',
    'Llamando al 911',
    'Esta demorando mucho',
    'Ya me voy',
  ];

    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return message[step];
    }).take(message.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere Por favor'),
          const SizedBox(height: 10,),
          const CircularProgressIndicator(strokeWidth: 2,),
          const SizedBox(height: 10,),

          StreamBuilder(
            stream: getLoadingMesseges(),
            builder: (context, snapshot) {
              if( !snapshot.hasData ) return const Text('Cargando...');

              return Text(snapshot.data!);
            },
          )
        ],
      ),
    );
  }
}