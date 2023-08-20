import 'package:day_33_with_flutter/screens/booksdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'model/book_model.dart';

class BookApp extends StatefulWidget {
  const BookApp({super.key});

  @override
  State<BookApp> createState() => _BookAppState();
}

List<String> tabs = [
  "New",
  "Trending",
  "Best Seller",
];
int current = 0;

class _BookAppState extends State<BookApp> {
  double changePositionedOfLine() {
    switch (current) {
      case 0:
        return 0;
      case 1:
        return 56;
      case 2:
        return 140;

      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, Kuvaan16",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: .2,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "Discover Latest Book",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: .2,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        height: 40,
                        width: MediaQuery.of(context).size.width - 80,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Search book..",
                            hintStyle: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.pink[100],
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: size.width / 2 + 12,
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
                                    StoryData();
                                    print(
                                        tabs[current].toLowerCase().toString());
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: index == 0 ? 10 : 25,
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
                          margin: EdgeInsets.only(left: 10),
                          duration: Duration(milliseconds: 1000),
                          width: 10,
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
                SizedBox(
                  height: 5,
                ),
                StoryData(),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Popular",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: .2,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Popular()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: double.infinity,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: getbooks.length,
        itemBuilder: (context, index) {
          if (getbooks[index].type.toString() != "new") {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BooksData(
                      bookData: getbooks[index],
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      padding: EdgeInsets.only(bottom: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffDDDDDD),
                            blurRadius: 8.0,
                            spreadRadius: 2.0,
                            offset: Offset(0, 1),
                          )
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          getbooks[index].cover.toString(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getbooks[index].name.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          getbooks[index].madeBy.toString(),
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          getbooks[index].value.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}

class StoryData extends StatelessWidget {
  const StoryData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: getbooks.length,
          itemBuilder: (context, index) {
            if (getbooks[index].type.toString() ==
                tabs[current].toLowerCase().toString()) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BooksData(
                        bookData: getbooks[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: 3),
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffDDDDDD),
                        blurRadius: 6.0,
                        spreadRadius: 2.0,
                        offset: Offset(0.0, 0.0),
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      getbooks[index].cover.toString(),
                    ),
                  ),
                ),
              );
            } else {
              return SizedBox();
            }
          }),
    );
  }
}
