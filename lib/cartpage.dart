import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Cart extends StatefulWidget {


  Cart({Key? key, }) : super(key: key);

  @override
  State<Cart> createState() => _CartState();

  static Future<Cart>? fromJson(jsonDecode) {}
}

class _CartState extends State<Cart> {
  List picked = [false, false];
  int totalamount = 0;

  int items = 0;
  // picktoggle(index) {
  //   setState(() {
  //     picked[index] = !picked[index];
  //     gettotalamount();
  //   });
  // }

  // gettotalamount() {
  //   var count = 0;
  //   for(int i=0;i<picked.length ;i++){
  //     if(picked[i]){
  //       setState(() {
  //         totalamount
  //       });
  //     }
  //   }
  // }

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      // Chicken image
                      image: AssetImage(
                          'assets/images/chicken.jpg'),
                    )),
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Fresh Chicken",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "Rs180",
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 10,
                                decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Rs150",
                            style: TextStyle(color: Colors.green[400]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 70,
                        height: 30,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 28,
                                child: IconButton(
                                    onPressed: () {
                                      minusitems();
                                    },
                                    icon: FaIcon(
                                      FontAwesomeIcons.circleMinus,
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
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_outlined,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10)),
              leading: Icon(Icons.percent_sharp),
              title: Text(
                "Apply Promo Code",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Delivery Charges",
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        Spacer(),
                        Text(
                          "Rs150",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Taxs and Charges",
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        Spacer(),
                        Text(
                          "Rs0",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Total amount",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                        Spacer(),
                        Text(
                          "Rs150",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.green[400]),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {},
                  child: Text(
                    "Place Order",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
