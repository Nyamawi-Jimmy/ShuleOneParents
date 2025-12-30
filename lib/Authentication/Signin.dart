import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../Routes/routes.dart';
import '../Widgets/TextFormFieldWidget.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _pinController = TextEditingController();
  bool _showPin = false;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/shuleone.png",),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.95), // adjust opacity here
              BlendMode.darken, // or softLight, multiply
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 30),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: screenHeight * 0.07),
                  Text("Log In", style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    fontWeight: FontWeight.bold
                  )),
                  SizedBox(
                      height: screenHeight * 0.04),
                  Text("Welcome Back!", style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                  )),
                  SizedBox(
                      height: screenHeight * 0.01),
                  Text("Enter Your Account Details", style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  )),

                  SizedBox(
                      height: screenHeight * 0.02),

                  // PHONE NUMBER
                  CustomTextField(
                    label: "Username",
                    hint: "Enter your username",
                    controller: _phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username required";
                      }
                      if (value.length < 9) {
                        return "Enter a valid Username";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    suffixIcon: Icons.email,
                  ),


                  SizedBox(height: screenHeight * 0.02),

                  // PIN
                  CustomTextField(
                    label: "Password",
                    hint: "****",
                    controller: _pinController,
                    keyboardType: TextInputType.number,
                    obscure: !_showPin,
                    suffixIcon:
                    _showPin ? Icons.visibility : Icons.visibility_off,
                    onTap: () => setState(() => _showPin = !_showPin),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (value.length < 4 || value.length > 6) {
                        return "Password must be 4–6 digits";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, RouteHelper.resetpasswordpage);
                    },
                    child: Text(
                      "Forgot password?",
                      style: theme.textTheme?.titleSmall?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.20),

                  // Create Account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont have an account?",
                        style: theme.textTheme.titleSmall?.copyWith(
                            color: Colors.white
                        ),),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(
                              context,
                              RouteHelper.signup  ,
                            ),
                        child: Text(
                          "Create One",
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // LOGIN BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteHelper.studentprofiles);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Login"),
                    ),
                  ),

                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
