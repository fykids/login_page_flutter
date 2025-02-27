import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var assetName = 'images/image_login.png';
    return MaterialApp(
      scrollBehavior: ScrollBehavior(),
      title: "Login Page",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            forceMaterialTransparency: true,
            leading: Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(
                height: 24,
                width: 24,
                child: FlutterLogo(),
              ),
            ),
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                Image(
                  image: AssetImage(assetName),
                  height: 180,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Silahkan untuk melanjutkan',
                  style: TextStyle(fontSize: 18, letterSpacing: 1),
                ),
                const SizedBox(
                  height: 16,
                ),
                FormLogin()
              ],
            ),
          ))),
    );
  }
}

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _usernameController,
          decoration: const InputDecoration(
            labelText: "Username",
            hintText: "Masukkan username",
            hintStyle: TextStyle(fontSize: 14),
            labelStyle: TextStyle(fontSize: 14),
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusColor: Colors.black87,
            hoverColor: Colors.black87,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black87),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            floatingLabelStyle: TextStyle(color: Colors.black87),
          ),
          cursorColor: Colors.black87,
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelStyle: TextStyle(fontSize: 14),
            labelText: "Password",
            hintText: "Masukkan password",
            hintStyle: TextStyle(fontSize: 14),
            prefixIcon: Icon(Icons.lock),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusColor: Colors.black87,
            hoverColor: Colors.black87,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black87),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            floatingLabelStyle: TextStyle(color: Colors.black87),
          ),
          cursorColor: Colors.black87,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50.0,
          child: FilledButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.black87),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            onPressed: () {
              final String username = _usernameController.text;
              final String password = _passwordController.text;

              if (username == "admin" && password == "admin") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Login Berhasil"),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Login Gagal"),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                );
              }
            },
            child: const Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
