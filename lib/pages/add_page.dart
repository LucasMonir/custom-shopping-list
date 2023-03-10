import 'package:custom_wish_list/classes/item.dart';
import 'package:custom_wish_list/classes/item_dao.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  static ItemDAO item = ItemDAO();
  const AddPage({super.key});
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 48, 75, 209),
      title: const Text(
        'Add Item',
        style: TextStyle(
          shadows: [
            Shadow(
              blurRadius: 5,
              color: Colors.black,
              offset: Offset(1, 2),
            ),
          ],
        ),
      ),
      content: Stack(
        children: [
          Container(
            height: 210,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: _itemForm(),
          ),
        ],
      ),
    );
  }

  Widget _itemForm() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 2.5, bottom: 5),
          child: TextField(
            onChanged: (value) {
              AddPage.item.name = value;
            },
            style: const TextStyle(
              color: Colors.white,
            ),
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              label: Text('Item Name'),
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 5,
            bottom: 20,
          ),
          child: TextField(
            onChanged: (value) {
              AddPage.item.price = double.tryParse(value)!;
            },
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              label: Text('Price'),
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: Offset(0.0, 3.0),
              ),
            ],
          ),
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: const ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(
                Color.fromARGB(255, 0, 0, 0),
              ),
              overlayColor: MaterialStatePropertyAll(
                Color.fromARGB(131, 164, 223, 255),
              ),
              backgroundColor: MaterialStatePropertyAll(
                Colors.white,
              ),
            ),
            onPressed: () {
              if (!(AddPage.item.name == '' || AddPage.item.price == 0)) {
                Navigator.pop(context, AddPage.item);
                AddPage.item.name = '';
                AddPage.item.price = 0;
              }
            },
            child: const Text('Add Item!'),
          ),
        ),
      ],
    );
  }
}
