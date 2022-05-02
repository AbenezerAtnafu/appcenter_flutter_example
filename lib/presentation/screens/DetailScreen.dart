import 'package:flutter/material.dart';
import 'package:flutter_job_one/presentation/router/routes.dart';
import 'package:flutter_job_one/presentation/screens/EmailLoginScreen.dart';
import 'package:flutter_job_one/sample_data.dart';
import 'package:flutter_job_one/utils/constants.dart';
import 'package:flutter_job_one/utils/custom_functions.dart';
import 'package:flutter_job_one/utils/widgets_functions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:readmore/readmore.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  bool isReadmore = false;

  Widget buildText(String text) {
    final ThemeData themeData = Theme.of(context);

    final lines = isReadmore ? null : 4;
    return Text(
      text,
      style: themeData.textTheme.bodyText2,
      maxLines: lines,
      overflow: isReadmore ? TextOverflow.visible : TextOverflow.ellipsis,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25.0;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Container(
          height: 80.0,
          width: 80.0,
          child: FloatingActionButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.call,
                  size: 28,
                ),
                Text('Call')
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, addListingRoute);
            },
          ),
        ),
        body: Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/real_estate1.png"),
                    ),
                  ),
                ),
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${formatCurrency(285000)}',
                            style: themeData.textTheme.headline6!.copyWith(
                              color: COLOR_PRIMARY,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          addVerticalSpace(7),
                          Text(
                            'Bole, Addis Ababa',
                            style: themeData.textTheme.bodyText2,
                          ),
                          addVerticalSpace(7),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.favorite_border,
                            size: 30,
                          ),
                          addHorizontalSpace(10),
                          Icon(
                            Icons.share_outlined,
                            size: 30,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: sidePadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.king_bed_outlined,
                            color: COLOR_PRIMARY,
                          ),
                          addHorizontalSpace(5),
                          Text('2 Bedrooms')
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.shower_outlined,
                            color: COLOR_PRIMARY,
                          ),
                          addHorizontalSpace(5),
                          Text('2 Baths')
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.square_foot,
                            color: COLOR_PRIMARY,
                          ),
                          addHorizontalSpace(5),
                          Text('250 msq')
                        ],
                      )
                    ],
                  ),
                ),
                addVerticalSpace(padding),
                Divider(
                  thickness: 2,
                ),
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: Text(
                    'Floor Number : 2',
                    style: themeData.textTheme.headline6,
                  ),
                ),
                addVerticalSpace(padding / 2),
                Padding(
                  padding: sidePadding,
                  child: Text(
                    'Bathroom : Shared',
                    style: themeData.textTheme.headline6,
                  ),
                ),
                addVerticalSpace(padding),
                Divider(
                  thickness: 2,
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
                  child: ReadMoreText(
                    'Beautifully furnished 2 bedroom apartment available for short and long term stay in furnished 2 bedroom apartment available for short and long term stay in Beautifully furnished 2 bedroom apartment available for short and long term stay in furnished 2 bedroom apartment available for short and long term stay in Beautifully furnished 2 bedroom apartment available for short and long term stay in furnished 2 bedroom apartment available for short and long term stay in Beautifully furnished 2 bedroom apartment available for short and long term stay in furnished 2 bedroom apartment available for short and long term stay in Beautifully furnished 2 bedroom apartment available for short and long term stay in furnished 2 bedroom apartment available for short and long term stay in Beautifully furnished 2 bedroom apartment available for short and long term stay in furnished 2 bedroom apartment available for short and long term stay in',
                    trimLines: 4,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: '',
                    moreStyle: TextStyle(
                      color: COLOR_PRIMARY,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    style: TextStyle(
                      color: COLOR_SECONDARY,
                    ),
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
                    spacing: 60,
                    runSpacing: 20,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.local_parking_outlined,
                            size: 40,
                            color: COLOR_PRIMARY,
                          ),
                          addVerticalSpace(10),
                          Text('Parking Lot')
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.elevator_outlined,
                            size: 40,
                            color: COLOR_PRIMARY,
                          ),
                          addVerticalSpace(10),
                          Text('Elevator')
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.security_outlined,
                            size: 40,
                            color: COLOR_PRIMARY,
                          ),
                          addVerticalSpace(10),
                          Text('Security')
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.power_rounded,
                            size: 40,
                            color: COLOR_PRIMARY,
                          ),
                          addVerticalSpace(10),
                          Text('Generator')
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.water,
                            size: 40,
                            color: COLOR_PRIMARY,
                          ),
                          addVerticalSpace(10),
                          Text('Water Tanker')
                        ],
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(padding),
                Divider(
                  thickness: 2,
                ),
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: Text(
                    'Map location',
                    style: themeData.textTheme.headline6,
                  ),
                ),
                addVerticalSpace(padding / 2),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Container(
                      width: size.width * 0.9,
                      height: 250,
                      child: GoogleMap(
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                          target: _center,
                          zoom: 11.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 100,
                    right: 20,
                    left: 20,
                  ),
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    color: COLOR_GREY.withAlpha(80),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'See on Google Maps',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
