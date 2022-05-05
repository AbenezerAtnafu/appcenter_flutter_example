import 'package:flutter/material.dart';
import 'package:flutter_job_one/presentation/router/routes.dart';
import 'package:flutter_job_one/presentation/screens/email_login_screen.dart';
import 'package:flutter_job_one/sample_data.dart';
import 'package:flutter_job_one/utils/constants.dart';
import 'package:flutter_job_one/utils/custom_functions.dart';
import 'package:flutter_job_one/utils/widgets_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25.0;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                height: size.height * 0.2,
                color: COLOR_PRIMARY,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextFieldContainer(
                      color: COLOR_WHITE,
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.search_outlined,
                            color: COLOR_PRIMARY,
                          ),
                          hintText: 'Enter address',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    addVerticalSpace(15),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: padding - 15,
                      ),
                      child: Row(
                        children: ['All', 'Rent', 'Buy']
                            .map(
                              (filter) => FilterOptionButton(
                                text: filter,
                                isSelected: filter == 'All',
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              addVerticalSpace(padding),
              Expanded(
                child: RE_DATA.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 60,
                                    color: COLOR_PRIMARY,
                                    spreadRadius: 15,
                                  )
                                ],
                              ),
                              child: const CircleAvatar(
                                radius: 30.0,
                                backgroundColor: COLOR_PRIMARY,
                                child: Icon(
                                  Icons.add,
                                  color: COLOR_WHITE,
                                ),
                              ),
                            ),
                            addVerticalSpace(padding * 2),
                            RichText(
                              text: TextSpan(
                                text: 'Your favourite page is',
                                style: themeData.textTheme.headline5!.copyWith(
                                  color: COLOR_SECONDARY,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' empty',
                                    style:
                                        themeData.textTheme.headline5!.copyWith(
                                      color: COLOR_PRIMARY,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            addVerticalSpace(30),
                            Padding(
                              padding: sidePadding * 2,
                              child: Text(
                                'Click add button above to start exploring and choose your favourite properites.',
                                style: themeData.textTheme.bodyText2!.copyWith(
                                  color: COLOR_SECONDARY,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: RE_DATA.length,
                        itemBuilder: (BuildContext context, int index) =>
                            RealEstateItem(
                          itemData: RE_DATA[index],
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;

  const RealEstateItem({
    Key? key,
    required this.itemData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, detailRoute);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset(itemData['image'] as String),
                ),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 10,
                  ),
                  margin: const EdgeInsets.only(
                    top: 8,
                    left: 8,
                  ),
                  child: Center(
                    child: Text(
                      'Featured',
                      style: themeData.textTheme.bodyText1!.copyWith(
                        color: COLOR_WHITE,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatCurrency(itemData["amount"] as int),
                        style: themeData.textTheme.headline6,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.favorite_outline,
                          ),
                          addHorizontalSpace(10),
                          const Icon(
                            Icons.share_outlined,
                          ),
                        ],
                      )
                    ],
                  ),
                  addVerticalSpace(10),
                  Text(
                    '${itemData["address"]}',
                    style: themeData.textTheme.bodyText2,
                  ),
                  addVerticalSpace(10),
                  Text(
                    "${itemData['bedrooms']} bedrooms / ${itemData['bathrooms']} bathrooms / ${itemData['sqft']} sqft",
                    style: themeData.textTheme.bodyText2,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterOptionButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const FilterOptionButton({required this.text, this.isSelected = false});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff178DD0) : COLOR_WHITE,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? COLOR_WHITE : COLOR_PRIMARY,
          ),
        ),
      ),
    );
  }
}
