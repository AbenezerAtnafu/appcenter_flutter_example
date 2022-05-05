import 'package:flutter/material.dart';
import 'package:flutter_job_one/sample_data.dart';
import 'package:flutter_job_one/utils/constants.dart';
import 'package:flutter_job_one/utils/custom_functions.dart';
import 'package:flutter_job_one/utils/widgets_functions.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
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
        body: Container(
          padding: sidePadding,
          width: size.width,
          height: size.height,
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
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: COLOR_BLACK,
                      ),
                    ),
                  ),
                  Text(
                    'My favourites',
                    style: themeData.textTheme.headline6,
                  ),
                  if (FAVOURITE_DATA.isNotEmpty)
                    Container(
                      decoration: BoxDecoration(
                        color: COLOR_GREY.withAlpha(40),
                        shape: BoxShape.circle,
                      ),
                      width: 60,
                      height: 60,
                      child: const Icon(
                        Icons.delete_outline,
                        color: COLOR_BLACK,
                      ),
                    )
                  else
                    Container(),
                ],
              ),
              addVerticalSpace(padding * 2),
              Text(
                '${FAVOURITE_DATA.length} Properties',
                style: themeData.textTheme.headline6,
              ),
              addVerticalSpace(padding / 2),
              Expanded(
                child: FAVOURITE_DATA.isEmpty
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
                        itemCount: FAVOURITE_DATA.length,
                        itemBuilder: (BuildContext context, int index) =>
                            RealEstateItem(
                          itemData: FAVOURITE_DATA[index],
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

  const RealEstateItem({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addVerticalSpace(15.0),
                    Text(
                      formatCurrency(itemData["amount"] as int),
                      style: themeData.textTheme.headline6,
                    ),
                    addVerticalSpace(10),
                    Text(
                      "${itemData['bedrooms']} bedrooms / ${itemData['bathrooms']} bathrooms / ${itemData['sqft']} sqft",
                      style: themeData.textTheme.bodyText2,
                    ),
                    addVerticalSpace(10),
                    Text(
                      '${itemData["address"]}',
                      style: themeData.textTheme.bodyText2,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addVerticalSpace(15.0),
                    const Icon(Icons.share_outlined),
                    addVerticalSpace(5.0),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: COLOR_GREY.withAlpha(40),
                      ),
                      child: const Icon(
                        Icons.delete_outline_outlined,
                        color: COLOR_PRIMARY,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
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
