import 'package:flex/constants/colors.dart';
import 'package:flex/constants/images.dart';
import 'package:flex/models/lead_model.dart';
import 'package:flex/utils/size_config.dart';
import 'package:flex/widgets/back_button.dart';
import 'package:flutter/material.dart';

class LeadsDetailPage extends StatefulWidget {
  const LeadsDetailPage({
    Key? key,
    required this.getData,
  }) : super(key: key);
  final LeadModel getData;
  @override
  State<LeadsDetailPage> createState() => _LeadsDetailPageState();
}

class _LeadsDetailPageState extends State<LeadsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPinkColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0,
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularButton(),
            ),
            backgroundColor: lightPinkColor,
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
                // title: const Text('Details'),

                background: Container(
              height: 200,
              width: 100 * SizeConfig.widthMultiplier,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(lead),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            )),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SizedBox(
                  height: 100 * SizeConfig.heightMultiplier,
                  width: 100 * SizeConfig.widthMultiplier,
                  child: Column(
                    children: const [],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
