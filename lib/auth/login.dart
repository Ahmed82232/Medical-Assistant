// ignore_for_file: deprecated_member_use, unused_field
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/auth/cubit/cubit.dart';
import 'package:graduation_project/auth/cubit/states.dart';
import 'package:graduation_project/modules/settings/cubit.dart';
import 'package:graduation_project/shared/components/components.dart';
import 'package:graduation_project/shared/cubit/cubit.dart';
import '../generated/l10n.dart';
import '../home layouts/home.dart';
import '../shared/components/consistant.dart';
import '../shared/networks/local/cache_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword = true;

  var formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  bool isRememberMe = false;
  @override
  void initState() {
    super.initState();
    if (isRememberMeFromShared != null && isRememberMeFromShared == true) {
      emailController.text = CacheHelper.getData(key: 'email');
      // passwordController.text = CacheHelper.getData(key: 'password') ?? '';
      print(emailController.text);
      print(passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
        if (state is SuccesssLoginState) {
          if (state.authModel!.status!) {
            // showToast(
            //     text: state.authModel!.message!, state: ToastStates.Successful);
            // print(state.authModel!.data!.email);

            CacheHelper.saveData(
                    key: 'token', value: state.authModel!.data!.token!)
                .then(
              (value) {
                naviAndFinish(context, HomePage());
              },
            );
            // CacheHelper.saveData(
            //     key: 'email', value: state.authModel!.data!.email!);
            // CacheHelper.saveData(
            //     key: 'name', value: state.authModel!.data!.name!);
          } else {
            showToast(
                text: state.authModel!.message!, state: ToastStates.Error);
          }
        }
      }, builder: (context, state) {
        if (isRememberMeFromShared != null && isRememberMeFromShared == true) {
          _email = CacheHelper.getData(key: 'email');
          // _password = CacheHelper.getData(key: 'password');
          print(emailController.text);
          // print(passwordController.text);
        }
        AuthCubit cubit = AuthCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.78,
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
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Align(
                            alignment: isArabic()
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Text(
                              S.of(context).login,
                              style: TextStyle(
                                fontSize: isArabic() ? 26 : 25,
                                fontFamily: 'Alexandria',
                                color: Color.fromARGB(255, 74, 101, 114),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                      style: const ButtonStyle(
                                        overlayColor: MaterialStatePropertyAll(
                                            Colors.transparent),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        S.of(context).forget,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      )),
                                  // if (isRememberMeFromShared == null &&
                                  //     isRememberMeFromShared == false)
                                  Row(
                                    children: [
                                      Text(
                                        S.of(context).rememberMe,
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: isArabic() ? 16 : 15),
                                      ),
                                      Checkbox(
                                        value: isRememberMe,
                                        onChanged: (value) {
                                          setState(() {
                                            isRememberMe = !isRememberMe;
                                            print(isRememberMe);
                                          });
                                          if (isRememberMe &&
                                              AppCubit.get(context).authModel !=
                                                  null &&
                                              AppCubit.get(context)
                                                      .authModel!
                                                      .data !=
                                                  null) {
                                            CacheHelper.saveData(
                                                key: 'isRememberMe',
                                                value: isRememberMe);
                                            CacheHelper.saveData(
                                                key: 'email',
                                                value: AppCubit.get(context)
                                                    .authModel!
                                                    .data!
                                                    .email);
                                            // CacheHelper.saveData(
                                            //     key: 'password',
                                            //     value: AppCubit.get(context)
                                            //         .authModel!
                                            //         .data!
                                            //         .password);
                                          }
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Row(
                                  children: [
                                    Text(
                                      S.of(context).have_not_ac,
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.popAndPushNamed(
                                              context, 'SignUp');
                                        },
                                        child: Text(
                                          S.of(context).RegNow,
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
                  SizedBox(
                    height: 20,
                  ),
                  ConditionalBuilder(
                    condition: state is! LoadingLoginState,
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
                          cubit.userLogin(
                              email: emailController.text,
                              password: passwordController.text);
                          if (login != null && login == true) {
                            if (AppCubit.get(context).authModel != null &&
                                AppCubit.get(context).authModel!.data != null) {
                              CacheHelper.saveData(
                                  key: 'email',
                                  value: AppCubit.get(context)
                                      .authModel!
                                      .data!
                                      .email);
                              CacheHelper.saveData(
                                  key: 'password',
                                  value: AppCubit.get(context)
                                      .authModel!
                                      .data!
                                      .password);
                            }
                          }
                        
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => HomePage(),
                          //     ),
                          //     (route) => false);
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
                                  S.of(context).login,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 1,
                        indent: 30,
                        endIndent: 5,
                        color: SettingCubit.get(context).isDark
                            ? Colors.white38
                            : Colors.grey[600],
                      )),
                      Center(
                        child: Text(
                          S.of(context).log_with,
                          style: TextStyle(
                              fontSize: 15,
                              color: SettingCubit.get(context).isDark
                                  ? Colors.white70
                                  : Colors.black87,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 1,
                        indent: 5,
                        endIndent: 30,
                        color: SettingCubit.get(context).isDark
                            ? Colors.white38
                            : Colors.grey[600],
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    onPressed: () {
                      print('Google Button');
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: SettingCubit.get(context).isDark
                              ? Colors.grey[800]
                              : Colors.grey[200],
                          image: DecorationImage(
                              image: AssetImage("assets/images/google.png"))),
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
