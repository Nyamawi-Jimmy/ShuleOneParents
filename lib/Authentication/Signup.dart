import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:shuleoneparents/Authentication/AuthControllers/AuthController.dart';
import '../Models/RegClassesModal.dart';
import '../Models/SignUpModal.dart';
import '../Routes/routes.dart';
import '../Widgets/DropdownWidget.dart';
import '../Widgets/TextFormFieldWidget.dart';
import 'AuthControllers/RegGetClassesController.dart';
import 'AuthControllers/getNetAdmController.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _reggetclasses();
    _loadNextAdm();
    super.initState();
  }

  void _loadNextAdm() async {
    final getNextAdmController = Get.find<Getnetadmcontroller>();
    final response = await getNextAdmController.getnextadm();

    if (response.isSuccess) {
      final List<dynamic> data = jsonDecode(response.message);
      final nextAdm = data[0]['nextadm'];
      _admnoController.text=nextAdm;
      _usernameController.text = "$nextAdm@shuleone";
    }
  }
  List<RegClassesModel> _classes = [];
  RegClassesModel? _selectedClass;
  String? _selectedClassId;

  void _reggetclasses() async {
    final getClassesController = Get.find<Reggetclassescontroller>();
    final response = await getClassesController.reggetclasses();

    if (response.isSuccess) {
      final List<dynamic> data = response.message; // If already decoded, else use jsonDecode
      setState(() {
        _classes = data.map<RegClassesModel>((e) => RegClassesModel.fromJson(e)).toList();
      });
    }
  }





  String? _gender;
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
    if (_formKey.currentState!.validate()) {
      var AuthCotroller=Get.find<AuthController>();
      RegisterModel registerModel = RegisterModel(
        firstName: _firstnameController.text,
        middleName: _middlenameController.text,
        lastName: _lastnameController.text,
        userName: _usernameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        password: _passwordController.text,
        admissionNumber: _admnoController.text,
        selectedClass:int.parse(_selectedClassId!),
      );
      print("This is it${registerModel.toString()}");
      print("Sending${registerModel.toJson()}");

      AuthCotroller.registration(registerModel).then((status){
        if(status.isSuccess){
          print("Account created successfully!");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Account created successfully!")),
          );
        }else{
          status.message;
        }
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
              padding: const EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 12,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.07),
                    Text(
                      "Sign Up",
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Text(
                      "Welcome!",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      "Create Account",
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),
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
                      readOnly: true,
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
                      readOnly: true,
                      controller: _admnoController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Admission Number is Required";
                        }
                        return null;
                      },
                      suffixIcon: Icons.numbers,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomDropdownField<RegClassesModel>(
                      label: "Select Class",
                      value: _selectedClass,
                      items: _classes,
                      onChanged: (value) {
                        setState(() {
                          _selectedClass = value;
                          _selectedClassId=_selectedClass?.id.toString();
                          print('Selected class id: ${_selectedClass?.id}');
                        });
                      },
                      validator: (value) {
                        if (value == null) return "Please select a class";
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
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: Colors.white),
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
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: Colors.white),
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
                      label: "Confirm Password",
                      hint: "Re-enter your Password",
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
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: Colors.white),
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
                              backgroundColor: Theme.of(context).primaryColor,
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
      ),
    );
  }

}
