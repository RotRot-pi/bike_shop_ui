// import 'package:bike_shop_experiment/colors.dart';
// import 'package:bike_shop_experiment/data.dart';
// import 'package:bike_shop_experiment/home_screen.dart';
// import 'package:bike_shop_experiment/images.dart';
// import 'package:flutter/material.dart';

// class LazyLoadingProductsPage extends StatefulWidget {
//   @override
//   _LazyLoadingProductsPageState createState() =>
//       _LazyLoadingProductsPageState();
// }

// class _LazyLoadingProductsPageState extends State<LazyLoadingProductsPage> {
//   final ScrollController _scrollController = ScrollController();
//   List<Map<String, dynamic>> _loadedProducts = [];
//   int _currentPage = 0;
//   final int _itemsPerPage = 10;
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadMoreItems();
//     _scrollController.addListener(_onScroll);
//   }

//   @override
//   void dispose() {
//     _scrollController.removeListener(_onScroll);
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _onScroll() {
//     if (_scrollController.position.pixels ==
//         _scrollController.position.maxScrollExtent) {
//       _loadMoreItems();
//     }
//   }

//   void _loadMoreItems() {
//     if (_isLoading) return;
//     setState(() {
//       _isLoading = true;
//     });

//     final startIndex = _currentPage * _itemsPerPage;
//     final endIndex = startIndex + _itemsPerPage;

//     Future.delayed(Duration(seconds: 1), () {
//       if (startIndex < AppData.listOfProducts.length) {
//         final newItems = AppData.listOfProducts.sublist(
//           startIndex,
//           endIndex.clamp(0, AppData.listOfProducts.length),
//         );
//         setState(() {
//           _loadedProducts.addAll(newItems);
//           _currentPage++;
//           _isLoading = false;
//         });
//       } else {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Transform.translate(
//               offset: const Offset(0, 109),
//               child: Image.asset(
//                 AppImages.blueBg,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: NotificationListener<OverscrollIndicatorNotification>(
//                 onNotification: (notification) {
//                   notification.disallowIndicator();
//                   return true;
//                 },
//                 child: SingleChildScrollView(
//                   controller: _scrollController,
//                   child: RepaintBoundary(
//                     child: Column(
//                       children: [
//                         const Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 8.0, vertical: 16.0),
//                           child: Row(
//                             children: [
//                               Text(
//                                 'Choose Your Bike',
//                                 style: TextStyle(
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold,
//                                   color: AppColors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const BikeCard(),
//                          ListOfCategoryCard(),
//                         const SizedBox(height: 24),
//                         Wrap(
//                           spacing: 16,
//                           children: [
//                             ..._loadedProducts.map((product) => ProductCard(
//                                   isFavorate: product['isFavorite'],
//                                   title: product['title'],
//                                   subtitle: product['subtitle'],
//                                   price: product['price'],
//                                   image: product['image'],
//                                 )),
//                           ],
//                         ),
//                         if (_isLoading)
//                           Padding(
//                             padding: EdgeInsets.all(16.0),
//                             child: CircularProgressIndicator(),
//                           ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
