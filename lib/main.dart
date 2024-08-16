import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //classe que representa o aplicativo
  @override
  Widget build(BuildContext context) {
    //constroi a interface do app
    return MaterialApp(); // tipo de layout da aplicação
    home: Home(),
     debugShowCheckedModeBanner: false,
  }
}

class Home extends StatefulWidget {

  _HomeState createState()=> _HomeState(); //cria um estado para tela inicial
}

class _HomeState extends State<Home>{ //classe que representa o estado 
      final TextEditingController _pesoController = TextEditingController();
      final TextEditingController _alturaController = TextEditingController();

      String _resultado = "Informe seus dados!";
      final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); //Validação do formulário
      

      void limparCampos(){
        _pesoController.text = "";
        _alturaController.text = "";
        setState(() {
          _resultado = "Informe seus dados!";
        });
      }
      void calcular(){
  double peso = double.parse(_pesoController.text);
  double altura = double.parse(_alturaController.text);

  double imc = peso / (altura * altura);

  setState(() {
    if (imc < 18.6){
      _resultado = "Você está abaixo do peso IMC atual: (${imc.toStringAsPrecision(3)})";
    }
    else if (imc >= 18.6 && imc <= 24.9){
      _resultado = "Você está com o peso normal IMC atual: (${imc.toStringAsPrecision(3)})";
    }
    else if (imc >= 25 && imc <= 29.9){
      _resultado = "Você está com sobrepeso IMC atual: (${imc.toStringAsPrecision(3)})";
    }
    else if (imc >= 30 && imc <= 34.9){
      _resultado = "Você está com obesidade grau I IMC atual: (${imc.toStringAsPrecision(3)})";
    }
    else if (imc >= 35 && imc <= 39.9){
      _resultado = "Você está com obesidade grau II (severa) IMC atual: (${imc.toStringAsPrecision(3)})";
    }
    else{
      _resultado = "Você está com obesidade mórbida (morbida) IMC atual: (${imc.toStringAsPrecision(3)})";
    }

  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculo IMC'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text("Informe seu peso"),
              TextField(controller: _pesoController,),
              Text("Informe sua altura"),
              TextField(controller: _alturaController,),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    calcular();
                  }
                },
                child: Text('Calcular'),
              ),
              SizedBox(height: 10,),
              Text(_resultado),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  limparCampos();
                },
                child: Text('Limpar'),
              )
            ],
          ),
        ),
      ),

      floatingActionButton: Floating
    )
}
}
