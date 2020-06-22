
import 'package:flutter/material.dart';
import 'package:furball/data/pet_data.dart';
import 'package:furball/models/pet_category.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PetCategory> filterDogList = dogsList;
  List<PetCategory> filterCatList = catsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Text('My Pets',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30.0),),
            SizedBox(
              height: 10.0,
            ),
        TextField(
          onChanged: (petName){
            setState(() {
              filterCatList = catsList.where((cat) => (cat.name.toLowerCase().contains(petName.trim().toLowerCase().toString())) || cat.age.toLowerCase().contains(petName.trim().toLowerCase().toString())).toList();
              filterDogList = dogsList.where((dog) => (dog.name.toLowerCase().contains(petName.trim().toLowerCase().toString())) || dog.age.toLowerCase().contains(petName.trim().toLowerCase().toString())).toList();
            });
          },
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: "search by pet name or age",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            suffixIcon: GestureDetector(
              child: Icon(Icons.search),

            ),
          ),
        ),
            Text('Dogs',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 26.0),),
            SizedBox(
              height: 15.0,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: filterDogList.length,
                itemBuilder: (context,index){
              return PetsCard(
                age: filterDogList[index].age,
                breed: filterDogList[index].breed,
                image: filterDogList[index].image,
                name: filterDogList[index].name,
              );
            }),
            SizedBox(
              height: 5.0,
            ),
            Text('Cats',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 26.0),),
            SizedBox(
              height: 15.0,
            ),
            
            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: filterCatList.length,
                itemBuilder: (context,index){
                  return PetsCard(
                    age: filterCatList[index].age,
                    breed: filterCatList[index].breed,
                    image: filterCatList[index].image,
                    name: filterCatList[index].name,
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class PetsCard extends StatelessWidget {
  final String image;
  final String breed;
  final String name;
  final String age;
  const PetsCard({
    Key key,
    this.name,
    this.age,
    this.breed,
    this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0XFFE3E1F8),
            boxShadow: [
              BoxShadow(
                  color: Colors.white,
                  spreadRadius: 1.0,
                  blurRadius: 1.0,
                  offset: Offset(-0.5,-1.0)
              ),
              BoxShadow(
                  color: Colors.white,
                  spreadRadius: 5.0,
                  blurRadius: 10.0,
                  offset: Offset(-0.5,-1.0)
              ),

            ]
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 10.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(
                  child: ClipOval(child: Image.asset(image,)),
                  radius: 38.0,backgroundColor: Colors.brown,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(breed[0].toUpperCase()+breed.substring(1),style: TextStyle(
                      fontSize: 16.0
                    ),),
                    SizedBox(
                      height: 5,
                    ),
                    Text(name[0].toUpperCase()+name.substring(1),style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800
                    ),),
                    SizedBox(
                      height: 5,
                    ),
                    Text('$age years old')
                  ],
                ),
                Spacer(),
                Icon(Icons.chevron_right,size: 35.0,)
              ],
            )
//                ListTile(
//                  leading: CircleAvatar(
//                    child: Text('A'),
//                    radius: 50.0,backgroundColor: Colors.brown,
//                  ),
//                  title: Text('Aravind'),
//                  subtitle: Text("Mobile Developer"),
//                  trailing: Icon(Icons.chevron_right),
//                ),
        ),
      ),
    );
  }
}
