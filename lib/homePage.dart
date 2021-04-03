import 'package:api_ten/MakeUp.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as https;

import 'details.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Model>> getData() async {
    var url =
        "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";
    var response = await https.get(Uri.parse(url));
    var jsonString = response.body;
    List<Model> model = modelFromJson(jsonString);
    return model;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MakeUp',
          style: TextStyle(
              color: Colors.pink[400],
              fontWeight: FontWeight.w500,
              fontFamily: "Satisfy"),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            height: height * 0.2,
            width: width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ClipRRect(
                  child: Image.asset(
                    "assets/banner-1.jpg",
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                SizedBox(width: 5.0),
                ClipRRect(
                  child: Image.asset(
                    "assets/banner-2.jpeg",
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            width: width,
            height: height * 0.15,
            child: Column(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: FontAwesomeIcons.female,
                        label: "All",
                      ),
                      IconButton(
                        icon: Icons.cake,
                        label: "Events",
                      ),
                      IconButton(
                        icon: Icons.attach_money,
                        label: "Offers",
                      ),
                      IconButton(
                        icon: Icons.favorite,
                        label: "Favorites",
                      ),
                    ]),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: FontAwesomeIcons.award,
                        label: "Stories",
                      ),
                      IconButton(
                        icon: FontAwesomeIcons.angellist,
                        label: "Community",
                      ),
                      IconButton(
                        icon: FontAwesomeIcons.carrot,
                        label: "Health",
                      ),
                      IconButton(
                        icon: FontAwesomeIcons.chessQueen,
                        label: "For you",
                      ),
                    ]),
              ],
            ),
          ),
          Container(
              width: width,
              height: height * 0.54,
              child: FutureBuilder(
                  future: getData(),
                  builder: (context, snapshot) {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        physics: ScrollPhysics(),
                        itemCount:
                            snapshot.data == null ? 0 : snapshot.data.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              width: 80,
                              height: 80,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 4,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(1),
                                        width: 50,
                                        height: 18,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                            color: Colors.pink),
                                        child: Text(
                                          snapshot.data[index].price + " \$",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5.0),
                                  Image.network(snapshot.data[index].imageLink,
                                      width: 60.0, height: 60.0),
                                  Text(
                                    snapshot.data[index].name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Montserrat",
                                        letterSpacing: 1.2,
                                        fontSize: 10.0),
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Details(
                                          name: snapshot.data[index].name,
                                          price: snapshot.data[index].price,
                                          image: snapshot.data[index].imageLink,
                                          description: snapshot
                                              .data[index].description)));
                            },
                          );
                        });
                  }))
        ],
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  IconButton({@required this.icon, @required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            icon,
            size: 20,
            color: Colors.pink,
          ),
          SizedBox(height: 10.0),
          Text(
            label,
            style: TextStyle(fontFamily: "Montserrat", color: Colors.grey[700]),
          )
        ],
      ),
    );
  }
}
