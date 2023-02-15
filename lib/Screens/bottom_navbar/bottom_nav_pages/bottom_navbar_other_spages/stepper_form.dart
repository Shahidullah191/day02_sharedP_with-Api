import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_3/Screens/bottom_navbar/bottom_nav_pages/bottom_navbar_other_spages/stepper_form_details.dart';
import 'package:project_3/widgets/custom_textstyle.dart';

import '../../../../widgets/custom_textfield.dart';

class StepperFormScreen extends StatefulWidget {
  const StepperFormScreen({Key? key}) : super(key: key);

  @override
  State<StepperFormScreen> createState() => _StepperFormScreenState();
}

class _StepperFormScreenState extends State<StepperFormScreen> {
  // controllers for text fields
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final addressController = TextEditingController();
  final instituteNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? genderValue;

  // list of checkboxes for academic qualifications
  List<String> academicQualifications = [
    'SSC',
    'HSC',
    'BSc',
    'MSc',
    'PhD',
  ];
  List<bool> academicQualificationsValues = List.filled(5, false);

  // list of professional qualifications
  List<Map<String, String>> professionalQualifications = [];

  // stepper related variables
  int currentStep = 0;
  bool complete = false;

  @override
  void dispose() {
    // Clean up the controllers when the widget is removed from the widget tree
    nameController.dispose();
    emailController.dispose();
    mobileNumberController.dispose();
    addressController.dispose();
    instituteNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper Form"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                type: StepperType.horizontal,
                currentStep: currentStep,
                onStepContinue: () {
                  setState(() {
                    if (currentStep < 3) {
                      currentStep += 1;
                    } else {
                      complete = true;
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (currentStep > 0) {
                      currentStep -= 1;
                    } else {
                      currentStep = 0;
                    }
                  });
                },
                onStepTapped: (step) {
                  setState(() {
                    currentStep = step;
                  });
                },
                steps: [
                  //First form..
                  Step(
                    title: Text("1"),
                    content: Column(
                      children: [
                        Text("Personal Information", style: myStyle(18.sp, Colors.black, FontWeight.bold),),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomTextField(
                          Controller: nameController,
                          keyBoardType: TextInputType.name,
                          labelText: "Name",
                          icon: Icons.person,
                          validator: (value) {
                            if (value.isEmpty ||
                                !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                              //allow upper and lower case alphabets and space
                              return "Enter Correct Name";
                            } else {
                              return null;
                            }
                          },
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomTextField(
                          Controller: emailController,
                          keyBoardType: TextInputType.emailAddress,
                          labelText: "Email",
                          icon: Icons.email,
                          validator: (value) {
                            if (value.isEmpty ||
                                !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value)) {
                              return "Enter Correct Email Address";
                            } else {
                              return null;
                            }
                          },
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomTextField(
                          Controller: mobileNumberController,
                          keyBoardType: TextInputType.number,
                          labelText: "Phone",
                          icon: Icons.phone,
                          validator: (value) {
                            if (value.isEmpty ||
                                !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                    .hasMatch(value)) {
                              //  r'^[0-9]{10}$' pattern plain match number with length 10
                              return "Enter Correct Phone Number";
                            } else {
                              return null;
                            }
                          },
                          textInputAction: TextInputAction.done,
                        ),
                      ],
                    ),
                    isActive: currentStep == 0,
                    state:
                        currentStep == 0 ? StepState.editing : StepState.indexed,
                  ),

                  //Second form
                  Step(
                    title: Text("2"),
                    content: Column(
                      children: [
                        Text("Personal Details", style: myStyle(18.sp, Colors.black, FontWeight.bold),),
                        SizedBox(height: 10.h,),
                        Row(
                          children: [
                            Radio(
                              value: 'Male',
                              groupValue: genderValue,
                              onChanged: (value) {
                                setState(() {
                                  genderValue = value;
                                });
                              },
                            ),
                            Text('Male'),
                            Radio(
                              value: 'Female',
                              groupValue: genderValue,
                              onChanged: (value) {
                                setState(() {
                                  genderValue = value;
                                });
                              },
                            ),
                            Text('Female'),
                            Radio(
                              value: 'Other',
                              groupValue: genderValue,
                              onChanged: (value) {
                                setState(() {
                                  genderValue = value;
                                });
                              },
                            ),
                            Text('Other'),
                          ],
                        ),
                        CustomTextField(
                          Controller: addressController,
                          keyBoardType: TextInputType.text,
                          labelText: "Address",
                          icon: Icons.add_location,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your correct address';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.done,
                        ),
                      ],
                    ),
                    isActive: currentStep == 1,
                    state:
                        currentStep == 1 ? StepState.editing : StepState.indexed,
                  ),

                  //Third form..
                  Step(
                    title: Text("3"),
                    content: Column(
                      children: [
                        Text("Academic Qualification", style: myStyle(18.sp, Colors.black, FontWeight.bold),),
                        SizedBox(height: 10.h,),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: academicQualifications.length,
                          itemBuilder: (context, index) {
                            return CheckboxListTile(
                              title: Text(academicQualifications[index]),
                              value: academicQualificationsValues[index],
                              onChanged: (value) {
                                setState(() {
                                  academicQualificationsValues[index] = value!;
                                });
                              },
                            );
                          },
                        ),
                        CustomTextField(
                          Controller: instituteNameController,
                          keyBoardType: TextInputType.text,
                          labelText: "Last Institute Name",
                          icon: Icons.school,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your Last Institute Name';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.done,
                        ),
                      ],
                    ),
                    isActive: currentStep == 2,
                    state:
                        currentStep == 2 ? StepState.editing : StepState.indexed,
                  ),

                  //Fourth Form
                  Step(
                    title: Text("4"),
                    content: Column(
                      children: [
                        Text("Professional Qualification", style: myStyle(18.sp, Colors.black, FontWeight.bold),),
                        SizedBox(
                          height: 10.h,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: professionalQualifications.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomTextField(
                                  Controller: TextEditingController.fromValue(
                                      TextEditingValue(
                                    text: professionalQualifications[index]
                                            ["instituteName"] ??
                                        '',
                                  )),
                                  keyBoardType: TextInputType.text,
                                  labelText: "Institute Name",
                                  icon: Icons.school,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your Institute Name';
                                    }
                                    return null;
                                  },
                                  onChange: (newValue) {
                                    professionalQualifications[index]
                                        ['instituteName'] = newValue;
                                  },
                                  textInputAction: TextInputAction.next,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                CustomTextField(
                                  Controller: TextEditingController.fromValue(
                                      TextEditingValue(
                                    text: professionalQualifications[index]
                                            ["yearOfExperience"] ??
                                        '',
                                  )),
                                  keyBoardType: TextInputType.number,
                                  labelText: "Year of Experience",
                                  icon: Icons.date_range,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your Institute Name';
                                    }
                                    return null;
                                  },
                                  onChange: (newValue) {
                                    professionalQualifications[index]
                                        ['yearOfExperience'] = newValue;
                                  },
                                  textInputAction: TextInputAction.done,
                                ),
                              ],
                            );
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              professionalQualifications.add({});
                            });
                          },
                          child: Text("Add Professional Qualification"),
                        ),
                      ],
                    ),
                    isActive: currentStep == 3,
                    state:
                        currentStep == 3 ? StepState.editing : StepState.indexed,
                  ),
                ],
              ),
            ),
            if (complete)
            ElevatedButton(
                onPressed: () {
                  Get.to(StepperFormDetails(
                      name: nameController.text,
                      email: emailController.text,
                      mobileNumber: mobileNumberController.text,
                      gender: genderValue.toString(),
                      address: addressController.text,
                      professionalQualifications:
                          getProfessionalQualifications(),
                      academicQualifications: getAcademicQualifications(),
                      lastInstituteName: instituteNameController.text));
                },
                child: Text("Submit")),
          ],
        ),
      ),
    );
  }

  String getAcademicQualifications() {
    List<String> selectedQualifications = [];
    for (int i = 0; i < academicQualificationsValues.length; i++) {
      if (academicQualificationsValues[i]) {
        selectedQualifications.add(academicQualifications[i]);
      }
    }
    return selectedQualifications.join(', ');
  }

  String getProfessionalQualifications() {
    List<String> qualificationStrings = [];
    for (int i = 0; i < professionalQualifications.length; i++) {
      if (professionalQualifications[i]['instituteName'] != null &&
          professionalQualifications[i]['yearOfExperience'] != null) {
        qualificationStrings.add(
            '${professionalQualifications[i]['instituteName']}, ${professionalQualifications[i]['yearOfExperience']} years');
      }
    }
    return qualificationStrings.join('\n');
  }
}
