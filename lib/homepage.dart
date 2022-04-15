import 'dart:async';

import 'package:api_test/model/quotesmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'apiservice/apiservice.dart';
import 'cartpage.dart';
import 'model/quotesmodel.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<RestaurantModel>? futureQuotes;

  @override
  void initState() {
    super.initState();
    futureQuotes = fetchQuotes();
  }

  int items = 0;
  void additems() {
    setState(() {
      items++;
    });
  }

  void minusitems() {
    setState(() {
      items--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetching Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Restaurant Api'),
        ),
        body: Center(
          child: FutureBuilder<RestaurantModel>(
            future: futureQuotes,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.nrestaurants!.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Column(children: [
                          Stack(children: [
                            Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://ebshosting.co.in" +
                                                '${snapshot.data!.nrestaurants![index].logo}'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Container(
                                  child: ListTile(
                                    tileColor: Colors.lightGreen[400],
                                    title: Text(
                                        "${snapshot.data!.nrestaurants![index].name}"),
                                    subtitle: Row(
                                      children: [
                                        Icon(Icons.star),
                                        Icon(Icons.star),
                                        Icon(Icons.star),
                                        Icon(Icons.star),
                                        Icon(Icons.star),
                                      ],
                                    ),
                                    trailing: Text(
                                        '${snapshot.data!.nrestaurants![index].deliveryTime}'),
                                  ),
                                )
                              ],
                            )
                          ]),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Column(
                                children: [
                                  DefaultTabController(
                                    length: 3,
                                    child: Container(
                                      height: 25,
                                      width: 405,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TabBar(
                                        isScrollable: true,
                                        labelColor: Colors.grey,
                                        //unselectedLabelColor: colors,

                                        //indicatorColor: Colors.grey,
                                        indicator: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.grey.shade400)),
                                        tabs: [
                                          Text(
                                            "Fresh Chicken",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text("Fresh Chicken",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          Text("Fresh Chicken",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Cart()));
                                    },
                                    leading:
                                        //Image(image: image),
                                        Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/chicken.jpg'))),
                                      width: 50,
                                      height: 50,
                                    ),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Fresh Chicken",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("1KG")
                                      ],
                                    ),
                                    subtitle: Row(
                                      children: [
                                        Text(
                                          "rs 150\t\t",
                                          style: TextStyle(
                                              color: Colors.lightGreen[400]),
                                        ),
                                        Text(
                                          "Rs180",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.grey[300]),
                                        )
                                      ],
                                    ),
                                    trailing: ElevatedButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                            context: context,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(20),
                                              ),
                                            ),
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            builder: (BuildContext context) {
                                              return Container(
                                                color: Colors.white,
                                                height: 200,
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    // mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Select Quantity",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        width: 300,
                                                        height: 40,
                                                        child: Row(
                                                          children: [
                                                            Spacer(),
                                                            Text(
                                                              "Full | Rs300",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 50,
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                border: Border.all(
                                                                    width: 1,
                                                                    color: Colors
                                                                        .grey),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                              width: 70,
                                                              height: 30,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    SizedBox(
                                                                      width: 28,
                                                                      child:
                                                                          IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          if (items <=
                                                                              0) {
                                                                            items =
                                                                                0;
                                                                          } else {
                                                                            minusitems();
                                                                          }
                                                                          // minusitems();
                                                                        },
                                                                        icon:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .circleMinus,
                                                                          size:
                                                                              15,
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                        "$items"),
                                                                    SizedBox(
                                                                      width: 25,
                                                                      child:
                                                                          IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          additems();
                                                                        },
                                                                        icon:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .circlePlus,
                                                                          size:
                                                                              15,
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        width: 300,
                                                        height: 40,
                                                        child: Row(
                                                          children: [
                                                            Spacer(),
                                                            Text(
                                                              "Full | Rs300",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 50,
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                border: Border.all(
                                                                    width: 1,
                                                                    color: Colors
                                                                        .grey),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                              width: 70,
                                                              height: 30,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    SizedBox(
                                                                      width: 28,
                                                                      child:
                                                                          IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          if (items <=
                                                                              0) {
                                                                            items =
                                                                                0;
                                                                          } else {
                                                                            minusitems();
                                                                          }
                                                                        },
                                                                        icon:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .circleMinus,
                                                                          size:
                                                                              15,
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "$items",
                                                                    ),
                                                                    SizedBox(
                                                                      width: 25,
                                                                      child:
                                                                          IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          additems();
                                                                        },
                                                                        icon:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .circlePlus,
                                                                          size:
                                                                              15,
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        width: 300,
                                                        height: 40,
                                                        child: Row(
                                                          children: [
                                                            Spacer(),
                                                            Text(
                                                              "Full | Rs300",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 50,
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                border: Border.all(
                                                                    width: 1,
                                                                    color: Colors
                                                                        .grey),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                              width: 70,
                                                              height: 30,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    SizedBox(
                                                                      width: 28,
                                                                      child:
                                                                          IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          if (items <=
                                                                              0) {
                                                                            items =
                                                                                0;
                                                                          } else {
                                                                            minusitems();
                                                                          }
                                                                        },
                                                                        icon:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .circleMinus,
                                                                          size:
                                                                              15,
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                        "$items"),
                                                                    SizedBox(
                                                                      width: 25,
                                                                      child:
                                                                          IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          additems();
                                                                        },
                                                                        icon:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .circlePlus,
                                                                          size:
                                                                              15,
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Text("Add to Cart"),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.green[400],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        )),
                                  ),
                                  ListTile(
                                    leading:

                                        //Image(image: image),
                                        Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/chicken.jpg'))),
                                      width: 50,
                                      height: 50,
                                    ),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Fresh Chicken",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("1KG")
                                      ],
                                    ),
                                    subtitle: Row(
                                      children: [
                                        Text(
                                          "rs 150\t\t",
                                          style: TextStyle(
                                              color: Colors.lightGreen[400]),
                                        ),
                                        Text(
                                          "Rs180",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.grey[300]),
                                        )
                                      ],
                                    ),
                                    trailing: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                      ),
                                      width: 70,
                                      height: 30,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: 28,
                                              child: IconButton(
                                                  onPressed: () {
                                                    if (items <= 0) {
                                                      items = 0;
                                                    } else {
                                                      minusitems();
                                                    }
                                                  },
                                                  icon: FaIcon(
                                                    FontAwesomeIcons
                                                        .circleMinus,
                                                    size: 15,
                                                    color: Colors.black,
                                                  )),
                                            ),
                                            Text("$items"),
                                            SizedBox(
                                              width: 25,
                                              child: IconButton(
                                                  onPressed: () {
                                                    additems();
                                                  },
                                                  // icon: Icon(Icons.add)
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.circlePlus,
                                                    size: 15,
                                                    color: Colors.black,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                      );
                    });

                //end
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
