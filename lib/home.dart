import 'package:e_commerce/resources.dart';
import 'package:e_commerce/search.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool expanded = false;
  //final searchControll = TextEditingController();
   /**final List<Searches> allData = [
    //imageContainer(context, logo: 'assets/003.JPG', title: "Ear phone", amount: "\$900")
    const Searches(logo: 'assets/003.JPG', title: "Ear phone", price: "\$900"),
    const Searches(logo: 'assets/002.JPG', title: "Ear phone1", price: "\$900"),
    const Searches(logo: 'assets/004.JPG', title: "Ear phone2", price: "\$900"),
    const Searches(logo: 'assets/001.JPG', title: "Ear phone3", price: "\$900"),
    const Searches(logo: 'assets/009.JPG', title: "Ear phone4", price: "\$900"),
    const Searches(logo: 'assets/003.JPG', title: "Ear phone5", price: "\$900"),
    const Searches(logo: 'assets/003.JPG', title: "Ear phone6", price: "\$900"),
  ];

  List<Searches> filteredData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredData = List.from(allData);
  }
  void searchResults(String query){
    setState(() {
      filteredData = allData.where((searches) =>
          searches.title.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }
  @override
  void dispose(){
    searchControll.dispose();
    super.dispose();
  }**/
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      //backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Delivery Address",style: TextStyle(fontSize: screenHeight * 0.016,color: Colors.grey),),
            GestureDetector(
              onTap: (){
                setState(() {
                  expanded = !expanded;
                });
              },
              child: Row(
                children: [
                  Text("Salatiga City, Central Java",style: TextStyle(fontSize: screenHeight * 0.02)),
                  Icon(expanded? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                ],
              ),
             ),
            Visibility(
              visible: expanded,
                child: Container())
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                Stack(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined,size: screenWidth*0.08,)),
                    const CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Text("2",style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
                IconButton(onPressed: (){}, icon:Icon(Icons.notifications_none_rounded,size: screenWidth*0.08),),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) => const SearchPage()));
                },
                  child: searchBar()),
              //result(context),
              SizedBox(height: screenHeight*0.01,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    longContainer(context, logo: 'assets/007.PNG'),
                    SizedBox(width: screenWidth*0.04,),
                    longContainer(context, logo: 'assets/007.PNG'),
                  ],
                ),
              ),
              SizedBox(height: screenHeight*0.01,),
              Text("Category",style: TextStyle(
                  fontSize: screenWidth*0.04,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: screenHeight*0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  smaallBoxes(context, logo: 'assets/001.PNG'),
                  smaallBoxes(context, logo: 'assets/002.PNG'),
                  smaallBoxes(context, logo: 'assets/003.PNG'),
                  smaallBoxes(context, logo: 'assets/more.JPG')
                ],
              ),
              SizedBox(height: screenHeight*0.01,),
              Row(
                children: [
                  Expanded(child: Text("Recent Product",style: TextStyle(
                    fontSize: screenWidth*0.04,
                    fontWeight: FontWeight.bold
                  ),)),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(width: 0.5,color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        children: [
                          Text("Filters",style: TextStyle(
                              fontSize: screenWidth*0.03,
                              //fontWeight: FontWeight.bold
                          ),),
                          const Icon(Icons.filter_alt_outlined),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  imageContainer(context, logo: 'assets/001.JPG', title: "Monitor LG 22 inch", amount: "\$199.99"),
                  imageContainer(context, logo: 'assets/002.JPG', title: "Aestechic Mug", amount: "\$19.99"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  imageContainer(context, logo: 'assets/007.PNG', title: "Monitor LG 22 inch", amount: "\$199.99"),
                  imageContainer(context, logo: 'assets/006.JPG', title: "Aestechic Mug", amount: "\$19.99")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
