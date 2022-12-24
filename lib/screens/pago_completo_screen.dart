import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PagoCompletoScreen extends StatelessWidget {
   
  const PagoCompletoScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pago Realizado'),
      ),
      body: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:const[
            
            Icon(FontAwesomeIcons.star, color: Colors.white, size: 100,),
            SizedBox(height: 20,),
            Text('Pago Realizado Correctamente', style: TextStyle(color: Colors.white, fontSize: 20),)
          ],
         ),
      ),
    );
  }
}