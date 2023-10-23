import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/settings/cubit.dart';
import 'package:graduation_project/shared/components/components.dart';
import '../generated/l10n.dart';
import '../shared/components/consistant.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';
import '../shared/style/colors.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  bool isEnabled = false;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is SuccesssUpdateProfileUserState) {
          if (state.authModel!.status!) {
            showToast(
                text: state.authModel!.message!, state: ToastStates.Successful);
          } else {
            showToast(
                text: state.authModel!.message!, state: ToastStates.Error);
          }
        }
        if (state is LoadingProfileUserDataState) {}
      },
      builder: (context, state) {
        var model = AppCubit.get(context).authModel;
        if (model != null && model.data != null) {
          nameController.text = model.data!.name!;
          emailController.text = model.data!.email!;
          phoneController.text = model.data!.phone!;
          // print(nameController.text);
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).your_profile),
            backgroundColor: SettingCubit.get(context).isDark
                ? appBarDarkColor
                : defaultColor,
            centerTitle: true,
            // leading: back(context),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (state is LoadingUpdateProfileUserState)
                  LinearProgressIndicator(),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 127, 140, 168),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        // TextFormField(
                        //   controller: nameController,
                        //   keyboardType: TextInputType.name,
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return S.of(context).nameAuth;
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        //   style: const TextStyle(fontSize: 14),
                        //   enabled: isEnabled,
                        //   decoration: InputDecoration(
                        //     labelText: S.of(context).yourName,
                        //     labelStyle: const TextStyle(fontSize: 14),
                        //     prefixIcon: const Icon(Icons.person),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 14,
                        // ),
                        TextFF(context,
                            labelText: S.of(context).yourName,
                            isEnabled: isEnabled,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(40)
                            ],
                            controller: nameController, validate: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).nameAuth;
                          } else {
                            return null;
                          }
                        },
                            keyboardType: TextInputType.name,
                            prefixIcon: Icon(Icons.person)),
                        SizedBox(
                          height: 14,
                        ),
                        TextFF(context,
                            labelText: S.of(context).yourEmail,
                            controller: emailController,
                            prefixIcon: Icon(Icons.email), validate: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).emailAuth;
                          } else if (value.trim().isEmpty ||
                              !value.contains("@")) {
                            // return S.of(context).emailAuth2;
                            return isArabic()
                                ? "صيغة البريد غير صحيحة"
                                : "Email format is incorrect";
                          } else {
                            return null;
                          }
                        },
                            isEnabled: isEnabled,
                            keyboardType: TextInputType.emailAddress),

                        SizedBox(
                          height: 14,
                        ),
                        TextFF(context,
                            labelText: S.of(context).yourPhone,
                            controller: phoneController,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10)
                            ], validate: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).phoneAuth;
                          } else {
                            return null;
                          }
                        },
                            isEnabled: isEnabled,
                            prefixIcon: Icon(Icons.call),
                            keyboardType: TextInputType.phone),

                        SizedBox(
                          height: 20,
                        ),
                        isEnabled
                            ? Center(
                                child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        isEnabled = false;
                                      });
                                      if (formKey.currentState!.validate()) {
                                        AppCubit.get(context).updateUserProfile(
                                            name: nameController.text,
                                            email: emailController.text,
                                            phone: phoneController.text,
                                            image:
                                                model!.data!.image.toString());
                                      }
                                    },
                                    child: Text(
                                      S.of(context).saveEdit,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 37, 11, 11),
                                        fontSize: 17,
                                      ),
                                    )),
                              )
                            : Center(
                                child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        isEnabled = true;
                                      });
                                    },
                                    child: Text(
                                      S.of(context).editProf,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    )),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

