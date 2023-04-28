import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  String _resultado = "resultado";

    _recuperarCep(String cep) async {
    String url = "https://viacep.com.br/ws/${cep}/json/";
    http.Response response;

    response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno['logradouro'];
    String complemento = retorno['complemento'];
    String bairro = retorno['bairro'];
    String localidade = retorno['localidade'];
    String ddd = retorno['ddd'];

    print(
      "Resposta: logradouro: ${logradouro} complemento: ${complemento} bairro: ${bairro} localidade ${localidade} ddd ${ddd}"
    );

    setState(() {
      _resultado = "${logradouro}, ${complemento}, ${bairro}, ${localidade}, ${ddd} ";
    });

  }
  @override
  Widget build(BuildContext context) {
      TextEditingController cep = TextEditingController();
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
           Lottie.asset("assets/lotties/location.json", width: 130),
           Center(
             child: SizedBox(
               width: 250,
               child: TextField(
                 controller: cep,
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
           Text(_resultado),
           ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                textStyle: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
               onPressed: () => _recuperarCep(cep.text),
               child: Text('Consultar'),
           ),
         ],
       ),
     ),
    );
  }
}
