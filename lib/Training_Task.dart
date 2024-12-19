import 'package:flutter/material.dart';

class TrainingTask extends StatefulWidget {
  const TrainingTask({super.key});

  @override
  State<TrainingTask> createState() => _TrainingTaskState();
}

class _TrainingTaskState extends State<TrainingTask> {

  //List of images and their names
  final List<String> images = [
    'assets/images/abs.png',
    'assets/images/back.png',
    'assets/images/biceps.png',
    'assets/images/squats.png',
    'assets/images/thigh.png',
    'assets/images/running.png',
  ];

  final List<String> imageNames = [
    'Abs',
    'Back',
    'Biceps',
    'Squats',
    'Thigh',
    'Running',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Training'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios),
                  Icon(Icons.calendar_month_outlined),
                  Text(' 29 April ',style: TextStyle(fontSize: 15),),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text('Your Progress',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Padding(
                      padding: const EdgeInsets.only(left: 150.0),
                      child: Text('Details',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ),
                    Icon(Icons.arrow_forward_outlined,size: 30,),
                  ],
                ),

                //Let's Workout UI
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    height: 250,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(100),topLeft: Radius.circular(10),bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10),),
                      color: Colors.blueAccent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Let\'s Workout',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),
                          Text('Legs Toning\nand Glutes Workout',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
                          Padding(
                            padding: const EdgeInsets.only(top: 70),
                            child: Row(
                              children: [
                                Icon(Icons.timer_outlined,size: 25,color: Colors.white),
                                Text('44 min',style: TextStyle(color: Colors.white),),
                                Padding(
                                  padding: const EdgeInsets.only(left: 225),
                                  child: Icon(Icons.play_circle_fill_outlined,color: Colors.white,size: 55,),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                //Progress UI
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        height: 125,
                        width: double.infinity,
                        child: Card(
                          // elevation: 25,
                          // shadowColor: Colors.blueAccent,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 110.0,top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("You are doing great...",style: TextStyle(color: Colors.blueAccent,fontSize: 25),),
                                Text("Time : 5 min",style: TextStyle(fontSize: 15)),
                                Text("you have burnt lot of calories",style: TextStyle(fontSize: 15))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: Container(
                        height: 135,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/images/sport-woman-running-fitness-icon.png',),alignment: Alignment.bottomLeft)
                        ),
                      ),
                    ),
                  ]
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Area of Focus",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 10,),

                //Area of Focus
                Container(
                  height: 800,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.white,
                          child: Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Image.asset(images[index] ,height: 100,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(imageNames[index],style: TextStyle(fontSize: 15),),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
