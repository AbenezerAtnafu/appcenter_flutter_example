import 'package:flutter/material.dart';
import 'package:flutter_job_one/presentation/screens/EmailLoginScreen.dart';
import 'package:flutter_job_one/sample_data.dart';
import 'package:flutter_job_one/utils/constants.dart';
import 'package:flutter_job_one/utils/custom_functions.dart';
import 'package:flutter_job_one/utils/widgets_functions.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({Key? key}) : super(key: key);

  @override
  _AddPropertyScreenState createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25.0;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);

    PageController controller = PageController();
    int _curr = 0;
    List<Widget> _list = <Widget>[
      StepOneForm(
        controller: controller,
      ),
      StepTwoForm(
        controller: controller,
      ),
      StepThreeForm(
        controller: controller,
      )
    ];

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            child: PageView(
              children: _list,
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              physics: BouncingScrollPhysics(),
              controller: controller,
              onPageChanged: (num) {
                print("Current page number is " + num.toString());
                _curr = num;
              },
            ),
          ),
        ),
      ),
    );
  }
}

class StepOneForm extends StatefulWidget {
  PageController controller;
  StepOneForm({required this.controller});
  @override
  _StepOneFormState createState() => _StepOneFormState();
}

class _StepOneFormState extends State<StepOneForm> {
  int _value = 1;
  int _value2 = 2;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final double padding = 25.0;
    final Size size = MediaQuery.of(context).size;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);

    return Container(
      padding: sidePadding,
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpace(padding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: COLOR_GREY.withAlpha(40),
                      shape: BoxShape.circle,
                    ),
                    width: 60,
                    height: 60,
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: COLOR_BLACK,
                    ),
                  ),
                ),
                Text(
                  'Add Listing',
                  style: themeData.textTheme.headline6,
                ),
                Container()
              ],
            ),
            addVerticalSpace(padding),
            RichText(
              text: TextSpan(
                text: 'Fill the detail of your',
                style: themeData.textTheme.headline5!.copyWith(
                  color: COLOR_SECONDARY,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' property',
                    style: themeData.textTheme.headline5!.copyWith(
                      color: COLOR_PRIMARY,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            addVerticalSpace(padding),
            Text(
              'Address (address on google map)',
              style: themeData.textTheme.headline6,
            ),
            addVerticalSpace(padding / 2),
            TextFieldContainer(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Gerji, Addis ababa',
                  border: InputBorder.none,
                ),
              ),
            ),
            addVerticalSpace(padding),
            Text(
              'Relative address',
              style: themeData.textTheme.headline6,
            ),
            addVerticalSpace(padding / 2),
            TextFieldContainer(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Behind Roba dabo',
                  border: InputBorder.none,
                ),
              ),
            ),
            addVerticalSpace(padding),
            Text(
              'Listing for',
              style: themeData.textTheme.headline6,
            ),
            addVerticalSpace(padding),
            Wrap(
              children: [
                MyRadioListTile<int>(
                  value: 1,
                  groupValue: _value,
                  leading: 'Rent',
                  onChanged: (value) => setState(() => _value = value!),
                ),
                MyRadioListTile<int>(
                  value: 2,
                  groupValue: _value,
                  leading: 'Sell',
                  onChanged: (value) => setState(() => _value = value!),
                ),
              ],
            ),
            addVerticalSpace(padding),
            Text(
              'Property category',
              style: themeData.textTheme.headline6,
            ),
            addVerticalSpace(padding),
            Wrap(
              runSpacing: 20,
              children: [
                MyRadioListTile<int>(
                  value: 1,
                  groupValue: _value2,
                  leading: 'Villa',
                  onChanged: (value2) => setState(() => _value2 = value2!),
                ),
                MyRadioListTile<int>(
                  value: 2,
                  groupValue: _value2,
                  leading: 'Apartment',
                  onChanged: (value2) => setState(() => _value2 = value2!),
                ),
                MyRadioListTile<int>(
                  value: 3,
                  groupValue: _value2,
                  leading: 'Warehouse',
                  onChanged: (value2) => setState(() => _value2 = value2!),
                ),
                MyRadioListTile<int>(
                  value: 4,
                  groupValue: _value2,
                  leading: 'Condominium',
                  onChanged: (value2) => setState(() => _value2 = value2!),
                ),
                MyRadioListTile<int>(
                  value: 5,
                  groupValue: _value2,
                  leading: 'Land',
                  onChanged: (value2) => setState(() => _value2 = value2!),
                ),
                MyRadioListTile<int>(
                  value: 6,
                  groupValue: _value2,
                  leading: 'Office',
                  onChanged: (value2) => setState(() => _value2 = value2!),
                ),
              ],
            ),
            addVerticalSpace(padding * 2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding * 4),
              child: LinearProgressIndicator(
                value: 1 / 3,
                backgroundColor: COLOR_GREY.withAlpha(40),
              ),
            ),
            addVerticalSpace(padding),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: COLOR_WHITE,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: COLOR_PRIMARY,
                    ),
                  ),
                ),
                addHorizontalSpace(20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: COLOR_PRIMARY,
                  ),
                  onPressed: () {
                    widget.controller.animateToPage(
                      1,
                      duration: Duration(microseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: padding * 3,
                      vertical: 20,
                    ),
                    child: Text('Next'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StepTwoForm extends StatefulWidget {
  PageController controller;
  StepTwoForm({required this.controller});
  @override
  _StepTwoFormState createState() => _StepTwoFormState();
}

class _StepTwoFormState extends State<StepTwoForm> {
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final double padding = 25.0;
    final Size size = MediaQuery.of(context).size;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);

    return Container(
      padding: sidePadding,
      width: size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                  color: COLOR_GREY.withAlpha(40),
                  shape: BoxShape.circle,
                ),
                width: 60,
                height: 60,
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: COLOR_BLACK,
                ),
              ),
              Text(
                'Add Listing',
                style: themeData.textTheme.headline6,
              ),
              Container()
            ],
          ),
          addVerticalSpace(padding),
          imagefiles != null
              ? RichText(
                  text: TextSpan(
                    text: 'Add',
                    style: themeData.textTheme.headline5!.copyWith(
                      color: COLOR_SECONDARY,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' photos',
                        style: themeData.textTheme.headline5!.copyWith(
                          color: COLOR_PRIMARY,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' to your listing',
                        style: themeData.textTheme.headline5!.copyWith(
                          color: COLOR_SECONDARY,
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox.shrink(),
          // addVerticalSpace(padding),

          addVerticalSpace(padding),
          // ElevatedButton(
          //   onPressed: () {
          //     openImages();
          //   },
          //   child: Text("Open Images"),
          // ),
          imagefiles != null
              ? Wrap(
                  children: imagefiles!.map(
                    (imageone) {
                      return Container(
                        child: Card(
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Image.file(File(imageone.path)),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                )
              : Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 60,
                              color: COLOR_PRIMARY,
                              spreadRadius: 15,
                            )
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundColor: COLOR_PRIMARY,
                          child: IconButton(
                            onPressed: () {
                              openImages();
                            },
                            icon: Icon(Icons.explicit_sharp),
                            color: COLOR_WHITE,
                          ),
                        ),
                      ),
                      addVerticalSpace(padding),
                      Padding(
                        padding: EdgeInsets.all(padding),
                        child: Text(
                          'Add at least 1 picture to continue.',
                          style: themeData.textTheme.headline5!.copyWith(
                            color: COLOR_SECONDARY,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      addVerticalSpace(30),
                    ],
                  ),
                ),
          addVerticalSpace(padding),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding * 4),
                  child: LinearProgressIndicator(
                    value: 2 / 3,
                    backgroundColor: COLOR_GREY.withAlpha(40),
                  ),
                ),
                addVerticalSpace(padding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        widget.controller.animateToPage(
                          0,
                          duration: Duration(microseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: COLOR_WHITE,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: COLOR_PRIMARY,
                        ),
                      ),
                    ),
                    addHorizontalSpace(20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: COLOR_PRIMARY,
                      ),
                      onPressed: () {
                        widget.controller.animateToPage(
                          2,
                          duration: Duration(microseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: padding * 3,
                          vertical: 20,
                        ),
                        child: Text('Next'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class StepThreeForm extends StatefulWidget {
  PageController controller;
  StepThreeForm({required this.controller});
  @override
  _StepThreeFormState createState() => _StepThreeFormState();
}

class _StepThreeFormState extends State<StepThreeForm> {
  int _value = 1;
  int _value2 = 2;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final double padding = 25.0;
    final Size size = MediaQuery.of(context).size;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);

    return Container(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            CustomPaint(
              painter: CirclePainter(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(padding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: COLOR_GREY.withAlpha(40),
                        shape: BoxShape.circle,
                      ),
                      width: 60,
                      height: 60,
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: COLOR_BLACK,
                      ),
                    ),
                    Text(
                      'Add Listing',
                      style: themeData.textTheme.headline6,
                    ),
                    Container()
                  ],
                ),
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: RichText(
                    text: TextSpan(
                      text: 'Almost finished',
                      style: themeData.textTheme.headline5!.copyWith(
                        color: COLOR_PRIMARY,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ', complete the listing.',
                          style: themeData.textTheme.headline5!.copyWith(
                            color: COLOR_SECONDARY,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: Text(
                    'Rent Price',
                    style: themeData.textTheme.headline6,
                  ),
                ),
                addVerticalSpace(padding / 2),
                Padding(
                  padding: sidePadding,
                  child: TextFieldContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 180,
                          child: TextField(
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.email_outlined,
                                color: COLOR_SECONDARY,
                              ),
                              hintText: 'Email',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Text('hey'),
                      ],
                    ),
                  ),
                ),
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: Text(
                    'Property Features',
                    style: themeData.textTheme.headline6,
                  ),
                ),
                addVerticalSpace(padding / 2),
                Padding(
                  padding: sidePadding,
                  child: TextFieldContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 180,
                          child: TextField(
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.email_outlined,
                                color: COLOR_SECONDARY,
                              ),
                              hintText: 'Email',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Text('hey'),
                      ],
                    ),
                  ),
                ),
                addVerticalSpace(padding / 2),
                Padding(
                  padding: sidePadding,
                  child: TextFieldContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 180,
                          child: TextField(
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.email_outlined,
                                color: COLOR_SECONDARY,
                              ),
                              hintText: 'Email',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Text('hey'),
                      ],
                    ),
                  ),
                ),
                addVerticalSpace(padding / 2),
                Padding(
                  padding: sidePadding,
                  child: TextFieldContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 180,
                          child: TextField(
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.email_outlined,
                                color: COLOR_SECONDARY,
                              ),
                              hintText: 'Email',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Text('hey'),
                      ],
                    ),
                  ),
                ),
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: Text(
                    'Furnished',
                    style: themeData.textTheme.headline6,
                  ),
                ),
                addVerticalSpace(padding / 2),
                Padding(
                  padding: sidePadding,
                  child: Wrap(
                    children: [
                      MyRadioListTile<int>(
                        value: 1,
                        groupValue: _value,
                        leading: 'Furnished',
                        onChanged: (value) => setState(() => _value = value!),
                      ),
                      MyRadioListTile<int>(
                        value: 2,
                        groupValue: _value,
                        leading: 'Unfurnished',
                        onChanged: (value) => setState(() => _value = value!),
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: Text(
                    'Amenities',
                    style: themeData.textTheme.headline6,
                  ),
                ),
                addVerticalSpace(padding / 2),
                Padding(
                  padding: sidePadding,
                  child: Wrap(
                    runSpacing: 20,
                    children: [
                      MyRadioListTile<int>(
                        value: 1,
                        groupValue: _value2,
                        leading: 'Parking Lot',
                        onChanged: (value) => setState(() => _value2 = value!),
                      ),
                      MyRadioListTile<int>(
                        value: 2,
                        groupValue: _value2,
                        leading: 'Elevator',
                        onChanged: (value) => setState(() => _value2 = value!),
                      ),
                      MyRadioListTile<int>(
                        value: 3,
                        groupValue: _value2,
                        leading: 'Security',
                        onChanged: (value) => setState(() => _value2 = value!),
                      ),
                      MyRadioListTile<int>(
                        value: 4,
                        groupValue: _value2,
                        leading: 'Generator',
                        onChanged: (value) => setState(() => _value2 = value!),
                      ),
                      MyRadioListTile<int>(
                        value: 5,
                        groupValue: _value2,
                        leading: 'Water Tanker',
                        onChanged: (value) => setState(() => _value2 = value!),
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: Text(
                    'Description',
                    style: themeData.textTheme.headline6,
                  ),
                ),
                addVerticalSpace(padding / 2),
                Padding(
                  padding: sidePadding,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    maxLength: null,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: COLOR_GREY,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2,
                          color: COLOR_GREY,
                        ),
                      ),
                    ),
                  ),
                ),
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: Text(
                    'Phone number',
                    style: themeData.textTheme.headline6,
                  ),
                ),
                addVerticalSpace(padding / 2),
                Padding(
                  padding: sidePadding,
                  child: Form(
                    key: formkey,
                    child: IntlPhoneField(
                      controller: controller,
                      flagsButtonPadding: EdgeInsets.only(left: 10),
                      dropdownIconPosition: IconPosition.trailing,
                      decoration: InputDecoration(
                        hintText: 'Mobile Number',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: COLOR_GREY.withAlpha(80),
                            width: 0.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: COLOR_PRIMARY,
                          ),
                        ),
                      ),
                      initialCountryCode: 'ET',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding * 4),
                        child: LinearProgressIndicator(
                          value: 3 / 3,
                          backgroundColor: COLOR_GREY.withAlpha(40),
                        ),
                      ),
                      addVerticalSpace(padding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              widget.controller.animateToPage(
                                1,
                                duration: Duration(microseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                color: COLOR_WHITE,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.arrow_back_outlined,
                                color: COLOR_PRIMARY,
                              ),
                            ),
                          ),
                          addHorizontalSpace(20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: COLOR_PRIMARY,
                            ),
                            onPressed: () {
                              showModalBottomSheet<void>(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(75),
                                  ),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: size.height * 0.5,
                                    decoration: BoxDecoration(
                                      color: COLOR_WHITE,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          width: 80,
                                          child: Divider(
                                            color: COLOR_BLACK,
                                            thickness: 2,
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 60,
                                                color: COLOR_PRIMARY,
                                                spreadRadius: 15,
                                              )
                                            ],
                                          ),
                                          child: CircleAvatar(
                                            radius: 30.0,
                                            backgroundColor: COLOR_PRIMARY,
                                            child: Icon(
                                              Icons.check,
                                              color: COLOR_WHITE,
                                            ),
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Your listing is now',
                                            style: themeData
                                                .textTheme.headline5!
                                                .copyWith(
                                              color: COLOR_SECONDARY,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: ' published',
                                                style: themeData
                                                    .textTheme.headline5!
                                                    .copyWith(
                                                  color: COLOR_PRIMARY,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 20.0,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  minimumSize: Size(
                                                      size.width * 0.4, 60),
                                                  primary:
                                                      COLOR_GREY.withAlpha(30),
                                                ),
                                                onPressed: () {
                                                  widget.controller
                                                      .animateToPage(
                                                    0,
                                                    duration: Duration(
                                                        microseconds: 300),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                child: Text(
                                                  'Add More',
                                                  style: TextStyle(
                                                    color: COLOR_PRIMARY,
                                                  ),
                                                ),
                                              ),
                                              addHorizontalSpace(20),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  minimumSize: Size(
                                                      size.width * 0.4, 60),
                                                  primary: COLOR_PRIMARY,
                                                ),
                                                onPressed: () {},
                                                child: Text('Finish'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: padding * 3,
                                vertical: 20,
                              ),
                              child: Text('Next'),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String leading;
  final ValueChanged<T?> onChanged;

  const MyRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: _customRadioButton,
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
      width: 100,
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? COLOR_PRIMARY : COLOR_GREY.withAlpha(30),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          leading,
          maxLines: 1,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[600]!,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final Paint lightBluePaint = Paint()..color = Color(0xFFBCCAD3);
  final Paint bluePaint = Paint()..color = Color(0xFFBCCAD3);
  final TextPainter textPainter = TextPainter(
    textDirection: TextDirection.ltr,
  );

  final TextStyle textStyle = TextStyle(
      color: Colors.white.withAlpha(240),
      fontSize: 18,
      letterSpacing: 1.2,
      fontWeight: FontWeight.w900);

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromLTRB(
        -80, size.height - 60, size.width * 0.3, size.height + 60);

    final Path circle = Path()..addOval(rect);
    final Path smallCircle = Path()..addOval(rect.inflate(120));

    canvas.drawPath(smallCircle, lightBluePaint);
    canvas.drawPath(circle, bluePaint);

    drawText(canvas, size, 'Write now');
  }

  void drawText(Canvas canvas, Size size, String text) {
    textPainter.text = TextSpan(style: textStyle, text: text);
    textPainter.layout();
    textPainter.paint(canvas, Offset(30, size.height - 60));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
