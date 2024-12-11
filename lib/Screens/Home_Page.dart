import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tea_diary_app/Screens/Bill_History_Page.dart';
import 'package:tea_diary_app/Screens/Items.dart';
import 'package:tea_diary_app/Screens/New_Order_Page.dart';
import 'package:tea_diary_app/Screens/Seller_Page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<Map<String, dynamic>>fetchMonthlyData() async{

    num teaCoffeeCount = 0;
    num totalAmount = 0;

    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('orders')
          .where('timestamp', isGreaterThanOrEqualTo: DateTime(DateTime.now().year, DateTime.now().month))
          .get();

      for (var doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        teaCoffeeCount += (data['teaQuantity'] ?? 0) + (data['bournvitaQuantity'] ?? 0);
        totalAmount += data['grandTotal'] ?? 0;
      }
    } catch (e) {
      print("Error fetching monthly data: $e");
    }

    return {
      'teaCoffeeCount': teaCoffeeCount,
      'totalAmount': totalAmount,
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: fetchMonthlyData(),
        builder: (context, snapshot) {
          num teaCoffeeCount = 0;
          num totalAmount = 0;

    if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
      teaCoffeeCount = (snapshot.data!['teaCoffeeCount'] ?? 0) as int;
      totalAmount = (snapshot.data!['totalAmount'] ?? 0) as int;
    }
      return Scaffold(
        appBar: AppBar(
          title: Text('Tea Diary App',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.brown,
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
          ),
            backgroundColor: Colors.brown,
            child: Icon(Icons.share,color: Colors.white,),
            onPressed: (){

            }
        ),
        body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //Tea/Coffee Sold in this Month
                Container(
                  height: 250,
                  width: 175,
                  color: Colors.brown,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(teaCoffeeCount.toString(),
                        style: TextStyle(color: Colors.white,fontSize: 50),
                      ),
                      Text('Tea/Coffe in\n    August',style:TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                SizedBox(width: 25,),

                //For Monthly Total Amount
                Container(
                  height: 250,
                  width: 175,
                  color: Colors.brown,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("\u20b9 $totalAmount",
                        style: TextStyle(color: Colors.white,fontSize: 50),
                      ),
                      Text('Amount of\n   August',style:TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                //Seller
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> SellerPage()));
                    },
                    child: Container(
                      height: 110,
                      width: 115,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.people,color: Colors.brown,size: 50,),
                          Text('Seller',style: TextStyle(fontSize: 20,color: Colors.brown, fontWeight: FontWeight.bold),),
                        ],
                      ),

                    ),
                  ),
                ),

                //Items
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Items(),));
                    },
                    child: Container(
                      height: 110,
                      width: 115,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.menu_book_outlined,color: Colors.brown,size: 50,),
                          Text('Items',style: TextStyle(fontSize: 20,color: Colors.brown, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                ),

                //Seller-Wise Items
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){

                    },
                    child: Container(
                      height: 110,
                      width: 115,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person,color: Colors.brown,size: 50,),
                          Text('Sellerwise',style: TextStyle(fontSize: 20,color: Colors.brown, fontWeight: FontWeight.bold),),
                          Text('Items',style: TextStyle(fontSize: 20,color: Colors.brown, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //New Order
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NewOrderPage(),));
                    },
                    child: Container(
                      height: 110,
                      width: 115,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.note_alt_outlined,color: Colors.brown,size: 50,),
                          Text('New Order',style: TextStyle(fontSize: 20,color: Colors.brown, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                ),

                //Generate items
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){

                    },
                    child: Container(
                      height: 110,
                      width: 115,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.calculate,color: Colors.brown,size: 50,),
                          Text('Generate',style: TextStyle(fontSize: 20,color: Colors.brown, fontWeight: FontWeight.bold),),
                          Text('Items',style: TextStyle(fontSize: 20,color: Colors.brown, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                ),

                //Bill History
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => BillHistoryPage()));
                    },
                    child: Container(
                      height: 110,
                      width: 115,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.history,color: Colors.brown,size: 50,),
                          Text('Bill History',style: TextStyle(fontSize: 20,color: Colors.brown, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    }
  );
  }
}