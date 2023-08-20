import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/book_model.dart';

class BooksData extends StatefulWidget {
  final Books bookData;
  const BooksData({Key? key, required this.bookData}) : super(key: key);

  @override
  State<BooksData> createState() => _BooksDataState();
}

class _BooksDataState extends State<BooksData> {
  List<String> tabs = [
    "Description",
    "Reviews",
    "Similliar",
  ];
  int current = 0;

  double changePositionedOfLine() {
    switch (current) {
      case 0:
        return 0;
      case 1:
        return 103;
      case 2:
        return 185;

      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 430,
                color: Color.fromARGB(195, 255, 208, 179),
              ),
              Positioned(
                top: 55,
                left: 15,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(63, 61, 61, 61),
                            blurRadius: 6.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 0.0),
                          )
                        ]),
                    child: Icon(Icons.chevron_left_outlined),
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width / 2 - 70,
                top: 155,
                child: Container(
                  width: 140,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.bookData.cover.toString(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            height: MediaQuery.of(context).size.height - 430,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.bookData.name.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: .3),
                ),
                Text(
                  widget.bookData.madeBy.toString(),
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: .3),
                ),
                Text(
                  widget.bookData.value.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.pink[200],
                    letterSpacing: .3,
                  ),
                ),
                SizedBox(),
                SizedBox(
                  width: size.width / 2 + 120,
                  height: size.height * 0.039,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          width: size.width,
                          height: size.height * 0.04,
                          child: ListView.builder(
                            itemCount: tabs.length,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: index == 0 ? 0 : 25,
                                  ),
                                  child: Text(
                                    tabs[index],
                                    style: TextStyle(
                                      color: current == index
                                          ? Colors.black
                                          : Colors.grey[400],
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .4,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        bottom: 7,
                        left: changePositionedOfLine(),
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: Duration(milliseconds: 1000),
                        child: AnimatedContainer(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(milliseconds: 1000),
                          width: 30,
                          height: size.height * 0.003,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(1050),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                current == 0
                    ? Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley ",
                        style: TextStyle(
                          color: Colors.grey,
                          height: 1.2,
                        ),
                      )
                    : current == 1
                        ? Text(
                            "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                            style: TextStyle(
                              color: Colors.grey,
                              height: 1.2,
                            ),
                          )
                        : Text(
                            "industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                            style: TextStyle(
                              color: Colors.grey,
                              height: 1.2,
                            ),
                          ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 14, horizontal: 131),
                    decoration: BoxDecoration(
                        color: Colors.pink[200],
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      "Add to Library",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
