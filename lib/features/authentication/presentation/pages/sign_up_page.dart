import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:medg/features/authentication/presentation/pages/login_page.dart';
import '../../../../../core/widgets/w_button.dart';
import '../../../../../core/widgets/w_divider.dart';
import '../../../../assets/colors.dart';
import '../../../../assets/icons.dart';
import '../../../../assets/images.dart';

class SignUp extends StatefulWidget {
  static Route route() => MaterialPageRoute(
    builder: (_) => const SignUp(),
  );

  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoginDataValid = false;
  final mailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  final mailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final textFieldContentStyle = const TextStyle(
    color: AppColors.grey,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  final formKey = GlobalKey<FormState>();

  bool isObscure = true;

  InputDecoration decoration({
    required String hintText,
    Widget? suffixIcon,
  }) =>
      InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13.5),
        hintStyle: TextStyle(
          color: AppColors.grey.withOpacity(.6),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        fillColor: AppColors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.grey.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.grey.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.grey.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
      );

  @override
  void initState() {
    mailTextEditingController.addListener(() {
      if (formKey.currentState!.validate()) {
        if (!isLoginDataValid) {
          setState(() {
            isLoginDataValid = true;
          });
        }
      } else {
        if (isLoginDataValid) {
          setState(() {
            isLoginDataValid = false;
          });
        }
      }
    });

    passwordTextEditingController.addListener(() {
      if (formKey.currentState!.validate()) {
        if (!isLoginDataValid) {
          setState(() {
            isLoginDataValid = true;
          });
        }
      } else {
        if (isLoginDataValid) {
          setState(() {
            isLoginDataValid = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    mailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    mailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        actions: [
          SvgPicture.asset(AppImages.logo),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (FocusScope.of(context).hasFocus) {
            FocusScope.of(context).unfocus();
          }
        },
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text("Ro'yxatdan o'tish",style: TextStyle(color: AppColors.darkBlue,fontWeight: FontWeight.w700,fontSize: 20),),
                const Gap(44),
                TextFormField(
                  style: textFieldContentStyle,
                  cursorColor: AppColors.darkBlue,
                  focusNode: mailFocusNode,
                  controller: mailTextEditingController,
                  decoration: decoration(hintText: 'Email'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  onEditingComplete: () {
                    passwordFocusNode.requestFocus();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Iltimos, mail kiriting!';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Iltimos, yaroqli mail manzilini kiriting';
                    }

                    return null;
                  },
                ),
                const Gap(16),
                TextFormField(
                  style: textFieldContentStyle,
                  cursorColor: AppColors.darkBlue,
                  focusNode: passwordFocusNode,
                  controller: passwordTextEditingController,
                  decoration: decoration(
                    hintText: 'Maxfiylik kaliti',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 13.5),
                        child: SvgPicture.asset(
                          isObscure ? AppIcons.eye_off : AppIcons.eye_off,
                        ),
                      ),
                    ),
                  ),
                  onEditingComplete: () {},
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isObscure,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password!';
                    } else if (value.length < 7) {
                      return 'Password must be at least 8 characters long';
                    }

                    return null;
                  },
                ),
                const Gap(12),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                    },
                    child: const Text(
                      'Maxfiylik kalitini unutdingizmi?',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.buttonColor,
                      ),
                    ),
                  ),
                ),
                const Gap(16),
                WButton(
                  isDisabled: !isLoginDataValid,
                  onTap: () async {
                    try {
                      await auth.createUserWithEmailAndPassword(
                        email: mailTextEditingController.text,
                        password: passwordTextEditingController.text,
                      );

                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "User creation failed: $e",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }
                  },
                  text: "Ro'yxatdan o'tish",
                ),
                const Gap(56),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:  Container(
        width: double.maxFinite,
        color: AppColors.white,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 18),
            child: const Text(
              "Kirish",
              style: TextStyle(fontSize: 14, color: AppColors.darkBlue),
            ),
          ),
        ),
      ),
    );
  }
}

