import 'package:moviles/screens/dashboard.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<Login> {
  bool isValidating = false;
  @override
  Widget build(BuildContext context) {
    var txtUsuarioController = TextEditingController();
    var txtPasswordController = TextEditingController();

    final txtUsuario = TextFormField(
      controller: txtUsuarioController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Usuario',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
    final txtPassword = TextFormField(
        controller: txtPasswordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Contraseña',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ));
    final btnEntrar = ElevatedButton(
      onPressed: () {
        // print(txtUsuarioController.text);
        isValidating = true;
        setState(() {});
        Future.delayed(new Duration(seconds: 2), () {
          // print('Hola mundo');
          isValidating = false;
          setState(() {});
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Dashboard()));
        });
      },
      child: Text('Entrar'),
    );
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fondo.jpg"),
            fit: BoxFit.fill,
          ),
        )),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                txtUsuario,
                SizedBox(height: 5),
                txtPassword,
                SizedBox(height: 5),
                btnEntrar,
              ],
              shrinkWrap: true,
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
        //Positioned(child: Image.asset('assets/fondo2.png'), bottom: 200),
        Positioned(
            child: isValidating ? CircularProgressIndicator() : Container(),
            bottom: 100),
      ],
    );
  }
}
