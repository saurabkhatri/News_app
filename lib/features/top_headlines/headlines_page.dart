import 'package:flutter/material.dart';
import 'package:news_app/config/network/network_request.dart';

import 'headline_model.dart';

class HeadlinesPage extends StatefulWidget {
  const HeadlinesPage({super.key});

  @override
  State<HeadlinesPage> createState() => _HeadlinesPageState();
}

class _HeadlinesPageState extends State<HeadlinesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: ListView(
          children: [
            FutureBuilder<List<Articles>?>(
                future: NetworkRequest().getTopHeading(),
                builder: (context, snapshot){

                  if(snapshot.hasData){

                    var result = snapshot.data;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: result?.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context , index ) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text (result?[index].content??''),
                          ),
                        );
                      }
                    );
                  }
                  else if(snapshot.hasData){

                    return Center(child: Text('Error fetching data'),);

                  }
                  return CircularProgressIndicator();
                }


            )
          ],
       ),
        );
    }
}


