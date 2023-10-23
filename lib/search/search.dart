import 'package:flutter/material.dart';
import 'package:graduation_project/modules/settings/cubit.dart';
import '../shared/components/diseases_data.dart';

class DataSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            close(context, null);
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(
      '',
      style: TextStyle(color: Colors.black),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "${allData[index]["name"]}",
                      style: TextStyle(
                          fontSize: 15,
                          color: SettingCubit.get(context).isDark
                              ? Colors.grey
                              : Colors.grey[800]),
                    ),
                  ),
                  for (int i = 0; i >= allData[index]["data"].length; i++)
                    Text("${allData[index]["data"][i]["name"]}")
                ],
              ),
            ),
        separatorBuilder: (context, index) => Divider(
              height: 8,
              thickness: 1,
              indent: 50,
              endIndent: 50,
            ),
        itemCount: allData.length);
  }
}
