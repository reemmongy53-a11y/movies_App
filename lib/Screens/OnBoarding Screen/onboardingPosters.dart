import 'package:flutter/material.dart';
import 'package:movies_app/core/AppColor/color.dart';
import 'package:movies_app/core/AppImage/image.dart';
import 'package:movies_app/customWidget/linear_gradient.dart';

import '../../Routes/route.dart';



class OnboardingPosters extends StatelessWidget {
  const OnboardingPosters({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset( AppImage.posters),
        linearGradient( startColor: Colors.black,primaryColor: AppColor.black,primaryOpacity: 0.91, endColor: AppColor.black, startOpacity: 0.5, endOpacity: 1),
          Container(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(child: Text(maxLines: 2,textAlign: TextAlign.center,"Find Your Next Favorite Movie Here",style: Theme.of(context).textTheme.bodyLarge,)),
                SizedBox(height: 10,),
                Center(child: Text(maxLines: 3,textAlign: TextAlign.center,"Get access to a huge library of movies to suit all tastes. You will surely like it.",style: Theme.of(context).textTheme.bodySmall,)),
                SizedBox(height: 15,),
                ElevatedButton(onPressed: (){
                  Navigator.pushReplacementNamed(context, AppRoute.OnBoarding.name);
                }, child: Text("Explore Now"))
            
              ],
            ),
          )
        ],
      ),
    );
  }
}
