import 'package:flutter/material.dart';
import 'package:lecture11/features/mycart/data.dart';
import 'package:lecture11/features/widgets/cartwidgert.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset("assets/images/Group 1.png")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Exclusive Offer" ,style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.bold ,color: Colors.black),),
                  TextButton(onPressed: () {}, child: Text("see all" ,style: TextStyle(color: Color(0xff53B175)),)),
                ],
              ),
              SizedBox(
                height: 250,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: carts.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 18);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    CartData product = carts[index];
                    return productcard(product: product);
                  },
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("best selling" ,style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.bold ,color: Colors.black)),
              Text("see all" ,style:TextStyle(color: Color(0xff53B175)) ,)],),
              gridcards(),
            ],
          ),
        ),
      ),
    );
  }
}