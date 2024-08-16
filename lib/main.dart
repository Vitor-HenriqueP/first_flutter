import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Classe que representa o aplicativo
  @override
  Widget build(BuildContext context) {
    // Constrói a interface do app
    return MaterialApp(
      home: Home(), // Especifica a página inicial
      debugShowCheckedModeBanner: false, // Remove a bandeira de debug
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() =>
      _HomeState(); // Cria um estado para a tela inicial
}

class _HomeState extends State<Home> {
  // Classe que representa o estado
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();

  String _resultado = "Informe seus dados!";
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Validação do formulário

  void _limparCampos() {
    _pesoController.text = "";
    _alturaController.text = "";
    setState(() {
      _resultado = "Informe seus dados!";
    });
  }

  void calcular() {
    double peso = double.parse(_pesoController.text);
    double altura = double.parse(_alturaController.text);

    double imc = peso / (altura * altura);

    setState(() {
      if (imc < 18.6) {
        _resultado =
            "Você está abaixo do peso IMC atual: (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.6 && imc <= 24.9) {
        _resultado =
            "Você está com o peso normal IMC atual: (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 25 && imc <= 29.9) {
        _resultado =
            "Você está com sobrepeso IMC atual: (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 30 && imc <= 34.9) {
        _resultado =
            "Você está com obesidade grau I IMC atual: (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 35 && imc <= 39.9) {
        _resultado =
            "Você está com obesidade grau II (severa) IMC atual: (${imc.toStringAsPrecision(3)})";
      } else {
        _resultado =
            "Você está com obesidade mórbida IMC atual: (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cálculadora IMC'),
          centerTitle: true,
          backgroundColor: Colors.red,
          actions: <Widget>[
            IconButton(onPressed: _limparCampos, icon: Icon(Icons.refresh))
          ],
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Icon(Icons.person_2_outlined, size:120.0, color: Colors.red),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Peso(Kg)',
                        labelStyle: TextStyle(color: Colors.red, fontSize: 25.0),
                      ),
                      controller: _pesoController,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return ("Informe seu peso!");
                        }
                      }
                    )
                  ],
                ),
              ),
            ));
  }
}
