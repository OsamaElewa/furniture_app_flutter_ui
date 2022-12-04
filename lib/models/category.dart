class CategoryModel{
  int catId;
  String catName;
  CategoryModel({
    required this.catId,
    required this.catName
  });
}
List<CategoryModel> catList=[
  CategoryModel(catId: 1, catName: 'All'),
  CategoryModel(catId: 2, catName: 'Sofa'),
  CategoryModel(catId: 3, catName: 'Park bench'),
  CategoryModel(catId: 4, catName: 'Armchair'),
];
int selectedIndex=0;
