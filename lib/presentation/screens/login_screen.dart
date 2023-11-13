import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_academy_online_shop/auth/auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMessage = '';
  bool isLogin = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final User? user = Auth().currentUser;

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }
  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }
  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _entryField(String text, IconData icon, bool isPasswordType, TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: isPasswordType,
      autocorrect: !isPasswordType,
      cursorColor: Colors.white,
      style: TextStyle(
          color: Colors.white.withOpacity(0.9)
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
            icon,
            color: Colors.blueAccent,
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.blueGrey.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
        )
      ),
      keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.text,
    );
  }
  Widget _loginOrRegisterButton(BuildContext context, bool isLogin, Function onTap) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
      ),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.blueGrey;
            }
            return Colors.blueAccent;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          )
        ),
        child: Text(
          isLogin ? 'LOG IN' : 'SIGN UP',
          style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold,fontSize: 16,
          ),
        ),
      ),
    );
  }
  Widget _title(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.shopPageTitle,
      style: const TextStyle(color: Colors.white),
    );
  }
  Widget _logoWidget(String imageName) {
    return Image.asset(
      imageName,
      fit: BoxFit.fitWidth,
      width: 240,
      height: 240,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(context),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20,
                MediaQuery.of(context).size.height * 0.2, 20, 0
            ),
            child: Column(
              children: <Widget> [
                _logoWidget('assets/images/shop_logo.png'),
                const SizedBox(
                  height: 30,
                ),
                _entryField('Enter email', Icons.person_outline, false, _emailController),
                const SizedBox(
                  height: 30,
                ),
                _entryField('Enter password', Icons.lock_outline, true, _passwordController),
                const SizedBox(
                  height: 20,
                ),
                _loginOrRegisterButton(context, true, () {
                  signInWithEmailAndPassword();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
