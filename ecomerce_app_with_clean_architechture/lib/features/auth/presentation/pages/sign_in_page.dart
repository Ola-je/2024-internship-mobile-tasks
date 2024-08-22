import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/failure/failure.dart';
import '../../../../views/home_page.dart';
import '../../domain/entities/auth.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/button.dart';
import '../widgets/label.dart';
import '../widgets/logo.dart';
import '../widgets/text_field.dart';
import 'sign_up_page.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ErrorState) {
            Failure(state.message);
      
            emailController.clear();
            passwordController.clear();
      
            context.read<AuthBloc>().add(AuthInitialEvent());
          } else if (state is UserSignedIn) {
            if (state.isSignedIn) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            } else {
              Failure('Login Failed Please try again');
              emailController.clear();
              passwordController.clear();
      
              context.read<AuthBloc>().add(AuthInitialEvent());
            }
          }
        },
        builder: (context, state) {
          backgroundColor:
          Colors.white;
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.2,
                  ),
                  Center(
                    child: Logo(
                      logoHeight: 0.07,
                      logoWidth: 0.4,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  const Text(
                    'Sign in to your account',
                    style: TextStyle(
                      // fontFamily: 'Poppins',
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Label(text: 'Email'),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  TextFields(
                    hintText: 'ex: jon.smith@email.com',
                    inputController: emailController,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Label(text: 'Password'),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  TextFields(
                    hintText: 'Password',
                    inputController: passwordController,
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Center(
                    child: Button('Sign In', () {
                      Auth user = Auth(
                          name: '',
                          email: emailController.text,
                          password: passwordController.text);
      
                      context.read<AuthBloc>().add(SignInEvent(user: user));
      
                      print('login request from signin');
                    }),
                  ),
                  SizedBox(
                    height: screenHeight * 0.15,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          text: 'Don\'t have an account? ',
                          style: TextStyle(
                              // fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.grey),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'SIGN UP',
                              style: TextStyle(
                                // fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color.fromARGB(255, 63, 81, 243),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUpPage()));
                                },
                            )
                          ]),
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
