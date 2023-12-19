import 'dart:convert';

import 'package:basic_flutter/provider/changeBgColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../models/PostsModel.dart';
import '../models/post_model2.dart';
import '../models/post_model3.dart';
import '../models/user_details.dart';

String text =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vestibulum suscipit posuere. Duis diam mauris, pretium eget eros eget, pretium rutrum turpis. Donec rutrum aliquam arcu non blandit. Nulla quis porttitor nulla. Aenean tempor viverra dolor, nec venenatis est tristique ut. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse ullamcorper sem ac tellus commodo, et sodales purus aliquam. Cras pellentesque sit amet diam id tempus. Praesent eget ligula at risus ornare vestibulum venenatis sed sapien. Donec ut efficitur purus, ac commodo magna. Curabitur id dui eu nulla accumsan venenatis ac sed dui. Etiam libero sem, pretium vel congue non, sodales id lorem. Fusce vehicula dapibus orci nec sodales. Aenean sagittis id ligula quis molestie. Proin tempor felis fringilla lorem viverra dapibus. Donec vulputate augue eu posuere consectetur. Cras quis dolor ac ligula congue fermentum. Mauris et lectus eleifend, pulvinar augue quis, suscipit orci. Pellentesque at nulla et dolor laoreet semper a nec lacus. Aliquam at diam pellentesque, iaculis mauris a, pretium ex. Aliquam imperdiet magna id nunc rhoncus fermentum. Duis euismod cursus turpis non convallis. Donec ante odio, vehicula a orci eget, viverra placerat risus. Vestibulum orci tortor, vulputate eget ultricies et, imperdiet ut mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer magna nulla, sodales convallis nibh id, lobortis faucibus elit. Maecenas in dapibus dui. Nam risus leo, fringilla in molestie eu, ornare et lorem. Sed tristique tortor eu efficitur lacinia. Fusce cursus metus purus, hendrerit laoreet magna condimentum ac. Fusce a cursus ex. Nunc convallis sollicitudin ipsum et laoreet. Vestibulum euismod, risus nec tincidunt ultrices, metus elit vulputate purus, ut blandit diam nulla at lectus. Aenean commodo ipsum tortor. Mauris vulputate arcu a lacus condimentum placerat. Phasellus et nisi vulputate, vehicula justo non, pretium diam. Suspendisse dolor arcu, dictum nec finibus id, luctus molestie justo. Donec elementum cursus tellus, nec venenatis augue eleifend et. In in odio vehicula, sagittis felis vehicula, imperdiet magna. Vivamus risus mi, viverra quis scelerisque sit amet, vehicula dignissim odio. Maecenas blandit augue diam, sed lacinia quam eleifend vel. Suspendisse sit amet justo a velit sodales porttitor a at enim. Donec consectetur tincidunt volutpat. In enim elit, eleifend id nulla vitae, efficitur feugiat ipsum. Aliquam massa velit, consequat ullamcorper lorem non, maximus fringilla lacus. Fusce eu metus at sem ultrices consequat. Fusce semper, libero vitae gravida euismod, nisi neque rhoncus lectus, sit amet fringilla nisl dui et dolor. Donec luctus enim at tellus hendrerit commodo. Proin sed convallis orci. Integer mauris lectus, condimentum et efficitur quis, semper in neque. Duis ut justo neque. Morbi semper porta arcu. Morbi feugiat, tellus sed sagittis viverra, mi velit egestas leo, non aliquam enim lectus eu enim. Cras convallis euismod aliquam. Proin condimentum aliquet finibus. Nam augue turpis, pretium et aliquam vel, elementum ut sem. Aenean hendrerit mauris vel libero tempor mollis. Nullam id mi vitae magna tristique maximus. Maecenas massa felis, suscipit et lectus ac, aliquam tincidunt libero. Vestibulum consequat id nunc nec accumsan. Donec eu sagittis mi. Donec at feugiat ante. Suspendisse potenti. Sed in neque vel velit aliquam fermentum. Fusce congue feugiat metus, eu malesuada risus finibus in. Donec maximus nisi et magna cursus dictum. Integer id justo consequat justo blandit feugiat. Praesent molestie iaculis porttitor. Sed volutpat ipsum tellus, non rhoncus magna rutrum a. Proin suscipit orci rutrum, luctus justo eget, faucibus est. Nam non leo nunc. Quisque vulputate vestibulum malesuada. Donec tincidunt orci convallis turpis blandit euismod. Pellentesque sodales ex a enim vestibulum consectetur. Curabitur ut nibh at libero dapibus aliquet vel ac turpis. Mauris eget diam quis neque varius vulputate sed non diam. Morbi viverra efficitur iaculis. Vivamus ornare mattis pharetra. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce scelerisque, mi a tincidunt suscipit, nisl quam viverra eros, quis varius justo augue et dolor. Proin quis sodales magna. Nullam condimentum rhoncus metus at dictum. Duis tempus sagittis erat, vitae cursus risus elementum nec. Aliquam nec turpis arcu. Integer ultrices, orci vitae egestas interdum, felis odio commodo risus, a pharetra erat enim sed urna. Integer dapibus rhoncus dolor, quis gravida ante convallis nec. Duis ante nibh, porttitor eget purus non, aliquam euismod augue. Pellentesque volutpat, tellus a aliquam hendrerit, dolor nisl dapibus quam, ac interdum mi ante et leo. Duis ac lorem mi. In rhoncus nisl ut sapien lobortis, in blandit urna hendrerit. Nam vehicula metus est, at sollicitudin tortor malesuada quis. Nullam tortor eros, placerat eget pharetra quis, semper eget massa. Morbi ut leo enim. Pellentesque tempor ligula dui, ac lacinia turpis consectetur in. Mauris congue dapibus nunc, et facilisis elit. Ut hendrerit odio enim, id varius leo pellentesque sit amet. Nulla gravida orci id commodo venenatis. Vivamus interdum orci id dolor imperdiet, et luctus tellus feugiat. Maecenas a ullamcorper justo, non gravida mauris. Nulla bibendum ante a luctus finibus. Donec non mollis odio. Sed tellus tellus, tincidunt et venenatis et, pulvinar eu eros. Curabitur eget nulla nec ipsum sodales tristique. Praesent in lacinia ligula. Integer lorem mauris, viverra at turpis ac, iaculis egestas sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam aliquam mauris ut est malesuada, vel aliquam augue euismod. Quisque auctor dignissim ultricies. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed arcu leo, vestibulum efficitur enim vel, semper elementum nunc. Nullam facilisis nisi vitae mi dignissim egestas. Suspendisse pharetra tortor vel ultrices tincidunt. Etiam tincidunt risus hendrerit ultricies cursus. Nam quis rhoncus nulla, in porttitor purus. Vestibulum pharetra blandit libero, eget interdum metus fringilla eget. Suspendisse non pulvinar dolor.  Nunc tempor neque in massa hendrerit, semper tempor nisl congue. Vivamus scelerisque lorem in velit vehicula sodales ultrices nec dui. Morbi in massa vel enim efficitur vestibulum. Proin eget vehicula est. Aliquam semper augue id tincidunt ultricies. Donec tempor nisi vitae sodales dapibus. Fusce ac posuere risus, vel vestibulum sem. Curabitur scelerisque nisi eu odio commodo placerat a ut quam. Vestibulum posuere purus sed ex ultricies, id vulputate enim lacinia. Phasellus id metus erat. Nullam vel mauris vehicula.";

class DescriptionPage extends StatelessWidget {
  DescriptionPage({super.key, required this.title, required this.path});
  final String title;
  final String path;
  List<UserDetails> postList = [];
  Future<List<UserDetails>> getPostApi() async {
    final response =
        // await http.get(Uri.parse('https://mocki.io/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8'));
        // await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

        //await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postList.clear();
      for (Map i in data) {
        postList.add(UserDetails.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ChangeColor>().color,
      appBar: AppBar(
        backgroundColor: Colors.red,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'My Blog',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 00,
        ),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                    future: getPostApi(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Text(
                          'Loading',
                        );
                      } else {
                        return ListView.builder(
                          itemCount: postList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                //  leading: CircleAvatar(
                                //    backgroundImage: NetworkImage(postList[index].url.toString()),
                                //  ),
                                // subtitle: Text(postList[index].title.toString()),
                                //  //title: Text(postList[index].id.toString()),

                                title: Text('Name: ${postList[index].name}\n'),
                                subtitle: Text(
                                    'Username: ${postList[index].username}\nEmail: ${postList[index].email}\nAdress: ${postList[index].address?.street}'
                                    ', ${postList[index].address?.suite} , ${postList[index].address?.city}, ${postList[index].address?.zipcode} \nPhone: ${postList[index].phone}'
                                    '\nWebsite: ${postList[index].website}'),
                              ),
                            );
                          },
                        );
                      }
                    }),
              ),

              //
              // SvgPicture.asset(path),
              // Text(
              //   title,
              //   style: const TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // Text(
              //   text,
              //   style: const TextStyle(
              //     fontSize: 14,
              //     fontWeight: FontWeight.w400,
              //   ),
              //   textAlign: TextAlign.justify,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
