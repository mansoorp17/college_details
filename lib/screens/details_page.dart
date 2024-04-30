import 'package:college_details/common/color_page.dart';
import 'package:college_details/models/college_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

class DetailsPage extends StatelessWidget {
  final CollegeModel collegeModel;
  const DetailsPage({super.key, required this.collegeModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * 0.6,
              width: width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.03),
                  color: colorPage.secondaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "College Name:",
                    style: TextStyle(
                        color: colorPage.backgroundColor,
                        fontSize: width * 0.04),
                  ),
                  SizedBox(
                    width: width * 0.5,
                    child: Text(
                      collegeModel.name,
                      style: TextStyle(
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.w600,
                        color: colorPage.primaryColor,
                      ),
                    ),
                  ),
                  Divider(),
                  Text(
                    "Alpha-two-code:",
                    style: TextStyle(
                        color: colorPage.backgroundColor,
                        fontSize: width * 0.04),
                  ),
                  Text(
                    collegeModel.alphaTwoCode,
                    style: TextStyle(
                        fontSize: width * 0.05, color: colorPage.primaryColor),
                  ),
                  Divider(),
                  Text(
                    "Country:",
                    style: TextStyle(
                        color: colorPage.backgroundColor,
                        fontSize: width * 0.04),
                  ),
                  Text(
                    collegeModel.country,
                    style: TextStyle(
                        fontSize: width * 0.05, color: colorPage.primaryColor),
                  ),
                  Divider(),
                  Text(
                    "Domains:",
                    style: TextStyle(
                        color: colorPage.backgroundColor,
                        fontSize: width * 0.04),
                  ),
                  Text(collegeModel.domains[0]),
                  Divider(),
                  GestureDetector(
                    onTap: () => _launchUrl(collegeModel.webPages[0]),
                    child: Text(
                      "More details click here...",
                      style: TextStyle(
                          color: colorPage.backgroundColor,
                          decoration: TextDecoration.underline,
                          decorationColor: colorPage.backgroundColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}
