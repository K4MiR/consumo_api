import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {



  _recuperarCep() async {

    //String cep = "";
    String url = "https://viacep.com.br/ws/54753740/json/";
    http.Response response;

    response = await http.get(Uri.parse(url));

    print('resposta' + response.statusCode.toString());
    print('resposta' + response.body);

  }

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
       width: MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height,
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                textStyle: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
               onPressed: _recuperarCep,
               child: Text('Consultar'),
           ),
         ],
       ),
     ),
    );
  }
}
