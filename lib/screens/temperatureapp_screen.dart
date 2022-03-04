import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TemperatureApp extends StatelessWidget {
  const TemperatureApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var txtTempController = TextEditingController();

    final List<String> genderItems = ['Celsius', 'Fahrenheit'];
    String? selectedValue;
    final _formKey = GlobalKey<FormState>();

    final txtTemp = TextFormField(
      controller: txtTempController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: "Introduce la temperatura",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final ddb2Medida = DropdownButtonFormField2(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      isExpanded: true,
      hint: const Text(
        'Selecciona la medida',
        style: TextStyle(fontSize: 14),
      ),
      icon: const Icon(Icons.arrow_drop_down, color: Colors.black45),
      iconSize: 30,
      buttonHeight: 60,
      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      items: genderItems
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select gender.';
        }
      },
      onChanged: (value) {},
      onSaved: (value) {
        selectedValue = value.toString();
      },
    );

    final btnEntrar = ElevatedButton(
        onPressed: () {
          //String db = ddb2Medida.value.toString();
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            Alert(
              context: context,
              title: "Temperatura",
              desc: "La temperatura en grados Fahrenheit es: 50",
              buttons: [
                DialogButton(
                  child: Text(
                    "OK",
                    style: TextStyle(
                        color: Color.fromARGB(255, 26, 25, 25), fontSize: 20),
                  ),
                  onPressed: () => Navigator.pop(context),
                  width: 120,
                )
              ],
            ).show();
          }
        },
        child: Text('Calcular'));

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 18, 51, 83),
        title: Text('Conversor de temperatura'),
        leading: Row(
          children: <Widget>[
            SizedBox(
              width: 5.0,
            ),
            IconButton(
              color: Colors.white,
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              txtTemp,
              const SizedBox(height: 10),
              ddb2Medida,
              const SizedBox(height: 20),
              btnEntrar
            ],
          ),
        ),
      ),
    ));
  }
}
