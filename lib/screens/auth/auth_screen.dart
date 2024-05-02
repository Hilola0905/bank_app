import 'package:bank_app/utils/size/screen_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_event.dart';
import '../../blocs/auth/auth_state.dart';
import '../../data/model/user_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../../utils/style/app_text_style.dart';
import '../routes.dart';
import '../widgets/my_text_field.dart';
import '../widgets/rounded_button.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: BlocConsumer<AuthBloc, AuthState>(
        builder: (BuildContext context, AuthState state) {

          if (state is AuthLoadState) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Register",
                    style: AppTextStyle.interBold.copyWith(
                      color: AppColors.blue1,
                      fontSize: 32.w,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          color: AppColors.mainColor.withOpacity(.2),
                          borderRadius: BorderRadius.circular(8.w)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppImages.google),
                          const SizedBox(width: 10,),
                          Text(
                            "Google",
                            style: AppTextStyle.interLight,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width / 4,
                        child: const Divider(),
                      ),
                      const SizedBox(width: 10,),
                      Text("or",
                          style: TextStyle(
                              color: const Color(0xff486484), fontSize: 18.w)),
                      const SizedBox(width: 10,),
                      SizedBox(
                        width: width / 4,
                        child: const Divider(),
                      ),
                    ],
                  ),
                  MyTextFieldWidget(
                    keyBoardType: TextInputType.text,
                    controller: nameController,
                    hintText: "Name",
                  ),
                  MyTextFieldWidget(
                    keyBoardType: TextInputType.text,
                    controller: emailController,
                    hintText: "Email",
                  ),
                  MyTextFieldWidget(
                    isObscureText: true,
                    keyBoardType: TextInputType.text,
                    controller: passwordController,
                    hintText: "Password",
                  ),
                  MyTextFieldWidget(
                    isObscureText: true,
                    keyBoardType: TextInputType.text,
                    controller: confirmController,
                    hintText: "Confirm Password",
                  ),
                  const SizedBox(height: 20,),
                  Center(
                    child: SizedBox(
                      width: width * 0.8,
                      height: 46.h,
                      child: RoundedButton(
                        text: "Register",
                        onTap: () {
                          context.read<AuthBloc>().add(
                                RegisterEvent(
                                  UserModel(
                                    email: emailController.text,
                                    name: nameController.text,
                                    password: passwordController.text,
                                  ),
                                  confirmController.text,
                                ),
                              );
                        },
                      ),
                    ),
                  ),
                const SizedBox(height: 40,),
                  Text("Already have an account?",
                      style: AppTextStyle.interSemiBold),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.loginScreen);
                    },
                    child: Row(
                      children: [
                        Text(
                          "LOGIN",
                          style: AppTextStyle.interMedium
                              .copyWith(color: AppColors.secondaryColor),
                        ),
                        const SizedBox(width: 10,),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: AppColors.secondaryColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (BuildContext context, AuthState state) {
          if (state is AuthErrorState) {
              Fluttertoast.showToast(
                  msg: state.errorText,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
          }
          if (state is AuthSuccessState) {
            Navigator.pushReplacementNamed(context, RouteNames.tabRoute);
          }
        },
      )),
    );
  }
}
