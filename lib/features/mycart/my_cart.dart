import 'package:flutter/material.dart';
import 'package:lecture11/features/mycart/data.dart';

class MyCart extends StatefulWidget {
  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  late List<int> quantities;

  @override
  void initState() {
    super.initState();
    // نبدأ بقيمة 1 لكل منتج
    quantities = List<int>.filled(carts.length, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: carts.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 18);
              },
              itemBuilder: (BuildContext context, int index) {
                late final CartData cart_product = carts[index];

                return Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),

                    border: BoxBorder.fromLTRB(
                      bottom: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(cart_product.image, height: 70, width: 70),
                      SizedBox(width: 18),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(cart_product.name),
                            Text("${cart_product.price} ,price"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (quantities[index] > 0) {
                                        quantities[index]--;
                                      } else {
                                        quantities[index] = 0;
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xff53B175),
                                    ),
                                    child: Icon(Icons.remove),
                                  ),
                                ),
                                Text("${quantities[index]}"),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quantities[index]++;
                                      ;
                                    });
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xff53B175),
                                    ),
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 18),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.close)),
                          Text(
                            "${(quantities[index] * cart_product.price).toStringAsFixed(2)}",
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
