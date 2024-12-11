import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BillHistoryPage extends StatefulWidget {
  const BillHistoryPage({super.key});

  @override
  State<BillHistoryPage> createState() => _BillHistoryPageState();
}

class _BillHistoryPageState extends State<BillHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill History',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.brown,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Orders").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty){
            return Center(child: Text('No Order Found...'),);
          }
          final Orders = snapshot.data!.docs;

          return ListView.builder(
            itemCount: Orders.length,
            itemBuilder: (context,index){

              final order = Orders[index];
              final seller = order['seller'] ?? 'not found';
              final teaQuantity = order['teaQuantity'] ?? 0;
              final teaTotal = order['teaTotal'] ?? 0;
              final bournvitaQuantity = order['bournvitaQuantity'] ?? 0;
              final bournvitaTotal = order['bournvitaTotal'] ?? 0;
              final grandTotal = order['grandTotal'] ?? 0;

              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Seller: $seller",
                        style: const TextStyle(fontSize: 18, color: Colors.brown),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Tea Quantity: $teaQuantity",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Tea Total: ₹ $teaTotal",
                        style: const TextStyle(fontSize: 16, color: Colors.green),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Bournvita Quantity: $bournvitaQuantity",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Bournvita Total: ₹ $bournvitaTotal",
                        style: const TextStyle(fontSize: 16, color: Colors.green),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Grand Total: ₹ $grandTotal",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                    ],
                  ),
                ),
              );
            });
        },
      ),
    );
  }
}
