import 'package:flutter/material.dart';
import 'package:flutter_online_store/pages/products_page/details_screen.dart';
import 'package:flutter_online_store/pages/products_page/product_card.dart';
import 'package:flutter_online_store/pages/products_page/product_data.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 255, 170, 59),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text(
              'Our Porducts',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SearchBar(
              leading: Icon(Icons.search),
              hintText: 'Search Your Favorite Food',
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildProductCatagory(
                    index: 0,
                    name: 'All Products',
                  ),
                  _buildProductCatagory(
                    index: 1,
                    name: 'Biriyani',
                  ),
                  _buildProductCatagory(
                    index: 2,
                    name: 'Burger',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: isSelected == 0
                  ? _buildAllProduct()
                  : isSelected == 1
                      ? _buildBiriyaniProduct()
                      : _buildBurgerProduct(),
            )
          ],
        ),
      ),
    );
  }

  _buildProductCatagory({
    required int index,
    required String name,
  }) =>
      GestureDetector(
        onTap: () {
          setState(() {
            isSelected = index;
          });
        },
        child: Container(
          width: 100,
          height: 40,
          margin: const EdgeInsets.only(left: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected == index ? Colors.red : Colors.redAccent,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  _buildAllProduct() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.allProduct.length,
        itemBuilder: (context, index) {
          final allProducts = MyProducts.allProduct[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsScreen(product: allProducts)));
            },
            child: ProductCard(
              product: allProducts,
            ),
          );
        },
      );

  _buildBurgerProduct() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: MyProducts.burger.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final burgerProduct = MyProducts.burger[index];
          return GestureDetector(
            child: ProductCard(product: burgerProduct),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsScreen(product: burgerProduct)));
            },
          );
        },
      );
  _buildBiriyaniProduct() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: MyProducts.biriyani.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final biriyaniProduct = MyProducts.biriyani[index];
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        DetailsScreen(product: biriyaniProduct)));
              },
              child: ProductCard(product: biriyaniProduct));
        },
      );
}
