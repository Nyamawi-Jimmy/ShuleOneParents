import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod/src/framework.dart';
import 'package:shuleoneparents/Authentication/registernotifier/classes_notifier.dart';
import 'package:shuleoneparents/Authentication/registernotifier/nextAdmNotifier.dart';
import 'package:shuleoneparents/Authentication/registernotifier/register_notifier.dart';

import '../Routes/routes.dart';
import '../Widgets/DropdownWidget.dart';
import '../Widgets/TextFormFieldWidget.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String? _gender;
  String? _selectedClass;
  bool _showPin = false;
  bool _showConfirmPin = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerProvider);
    final classesAsync = ref.watch(classesProvider);
    final nextAdmValue = ref.watch(nextAdmProvider).value;
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
                      func: (value) {
                        ref
                            .read(registerProvider.notifier)
                            .onFirstNameChanged(value);
                      },
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
                      func: (value) {
                        ref
                            .read(registerProvider.notifier)
                            .onMiddleNameChanged(value);
                      },
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
                      func: (value) {
                        ref
                            .read(registerProvider.notifier)
                            .onLastNameChanged(value);
                      },
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
                      func: (value) {
                        ref
                            .read(registerProvider.notifier)
                            .onUserNameChanged(value);
                      },

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
                      initialValue: nextAdmValue?.nextadm ?? "",
                      func: (value) {
                        ref.read(registerProvider.notifier).onadmChanged(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Admission Number is Required";
                        }
                        return null;
                      },
                      suffixIcon: Icons.numbers,
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    classesAsync.when(
                      loading: () => const CircularProgressIndicator(),
                      error: (err, _) => Text(
                        'Failed to load classes',
                        style: TextStyle(color: Colors.red),
                      ),
                      data: (classes) {
                        return CustomDropdownField<String>(
                          label: "Select Class",
                          value: _selectedClass,
                          items: classes.map((c) => c.classField).toList(),
                          onChanged: (value) {
                            if (value == null) return;

                            setState(() {
                              _selectedClass = value;
                            });
                            ref
                                .read(registerProvider.notifier)
                                .onselectedClassChanged(value);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please select a class";
                            }
                            return null;
                          },
                        );
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
                      func: (value) {
                        ref
                            .read(registerProvider.notifier)
                            .onPhoneNumberchanged(value);
                      },
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
                      func: (value) {
                        ref
                            .read(registerProvider.notifier)
                            .onemailChanged(value);
                      },
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
                      func: (value) {
                        ref
                            .read(registerProvider.notifier)
                            .onpasswordChanged(value);
                      },
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
                      func: (value) {
                        ref
                            .read(registerProvider.notifier)
                            .onconfirmpasswordChanged(value);
                      },
                      keyboardType: TextInputType.number,
                      obscure: !_showConfirmPin,
                      suffixIcon: _showConfirmPin
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onTap: () =>
                          setState(() => _showConfirmPin = !_showConfirmPin),
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
                            onPressed: () {
                              ref.read(registerProvider.notifier).register();
                            },
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
