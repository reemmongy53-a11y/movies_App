import 'package:flutter/material.dart';
import '../../API/ApiManager.dart';
import 'MoviesSources.dart';

class Browse extends StatelessWidget {
  Browse({super.key});


  @override
  Widget build(BuildContext context) {
    ApiManager.getInstence().getMoviesSources();
    return Scaffold(
      body:FutureBuilder(future:  ApiManager.getInstence().getMoviesSources(), builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError){
          return Center(child: Text("Something Went Wrong"));
        }
        var data = snapshot.data;
        return MoviesSources(data!.data!.movies!);
      })

    );
  }
}
