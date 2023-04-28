import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Center(
          child: Text('Consultar Cep',
          ),
        ),
      ),
     body: Container(
       child: Column(
         children: [
           SizedBox(
             height: 10,
           ),
           Lottie.asset("assets/lotties/location.json", width: 200),
           Center(
             child: SizedBox(
               width: 250,
               child: TextField(
                 decoration: InputDecoration(
                   labelText: 'Digite seu cep',
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(50),
                   ),
                 ),
                 keyboardType: TextInputType.number,
               ),
             ),
           ),
           SizedBox(
             height: 40,
           ),
           ElevatedButton(
               onPressed: (){},
               child: Text('Consultar'),
           ),
         ],
       ),
     ),
    );
  }
}
