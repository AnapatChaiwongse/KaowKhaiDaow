import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'homePage.dart';
import 'authentication.dart';

class loginPage extends StatefulWidget {
  loginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<loginPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final Authentication _auth = Authentication();

  Future<void> _login(BuildContext context) async {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      try {
        // Sign in with email and password
        final email = _formKey.currentState!.value['email'];
        final password = _formKey.currentState!.value['password'];
        await _auth.signInWithEmailAndPassword(email: email, password: password);

        // Navigate to the home page on successful login
        print("Login success!");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } catch (e) {
        // Handle errors here
        print("Login failed: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed. Please check your email and password.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } else {
      print("Validation failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromARGB(255, 207, 233, 238)!, Color.fromARGB(255, 236, 207, 245)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text('LOGIN', style: TextStyle(fontFamily: 'Mplus 1p', fontSize: 40, color: Color.fromARGB(255, 0, 0, 0))),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FormBuilder(
                    key: _formKey,
                    initialValue: {'email': '', 'password ': ''},
                    child: Column(
                      children: [
                        Container(
                          width: 300, // Set the desired width for the text field
                          child: FormBuilderTextField(
                            name: 'email',
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 20),
                              labelText: 'EMAIL',
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(errorText: 'Please insert email'),
                              FormBuilderValidators.email(),
                            ]),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: 300, // Set the desired width for the text field
                          child: FormBuilderTextField(
                            name: 'password',
                            obscureText: true,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 20),
                              labelText: 'PASSWORD',
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(errorText: 'Please insert password'),
                              FormBuilderValidators.minLength(8, errorText: 'Minimum length 8 characters'),
                            ]),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 200,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Color.fromRGBO(249, 114, 114, 1.0), // Set button color to red
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5), // Add shadow
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: MaterialButton(
                              onPressed: () => _login(context),
                              child: Text("LOGIN", style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
                            ),
                          ),
                        ),
                        SizedBox(height: 1),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: 300, // Set the desired width for the button
                                child: MaterialButton(
                                  onPressed: () {
                                    // open Homepage
                                    Navigator.pushNamed(context, '/');
                                  },
                                  child: Text('Continue as Guest', style: TextStyle(color: const Color.fromARGB(255, 0, 88, 160))),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
