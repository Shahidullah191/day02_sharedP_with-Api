import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3/widgets/custom_textstyle.dart';

// Widget myTextField(String hintText,keyBoardType,controller){
//   return TextField(
//     keyboardType: keyBoardType,
//     controller: controller,
//     decoration: InputDecoration(hintText: hintText),
//   );
// }


class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
        required this.Controller,
        this.keyBoardType,
        this.labelText,
        this.icon,
        this.sufixicon,
        this.validator
      })
      : super(key: key);

  final TextEditingController Controller;

  final TextInputType? keyBoardType;
  final String? labelText;
  final IconData? icon;
  final IconData? sufixicon;
  final FormFieldValidator? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: Controller,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 3.w, color: Color(0xff7B81EC)),
          borderRadius: BorderRadius.circular(50.0.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 3.w, color: Color(0xff7B81EC)),
          borderRadius: BorderRadius.circular(50.0.r),
        ),
        labelText: labelText,
        labelStyle: myStyle(20.sp, Color(0xff7B81EC), FontWeight.bold),
        prefixIcon: Icon(icon, color: Color(0xff7B81EC),),
        suffixIcon: Icon(sufixicon, color: Color(0xff7B81EC),),
      ),
    );
  }
}
