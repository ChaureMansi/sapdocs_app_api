import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdocs_app_api/DoctorAppointmentScreen/presentation/screens/doctor_screen.dart';
import 'package:sapdocs_app_api/DoctorListScreen/screens/doctorlist.dart';
import 'package:sapdocs_app_api/LoginScreen/data/repository.dart';
import 'package:sapdocs_app_api/LoginScreen/presentation/bloc/login_bloc.dart';
import 'package:sapdocs_app_api/LoginScreen/presentation/bloc/login_event.dart';
import 'package:sapdocs_app_api/LoginScreen/presentation/bloc/login_state.dart';
import 'package:sapdocs_app_api/RegisterScreen/presenatation/screens/register_screen.dart';
import 'package:sapdocs_app_api/pallete.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(Repository()),
      child: LoginScreenContent(),
    );
  }
}

class LoginScreenContent extends StatefulWidget {
  @override
  _LoginScreenContentState createState() => _LoginScreenContentState();
}

class _LoginScreenContentState extends State<LoginScreenContent> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/doctor.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text(
                        "SAPDOCS",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 55,
                          color: Pallete.main,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 70),
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Pallete.main,
                          fontWeight: FontWeight.w900,
                          fontSize: 28,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Enter existing account\'s details',
                        style: TextStyle(
                          color: Pallete.lighttext,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        width: 350,
                        height: 60,
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Pallete.main),
                            ),
                            prefixIcon: Icon(Icons.email, color: Pallete.main),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: 350,
                        height: 60,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: _obscureText,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: _toggleObscureText,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Pallete.main),
                            ),
                            prefixIcon: Icon(Icons.lock, color: Pallete.main),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccess) {
                            _showDialog('Login Successful', 'Welcome back, ${state.email}!', state.role);
                          } else if (state is LoginFailure) {
                            _showDialog('Login Failed', 'Invalid username or password.');
                          } else if (state is LoginError) {
                            _showDialog('Error', 'Failed to connect to server. Please try again later.');
                          }
                        },
                        builder: (context, state) {
                          return SizedBox(
                            width: 350,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: state is LoginLoading
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<LoginBloc>().add(
                                              LoginButtonPressed(
                                                email: _emailController.text.trim(),
                                                password: _passwordController.text.trim(),
                                              ),
                                            );
                                      }
                                    },
                              child: state is LoginLoading
                                  ? CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                    )
                                  : Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                    ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                fixedSize: const Size(300, 40),
                                backgroundColor: Pallete.main,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 40),
                      SizedBox(
                        width: 350,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Not on Sapdos?',
                              style: TextStyle(
                                fontSize: 16,
                                color: Pallete.main,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                                );
                              },
                              child: Text(
                                'Sign-up',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Pallete.main,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Pallete.main,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(String title, String content, [String? role]) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
              if (role != null) {
                _navigateBasedOnRole(role);
              }
            },
          ),
        ],
      ),
    );

    // Log message to console
    print('Dialog shown: $title - $content');
  }

  void _navigateBasedOnRole(String role) {
    if (role == 'doctor') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DoctorScreen()),
      );
    } else if (role == 'patient') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DoctorList()),
      );
    }

    // Log message to console
    print('Navigated to screen based on role: $role');
  }
}
