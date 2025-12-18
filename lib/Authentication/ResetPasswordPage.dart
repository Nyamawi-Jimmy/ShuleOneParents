import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../Routes/routes.dart';
import '../Widgets/TextFormFieldWidget.dart';

class Resetpasswordpage extends StatefulWidget {
  const Resetpasswordpage({super.key});

  @override
  State<Resetpasswordpage> createState() => _ResetpasswordpageState();
}

class _ResetpasswordpageState extends State<Resetpasswordpage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

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
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: screenHeight * 0.15),
                  Text("Reset Password", style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  )),
                  SizedBox(
                      height: screenHeight * 0.04),
                  Text("Enter the email associated with the account!", style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                  )),
                  SizedBox(
                      height: screenHeight * 0.02),

                  // PHONE NUMBER
                  CustomTextField(
                    label: "Email",
                    hint: "Enter your email",
                    controller: _emailController,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        if (!value.contains("@")) return "Enter a valid email";
                      }
                      return null;
                    },
                    suffixIcon: Icons.email,
                  ),


                  SizedBox(height: screenHeight * 0.40),

                  // Create Account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Bck to Login? ",
                        style: theme.textTheme.titleSmall?.copyWith(
                            color: Colors.white
                        ),),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(
                              context,
                              RouteHelper.signin,
                            ),
                        child: Text(
                          "Login",
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
                        //Navigator.pushNamed(context, RouteHelper.homepage);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Request Reset Link"),
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
