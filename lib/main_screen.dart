import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldapp/cubit/cubit.dart';
import 'package:goldapp/cubit/states.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});




  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()..getGoldPrice()..getSilverPrice(),
      child: BlocConsumer<MainCubit , States>(
        listener:(context, state){},
        builder:(context, state){
          return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:  const Center(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('TODAY ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            ),
            Text(' PRICE',
            style: TextStyle(
              color: Color.fromARGB(255, 248, 172, 59),
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            ),

          ],
        )),
      ),

      body: Container(
        padding: const EdgeInsets.only(top: 50, right: 8, left: 8),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Gold Column
            Column(
              children: [
                Image.asset('gold.png',
                height: MediaQuery.of(context).size.height/5,
                width: MediaQuery.of(context).size.width/2.5,
                ),
                // ignore: prefer_const_constructors
                SizedBox(height: 20,),
                // ignore: prefer_const_constructors
                Text('GOLD',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 33,
                  shadows: [
                    BoxShadow(
                      color: Colors.yellow[100]!,
                      offset: const Offset(2, 2),
                      blurRadius: 1.5
                    )
                  ]
                ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(height: 10,),
                // ignore: prefer_const_constructors
                Text(' ${MainCubit.get(context).goldI} 💷',
                style:  TextStyle(
                  color: Colors.orange[300],
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ],
            ),

            // Silver Column
            Column(
              children: [
                Image.asset('silver.png',
                height: MediaQuery.of(context).size.height/5,
                width: MediaQuery.of(context).size.width/2.5,
                ),
                // ignore: prefer_const_constructors
                SizedBox(height: 20,),
                // ignore: prefer_const_constructors
                Text('SILVER',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 33,
                  shadows: [
                    BoxShadow(
                      color: Colors.grey[300]!,
                      offset: const Offset(2, 2),
                      blurRadius: 1.5
                    )
                  ]
                ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(height: 10,),
                // ignore: prefer_const_constructors
                Text('${MainCubit.get(context).silverI} 💷',
                style:  TextStyle(
                  color: Colors.grey[300],
                  fontSize: 14,
                ),
                ),
              ],
            )
          ],
        ),
      ),
    );
        },
      )
      );
  }
  }