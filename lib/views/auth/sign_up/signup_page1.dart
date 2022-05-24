import 'dart:convert';

import 'package:flex/constants/colors.dart';
import 'package:flex/utils/size_config.dart';
import 'package:flex/views/auth/sign_up/signup_page2.dart';
import 'package:flex/views/auth/sign_up/widget/indicator.dart';
import 'package:flex/widgets/auth_button.dart';
import 'package:flex/widgets/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignUpPage1 extends StatefulWidget {
  const SignUpPage1({Key? key}) : super(key: key);

  @override
  State<SignUpPage1> createState() => _SignUpPage1State();
}

class _SignUpPage1State extends State<SignUpPage1> {
  final TextEditingController searchController = TextEditingController();

  bool isLoading = false;
  late List<String> autoCompleteData;

  late TextEditingController controller;

  Future fetchAutoCompleteData() async {
    setState(() {
      isLoading = true;
    });

    final String stringData =
        await rootBundle.loadString("assets/services.json");

    final List<dynamic> json = jsonDecode(stringData);

    final List<String> jsonStringData = json.cast<String>();

    setState(() {
      isLoading = false;
      autoCompleteData = jsonStringData;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAutoCompleteData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: lightPinkColor,
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10 * SizeConfig.heightMultiplier),
                child: Container(
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
                        horizontal: 5 * SizeConfig.widthMultiplier,
                        vertical: 4 * SizeConfig.heightMultiplier),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircularButton(),
                        SizedBox(height: 2 * SizeConfig.heightMultiplier),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Indicator(
                                isDone: false,
                              ),
                              HorizontalIndicator(),
                              Indicator(
                                isDone: false,
                              ),
                            ]),
                        SizedBox(height: 2 * SizeConfig.heightMultiplier),
                        Text(
                          'What service do you provide',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 2 * SizeConfig.heightMultiplier),
                        Text(
                          'Add the service you provide most regularly you can add more services later.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 5 * SizeConfig.heightMultiplier),
                        isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Autocomplete(
                                optionsBuilder:
                                    (TextEditingValue textEditingValue) {
                                  if (textEditingValue.text.isEmpty) {
                                    return const Iterable<String>.empty();
                                  } else {
                                    return autoCompleteData.where((word) => word
                                        .toLowerCase()
                                        .contains(textEditingValue.text
                                            .toLowerCase()));
                                  }
                                },
                                optionsViewBuilder: (context,
                                    Function(String) onSelected, options) {
                                  return Material(
                                    elevation: 4,
                                    child: ListView.separated(
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (context, index) {
                                        final option = options.elementAt(index);

                                        return ListTile(
                                          // title: Text(option.toString()),
                                          title: SubstringHighlight(
                                            text: option.toString(),
                                            term: controller.text,
                                            textStyleHighlight: const TextStyle(
                                                fontWeight: FontWeight.w700),
                                          ),
                                          // subtitle: const Text(""),
                                          onTap: () {
                                            onSelected(option.toString());
                                          },
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          const Divider(),
                                      itemCount: options.length,
                                    ),
                                  );
                                },
                                onSelected: (selectedString) {
                                  print(selectedString);
                                },
                                fieldViewBuilder: (context, controller,
                                    focusNode, onEditingComplete) {
                                  this.controller = controller;

                                  return TextField(
                                    controller: controller,
                                    focusNode: focusNode,
                                    onEditingComplete: onEditingComplete,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.grey[300]!),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.grey[300]!),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.grey[300]!),
                                      ),
                                      hintText: "Search Something",
                                      prefixIcon: const Icon(Icons.search),
                                    ),
                                  );
                                },
                              ),
                        // child:TypeAheadField<>(suggestionsCallback: suggestionsCallback, itemBuilder: itemBuilder, onSuggestionSelected: onSuggestionSelected)

                        // MyTextField(
                        //   hintText: 'Services',
                        //   textInputType: TextInputType.name,
                        //   controller: searchController,
                        //   validator: (val) {},
                        // ),
                        SizedBox(height: 5 * SizeConfig.heightMultiplier),
                        AuthButton(
                          onTap: () {
                            Get.to(() => const SignUpPage2());
                          },
                          text: 'Next',
                          isExpanded: true,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
