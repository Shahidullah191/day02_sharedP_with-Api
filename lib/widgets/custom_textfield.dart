import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3/widgets/custom_textstyle.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.Controller,
    this.keyBoardType,
    this.labelText,
    this.icon,
    this.sufixicon,
    required this.validator,
    this.textInputAction,
    this.onChange,
  }) : super(key: key);

  final TextEditingController Controller;

  final TextInputType? keyBoardType;
  final String? labelText;
  final IconData? icon;
  final IconData? sufixicon;
  final FormFieldValidator<String> validator;
  final TextInputAction? textInputAction;
  final FormFieldSetter<String>? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      validator: validator,
      //onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
      controller: Controller,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
        disabledBorder:OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color:  Color(0xff7B81EC)),
          borderRadius: BorderRadius.circular(50.0.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color:  Color(0xff7B81EC)),
          borderRadius: BorderRadius.circular(50.0.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color: Colors.red,),
          borderRadius: BorderRadius.circular(50.0.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color: Color(0xff7B81EC)),
          borderRadius: BorderRadius.circular(50.0.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color: Color(0xff7B81EC)),
          borderRadius: BorderRadius.circular(50.0.r),
        ),
        labelText: labelText,
        labelStyle: myStyle(16.sp, Color(0xff7B81EC), FontWeight.bold),
        prefixIcon: Icon(
          icon,
          color: Color(0xff7B81EC),
        ),
        suffixIcon: Icon(
          sufixicon,
          color: Color(0xff7B81EC),
        ),
      ),

      onChanged: onChange,
    );
  }
}
