import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';

Widget buildArticleItem(article, context) {
  var imgVariable = NetworkImage(
    "${article['urlToImage']}",
  );

  return InkWell(
    onTap: () {
      navigateTo(context: context, widget: WebViewScreen(url: article['url'],));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          BlocConsumer<NewsCubit, NewsStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),

                  ///onError property
                  image: DecorationImage(
                      image: imgVariable,

                      onError: (errorDetails, stack) {
                        NewsCubit
                            .get(context)
                            .imgVariable;
                      },
                      fit: BoxFit.cover
                  ),

                  // image: DecorationImage(
                  //     image: article['urlToImage'] == null
                  //         ? const NetworkImage(
                  //             "https://th.bing.com/th/id/R.0e6dd5b2fb2a9f8b1a694f322ae9b5a4?rik=8dz0jEx2rxzLaA&riu=http%3a%2f%2ffiles.maas1.com%2fimages_cache%2f130326130347S6oJ.jpg&ehk=hn9Yp81s7r2XZimuNgQj%2ft2KKghRk2Z%2f1Piw6PYiZic%3d&risl=&pid=ImgRaw&r=0")
                  //         : NetworkImage(
                  //             "${article['urlToImage']}",
                  //           ),
                  //     fit: BoxFit.cover),
                ),
              );
            },
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: SizedBox(
              height: 120.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${article['title']} ',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '${article['publishedAt']} ',
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}


Widget myDivider() {
  return Padding(
    padding: const EdgeInsetsDirectional.only(
      start: 20.0,
    ),
    child: Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    ),
  );
}

// image: DecorationImage(
// image: article['urlToImage'] == null ? const NetworkImage("https://th.bing.com/th/id/R.0e6dd5b2fb2a9f8b1a694f322ae9b5a4?rik=8dz0jEx2rxzLaA&riu=http%3a%2f%2ffiles.maas1.com%2fimages_cache%2f130326130347S6oJ.jpg&ehk=hn9Yp81s7r2XZimuNgQj%2ft2KKghRk2Z%2f1Piw6PYiZic%3d&risl=&pid=ImgRaw&r=0")
// :
// NetworkImage("${article['urlToImage']}",),
//
// fit: BoxFit.cover),


///defaultFormField
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required Function onChanged,
  final validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      onChanged: (value) {
        onChanged(value);
      },
      controller: controller,
      keyboardType: type,
      enabled: isClickable,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[100],
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: () {
            suffixPressed!();
          },
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: const OutlineInputBorder(),
      ),
    );


Widget articleBuilder(list, context, {isSearch = false}) =>
    list.length > 0 ?
    ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildArticleItem(list[index], context),
      separatorBuilder: (context, index) => myDivider(),
      itemCount:list.lenght,) : isSearch ? Container() : const Center(child: CircularProgressIndicator());


///navigator method
void navigateTo({required context, required widget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) =>widget));
