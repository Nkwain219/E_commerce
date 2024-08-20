import 'package:e_commerce/cart.dart';
import 'package:e_commerce/details.dart';
import 'package:flutter/material.dart';

Widget imageContainer(BuildContext context,
{
required String logo,
required String title,
required String amount,
}
    )

{
  double screenH = MediaQuery.sizeOf(context).height;
  double screenW = MediaQuery.sizeOf(context).width;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      elevation: 1,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(16),
          topLeft: Radius.circular(16))),
      shadowColor: Colors.white,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
        child: GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context)=>const Details()));
          },
          child: Container(
            height:screenH* 0.28,
            width: screenW* 0.43,
            decoration: const BoxDecoration(
              //color: Colors.blue,
            ),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: AssetImage(logo),fit: BoxFit.cover,height: (screenH*0.28)*0.55,width:screenW*0.43,),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0,right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,style: TextStyle(fontSize: (screenH*0.3)*0.06),),
                      SizedBox(height: (screenH*0.001)*0.3,),
                      Text(amount,style: TextStyle(fontWeight: FontWeight.bold,fontSize: (screenH*0.3)*0.08),),
                      SizedBox(height:  (screenH*0.03)*0.3,),
                      Container(
                        height: MediaQuery.sizeOf(context).height*0.12*0.38,
                        //width: MediaQuery.sizeOf(context).width*0.4,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.greenAccent
                        ),
                        child: TextButton(onPressed: (){},
                            child:Text("Add to cart",style: TextStyle(color: Colors.white,fontSize: (screenH*0.32*0.08)*0.6)),),
                      )
                    ],
                  ),
                ),

              ],
            )
          ),
        ),
      ),
    ),
  );
}
Widget longContainer(BuildContext context,
{
  required String logo,
}
    ){
  double screenH = MediaQuery.sizeOf(context).height;
  double screenW = MediaQuery.sizeOf(context).width;
  return ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child: Container(
      height: screenH*0.2,
      width: screenW*0.8,
      decoration: const BoxDecoration(),
      child: Image(image: AssetImage(logo),fit: BoxFit.fill),
    ),
  );
}

Widget smaallBoxes(BuildContext context,
{
  required logo,
}
    ){
  double screenH = MediaQuery.sizeOf(context).height;
  //double screenW = MediaQuery.sizeOf(context).width;
  return
    Stack(
      children: [
    ClipRRect(
    borderRadius: BorderRadius.circular(8),
  child: Container(
  height: screenH*0.06,
  width: screenH*0.06,
  decoration: BoxDecoration(
  color: Colors.greenAccent[100]
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: screenH*0.05,
            width: screenH*0.05,
            decoration: const BoxDecoration(
              color: Colors.blue
            ),
            child: Image(image: AssetImage(logo),width: screenH*0.05,height: screenH*0.05,fit: BoxFit.cover,)
              ),
      ),
    ],
  ),
  ),
  )
      ],
    );

}
 final searchControl = TextEditingController();
 Widget searchBar(){
   //double screenH = MediaQuery.sizeOf(context).height;
   //double screenW = MediaQuery.sizeOf(context).width;
   return
     Material(
       elevation: 3,
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
       shadowColor: Colors.white,
       child: Container(
         height: 40,
         width: double.infinity,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(8),

         ),
         child:
         Padding(
           padding: const EdgeInsets.only(left: 8.0),
           child:  TextField(
             onChanged: searchResults,
             controller: searchControl,
             decoration: const InputDecoration(
               hintText: "Search here.....",
               border: InputBorder.none,
               icon: Icon(Icons.search),
             ),
           ),
         ),
       ),
     );
 }
class Searches{
  final String logo;
  final String title;
  final String price;

  const Searches({
    required this.logo,
    required this.title,
    required this.price,
});
}
List<Searches> allData = [
  //imageContainer(context, logo: 'assets/003.JPG', title: "Ear phone", amount: "\$900")
  const Searches(logo: 'assets/003.JPG', title: "Ear phone", price: "\$900"),
  const Searches(logo: 'assets/002.JPG', title: "Ear phone1", price: "\$900"),
  const Searches(logo: 'assets/004.JPG', title: "Ear phone2", price: "\$900"),
  const Searches(logo: 'assets/001.JPG', title: "Ear phone3", price: "\$900"),
  const Searches(logo: 'assets/009.JPG', title: "Ear phone4", price: "\$900"),
  const Searches(logo: 'assets/003.JPG', title: "Ear phone5", price: "\$900"),
  const Searches(logo: 'assets/003.JPG', title: "Ear phone6", price: "\$900"),
];
List<Searches> filteredData = List.from(allData);
void searchResults(String query){
  filteredData = allData.where((searches) =>
      searches.title.toLowerCase().contains(query.toLowerCase())).toList();

}
Widget result(BuildContext context){
  return filteredData.isNotEmpty?
      ListView.builder(
        itemCount: filteredData.length,
          itemBuilder: (context, index){
          return ListTile(
            title: Text(filteredData[index].title),
          );
          },
          ):const Center(child: Text("No results found"));
}
int _counter = 0;
class AddCart extends StatefulWidget {
  const AddCart({super.key});

  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
 int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child:  Cart(),
    );
  }

  Widget addCart(
      BuildContext context,
      {
        required String logo,
        required String title,
        required String texts,
        required String price,
      }
      )

  {
    double screenH = MediaQuery.sizeOf(context).height;
    double screenW = MediaQuery.sizeOf(context).width;
    return
      Row(
        children: [
          Container(
            height:screenH* 0.28,
            width: screenW* 0.43,
            decoration: const BoxDecoration(
//color: Colors.blue,
            ),
            child:
            Image(image: AssetImage(logo),fit: BoxFit.cover,
              height: (screenH*0.28)*0.55,width:screenW*0.43,),),
          Column(
            children: [
              Text(texts),
              Text(title),
              Text(price)
            ],
          ),
          Row(
            children: [
              IconButton(onPressed:_incrementCounter,
                  tooltip: 'Increment',
                  icon: const Icon(Icons.add)),
              Text(
                '$_counter',
              ),
            ],
          ),
        ],
      );
  }

}

/**class ImageContainer extends StatelessWidget {
  final String logo;
  const ImageContainer({super.key, required this.logo});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}**/
