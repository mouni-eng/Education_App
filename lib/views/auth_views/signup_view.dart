// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/services/local/cache_helper.dart';
import 'package:movies_app/translate/locale_keys.g.dart';
import 'package:movies_app/view_models/App_Cubit/cubit.dart';
import 'package:movies_app/view_models/Auth_Cubit/cubit.dart';
import 'package:movies_app/view_models/Auth_Cubit/states.dart';
import 'package:movies_app/views/layout_views/layout_view.dart';
import 'package:movies_app/widgets.dart';
import 'package:easy_localization/easy_localization.dart';


class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {var _formKey = GlobalKey<FormState>();
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();
  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _phoneEditingController = TextEditingController();
  return Scaffold(
    appBar: AppBar(),
    body: BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if(state is CreateUserSuccessState) {
          CacheHelper.saveData(
            key: 'uId',
            value: state.logInModel!.uid,
          ).then((value)
          {
            CacheHelper.saveData(key: "categorie", value: "user").then((value) {
              if (value) {
                AppCubit.get(context).getCacheData();
                navigateToAndFinish(
                  context,
                  LayoutView(),
                );
              }
            });
          });
          showToast(text: "Register Success", state: ToastState.SUCCESS);
        }
        else if(state is SignUpErrorState){
          showToast(text: state.error, state: ToastState.ERROR);
        }
      },
      builder: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LocaleKeys.register.tr(), style: Theme.of(context).textTheme.bodyText1,),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultTextField(
                      size: 16,
                      text: LocaleKeys.registerSubHead.tr(),
                      color: Colors.grey),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultFormField(
                      context: context,
                      controller: _emailEditingController,
                      type: TextInputType.emailAddress,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Your Email";
                        }
                        return null;
                      },
                      label: LocaleKeys.email.tr(),
                      prefix: Icons.email_outlined),
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultFormField(
                      context: context,
                      controller: _passwordEditingController,
                      type: TextInputType.visiblePassword,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Password Is Too Short";
                        }
                        return null;
                      },
                      label: LocaleKeys.password.tr(),
                      prefix: Icons.lock_outline,
                      suffix: cubit.suffix,
                      suffixPressed: () {
                        cubit.changePasswordVisibility();
                      },
                      isPassword: cubit.isPassword),
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultFormField(
                      context: context,
                      controller: _nameEditingController,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Your Name";
                        }
                        return null;
                      },
                      label: LocaleKeys.Name.tr(),
                      prefix: Icons.person),
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultFormField(
                    context: context,
                    controller: _phoneEditingController,
                    type: TextInputType.phone,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Your Phone Number";
                      }
                      return null;
                    },
                    label: LocaleKeys.phoneNumber.tr(),
                    prefix: Icons.phone_android_outlined,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  ConditionalBuilder(
                    condition: state is! SignUpLoadingState,
                    builder: (context) => defaultButton(
                      radius: 25,
                        function: () {
                          if (_formKey.currentState!.validate()) {
                            cubit.signUp(
                              email: _emailEditingController.text,
                              password: _passwordEditingController.text,
                              name: _nameEditingController.text,
                              phone: _phoneEditingController.text,
                            );
                          }
                        },
                        text: LocaleKeys.register.tr()),
                    fallback: (context) => Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
  }
}