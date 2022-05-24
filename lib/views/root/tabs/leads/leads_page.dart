import 'package:flex/constants/colors.dart';
import 'package:flex/models/lead_model.dart';
import 'package:flex/utils/size_config.dart';
import 'package:flex/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail_page.dart';

class LeadsPage extends StatelessWidget {
  const LeadsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPinkColor,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 90 * SizeConfig.heightMultiplier,
              width: 100 * SizeConfig.widthMultiplier,
              decoration: const BoxDecoration(
                color: lightWhiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 2.5 * SizeConfig.widthMultiplier),
                child: Column(children: [
                  const CircularButton(),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: 10,
                        // mainAxisSpacing: 10,
                      ),
                      itemCount: leadData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Get.to(() => LeadsDetailPage(
                                //       getData: leadData[index],
                                //     ));
                                Get.to(() => DetailPage(
                                      getData: leadData[index],
                                    ));
                              },
                              child: SizedBox(
                                height: 28 * SizeConfig.heightMultiplier,
                                width: 45 * SizeConfig.widthMultiplier,
                                // color: Colors.black,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height:
                                            20 * SizeConfig.heightMultiplier,
                                        width: 80 * SizeConfig.widthMultiplier,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 4)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2 *
                                                  SizeConfig.heightMultiplier,
                                              horizontal: 5 *
                                                  SizeConfig.widthMultiplier),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                  'Post ' +
                                                      leadData[index]
                                                          .postedTimeAgo
                                                          .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        color: Colors.grey,
                                                      )),
                                              Text(
                                                  leadData[index]
                                                      .trainerName
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle1!
                                                      .copyWith(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                              Text(
                                                  leadData[index]
                                                      .trainerType
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                              SizedBox(
                                                  height: 2 *
                                                      SizeConfig
                                                          .heightMultiplier),
                                              Row(
                                                children: [
                                                  Icon(Icons.location_on,
                                                      color: Colors.black,
                                                      size: 4 *
                                                          SizeConfig
                                                              .imageSizeMultiplier),
                                                  const SizedBox(width: 5),
                                                  Flexible(
                                                    child: Text(
                                                        leadData[index]
                                                            .address
                                                            .toString(),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .caption!
                                                            .copyWith(
                                                                color: Colors
                                                                    .black)),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(Icons.credit_card,
                                                      color: Colors.black,
                                                      size: 4 *
                                                          SizeConfig
                                                              .imageSizeMultiplier),
                                                  const SizedBox(width: 5),
                                                  Flexible(
                                                    child: Text(
                                                        '${leadData[index].credits.toString()} credits',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .button!
                                                            .copyWith(
                                                                color: Colors
                                                                    .black)),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        child: CircleAvatar(
                                            radius: 30,
                                            backgroundImage: AssetImage(
                                                leadData[index].imgPath!)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
