import 'package:cleaneo_vendor/Home/Inventory%20Request/payment_page.dart';
import 'package:flutter/material.dart';

import '../../Screens/razorpay.dart';

class InventoryRequestPage extends StatefulWidget {
  const InventoryRequestPage({Key? key}) : super(key: key);

  @override
  State<InventoryRequestPage> createState() => _InventoryRequestPageState();
}

class _InventoryRequestPageState extends State<InventoryRequestPage> {
  bool showCounter = false;


  List<Map<String, dynamic>> activatedFavorites = [];

  final List<Map<String, dynamic>> washingItemList = [
    {
      'name': 'Rin Soap',
      'weight': '250 gm',
      'price': '31',
      'image':
      'https://rukminim2.flixcart.com/image/850/1000/kqttg280/washing-bar/b/z/m/bar-pack-of-6-250-gm-soap-detergent-bar-soap-6060-6-250-rin-original-imag4qgnjmbmznxd.jpeg?q=90&crop=false',
      'discount': '22% OFF',
    },
    {
      'name': 'Surf Excel',
      'weight': '250 gm',
      'price': '126',
      'image':
      'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRVsyftzVoDV4Z1Ruf-Gufufg1uOMC_SLWQk4fs-8d1a5SItu9RRtU3nmpF-x8LpW0eQmbNi8ERVw54FFmD7HXPJZB0DYRu4_4EdIlYnnbbkFrYLtngULttHA',
      'discount': '20% OFF',
    },
    {
      'name': 'Ariel',
      'weight': '250 gm',
      'price': '25',
      'image':
      'https://www.bigbasket.com/media/uploads/p/l/216400_15-ariel-complete-detergent-washing-powder.jpg',
      'discount': '16% OFF',
    },
  ];

  final List<Map<String, dynamic>> liquidItemList = [
    {
      'name': 'Fluff Liquid',
      'description': 'Description 1',
      'price': '50',
      'image':
      'https://images-eu.ssl-images-amazon.com/images/I/61TjFA8eSqL._AC_UL900_SR615,900_.jpg',
    },
    {
      'name': 'Comfort',
      'description': 'Description 2',
      'price': '80',
      'image': 'https://m.media-amazon.com/images/I/61ysR0hSLhL.jpg',
    },
    {
      'name': 'Fabric',
      'description': 'Description 3',
      'price': '35',
      'image':
      'https://m.media-amazon.com/images/I/51LkFmzImYL._AC_UF1000,1000_QL80_.jpg',
    },
  ];

  final List<Map<String, dynamic>> packagingItemList = [
    {
      'name': 'Tub',
      'weight': '200 gm',
      'price': '20',
      'image':
      'https://5.imimg.com/data5/SELLER/Default/2022/6/XH/VS/XD/105584709/round-plastic-tub.jpg',
    },
    {
      'name': 'Detergent Box',
      'weight': '300 gm',
      'price': '30',
      'image': 'https://m.media-amazon.com/images/I/61US9sntWUL.jpg',
    },
    {
      'name': 'Vanish',
      'weight': '250 gm',
      'price': '25',
      'image':
      'https://cdn.images.fecom-media.com/FE00055877/images/RK55515_01_nR4isnhUu0.jpeg?width=578&height=578&scale=UpscaleCanvas&anchor=MiddleCenter',
    },
  ];

  List<int> washingItemCounts = List.filled(3, 1);
  List<int> liquidItemCounts = List.filled(3, 1);
  List<int> packagingItemCounts = List.filled(3, 1);

  bool isFavorite = false;   // for Washing Items
  bool isFavorite1 = false;  // for Liquid Items
  bool isFavorite2 = false;  // for Packaging Materials

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff006acb),
        ),
        child: Column(
          children: [
            SizedBox(height: mQuery.size.height * 0.034),
            Padding(
              padding: EdgeInsets.only(
                top: mQuery.size.height * 0.058,
                bottom: mQuery.size.height * 0.03,
                left: mQuery.size.width * 0.045,
                right: mQuery.size.width * 0.045,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: mQuery.size.width * 0.045,
                  ),
                  Text(
                    "Inventory Request",
                    style: TextStyle(
                      fontSize: mQuery.size.height * 0.027,
                      color: Colors.white,
                      fontFamily: 'SatoshiBold',
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  GestureDetector(
                      onTap: ()
                      {
                        favoriteItemsBottomSheet(context);
                      },
                      child: Icon(Icons.favorite, color: Colors.white)),
                  SizedBox(width: mQuery.size.width * 0.053),
                  GestureDetector(
                      onTap: ()
                      {
                        addToCartBottomSheet(context);
                      },
                      child: Icon(Icons.shopping_cart, color: Colors.white)),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 20, bottom: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Washing Items",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: mQuery.size.height * 0.023),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: washingItemList.asMap().entries.map((entry) {
                              return Padding(
                                padding: EdgeInsets.only(right: 12.0),
                                child: _buildItemCard(entry.value, mQuery, washingItemCounts[entry.key], (newValue) {
                                    setState(() {
                                      washingItemCounts[entry.key] = newValue;
                                    });
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: mQuery.size.height * 0.05),


                        Text(
                          "Liquid Items",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: mQuery.size.height * 0.023),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: liquidItemList.asMap().entries.map((entry) {
                              return Padding(
                                padding: EdgeInsets.only(right: 12.0),
                                child: _buildAdditionalItemCard(
                                  entry.value,
                                  mQuery,
                                  liquidItemCounts[entry.key],
                                      (newValue) {
                                    setState(() {
                                      liquidItemCounts[entry.key] = newValue;
                                    });
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: mQuery.size.height * 0.05),


                        Text(
                          "Packaging Materials",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: mQuery.size.height * 0.023),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: packagingItemList.asMap().entries.map((entry) {
                              return Padding(
                                padding: EdgeInsets.only(right: 12.0),
                                child: _buildPackagingItemCard(
                                  entry.value,
                                  mQuery,
                                  packagingItemCounts[entry.key],
                                      (newValue) {
                                    setState(() {
                                      packagingItemCounts[entry.key] = newValue;
                                    });
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget _buildItemCard(
      Map<String, dynamic> item,
      MediaQueryData mQuery,
      int count,
      Function(int) onCountChanged,
      ) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          width: mQuery.size.width * 0.34,
          height: mQuery.size.height * 0.18,
          padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.03),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: mQuery.size.width * 0.12,
                    height: mQuery.size.height * 0.021,
                    decoration: BoxDecoration(
                      color: Color(0xff3d8b15),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        item['discount'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: mQuery.size.height * 0.01,
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                        if (isFavorite) {
                          activatedFavorites.add(item);
                        } else {
                          activatedFavorites.removeWhere((element) => element['name'] == item['name']);
                        }
                      });
                      // Show Snackbar when the favorite icon is clicked
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Color(0xffa1f3a1),
                          content: Center(
                              child: Text(isFavorite ? 'Added to favorites' : 'Removed from favorites',style: TextStyle(
                                color: Color(0xff3d8b15),
                                fontWeight: FontWeight.w700
                              ),)),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    },
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_outline_outlined,
                      color: isFavorite ? Colors.red : Colors.black54,
                      size: mQuery.size.height * 0.03,
                    ),
                  ),
                ],
              ),
              SizedBox(height: mQuery.size.height * 0.01),
              Image.network(
                item['image'],
                height: mQuery.size.height * 0.06,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'],
                    style: TextStyle(fontSize: mQuery.size.height * 0.015),
                  ),
                  Text(
                    item['weight'],
                    style: TextStyle(fontSize: mQuery.size.height * 0.012),
                  ),
                  Row(
                    children: [
                      Text(
                        '₹${item['price']}',
                        style: TextStyle(fontSize: mQuery.size.height * 0.015),
                      ),
                      Expanded(child: SizedBox()),
                      ValueListenableBuilder<int>(
                        valueListenable: ValueNotifier<int>(count),
                        builder: (context, value, child) {
                          if (showCounter) {
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (value > 0) onCountChanged(value - 1);
                                  },
                                  child: Container(
                                    width: mQuery.size.width * 0.06,
                                    height: mQuery.size.height * 0.03,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xfff0f0f0),
                                      border: Border.all(color: Color(0xff008000)),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.black,
                                        size: mQuery.size.width * 0.04,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: mQuery.size.width * 0.02),
                                Text(
                                  "$value",
                                  style: TextStyle(fontSize: mQuery.size.height * 0.014),
                                ),
                                SizedBox(width: mQuery.size.width * 0.02),
                                GestureDetector(
                                  onTap: () {
                                    onCountChanged(value + 1);
                                  },
                                  child: Container(
                                    width: mQuery.size.width * 0.06,
                                    height: mQuery.size.height * 0.03,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xfff0f0f0),
                                      border: Border.all(color: Color(0xff008000)),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.black,
                                        size: mQuery.size.width * 0.04,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                          else {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showCounter = !showCounter; // Toggle the visibility
                                  });
                                },
                                child: Container(
                                  width: mQuery.size.width*0.13,
                                  height: mQuery.size.height*0.028,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Color(0xfff7fff9),
                                      border: Border.all(
                                          color: Color(0xff348719)
                                      )
                                  ),
                                  child: Center(
                                    child: Text("ADD",style: TextStyle(
                                        color: Color(0xff318616),
                                        fontSize: mQuery.size.height*0.012,
                                        fontWeight: FontWeight.w700
                                    ),),
                                  ),
                                )
                            );
                          }
                        },
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }


  Widget _buildAdditionalItemCard(
      Map<String, dynamic> item,
      MediaQueryData mQuery,
      int count,
      Function(int) onCountChanged,
      ) {
    // Initialize ValueNotifier to track favorite status
    ValueNotifier<bool> isFavoriteNotifier = ValueNotifier<bool>(false);

    return Container(
      width: mQuery.size.width * 0.34,
      height: mQuery.size.height * 0.18,
      padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: mQuery.size.width * 0.12,
                height: mQuery.size.height * 0.021,
                decoration: BoxDecoration(
                  color: Color(0xff3d8b15),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    "20% OFF",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: mQuery.size.height * 0.01,
                    ),
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              // Use ValueListenableBuilder for the favorite icon
              ValueListenableBuilder<bool>(
                valueListenable: isFavoriteNotifier,
                builder: (context, isFavorite, child) {
                  return GestureDetector(
                    onTap: ()
                    {
                      isFavoriteNotifier.value = !isFavoriteNotifier.value;
                      if (!isFavoriteNotifier.value) {
                        activatedFavorites.add(item);
                      } else {
                        activatedFavorites.removeWhere((element) => element['name'] == item['name']);
                      }
                    },
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_outline_outlined,
                      color: isFavorite ? Colors.red : Colors.black54,
                      size: mQuery.size.height * 0.03,
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: mQuery.size.height * 0.01),
          Image.network(
            item['image'],
            height: mQuery.size.height * 0.06,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['name'],
                style: TextStyle(fontSize: mQuery.size.height * 0.015),
              ),
              Text(
                item['description'],
                style: TextStyle(fontSize: mQuery.size.height * 0.012),
              ),
              Row(
                children: [
                  Text(
                    '₹${item['price']}',
                    style: TextStyle(fontSize: mQuery.size.height * 0.015),
                  ),
                  Expanded(child: SizedBox()),
                  ValueListenableBuilder<int>(
                    valueListenable: ValueNotifier<int>(count),
                    builder: (context, value, child) {
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (value > 1) onCountChanged(value - 1);
                            },
                            child: Container(
                              width: mQuery.size.width * 0.06,
                              height: mQuery.size.height * 0.03,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xfff0f0f0),
                                border: Border.all(color: Color(0xff008000)),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                  size: mQuery.size.width * 0.04,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: mQuery.size.width * 0.02),
                          Text(
                            "${value - 1}",
                            style: TextStyle(fontSize: mQuery.size.height * 0.014),
                          ),

                          SizedBox(width: mQuery.size.width * 0.02),
                          GestureDetector(
                            onTap: () {
                              onCountChanged(value + 1);
                            },
                            child: Container(
                              width: mQuery.size.width * 0.06,
                              height: mQuery.size.height * 0.03,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xfff0f0f0),
                                border: Border.all(color: Color(0xff008000)),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: mQuery.size.width * 0.04,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }


  Widget _buildPackagingItemCard(
      Map<String, dynamic> item,
      MediaQueryData mQuery,
      int count,
      Function(int) onCountChanged,
      ) {
    ValueNotifier<bool> isFavoriteNotifier = ValueNotifier<bool>(false);
    return Container(
      width: mQuery.size.width * 0.34,
      height: mQuery.size.height * 0.18,
      padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: mQuery.size.width * 0.12,
                height: mQuery.size.height * 0.021,
                decoration: BoxDecoration(
                  color: Color(0xff3d8b15),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    "20% OFF",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: mQuery.size.height * 0.01,
                    ),
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              ValueListenableBuilder<bool>(
                valueListenable: isFavoriteNotifier,
                builder: (context, isFavorite, child) {
                  return GestureDetector(
                    onTap: ()
                    {
                      isFavoriteNotifier.value = !isFavoriteNotifier.value;
                    },
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_outline_outlined,
                      color: isFavorite ? Colors.red : Colors.black54,
                      size: mQuery.size.height * 0.03,
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: mQuery.size.height * 0.01),
          Image.network(
            item['image'],
            height: mQuery.size.height * 0.06,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['name'],
                style: TextStyle(fontSize: mQuery.size.height * 0.015),
              ),
              Text(
                item['weight'],
                style: TextStyle(fontSize: mQuery.size.height * 0.012),
              ),
              Row(
                children: [
                  Text(
                    '₹${item['price']}',
                    style: TextStyle(fontSize: mQuery.size.height * 0.015),
                  ),
                  Expanded(child: SizedBox()),
                  ValueListenableBuilder<int>(
                    valueListenable: ValueNotifier<int>(count),
                    builder: (context, value, child) {
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (value > 1) onCountChanged(value - 1);
                            },
                            child: Container(
                              width: mQuery.size.width * 0.06,
                              height: mQuery.size.height * 0.03,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xfff0f0f0),
                                  border: Border.all(color: Color(0xff008000))),
                              child: Center(
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                  size: mQuery.size.width * 0.04,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: mQuery.size.width * 0.02),
                          Text(
                            "${value - 1}",
                            style: TextStyle(fontSize: mQuery.size.height * 0.014),
                          ),

                          SizedBox(width: mQuery.size.width * 0.02),
                          GestureDetector(
                            onTap: () {
                              onCountChanged(value + 1);
                            },
                            child: Container(
                              width: mQuery.size.width * 0.06,
                              height: mQuery.size.height * 0.03,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xfff0f0f0),
                                  border: Border.all(color: Color(0xff008000))),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: mQuery.size.width * 0.04,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }


  void favoriteItemsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        var mQuery = MediaQuery.of(context);

        if (activatedFavorites.isEmpty) {
          return Container(
            height: mQuery.size.height * 0.8,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.04),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "No Favorite items here",
                    style: TextStyle(fontSize: mQuery.size.height * 0.023, color: Colors.grey,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          );
        }

        // If there are favorite items, render the ListView.builder
        return Container(
          height: mQuery.size.height * 0.8,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.04),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: mQuery.size.height * 0.03),
              Text(
                "Your Favorite Items",
                style: TextStyle(fontSize: mQuery.size.height * 0.02,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: mQuery.size.height * 0.02),
              Expanded(
                child: ListView.builder(
                  itemCount: activatedFavorites.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: mQuery.size.height * 0.01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Image.network(
                              activatedFavorites[index]['image'],
                              width: mQuery.size.width * 0.14,
                              height: mQuery.size.height * 0.06,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              activatedFavorites[index]['name'],
                              style: TextStyle(fontSize: mQuery.size.height * 0.017),
                            ),
                            subtitle: Text(
                              activatedFavorites[index]['weight'],
                              style: TextStyle(fontSize: mQuery.size.height * 0.015),
                            ),
                            trailing: Text('₹${activatedFavorites[index]['price']}'),
                          ),
                          GestureDetector(
                            onTap : ()
                            {
                              addToCartBottomSheet(context);
                            },
                            child: Container(
                              width: mQuery.size.width * 0.17,
                              height: mQuery.size.height * 0.024,
                              decoration: BoxDecoration(
                                color: Color(0xff3d8b15),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              margin : EdgeInsets.only(
                                  left: mQuery.size.width*0.045,
                                  bottom: mQuery.size.height*0.01
                              ),
                              child: Center(
                                child: Text("Add to Cart",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: mQuery.size.height*0.012
                                ),),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  // AddToCart BottomSheet
  void addToCartBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        var mQuery = MediaQuery.of(context);

        // Adding itemNo to each item in activatedFavorites
        for (int i = 0; i < activatedFavorites.length; i++) {
          activatedFavorites[i]['itemNo'] = i + 1;
        }

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: mQuery.size.height * 0.8,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.04),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: mQuery.size.height * 0.02),
                  activatedFavorites.isNotEmpty
                      ? Text(
                    "Added items are",
                    style: TextStyle(fontSize: mQuery.size.height * 0.02, fontWeight: FontWeight.w700),
                  )
                      : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: mQuery.size.height * 0.32),
                      Center(
                        child: Text(
                          "No Items Added",
                          style: TextStyle(
                            fontSize: mQuery.size.height * 0.023,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: mQuery.size.height * 0.02),
                  activatedFavorites.isNotEmpty
                      ? Expanded(
                    child: ListView.builder(
                      itemCount: activatedFavorites.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: mQuery.size.height * 0.02),
                            Container(
                              margin: EdgeInsets.only(bottom: mQuery.size.height * 0.02),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    leading: Image.network(
                                      activatedFavorites[index]['image'],
                                      width: mQuery.size.width * 0.14,
                                      height: mQuery.size.height * 0.06,
                                      fit: BoxFit.cover,
                                    ),
                                    title: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          activatedFavorites[index]['name'],
                                          style: TextStyle(fontSize: mQuery.size.height * 0.017),
                                        ),
                                        Text(
                                          activatedFavorites[index]['weight'],
                                          style: TextStyle(fontSize: mQuery.size.height * 0.015),
                                        ),
                                        Text(
                                          'Item No: ${activatedFavorites[index]['itemNo']}',
                                          style: TextStyle(fontSize: mQuery.size.height * 0.015),
                                        ),
                                      ],
                                    ),
                                    trailing: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          activatedFavorites.removeAt(index);
                                        });
                                      },
                                      child: Icon(Icons.delete, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                      : SizedBox.shrink(), // Hides the ListView.builder if activatedFavorites is empty
                  SizedBox(height: mQuery.size.height * 0.02),
                  // Add space below the list
                  activatedFavorites.isNotEmpty ?
                  Column(
                    children: [
                      GestureDetector(
                        onTap: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return PaymentPage();
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(mQuery.size.height * 0.02),
                          decoration: BoxDecoration(
                            color: Color(0xff29b2fe),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Buy Now",
                              style: TextStyle(
                                fontSize: mQuery.size.height * 0.02,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,)
                    ],
                  ) : SizedBox.shrink()
                ],
              ),
            );
          },
        );
      },
    );
  }
}



