// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
 
import 'package:flutter/material.dart';
 
class Login extends StatelessWidget {
  const Login({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Color(0xFFfff6ec), 
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 280,
              height: 280,
              child: Image.asset('assets/images/logo_borda.png'),
            ),
 
            SizedBox(height: 10),
 
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                     ),
                  decoration: InputDecoration(
                    labelText: 'Login: ',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xFF8A2F38),
                        width: 2.0,
                      )
                    )
                  ),
            ),
 
              SizedBox(height: 20),
 
            TextFormField(
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Senha: ',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xFF8A2F38),
                        width: 2.0,
                      )
                    )
                  ),
                ),
 
           Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: TextButton(
              onPressed: () => {},
              style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              ),
              child: Text(
                "Recuperar Senha",
                  textAlign: TextAlign.right,
              ),
              ),
            ),
 
 
            SizedBox(height: 40),
 
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color(0xFFC48C64), //tem que colocar 0xFF pra definir a opacidade antes do hex
                    Color(0xFF8A2F38),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton (
                  onPressed: () => {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Entrar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                        ),
                    ],
                  )
                )
              ),
            ),

            SizedBox(height: 20),

            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color(0xFFC48C64),
                    Color(0xFF8A2F38),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton (
                  onPressed: () => {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Cadastrar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                        ),
                    ],
                  )
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 
 