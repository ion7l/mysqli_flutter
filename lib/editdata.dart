import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'listdata.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerCode;
  TextEditingController controllerName;
  TextEditingController controllerPrice;
  TextEditingController controllerStock;

  void editData() {
    var url = "http://10.0.2.2/my_store/editdata.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text,
    });
  }

  @override
  void initState() {
    controllerCode =
        new TextEditingController(text: widget.list[widget.index]['item_code']);
    controllerName =
        new TextEditingController(text: widget.list[widget.index]['item_name']);
    controllerPrice =
        new TextEditingController(text: widget.list[widget.index]['price']);
    controllerStock =
        new TextEditingController(text: widget.list[widget.index]['stock']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Edit Data",
          style: TextStyle(fontFamily: "Netflix"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerCode,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "Item Code", labelText: "Item Code"),
                ),
                new TextField(
                  controller: controllerName,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "Item Name", labelText: "Item Name"),
                ),
                new TextField(
                  controller: controllerPrice,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "Price", labelText: "Price"),
                ),
                new TextField(
                  controller: controllerStock,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "Stock", labelText: "Stock"),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    child: new Text(
                      "EDIT DATA",
                      style:
                          TextStyle(fontFamily: "Netflix", color: Colors.white),
                    ),
                    onPressed: () {
                      editData();
                      Navigator.of(context).pushReplacement(
                          new MaterialPageRoute(
                              builder: (BuildContext context) => new Home()));
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    child: Text(
                      "Kembali ke menu",
                      style:
                          TextStyle(fontFamily: "Netflix", color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return Home();
                      }));
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
