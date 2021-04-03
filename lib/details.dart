import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Details(
      {@required this.name,
      @required this.price,
      @required this.image,
      @required this.description});
  final String name;
  final String price;
  final String image;
  final String description;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: TextStyle(color: Colors.pink, fontFamily: 'Satisfy'),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: height * 0.3),
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text(
                            name,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: 160,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: ClipRRect(
                              child: Image.network(
                                image,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Expanded(
                          flex: 3,
                          child: SingleChildScrollView(
                            physics: ScrollPhysics(),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    description,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10.0),
                          width: width,
                          height: 40.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Add to Cart",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                price + " \$",
                                style: TextStyle(
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
