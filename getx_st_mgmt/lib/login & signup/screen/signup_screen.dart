import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_st_mgmt/login%20&%20signup/controller/signup_controller.dart';
import 'package:getx_st_mgmt/login%20&%20signup/utils/utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  SignupController signupController = Get.put(SignupController());

  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX SignUp'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: const EdgeInsets.all(25),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: signupController.emailController.value,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocus,
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(context, emailFocus, passFocus);
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your Email',
                  prefixIcon: Icon(Icons.person_3_outlined),
                  label: Text('Enter your Email'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => TextFormField(
                  controller: signupController.passController.value,
                  obscureText: signupController.visibilityToggle.value,
                  focusNode: passFocus,
                  decoration: InputDecoration(
                    hintText: 'Enter your Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        signupController.visibilityToggle.value =
                            !signupController.visibilityToggle.value;
                        signupController.setVisibility(
                            signupController.visibilityToggle.value);
                      },
                      child: Icon(
                        signupController.visibilityToggle.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    label: const Text('Enter your Password'),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Obx(
                () {
                  return SizedBox(
                    height: 50,
                    width: 280,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.blue[200])),
                      onPressed: () {
                        signupController.signupApi();
                        Get.toNamed('/LoginScreen');
                      },
                      child: signupController.loading.value
                          ? const Center(child: CircularProgressIndicator())
                          : const Text(
                              'Signup',
                              style: TextStyle(fontSize: 20),
                            ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an Account? '),
                  GestureDetector(
                    onTap: () {
                      Get.offAndToNamed('/LoginScreen');
                    },
                    child: Text(
                      'Login ',
                      style: TextStyle(color: Colors.blue[500]),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
