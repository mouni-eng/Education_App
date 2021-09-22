// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/services/local/cache_helper.dart';
import 'package:movies_app/view_models/App_Cubit/cubit.dart';
import 'package:movies_app/view_models/Auth_Cubit/cubit.dart';
import 'package:movies_app/view_models/Auth_Cubit/states.dart';
import 'package:movies_app/views/auth_views/signup_view.dart';
import 'package:movies_app/views/layout_views/layout_view.dart';
import 'package:movies_app/widgets.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _formKey = GlobalKey<FormState>();
    TextEditingController _emailEditingController = TextEditingController();
    TextEditingController _passwordEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LogInSuccessState) {
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value) {
              if (value) {
                AppCubit.get(context).getCacheData();
                navigateToAndFinish(
                  context,
                  LayoutView(),
                );
              }
            });
            showToast(text: "LogIn Success", state: ToastState.SUCCESS);
          } else if (state is LogInErrorState) {
            showToast(text: state.error.toString(), state: ToastState.ERROR);
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
                    Text('LOGIN', style: Theme.of(context).textTheme.bodyText1,),
                    SizedBox(
                      height: 10.0,
                    ),
                    defaultTextField(
                        size: 16,
                        text: "Login now and discover our New Teachers,",
                        color: Colors.grey),
                    SizedBox(
                      height: 60.0,
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
                        label: "Email",
                        prefix: Icons.email_outlined),
                    SizedBox(
                      height: 40.0,
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
                        label: "Password",
                        prefix: Icons.lock_outline,
                        suffix: cubit.suffix,
                        suffixPressed: () {
                          cubit.changePasswordVisibility();
                        },
                        isPassword: cubit.isPassword),
                    SizedBox(
                      height: 60.0,
                    ),
                    ConditionalBuilder(
                      condition: state is! LogInLoadingState,
                      builder: (context) => defaultButton(
                          radius: 25,
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              cubit.signIn(
                                  email: _emailEditingController.text,
                                  password: _passwordEditingController.text);
                            }
                          },
                          text: "LOGIN"),
                      fallback: (context) => Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Text("Don't have an account?", style: Theme.of(context).textTheme.bodyText2,),
                        TextButton(
                            onPressed: () {
                              navigateTo(context, RegisterView());
                            },
                            child: defaultTextField(
                                size: 14.0,
                                text: "REGISTER",
                                color: kPrimaryColor)),
                      ],
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
