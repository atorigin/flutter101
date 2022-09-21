import 'package:flutter/material.dart';

// 整個 titleSection 都用 Container 包起來
Widget titleSection = Container(
  // 設定 padding 內縮空間 32 pixels
  padding: const EdgeInsets.all(32),
  // 雖然是一個大 row，但裡面可以細拆成
  // 1. 兩個 column，一個放 text 一個放 icon
  // 2. text 的 column 要拆成兩個 row，兩個不同字體呈現
  child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                'Oeschinen Lake Campground',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Text(
              'Kandersteg, Switzerland',
              style: TextStyle(
                color: Colors.grey[500]
              ),
            ),
            Text(
              'For test Column children',
              style: TextStyle(
                color: Colors.blue[500]
              ),
            )
          ],
        )
      ),
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      const Text("41"),
    ],
  ),
);