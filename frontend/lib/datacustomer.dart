import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PageDataCustomer extends StatefulWidget {
  const PageDataCustomer({super.key});

  @override
  State<PageDataCustomer> createState() => _PageDataCustomerState();
}

class _PageDataCustomerState extends State<PageDataCustomer> {
  List _dataCustomer = [];

  void _ambilDataCustomer() async {
    var res =
        await http.get(Uri.parse("http://localhost/customerbutik/list.php"));

    setState(() {
      _dataCustomer = json.decode(res.body);
    });
  }

  @override
  void initState() {
    _ambilDataCustomer();
    super.initState();
  }

  SingleChildScrollView _tabelCustomer() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            columns: [
              DataColumn(label: Text("Nama Customer")),
              DataColumn(label: Text("Alamat")),
              DataColumn(label: Text("No. Telepon")),
              DataColumn(label: Text("Email")),
              DataColumn(label: Text("Tanggal")),
            ],
            rows: _dataCustomer.map((item) {
              return DataRow(cells: <DataCell>[
                DataCell(Text(item["nama"])),
                DataCell(Text(item["alamat"])),
                DataCell(Text(item["notelp"])),
                DataCell(Text(item["email"])),
                DataCell(Text(item["date"])),
              ]);
            }).toList()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BUTIK Shintia Collection"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            Text(
              "Data Customer BUTIK",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            _tabelCustomer()
          ],
        ),
      ),
    );
  }
}
