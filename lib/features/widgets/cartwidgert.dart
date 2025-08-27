

import 'package:flutter/material.dart';
import 'package:lecture11/features/mycart/data.dart';

class gridcards extends StatelessWidget {
  const gridcards({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 250,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),

      itemCount: carts.length,
      itemBuilder: (BuildContext context, int index) {
        final CartData product2 = carts[index];
        return Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffE2E2E2), width: 1),
          ),
          width: 150,
          padding: EdgeInsets.all(5),
          height: 200,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(product2.image, width: 100, height: 70),
                ),
                Text(product2.name ,style: TextStyle(fontSize: 16 ,color: Colors.black ,),),
                Text(product2.weigth ,style:TextStyle(color: Color(0xff53B175) ),),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product2.price.toString()),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      style: IconButton.styleFrom(
                        backgroundColor: Color(0xff53B175),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class productcard extends StatelessWidget {
  const productcard({super.key, required this.product});

  final CartData product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE2E2E2), width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      width: 170,
      padding: EdgeInsets.all(20),

      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset(product.image)],
            ),
            SizedBox(height: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [Text(product.name, style: TextStyle(fontSize: 16 ,color: Colors.black),), Text(product.weigth ,style: TextStyle(color: Color(0xff53B175)),)],
            ),
            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.price.toString()),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  style: IconButton.styleFrom(
                    backgroundColor: Color(0xff53B175),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
