import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnitureapp/constants/constant.dart';
import 'package:furnitureapp/models/category.dart';
import 'package:furnitureapp/models/product.dart';
import 'package:furnitureapp/modules/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: const Text('Dashboard'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/notification.svg'))
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            buildSearch(),
            const SizedBox(
              height: 10,
            ),
            buildCategoryList(),
            const SizedBox(height: 10,),
            Expanded(
              child: Stack(
                children: [
                  Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )
                  ),
                  margin: const EdgeInsets.only(top: 70),
                ),
                  buildProductList(),
                ],
              ),
            ),
           // buildProductList(),
          ],
        ),
      ),
    );
  }

  Widget buildProductList()=>ListView.builder(
    physics: const BouncingScrollPhysics(),
    itemCount: productsList.length,
      itemBuilder: (context,index)=>buildProductItem(productsList[index],index),
  );

  Widget buildProductItem(ProductsModel model,int index) {
    Size size=MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen(model: model,)
        )
        );
      },
      child: Container(
        height: 160,
        margin: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding/2
        ),
       // color: Colors.blueAccent,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                color: index.isEven? kBlueColor:kSecondaryColor,
                boxShadow: const [kDefaultShadow],
                borderRadius: BorderRadius.circular(20)
              ),
              height: 136,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.only(right: 10),
              ),
            ),
           Positioned(
             top: 0,
             right: 0,
             child: Hero(
               tag: model.id,
               child: Container(
                 padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                 height: 160,
                 width: 200,
                 child: Image(image: AssetImage(model.image),fit: BoxFit.cover,),
               ),
             ),
           ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 136,
                width: size.width-200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        model.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding*1.5,
                        vertical: kDefaultPadding/4
                      ),
                      decoration:  BoxDecoration(
                        color: kSecondaryColor.withOpacity(0.7),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)

                        ),
                      ),
                      child: Text(
                        '${model.price}\$',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
            ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryList() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 30,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
          itemCount: catList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              buildCategoryItem(catList[index], index)),
    );
  }

  Widget buildCategoryItem(CategoryModel model, int index) => GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
              left: kDefaultPadding,
              right: index==catList.length-1? kDefaultPadding : 0,
          ),
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          decoration: BoxDecoration(
            color: index == selectedIndex
                ? Colors.white.withOpacity(0.4)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            model.catName,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );

  Widget buildSearch() => Container(
    margin: const EdgeInsets.all(kDefaultPadding),
    padding: const EdgeInsets.symmetric(
      horizontal: kDefaultPadding,
      vertical: kDefaultPadding / 4,
    ),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.4),
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        icon: SvgPicture.asset('assets/icons/search.svg'),
        hintText: 'search',
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );



}

