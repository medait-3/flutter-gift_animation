import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Home(),
       theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>  with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  bool _animationCompleted = false;
  bool bottomCardShow = false;
  bool shouldShow =true;
double myheight=350;
bool _isVisible = true;




  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..addListener(() {
        if (_controller.status == AnimationStatus.completed && !_animationCompleted) {
          setState(() {
            _animationCompleted = true;
          });
        }
      });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.red.shade100,
      body: Stack(
        children: [

          Column(
            children: [
             SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(    
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        color: Colors.white,
                        height: 45,
                        width: 45,
                           child: IconButton(
                                   icon: const Icon(Icons.chevron_left_sharp),
                                   iconSize: 25,
                                   color: Colors.red.shade100,
                                   onPressed: () {},
                                 ),),
                    ), 
                    ClipRRect(    
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        color: Colors.white,
                        height: 45,
                        width: 45,
                           child: IconButton(
                                   icon: const Icon(Icons.shopping_bag_sharp),
                                   iconSize: 25,
                                   color: Colors.red.shade100,
                                   onPressed: () {},
                                 ),),
                    ), 
                  ],
                ),
              ),
             SizedBox(height: 60,),
           !bottomCardShow?     Image.asset("assets/watches/3.png",height: myheight,)
                                : Column(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [SizedBox(height: 62,),
                                    FadeInDownBig(from: 500,duration: Duration(seconds: 3),
                                    child:             Visibility(
              visible: _isVisible,
child: Image.asset("assets/watches/3.png",height: myheight,)),),
                                  ],
                                ),
         
            
             SizedBox(height: 20,),
             !bottomCardShow? Expanded(child: bottomCard()):FadeInDown(child: Offstage())
             ],),
          
                 shouldShow==true&&
            _animationCompleted==true? Center(
              child: FadeInDown(from: 1150,duration: Duration(seconds: 5),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  children: [SizedBox(height: 100,),
                      CircleAvatar(radius: 25,
                 backgroundColor: Colors.pink.shade200,
                 child: Icon(Icons.check,
                         size: 40,
                         color: Colors.red.shade100,),
                ), 
                  ],
                ),
              ),
            ):Container(), 
            if(_animationCompleted==true&&shouldShow==false) 
            Center(
              child: FadeInDown(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        CircleAvatar(radius: 55,
                   backgroundColor: Colors.pink.shade200,
                   child: Icon(Icons.check,
                           size: 90,
                           color: Colors.red.shade100,),
                           
                  ),SizedBox(height: 11,), 
                  Text("Congratulations",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
            ),
            // |
                 if(shouldShow)
             AnimatedPositioned(height: 300,
            duration: Duration(seconds: 3),
            top: _animationCompleted ? MediaQuery.of(context).size.height / 2 - 200 : -200,
            child: FadeIn(child: Image.asset("assets/watches/1.png",))
          ),
          
                 if(shouldShow)
          AnimatedPositioned(height: 300,
            duration: Duration(seconds: 1),
            bottom: _animationCompleted ? MediaQuery.of(context).size.height / 2 - 120 : -600,
            child:Image.asset("assets/watches/2.png",)
          ),

        ],
      ),
    );
  }

  ClipRRect bottomCard() {
    return ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(160)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 40),
        decoration: BoxDecoration(color: Color.fromARGB(255, 247, 239, 239)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Text('Teddy Medyy',style: TextStyle(fontSize: 18),),
              const SizedBox(height: 5),
              
              Row(
                children: [
                  Text('\$23.44',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              Text('  /  ',style: TextStyle(fontSize: 16,color: Colors.grey.shade400),),
              Text('Price + Taxes',style: TextStyle(fontSize: 16,color: Colors.grey.shade400),),
                ],
              ),

              const SizedBox(height: 15),
              Row(
                children: [
                        CircleAvatar(radius: 8,
             backgroundColor: Colors.red,
            ), SizedBox(width: 10,),
                   CircleAvatar(radius: 8,
             backgroundColor: Colors.pink.shade300,
            ), SizedBox(width: 10,),
                   CircleAvatar(radius: 8,
             backgroundColor: Colors.amber,
            ), SizedBox(width: 10,),
                   CircleAvatar(radius: 8,
             backgroundColor: Colors.green,
                   ),
                ],
              ),
               Padding(
                 padding: const EdgeInsets.only(right: 50,top: 20,bottom: 30),
                 child: InkWell(
onTap: () {

  setState(() {
    
              bottomCardShow = !bottomCardShow;
    _controller.forward();
myheight=150;
    shouldShow = true;
      _isVisible = true;

  });
    Timer timer = Timer(Duration(seconds: 7), () {
    setState(() {
      shouldShow = false;
        _isVisible = false;
    });
  });

},                   child: ClipRRect(    borderRadius: BorderRadius.circular(21),
                    child:   Container(color:Colors.pink.shade300,width: double.infinity,height: 50,
                    child: Center(child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Icon(
                        Icons.shopping_basket_outlined,
                        color: Colors.white,
                        size: 20,
                      ),            SizedBox(width: 11,),
                        Text("ADD TO BOX",style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 16),),
                      ],
                    )),),
                        ),
                 ),
               )
 
            ],
          ),
        ),
      ),
    );
  }
}

