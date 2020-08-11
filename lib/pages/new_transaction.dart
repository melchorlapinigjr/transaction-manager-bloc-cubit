import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatefulWidget {
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController amount = TextEditingController();
  String isExpense = "false";

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          body: SafeArea(
        child: Container(
          child: Column(
            children: [
              AppBarWidget(),
              inputFields(),
            ],
          ),
        ),
      )),
    );
  }

  inputFields() {
    return Expanded(
      child: Column(
        children: [
          TextFormField(
            controller: name,
            decoration: InputDecoration(
                icon: Icon(Icons.title),
                labelText: "Name",
                hintText: "Transaction Name",
                hintStyle: TextStyle(color: Colors.black26)),
          ),
          TextFormField(
            controller: description,
            maxLines: 2,
            decoration: InputDecoration(
                icon: Icon(Icons.description),
                labelText: "Description",
                hintText: "Transaction Description",
                hintStyle: TextStyle(color: Colors.black26)),
          ),
          TextFormField(
            controller: amount,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
                icon: Icon(Icons.attach_money),
                labelText: "Amount",
                hintText: "0.00",
                hintStyle: TextStyle(color: Colors.black26)),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 5.0,
                  right: 10.0,
                ),
                child: Icon(Icons.category, color: Colors.black54),
              ),
              Text(
                "Type",
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
              DropdownButton(
                  value: isExpense, 
                  items: [
                    DropdownMenuItem(
                      value: 'false',
                      child: Text('No'),
                    ),
                    DropdownMenuItem(
                      value: 'true',
                      child: Text('Yes'),
                    )
                  ],
                  onChanged: (value) {
                    setState(() {
                      isExpense = value;
                    });
                  }),
            ],
          ),
          TextFormField(
            controller: date,
            keyboardType: TextInputType.datetime,  
            decoration: InputDecoration(
                icon: Icon(Icons.calendar_today),
                labelText: "Date",
                hintText: "00/00/0000",
                hintStyle: TextStyle(color: Colors.black26)),
          ), Padding(
              padding: EdgeInsets.all(25.0),
              child: MaterialButton(
                minWidth: double.infinity,
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  print("ang galing!");
                },
                child: Text("Save"),
              ),
            ), 
        ],
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red[200],
      ),
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          Text("New Transaction"),
        ],
      ),
    );
  }
}
