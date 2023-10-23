// ignore_for_file: deprecated_member_use
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/auth/cubit/cubit.dart';
import 'package:graduation_project/auth/cubit/states.dart';
import 'package:graduation_project/shared/components/components.dart';
import '../generated/l10n.dart';
import '../home layouts/home.dart';
import '../modules/settings/cubit.dart';
import '../shared/networks/local/cache_helper.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var userController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
        if (state is SuccesssSignState) {
          if (state.authModel!.status!) {
            // print(state.authModel!.data!.email);
            // showToast(
            //     text: "${state.authModel!.message}",
            //     state: ToastStates.Successful);
            CacheHelper.saveData(
                    key: 'token', value: state.authModel!.data!.token!)
                .then(
              (value) {
                naviAndFinish(context, HomePage());
              },
            );
            CacheHelper.saveData(
                key: 'email', value: state.authModel!.data!.email);
            CacheHelper.saveData(
                key: 'name', value: state.authModel!.data!.name);
          } else {
            showToast(
                text: "${state.authModel!.message}", state: ToastStates.Error);
          }
        }
      }, builder: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                        gradient: LinearGradient(
                            colors: SettingCubit.get(context).isDark
                                ? [
                                    Colors.white60,
                                    Colors.grey[800]!,
                                  ]
                                : [Colors.lightBlueAccent, Colors.white])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/images/icon.png',
                            width: 250,
                            height: 190,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Medical Assistant',
                              style: TextStyle(
                                  fontSize: 35,
                                  letterSpacing: 2,
                                  color: SettingCubit.get(context).isDark
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kalam'),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Align(
                                alignment: isArabic()
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Text(
                                  S.of(context).create_ac,
                                  style: TextStyle(
                                    fontSize: isArabic() ? 26 : 23,
                                    color: Color.fromARGB(255, 74, 101, 114),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              TextFF(context,
                                  labelText: S.of(context).nameAuth,
                                  controller: userController,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(30)
                                  ], validate: (value) {
                                if (value!.isEmpty) {
                                  return S.of(context).nameAuth;
                                }
                                return null;
                              },
                                  fontSize: 12,
                                  prefixIcon: Icon(Icons.person),
                                  keyboardType: TextInputType.name,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(width: 1))),

                              const SizedBox(
                                height: 15,
                              ),
                              TextFF(context,
                                  labelText: S.of(context).emailAuth,
                                  controller: emailController,
                                  fontSize: 12,
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(width: 1)),
                                  validate: (value) {
                                if (value!.isEmpty) {
                                  return S.of(context).emailAuth;
                                } else if (value.trim().isEmpty ||
                                    !value.contains("@")) {
                                  return isArabic()
                                      ? "صيغة البريد غير صحيحة"
                                      : "Email format is incorrect";
                                } else {
                                  return null;
                                }
                              }, keyboardType: TextInputType.emailAddress),

                              const SizedBox(
                                height: 15,
                              ),
                              TextFF(context,
                                  labelText: S.of(context).phoneAuth,
                                  controller: phoneController,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(11)
                                  ], validate: (value) {
                                if (value == null || value.isEmpty) {
                                  return S.of(context).phoneAuth;
                                } else if (value.length < 11) {
                                  return isArabic()
                                      ? "رقم الهاتف غير صحيح"
                                      : "Mobile number is incorrect";
                                } else {
                                  return null;
                                }
                              },
                                  fontSize: 12,
                                  prefixIcon: Icon(Icons.phone),
                                  keyboardType: TextInputType.phone,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(width: 1))),

                              const SizedBox(
                                height: 15,
                              ),
                              TextFF(context,
                                  labelText: S.of(context).passAuth,
                                  controller: passwordController,
                                  fontSize: 12, validate: (value) {
                                if (value!.isEmpty) {
                                  return S.of(context).passAuth;
                                } else if (value.length < 6) {
                                  return isArabic()
                                      ? "كلمة السر قصبره جدا"
                                      : "The password is too short";
                                }
                                return null;
                              },
                                  obscureText:
                                      AuthCubit.get(context).isPassword,
                                  prefixIcon: Icon(Icons.lock_outline),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      AuthCubit.get(context)
                                          .toggleVisiabilityPassword();
                                    },
                                    icon: AuthCubit.get(context).isPassword
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(width: 1)),
                                  keyboardType: TextInputType.text),
                              // InkWell(
                              //   onTap: () {
                              //     AuthCubit.get(context).uploadImage();
                              //   },
                              //   child: Padding(
                              //     padding:
                              //         const EdgeInsets.only(left: 8.0, top: 8),
                              //     child: Row(
                              //       children: [
                              //         Icon(
                              //           Icons.image,
                              //           color: Color.fromARGB(255, 57, 81, 93),
                              //           size: 35,
                              //         ),
                              //         Text(
                              //           'Upload image',
                              //           style: TextStyle(
                              //               color:
                              //                   Color.fromARGB(255, 57, 81, 93),
                              //               fontWeight: FontWeight.w700),
                              //         )
                              //       ],
                              //     ),
                              //   ),
                              // ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      S.of(context).have_an_ac,
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamed('login');
                                        },
                                        child: Text(
                                          S.of(context).LogNow,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                SettingCubit.get(context).isDark
                                                    ? Colors.tealAccent
                                                        .withOpacity(0.7)
                                                    : Colors.blue,
                                          ),
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ConditionalBuilder(
                    condition: state is! LoadingSignState,
                    fallback: (context) => CircularProgressIndicator(),
                    builder: (context) => MaterialButton(
                      textColor: Colors.white,
                      color: const Color.fromARGB(255, 41, 83, 117),
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.userSign(
                              name: userController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              password: passwordController.text,
                              // image: Image.file(cubit.image!
                              // )
                              );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  S.of(context).RegisterDraw,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(fontSize: isArabic() ? 17 : 22),
                                  // style: TextStyle(fontSize: 22),
                                )),
                            const Icon(
                              Icons.login,
                              size: 24,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
