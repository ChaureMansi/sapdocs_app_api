import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdocs_app_api/LoginScreen/presentation/view/login_screen.dart';
import 'package:sapdocs_app_api/RegisterScreen/data/repository.dart';
import 'package:sapdocs_app_api/RegisterScreen/presenatation/bloc/register_bloc.dart';
import 'package:sapdocs_app_api/RegisterScreen/presenatation/bloc/register_event.dart';
import 'package:sapdocs_app_api/RegisterScreen/presenatation/bloc/register_state.dart';
import 'package:sapdocs_app_api/pallete.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  String _selectedRole = 'patient';

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _specializationController = TextEditingController();
  TextEditingController _experienceController = TextEditingController();
  TextEditingController _diseaseController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(registerRepository: RegisterRepository()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
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
                ),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: BlocListener<RegisterBloc, RegisterState>(
                        listener: (context, state) {
                          if (state is RegisterSuccess) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Registration Successful'),
                                  content: Text('You can now proceed to login.'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => LoginScreen()),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else if (state is RegisterFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.error)),
                            );
                          }
                        },
                        child: BlocBuilder<RegisterBloc, RegisterState>(
                          builder: (context, state) {
                            return Column(
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
                                SizedBox(height: 5),
                                Text(
                                  'Register',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Pallete.main,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 28,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Enter new account’s details',
                                  style: TextStyle(
                                    color: Pallete.lighttext,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 15),
                                SizedBox(
                                  width: 350,
                                  height: 40,
                                  child: TextFormField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: "Email",
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Pallete.main),
                                      ),
                                      prefixIcon: Icon(Icons.email, color: Pallete.main),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                  width: 350,
                                  height: 40,
                                  child: TextFormField(
                                    controller: _passwordController,
                                    obscureText: _obscureText,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureText ? Icons.visibility : Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Pallete.main),
                                      ),
                                      prefixIcon: Icon(Icons.lock, color: Pallete.main),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                  width: 350,
                                  height: 40,
                                  child: TextFormField(
                                    controller: _confirmPasswordController,
                                    obscureText: _obscureText,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: "Confirm Password",
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureText ? Icons.visibility : Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Pallete.main),
                                      ),
                                      prefixIcon: Icon(Icons.lock, color: Pallete.main),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                  width: 350,
                                  height: 40,
                                  child: TextFormField(
                                    controller: _mobileController,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      labelText: "Mobile Number",
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Pallete.main),
                                      ),
                                      prefixIcon: Icon(Icons.phone, color: Pallete.main),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your mobile number';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                height: 60,
                                width: 350,
                                  child: DropdownButtonFormField<String>(
                                    value: _selectedRole,
                                    items: [
                                      DropdownMenuItem(
                                        value: 'patient',
                                        child: Text('Patient'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'doctor',
                                        child: Text('Doctor'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedRole = value!;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Select Role',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Pallete.main),
                                      ),
                                    ),
                                  ),
                                ),
                                if (_selectedRole == 'doctor') ...[
                                  SizedBox(height: 20),
                                  SizedBox(
                                    width: 350,
                                    height: 40,
                                    child: TextFormField(
                                      controller: _specializationController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        labelText: "Specialization",
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Pallete.main),
                                        ),
                                        prefixIcon: Icon(Icons.local_hospital, color: Pallete.main),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your specialization';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  SizedBox(
                                    width: 350,
                                    height: 40,
                                    child: TextFormField(
                                      controller: _experienceController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        labelText: "Experience",
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Pallete.main),
                                        ),
                                        prefixIcon: Icon(Icons.school, color: Pallete.main),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your experience';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ] else if (_selectedRole == 'patient') ...[
                                  SizedBox(height: 20),
                                  SizedBox(
                                    width: 350,
                                    height: 40,
                                    child: TextFormField(
                                      controller: _diseaseController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        labelText: "Disease",
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Pallete.main),
                                        ),
                                        prefixIcon: Icon(Icons.local_hospital, color: Pallete.main),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your disease';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  SizedBox(
                                    width: 350,
                                    height: 40,
                                    child: TextFormField(
                                      controller: _ageController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        labelText: "Age",
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Pallete.main),
                                        ),
                                        prefixIcon: Icon(Icons.calendar_today, color: Pallete.main),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your age';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                                SizedBox(height: 30),
                                if (state is RegisterLoading)
                                  CircularProgressIndicator()
                                else
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Pallete.main,
                                      padding: EdgeInsets.symmetric(horizontal: 135.0, vertical: 15.0),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        BlocProvider.of<RegisterBloc>(context).add(
                                          RegisterSubmitted(
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                            confirmPassword: _confirmPasswordController.text,
                                            mobile: _mobileController.text,
                                            role: _selectedRole,
                                            specialization: _specializationController.text,
                                            experience: _experienceController.text,
                                            disease: _diseaseController.text,
                                            age: _ageController.text,
                                          ),
                                        );
                                      }
                                    },
                                    child: Text(
                                      'Register',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                 SizedBox(height: 3),
                          SizedBox(
                            width: 350,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already on Sapdos?',
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
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Sign-In',
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
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
