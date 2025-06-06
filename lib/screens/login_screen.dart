import 'package:flutter/material.dart';
import 'package:real_state_app_flutter/const/colors.dart';
import 'package:real_state_app_flutter/const/font_style.dart';
import 'package:real_state_app_flutter/screens/bottom_nav_screen.dart';
import 'package:real_state_app_flutter/screens/splash_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
static const String screenName='/login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          ///logo
          Expanded(
            flex: 1,
            child: Image.asset('assets/images/logo_white.png', width: size.width * 0.6),
          ),

          ///body
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(25),
              width: size.width,
              decoration: BoxDecoration(
                color: MyColors.bottomSheetColor,

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),
              child: Column(
                spacing: 20,
                children: [
                  Text(
                    'Login',
                    style: getLargeTitleStyle(context, fontWeight: FontWeight.bold),
                  ),

                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: MyColors.lightColor,
                    ),

                    child: Form(
                      key: globalKey,
                      child: Column(
                        spacing: 5,
                        children: [
                          TextFormField(
                            controller: emailController,
                            decoration: customDecoration(
                              icon: Icons.email_outlined,
                              iconColor: Colors.orange,
                              label: 'email',
                              iconBackgroundColor: Colors.orange.shade100,
                            ),

                            validator: emailValidator,
                          ),

                          Divider(),

                          TextFormField(
                            controller: passwordController,
                            decoration: customDecoration(
                              icon: Icons.lock_open,
                              iconColor: Colors.blueAccent,
                              label: 'Password',
                              iconBackgroundColor: Colors.blue.shade100,
                            ),

                            validator: passwordValidator,
                          ),
                        ],
                      ),
                    ),
                  ),
                  buttonSection(size),

                  SizedBox(height: 30),
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.facebook),
                        radius: 30,
                        backgroundColor: MyColors.lightColor,
                      ),
                      CircleAvatar(
                        child: Icon(Icons.apple),
                        radius: 30,
                        backgroundColor: MyColors.lightColor,
                      ),
                      CircleAvatar(
                        child: Icon(Icons.telegram),
                        radius: 30,
                        backgroundColor: MyColors.lightColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buttonSection(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: Text('Forget Password?', style: getSmallBodyStyle(context)),
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.primaryColor,
            fixedSize: Size(size.width * 0.35, 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),

          onPressed: () {
            if (globalKey.currentState!.validate()) {



              Navigator.of(context).pushReplacementNamed(BottomNavScreen.screenName);



            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('این یک اسنک‌بار است!'),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 3),
                  dismissDirection: DismissDirection.startToEnd,
                  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  //  behavior: SnackBarBehavior.fixed,
                  // action: SnackBarAction(
                  //   label: 'Undo',
                  //   textColor: Colors.white,
                  //
                  //   onPressed: () {
                  //     // یک عملیات را برگردان (optional)
                  //     ScaffoldMessenger.of(
                  //       context,
                  //     ).showSnackBar(SnackBar(content: Text('عملیات بازگردانده شد')));
                  //   },
                  // ),
                ),
              );
            }
          },
          child: Text(
            'Login',
            style: getBodyStyle(
              context,
              color: MyColors.lightColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration customDecoration({
    required String label,
    required IconData icon,
    required Color iconColor,
    required Color iconBackgroundColor,
  }) {
    return InputDecoration(
      border: InputBorder.none,
      labelText: label,
      labelStyle: getSmallBodyStyle(context, color: MyColors.grey),
      prefixIcon: Container(
        decoration: BoxDecoration(
          color: iconBackgroundColor,
          borderRadius: BorderRadius.circular(50),
        ),

        child: Icon(icon, color: iconColor, size: 22),
      ),
    );
  }

  String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your email';
    }

    if (value.length <= 20) {
      return 'your email is too Long';
    }

    if (!value.endsWith('@gmail.com')) {
      return 'your email is not valid';
    }

    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your password';
    }

    if (value.length <= 6) {
      return 'your password is too short';
    }

    return null;
  }
}
