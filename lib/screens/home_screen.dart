import 'package:college_details/models/college_model.dart';
import 'package:college_details/screens/details_page.dart';
import 'package:college_details/services/api_service.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CollegeModel> colleges = [];
  @override
  void initState() {
    fetchCollege();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COLLEGES"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: width,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var college = colleges[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(
                          collegeModel: colleges[index],
                        ),
                      )),
                  child: ListTile(
                    title: Text(college.name),
                    trailing: Text(college.alphaTwoCode),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemCount: colleges.length,
            ),
          )
        ],
      ),
    );
  }

  Future<void> fetchCollege() async {
    final response = await UserApi.fetchColleges();
    // print("ggggggggggg $response");
    setState(() {
      colleges = response;
    });
  }
}
