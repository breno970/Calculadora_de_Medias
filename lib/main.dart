import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Input Centralizado',
      home: CenteredInputWidget(),
    );
  }
}

class CenteredInputWidget extends StatefulWidget {
  const CenteredInputWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CenteredInputWidgetState createState() => _CenteredInputWidgetState();
}

class _CenteredInputWidgetState extends State<CenteredInputWidget> {
  final TextEditingController _controllerAv1 = TextEditingController();
  final TextEditingController _controllerAv2 = TextEditingController();
  final TextEditingController _controllerMatricula = TextEditingController();
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerDisciplina = TextEditingController();
  final TextEditingController _controllerMedia = TextEditingController();

  void _somar() {
    int notaAv1 = int.tryParse(_controllerAv1.text) ?? 0;
    int notaAv2 = int.tryParse(_controllerAv2.text) ?? 0;
    double resultado = (notaAv1 + notaAv2) / 2;

    _controllerMedia.text = resultado.toString();
  }

  void _limpar() {
    _controllerAv1.clear();
    _controllerAv2.clear();
    _controllerMedia.clear();
    _controllerDisciplina.clear();
    _controllerNome.clear();
    _controllerMatricula.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistemas de Informação'),
        backgroundColor: Colors.blue[700],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InputField(controller: _controllerMatricula, label: 'Matrícula'),
              SizedBox(height: 20),
              InputField(controller: _controllerNome, label: 'Nome'),
              SizedBox(height: 20),
              InputField(
                  controller: _controllerDisciplina, label: 'Disciplina'),
              SizedBox(height: 20),
              InputField(controller: _controllerAv1, label: 'AV1'),
              SizedBox(height: 20),
              InputField(controller: _controllerAv2, label: 'AV2'),
              SizedBox(height: 20),
              InputField(controller: _controllerMedia, label: 'Média'),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomElevatedButton(text: 'Limpar', onPressed: _limpar),
                  CustomElevatedButton(text: 'Calcular', onPressed: _somar),
                  CustomElevatedButton(
                      text: 'Sair',
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  InputField({required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      controller: controller,
      decoration: InputDecoration(
        hintText: '$label',
        labelText: label,
        labelStyle: TextStyle(fontSize: 25),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  CustomElevatedButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.green[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
