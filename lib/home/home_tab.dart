import 'package:flutter/material.dart';
import '../my_theme.dart';


class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.blackColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 220,width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(6),
                    child: ClipRRect(
                      child: Container(
                        color: Colors.orange,
                        height: 200,
                        width: 300,
                      ),
                    ),
                  );
                }
            ),
          ),

          const SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('New Releases',style: TextStyle(
                color: MyTheme.whiteColor,fontSize: 20,
              ),
              ),
            ],
          ),
          const SizedBox(height: 18,),
          SizedBox(height: 150,width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      child: Container(
                        color: Colors.orange,
                        height: 200,
                        width: 90,
                      ),
                    ),
                  );
                }
            ),
          ),
          const SizedBox(height: 18,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Recomended',style: TextStyle(
                color: MyTheme.whiteColor,fontSize: 20,
              ),
              ),
            ],
          ),
          SizedBox(height: 170,width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      child: Container(
                        color: Colors.orange,
                        height: 200,
                        width: 90,
                      ),
                    ),
                  );
                }
            ),
          ),
        ],
      ),

    );
  }
}

