import 'package:flutter/material.dart';
import 'package:flutter_job_one/presentation/router/routes.dart';
import 'package:flutter_job_one/sample_data.dart';
import 'package:flutter_job_one/utils/constants.dart';
import 'package:flutter_job_one/utils/custom_functions.dart';
import 'package:flutter_job_one/utils/widgets_functions.dart';

class PropertyScreen extends StatefulWidget {
  const PropertyScreen({Key? key}) : super(key: key);

  @override
  _PropertyScreenState createState() => _PropertyScreenState();
}

class _PropertyScreenState extends State<PropertyScreen>
    with TickerProviderStateMixin {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25.0;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);

    final TabController _tabController = TabController(length: 3, vsync: this);

    return SafeArea(
      child: Scaffold(
        backgroundColor: COLOR_WHITE,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: COLOR_WHITE,
          elevation: 0.0,
          leadingWidth: 100,
          centerTitle: true,
          title: Text(
            'My Properties',
            style: TextStyle(color: COLOR_BLACK),
          ),
        ),
        body: SizedBox(
          width: size.width,
          height: size.height - kToolbarHeight - kBottomNavigationBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Michael Solomon',
                  style: themeData.textTheme.headline6,
                ),
              ),
              addVerticalSpace(10),
              Center(
                child: Text(
                  'se.michael.solomon@gmail.com',
                  style: themeData.textTheme.bodyText2,
                ),
              ),
              addVerticalSpace(padding * 2),
              Container(
                margin: sidePadding,
                padding: const EdgeInsets.all(10.0),
                height: 70,
                decoration: BoxDecoration(
                  color: COLOR_GREY.withAlpha(40),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TabBar(
                  controller: _tabController,
                  labelColor: COLOR_SECONDARY,
                  unselectedLabelColor: COLOR_SECONDARY.withAlpha(100),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: COLOR_WHITE,
                  ),
                  tabs: const [
                    Tab(child: Text('Active')),
                    Tab(child: Text('In Review')),
                    Tab(child: Text('Draft')),
                  ],
                ),
              ),
              addVerticalSpace(padding / 2),
              const Padding(
                padding: sidePadding,
                child: Text('1 listing'),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: padding),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: RE_DATA.length,
                        itemBuilder: (BuildContext context, int index) =>
                            RealEstateItem(
                          itemData: RE_DATA[index],
                        ),
                      ),
                      FAVOURITE_DATA.isNotEmpty
                          ? ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: FAVOURITE_DATA.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  RealEstateItem(
                                itemData: FAVOURITE_DATA[index],
                              ),
                            )
                          : Center(
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
                                      text: 'In Review is',
                                      style: themeData.textTheme.headline5!
                                          .copyWith(
                                        color: COLOR_SECONDARY,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' empty',
                                          style: themeData.textTheme.headline5!
                                              .copyWith(
                                            color: COLOR_PRIMARY,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/coming_soon.png'),
                          addVerticalSpace(padding),
                          Text(
                            'Coming soon',
                            style: themeData.textTheme.headline4!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: COLOR_PRIMARY,
                            ),
                          )
                        ],
                      ),
                    ],
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

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, detailRoute);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
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
                Positioned(
                  top: 6,
                  right: 6,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, editPropertyRoute);
                    },
                    child: const CircleAvatar(
                      maxRadius: 20,
                      backgroundColor: COLOR_PRIMARY,
                      child: Icon(
                        Icons.edit,
                        color: COLOR_WHITE,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 10, bottom: 10),
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
                  Text(
                    formatCurrency(itemData['amount'] as int),
                    style: themeData.textTheme.headline6,
                  ),
                  addHorizontalSpace(10),
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
