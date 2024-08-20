import 'package:e_commerce/home.dart';
import 'package:e_commerce/resources.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/cart.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) => const Home()));
        },
            icon: const Icon(Icons.arrow_back),
        ),
       title: const Text("Details product"),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined,size: screenWidth*0.08,)),
              const CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: Text("3",style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ],
      ),
      body:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: double.infinity,
                  child: Image(image: AssetImage('assets/003.JPG'),height: 200,fit: BoxFit.fill,)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Air pods max by Apple",style: TextStyle(fontWeight: FontWeight.bold),),
                            Row(
                              children: [
                                Text("\$ 1999,99",style: TextStyle(fontWeight: FontWeight.bold),),
                                SizedBox(width: 10,),
                                Text("(219 people buy this)")
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.favorite_border)
                      ],
                    ),
                    const Text("Choose the color",style: TextStyle(fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        smaallBoxes(context, logo: 'assets/003.JPG'),
                        smaallBoxes(context, logo: 'assets/003.JPG'),
                        smaallBoxes(context, logo: 'assets/003.JPG'),
                        smaallBoxes(context, logo: 'assets/003.JPG'),
                        smaallBoxes(context, logo: 'assets/003.JPG'),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/004.JPG'),
                          radius: 30,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Apple Store",style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("online 12 mins Ago")
                          ],
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child:
                          const Text("Folow"),
                        )
                      ],
                    ),
                  const Divider(),
                  const Text("Describtion of product",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              const Text("Lorem ipsum door sit amet, consecteur adipiscing elit. Maecenas magna massa,"
                  "laoreet ut tempor non, tincidunt non mi. Sed eget suscipit metus. Maecenas "
                  "luctus enim lacus, id volutpatnibh pulvinar luctus. Nullam id sapien pharetra, "
                  "malesuada feilis a, tempor velit. Proin egestas dictum auctor. duis a cursus est."),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration:const BoxDecoration(
                            color: Colors.greenAccent
                          ) ,
                          child: TextButton(onPressed: (){
                            Navigator.pushReplacement (context,
                               MaterialPageRoute(builder: (BuildContext context) => const Cart() ));
                          },
                              child: const Text("Add to Cart"),
                        )),
                        Container(
                            decoration:const BoxDecoration(
                                color: Colors.greenAccent
                            ) ,
                            child: TextButton(onPressed: (){},
                              child: const Text("Buy Now"),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
    );
  }
}
