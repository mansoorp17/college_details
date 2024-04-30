import 'dart:convert';
import 'package:college_details/models/college_model.dart';
import 'package:http/http.dart' as http;

class UserApi{
  static Future <List<CollegeModel>> fetchColleges() async {
    var url = "http://universities.hipolabs.com/search?name=middle";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    List<CollegeModel> datas=[];

    if(response.statusCode==200){
      var data = jsonDecode(response.body);

      for(var i in data){
        datas.add(CollegeModel.fromJson(i));
      }

      return datas;
      print(data);
    } else{
      print("Failed To Fetch Data");
    }
    // print(datas);
    return datas;
  }
}
