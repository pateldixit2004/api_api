import 'package:api_api/api/provider/productProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductProvider? providerF;
  ProductProvider? providerT;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).api();
  }

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<ProductProvider>(context, listen: false);
    providerT = Provider.of<ProductProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shop),
            color: Colors.black,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dixit patel",
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  "Welcome to yara",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 7.h,
                  width: 70.w,
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.w),
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.w),
                          borderSide: BorderSide(color: Colors.black)),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Colors.black,
                      ),
                      hintText: 'Serch here',
                      hintStyle: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Container(
                  height: 7.h,
                  width: 7.h,
                  decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(2.w)),
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
                )
              ],
            ),
            SizedBox(height: 2.h),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 25.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.w),
                          border:Border.all(color: Colors.green)
                        ),
                        child: Column(

                          children: [
                            Image.network('${providerT!.productList[index].image}',height: 20.h,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("₹${providerT!.productList[index].price}",style: TextStyle(fontSize: 2.h),),
                                      IconButton(onPressed: () {

                                      }, icon: Icon(Icons.favorite_border)),
                                    ],
                                  ),
                                  Text("rating=${providerT!.productList[index].rattingModal!.rate}"),

                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    );
                  },itemCount: providerT!.productList.length,),
            )
          ],
        ),
      ),
    ));
  }
}
