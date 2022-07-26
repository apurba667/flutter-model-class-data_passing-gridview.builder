import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'model/usermodel.dart';

class DetailsDemo extends StatefulWidget {
  const DetailsDemo({Key? key, this.model, this.mydata}) : super(key: key);

  final UserModel? model;
  final List<UserModel>? mydata;

  @override
  State<DetailsDemo> createState() => _DetailsDemoState();
}

class _DetailsDemoState extends State<DetailsDemo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage("${widget.model?.img}"),
                ),
              ),
              Text("Name: ${widget.model?.name}"),
              Text("occupation: ${widget.model?.address}"),
              Text("ID: ${widget.model?.id}"),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.mydata!.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailsDemo(
                                  model: myList[index],
                                  mydata: myList,
                                )));
                      },
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage("${widget.mydata![index].img}"),
                      ),
                      title: Text("${widget.mydata![index].name}"),
                      subtitle: Text("${widget.mydata![index].address}"),
                      trailing: Text(widget.mydata![index].isMale == true
                          ? "Male"
                          : widget.mydata![index].isMale == false
                              ? "Female"
                              : "Others"),
                    );
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
