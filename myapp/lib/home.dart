import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myapp/details.dart';
import 'package:myapp/model/usermodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                  flex: 5,
                  child: Container(
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: myList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.teal,
                          child: Column(
                            children: [
                              Image.network(
                                "${myList[index].img}",
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Text("${myList[index].name}"),
                            ],
                          ),
                        );
                      },
                    ),
                  )),
              Expanded(
                  flex: 5,
                  child: Container(
                    child: ListView.builder(
                      itemCount: myList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (DetailsDemo(
                                        model: myList[index],
                                        mydata: myList,
                                      ))),
                            );
                          },
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage("${myList[index].img}"),
                          ),
                          title: Text("${myList[index].name}"),
                          subtitle: Text("${myList[index].address}"),
                          trailing: Text("${myList[index].id}"),
                        );
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
