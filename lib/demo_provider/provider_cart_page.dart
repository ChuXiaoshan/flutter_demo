/*
 * Created by CxS on 2021/1/20 14:08
 * Description:
 */

import 'package:flutter/material.dart';
import 'package:flutterdemo/demo_provider/cart_model.dart';
import 'package:flutterdemo/demo_provider/item.dart';
import 'package:flutterdemo/demo_provider/provider/change_notifier_provider.dart';
import 'package:flutterdemo/demo_provider/provider/consumer.dart';

class ProviderCartPage extends StatefulWidget {
  @override
  createState() => _ProviderCartPageState();
}

class _ProviderCartPageState extends State<ProviderCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProviderCart"),
      ),
      body: Center(
        child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(
            builder: (context) {
              return Column(
                children: [
                  Consumer<CartModel>(
                    builder: (context, cart) => Text("总价：${cart.totalPrice}"),
                  ),
                  Builder(builder: (context) {
                    print('RaisedButton build');
                    return RaisedButton(
                      child: Text("添加商品"),
                      onPressed: () {
                        ChangeNotifierProvider.of<CartModel>(
                          context,
                          listen: false,
                        ).add(Item(20.0, 1));
                      },
                    );
                  }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
