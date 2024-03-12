import 'package:flutter/material.dart';
import 'package:flutter_store_app/view/widgets/app_bar_widget.dart';
import 'package:flutter_store_app/view/widgets/carousel_slider.dart';
import 'package:flutter_store_app/view/widgets/catagory_widget.dart';
import 'package:flutter_store_app/view/widgets/popular_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: prefAppBar(context),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
            child: SearchBar(
              hintText: 'Enter Your Favorate Food',
              leading: Icon(Icons.search),
            ),
          ),
          CarouselSliderWidget(
            scrollDelay: 4,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
            child: Text(
              'Catagories',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          CatagoryWidget(),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
            child: Text(
              'Popular',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          PopularWidget(),
          SizedBox(height: 20),
          CarouselSliderWidget(scrollDelay: 3),
        ],
      ),
    );
  }
}
