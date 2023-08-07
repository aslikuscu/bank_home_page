import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app/util/cards.dart';
import 'package:wallet_app/util/my_button.dart';
import 'package:wallet_app/util/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.monetization_on,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home,
                    size: 32,
                    color: Colors.pink[200],
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    size: 32,
                    color: Colors.grey,
                  ))
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'my',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'cards',
                      style: TextStyle(fontSize: 28),
                    )
                  ],
                ),
                Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.grey[400], shape: BoxShape.circle),
                    child: Icon(Icons.add)),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 200,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              children: [
                MyCard(
                  balance: 5250.20,
                  cardNumber: 12345678,
                  expiryMonth: 10,
                  expiryYear: 24,
                  color: Colors.deepPurple[400],
                ),
                MyCard(
                  balance: 3565.20,
                  cardNumber: 48753967,
                  expiryMonth: 02,
                  expiryYear: 25,
                  color: Colors.blue[400],
                ),
                MyCard(
                  balance: 9837.20,
                  cardNumber: 84765223,
                  expiryMonth: 03,
                  expiryYear: 22,
                  color: Colors.green[400],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(activeDotColor: Colors.grey.shade800),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(
                    iconImagePath: 'images/send-money.png', buttonText: 'send'),
                MyButton(
                    iconImagePath: 'images/debit-card.png', buttonText: 'pay'),
                MyButton(iconImagePath: 'images/bill.png', buttonText: 'bills'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              children: [
                MyListTile(
                    iconImagePath: 'images/pie-chart.png',
                    tileTitle: 'statistic',
                    titleSubtitle: 'payment and income'),
                MyListTile(
                    iconImagePath: 'images/transaction.png',
                    tileTitle: 'transactions',
                    titleSubtitle: 'transactions history')
              ],
            ),
          )
        ],
      )),
    );
  }
}
