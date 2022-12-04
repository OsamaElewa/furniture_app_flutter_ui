import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnitureapp/constants/constant.dart';
import 'package:furnitureapp/models/product.dart';

class DetailScreen extends StatelessWidget {

  final ProductsModel model;

  const DetailScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/back.svg'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: kBackgroundColor,
        actions: [
          IconButton(
              onPressed: (){},
              icon: SvgPicture.asset('assets/icons/cart_with_item.svg'),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            decoration: const BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                    tag: model.id,
                    child: buildItemImageAndBKG(size)),
                buildColorList(),
                buildItemDetails(),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(25),
              ),
              child: MaterialButton(
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.shopping_bag_outlined,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text('Add to cart',style: TextStyle(
                      color: Colors.white,
                    ),),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildItemImageAndBKG(Size size) {
    return Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  height: size.width * 0.8,
                  //color: Colors.black,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: size.width* 0.7,
                        width: size.width*0.7,
                        decoration: const BoxDecoration(
                           color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Image.asset(
                        model.image,
                      height: size.width*0.75,
                      width: size.width*0.75,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              );
  }

  Widget buildColorList() {
    return Padding(
                  padding:const EdgeInsets.symmetric(vertical: kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildDotColors(true, Colors.red),
                    buildDotColors(false, Colors.blue),
                    buildDotColors(false, Colors.green),
                  ],
                ),
              );
  }

  Widget buildDotColors(bool isSelected ,Color fillColor) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2.5),
      padding: const EdgeInsets.all(3),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected==true? const Color(0xFF707070):Colors.transparent,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: fillColor
        ),
      ),
    );
  }

  Widget buildItemDetails() {
    return Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.name,style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black,
                    ),),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('${model.price}\$',style: const TextStyle(
                      color: Colors.amber,
                    ),
                    ),
                    const SizedBox(height: 10,),
                    Text(model.description,style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                    ),),
                  ],
                ),
              );
  }

}
