import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entities/auth.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/button.dart';
import '../widgets/check_box.dart';
import '../widgets/label.dart';
import '../widgets/logo.dart';
import '../widgets/text_field.dart';
import 'sign_in_page.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ErrorState) {
            // Clear the text fields
            emailController.clear();
            passwordController.clear();
            nameController.clear();
            confirmPasswordController.clear();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                duration: const Duration(seconds: 2),
              ),
            );

            context.read<AuthBloc>().add(AuthInitialEvent());
          } else if (state is UserSignedUp) {
            if (state.isSignedUp) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Registered successfully!'),
                  duration: Duration(seconds: 2),
                ),
              );

              Future.delayed(const Duration(seconds: 2), () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              });
            }
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 30, top: 50, right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Color.fromARGB(255, 63, 81, 243),
                        ),
                      ),
                      const Spacer(),
                      Logo(),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  const Text(
                    'Create your account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      // : 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Label(text: 'Name'),
                  TextFields(
                    hintText: 'ex: Jon Smith',
                    inputController: nameController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Label(text: 'Email'),
                  TextFields(
                    hintText: 'ex: jon.smith@email.com',
                    inputController: emailController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Label(text: 'Password'),
                  TextFields(
                    hintText: '********',
                    inputController: passwordController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Label(text: 'Confirm password'),
                  TextFields(
                    hintText: '********',
                    inputController: confirmPasswordController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CheckBoxClass(
                    initialValue: false,
                    onChanged: (bool? value) {
                      print('Checkbox state: $value');
                    },
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Button('SIGN UP', () {
                    final email = emailController.text;
                    final name = nameController.text;
                    final password = passwordController.text;
                    final confirmPassword = confirmPasswordController.text;

                    if (name.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Name cannot be empty'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }

                    if (password.isEmpty || email.isEmpty || confirmPassword.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill all fields correctly!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }

                    if (password != confirmPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Passwords don\'t match'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }

                    final user = Auth(name: name, email: email, password: password);

                    context.read<AuthBloc>().add(SignUpEvent(user: user));
                  }),
                  SizedBox(height: screenHeight * 0.15),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Have an account? ',
                        style: const TextStyle(
                          // : 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'SIGN IN',
                            style: const TextStyle(
                              // : 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color.fromARGB(255, 63, 81, 243),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignInPage(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
