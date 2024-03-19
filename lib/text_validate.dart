import 'package:flutter/material.dart';

class TextValidate extends StatefulWidget {
  const TextValidate({super.key});

  @override
  State<TextValidate> createState() => _TextValidateState();
}

class _TextValidateState extends State<TextValidate> {
  TextEditingController _textEditingController = TextEditingController();
  String _displayText = '';
  final _formKey = GlobalKey<FormState>();

  void _updateDisplayText() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _displayText = _textEditingController.text;
      });
    }
  }

  void _clearTextField() {
    setState(() {
      _textEditingController.clear();
      _displayText = '';
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Демонстрация ввода текста'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  labelText: 'Введите текст',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите текст';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _updateDisplayText();
                    },
                    child: const Text('Показать текст'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _clearTextField();
                    },
                    child: const Text('Очистить'),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                _displayText,
                style: const TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
