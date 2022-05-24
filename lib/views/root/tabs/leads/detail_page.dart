import 'package:flex/constants/colors.dart';
import 'package:flex/models/lead_model.dart';
import 'package:flex/utils/size_config.dart';
import 'package:flex/widgets/auth_button.dart';
import 'package:flex/widgets/back_button.dart';
import 'package:flex/widgets/column_data.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.getData,
  }) : super(key: key);
  final LeadModel getData;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomSliverDelegate(
                expandedHeight: 198,
                getDataValue: widget.getData,
              ),
            ),
            SliverFillRemaining(
              child: Container(
                  // height: 90 * SizeConfig.heightMultiplier,
                  // width: 100 * SizeConfig.widthMultiplier,
                  color: lightPinkColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 1 * SizeConfig.heightMultiplier,
                        horizontal: 8 * SizeConfig.widthMultiplier),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 1 * SizeConfig.heightMultiplier),
                        Text('Trainer Detail',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600)),
                        const SizedBox(height: 5),
                        ColumnData(
                            heading: 'Gender:', text: widget.getData.gender!),
                        ColumnData(heading: 'Age:', text: widget.getData.age!),
                        ColumnData(
                            heading: 'Preference for the gender of trainer?',
                            text: widget.getData.prefergenderofTrainer!),
                        ColumnData(
                            heading: 'Frequently you want session',
                            text: widget.getData.sessionInWeek!),
                        ColumnData(
                            heading: 'Current exercises',
                            text: widget.getData.currentExercise!),
                        ColumnData(
                            heading: 'Goal:', text: widget.getData.goal!),
                        ColumnData(
                            heading: 'Consider online or remotly training',
                            text:
                                widget.getData.onlineTraining! ? "Yes" : "No"),
                        ColumnData(
                            heading: 'Training time preferences',
                            text: widget.getData.daysTimePreferences!),
                        ColumnData(
                            heading: 'Would you consider group class',
                            text: widget.getData.considerGroupclass!
                                ? "Yes"
                                : "No"),
                        SizedBox(height: 2 * SizeConfig.heightMultiplier),
                        AuthButton(
                            isExpanded: true,
                            onTap: () {},
                            text: 'Contact ${widget.getData.trainerName}')
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  final LeadModel getDataValue;
  CustomSliverDelegate({
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
    required this.getDataValue,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
              backgroundColor: lightPinkColor,
              leading: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularButton(),
              ),
              elevation: 0.0,
              title: Opacity(
                  opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                  child: Text("Lead Detail",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Colors.black))),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30 * percent),
                child: Card(
                    color: lightPinkColor,
                    elevation: 20.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Personal Information',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600)),
                          Text(getDataValue.trainerName!,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600)),
                          Text(getDataValue.trainerType!,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600)),
                          Text(getDataValue.address!,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.black)),
                          Text('Happy to recieve online or remotely',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.black)),
                          SizedBox(height: 1 * SizeConfig.heightMultiplier),
                          Row(
                            children: [
                              const Icon(Icons.phone, color: Colors.black),
                              SizedBox(width: 2 * SizeConfig.widthMultiplier),
                              Text(getDataValue.phoneNumber!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(color: Colors.black))
                            ],
                          ),
                          SizedBox(height: 1 * SizeConfig.heightMultiplier),
                          Row(
                            children: [
                              const Icon(Icons.mail, color: Colors.black),
                              SizedBox(width: 2 * SizeConfig.widthMultiplier),
                              Text(getDataValue.mail!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(color: Colors.black))
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.mail, color: Colors.black),
                              SizedBox(width: 2 * SizeConfig.widthMultiplier),
                              Text('${getDataValue.credits} Credits',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(color: Colors.black))
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
