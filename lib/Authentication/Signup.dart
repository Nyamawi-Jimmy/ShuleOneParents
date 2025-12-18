import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Routes/routes.dart';
import '../Widgets/DropdownWidget.dart';
import '../Widgets/TextFormFieldWidget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String? _gender;
  String? _selectedClass;
  final List<String> _classes = [
    "PP1",
    "PP2",
    "Grade 1",
    "Grade 2",
    "Grade 3",
    "Grade 4",
    "Grade 5",
    "Grade 6",
  ];

  final _firstnameController = TextEditingController();
  final _middlenameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _admnoController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPinController = TextEditingController();


  bool _showPin = false;
  bool _showConfirmPin = false;


  void _submitForm() {
    if (_formKey.currentState!.validate() ) {
      // TODO: Connect to API
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account created successfully!")),
      );
    }
  }

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
            image: AssetImage("assets/images/shuleone.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.95), // adjust opacity here
              BlendMode.darken, // or softLight, multiply
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: screenHeight * 0.12),
                    Text("Sign Up", style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    )),
                    SizedBox(
                        height: screenHeight * 0.04),
                    Text("Welcome!", style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                    )),
                    SizedBox(
                        height: screenHeight * 0.01),
                    Text("Create Account", style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    )),

                    SizedBox(
                        height: screenHeight * 0.02),
                    CustomTextField(
                      label: "First Name",
                      hint: "Enter your firstName",
                      controller: _firstnameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "FirstName is required";
                        }
                        return null;
                      },
                      suffixIcon: Icons.person_2_outlined,
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // National ID
                    CustomTextField(
                      label: "Middle Name",
                      hint: "Enter your middle name",
                      controller: _middlenameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Middle Name is Requirred";
                        }
                        return null;
                      },
                      suffixIcon: Icons.person_pin,
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Date of Birth
                    CustomTextField(
                      label: "Last Name",
                      hint: "Enter your middle name",
                      controller: _lastnameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Lat Name is Requirred";
                        }
                        return null;
                      },
                      suffixIcon: Icons.person_pin,
                    ),

                    SizedBox(height: screenHeight * 0.02),
                    CustomTextField(
                      label: "User Name",
                      hint: "Enter username",
                      controller: _usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "User Name is Required";
                        }
                        return null;
                      },
                      suffixIcon: Icons.person_pin,
                    ),

                    // Gender
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextField(
                      label: "Admission Number",
                      hint: "Enter Admission Number",
                      controller: _admnoController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Admission Number is Required";
                        }
                        return null;
                      },
                      suffixIcon: Icons.person_pin,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomDropdownField<String>(
                      label: "Select Class",
                      value: _selectedClass,
                      items: _classes, // your list of classes
                      onChanged: (value) {
                        setState(() {
                          _selectedClass = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) return "Please select a class";
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Contact Information",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.02),
                    CustomTextField(
                      label: "Phone Number",
                      hint: "Enter your phone number",
                      controller: _phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Phone number required";
                        if (value.length < 9)
                          return "Enter a valid phone number";
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      suffixIcon: Icons.phone,
                    ),

                    // Phone Number
                    SizedBox(height: screenHeight * 0.02),

                    // Email
                    CustomTextField(
                      label: "Email",
                      hint: "Enter your email",
                      controller: _emailController,
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          if (!value.contains("@"))
                            return "Enter a valid email";
                        }
                        return null;
                      },
                      suffixIcon: Icons.email,
                    ),

                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Security Informaton",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),
                    // PIN
                    CustomTextField(
                      label: "Password",
                      hint: "Create Password",
                      controller: _passwordController,
                      keyboardType: TextInputType.number,
                      obscure: !_showPin,
                      suffixIcon: _showPin
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onTap: () => setState(() => _showPin = !_showPin),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "PIN is required";
                        if (value.length < 4 || value.length > 6)
                          return "Password must be 4–6 digits";
                        return null;
                      },
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Confirm PIN
                    CustomTextField(
                      label: "Confirm Pin",
                      hint: "Re-enter your PIN",
                      controller: _confirmPinController,
                      keyboardType: TextInputType.number,
                      obscure: !_showConfirmPin,
                      suffixIcon: _showConfirmPin
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onTap: () =>
                          setState(() => _showConfirmPin = !_showConfirmPin),
                      validator: (value) {
                        if (value != _passwordController.text)
                          return "PINs do not match";
                        return null;
                      },
                    ),

                    SizedBox(height: screenHeight * 0.02),


                    // Submit Button
                    Column(
                      children: [
                        SizedBox(height: screenHeight * 0.02),

                        // Already have an account?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteHelper.signin,
                                );
                              },
                              child: Text(
                                "Login",
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _submitForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:Theme.of(context)
                                  .primaryColor,
                              foregroundColor: Colors.white,
                              // text color
                              minimumSize: const Size.fromHeight(50),
                              // height
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text("CREATE ACCOUNT"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }

  Widget genderSelector() {
    final theme = Theme.of(context);

    return Row(
      children: [
        GestureDetector(
          onTap: () => setState(() => _gender = "Male"),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade400),
              color: _gender == "Male"
                  ? theme.colorScheme.primary
                  : theme.disabledColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.male, size: 20, color: theme.colorScheme.secondary),
                const SizedBox(width: 6),
                Text("Male", style: theme.textTheme.bodyMedium!),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: () => setState(() => _gender = "Female"),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade400),
              color: _gender == "Female"
                  ? theme.colorScheme.primary
                  : theme.disabledColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.female,
                  size: 20,
                  color: theme.colorScheme.secondary,
                ),
                const SizedBox(width: 6),
                Text("Female", style: theme.textTheme.bodyMedium!),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
