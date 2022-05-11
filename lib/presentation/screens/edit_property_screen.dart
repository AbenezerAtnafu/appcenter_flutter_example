import 'package:flutter/material.dart';
import 'package:flutter_job_one/presentation/screens/add_property_screen.dart';
import 'package:flutter_job_one/utils/constants.dart';
import 'package:flutter_job_one/utils/widgets_functions.dart';

class EditPropertyScreen extends StatefulWidget {
  const EditPropertyScreen({Key? key}) : super(key: key);

  @override
  _EditPropertyScreenState createState() => _EditPropertyScreenState();
}

class _EditPropertyScreenState extends State<EditPropertyScreen> {
  int _value = 1;
  int _value2 = 2;
  int _value3 = 1;
  int _value4 = 2;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25.0;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: sidePadding,
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: COLOR_GREY.withAlpha(40),
                          shape: BoxShape.circle,
                        ),
                        width: 60,
                        height: 60,
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: COLOR_BLACK,
                        ),
                      ),
                      Text(
                        'Edit Listing',
                        style: themeData.textTheme.headline6,
                      ),
                      Container()
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(
                        width: 180,
                        child: TextField(
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.email_outlined,
                              color: COLOR_SECONDARY,
                            ),
                            hintText: 'Gerji, Addis ababa',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(padding),
                Text(
                  'Relative address',
                  style: themeData.textTheme.headline6,
                ),
                addVerticalSpace(padding / 2),
                TextFieldContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(
                        width: 180,
                        child: TextField(
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.email_outlined,
                              color: COLOR_SECONDARY,
                            ),
                            hintText: 'Behind Roba dabo',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(padding),
                Text(
                  'Listing type',
                  style: themeData.textTheme.headline6,
                ),
                addVerticalSpace(padding / 2),
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
                addVerticalSpace(padding / 2),
                Wrap(
                  runSpacing: 20,
                  children: [
                    MyRadioListTile<int>(
                      value: 1,
                      groupValue: _value2,
                      leading: 'Villa',
                      onChanged: (value) => setState(() => _value2 = value!),
                    ),
                    MyRadioListTile<int>(
                      value: 2,
                      groupValue: _value2,
                      leading: 'Apartment',
                      onChanged: (value) => setState(() => _value2 = value!),
                    ),
                    MyRadioListTile<int>(
                      value: 3,
                      groupValue: _value2,
                      leading: 'Warehouse',
                      onChanged: (value) => setState(() => _value2 = value!),
                    ),
                    MyRadioListTile<int>(
                      value: 4,
                      groupValue: _value2,
                      leading: 'Condominium',
                      onChanged: (value) => setState(() => _value2 = value!),
                    ),
                    MyRadioListTile<int>(
                      value: 5,
                      groupValue: _value2,
                      leading: 'Land',
                      onChanged: (value) => setState(() => _value2 = value!),
                    ),
                    MyRadioListTile<int>(
                      value: 6,
                      groupValue: _value2,
                      leading: 'Office',
                      onChanged: (value) => setState(() => _value2 = value!),
                    ),
                  ],
                ),
                addVerticalSpace(padding),
                Text(
                  'Listing Photos',
                  style: themeData.textTheme.headline6,
                ),
                addVerticalSpace(padding / 2),
                TextFieldContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(
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
                addVerticalSpace(padding),
                Text(
                  'Property Features',
                  style: themeData.textTheme.headline6,
                ),
                addVerticalSpace(padding / 2),
                TextFieldContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(
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
                addVerticalSpace(padding),
                Text(
                  'Furnished',
                  style: themeData.textTheme.headline6,
                ),
                addVerticalSpace(padding / 2),
                Wrap(
                  children: [
                    MyRadioListTile<int>(
                      value: 1,
                      groupValue: _value4,
                      leading: 'Furnished',
                      onChanged: (value) => setState(() => _value4 = value!),
                    ),
                    MyRadioListTile<int>(
                      value: 2,
                      groupValue: _value4,
                      leading: 'Unfurnished',
                      onChanged: (value) => setState(() => _value4 = value!),
                    ),
                  ],
                ),
                addVerticalSpace(padding),
                Text(
                  'Amneities',
                  style: themeData.textTheme.headline6,
                ),
                addVerticalSpace(padding / 2),
                Wrap(
                  runSpacing: 20,
                  children: [
                    MyRadioListTile<int>(
                      value: 1,
                      groupValue: _value3,
                      leading: 'Parking Lot',
                      onChanged: (value) => setState(() => _value3 = value!),
                    ),
                    MyRadioListTile<int>(
                      value: 2,
                      groupValue: _value3,
                      leading: 'Elevator',
                      onChanged: (value) => setState(() => _value3 = value!),
                    ),
                    MyRadioListTile<int>(
                      value: 3,
                      groupValue: _value3,
                      leading: 'Security',
                      onChanged: (value) => setState(() => _value3 = value!),
                    ),
                    MyRadioListTile<int>(
                      value: 4,
                      groupValue: _value3,
                      leading: 'Generator',
                      onChanged: (value) => setState(() => _value3 = value!),
                    ),
                    MyRadioListTile<int>(
                      value: 5,
                      groupValue: _value3,
                      leading: 'Water Tanker',
                      onChanged: (value) => setState(() => _value3 = value!),
                    ),
                  ],
                ),
                addVerticalSpace(padding),
                Text(
                  'Description',
                  style: themeData.textTheme.headline6,
                ),
                addVerticalSpace(padding / 2),
                TextFieldContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(
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
                addVerticalSpace(padding),
                Text(
                  'Phone number',
                  style: themeData.textTheme.headline6,
                ),
                addVerticalSpace(padding / 2),
                TextFieldContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(
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
                addVerticalSpace(padding),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width * 0.75, 50),
                      primary: COLOR_PRIMARY,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Update'),
                  ),
                ),
                addVerticalSpace(padding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  const TextFieldContainer({
    Key? key,
    required this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: color ?? COLOR_GREY.withAlpha(40),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
