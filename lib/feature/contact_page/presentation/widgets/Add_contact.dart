import 'package:contact_app/feature/contact_page/presentation/widgets/save_customers_widget.dart';
import 'package:flutter/material.dart';

import '../../../../config/db/db_helper.dart';
import '../../../../core/constants/app_strings.dart';
import '../../model/customer.dart';


class AddContacts extends StatefulWidget {
  const AddContacts({super.key});

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<AddContacts> {

  DBHelper dbHelper = DBHelper();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _nameCtrler = TextEditingController();
  final TextEditingController _emailCtrler =  TextEditingController();
  final TextEditingController _phoneCtrler =  TextEditingController();
  final TextEditingController _cityCtrler =  TextEditingController();

  late String _name, _mobile, _email, _city, _phone;

  List<Customer> savedCustomers = [];
  List<Customer> deleteCustomers =[];

  @override
  void initState() {
    super.initState();
    _fetchSavedCustomers();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          title: const Text(
            "Database Tutorial",
            style: TextStyle(color: Colors.white),
          ),
        ),
        // resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text("Add New Contact"),
                Container(
                  margin: const EdgeInsets.only(left: 10,
                      right: 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                        ),
                        controller: _nameCtrler,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        controller: _emailCtrler,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone',
                        ),
                        controller: _phoneCtrler,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'City',
                        ),
                        controller: _cityCtrler,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(
                              bottom: 10, left: 20,
                              right: 20),
                          height: 35,
                          width: MediaQuery.of(context)
                              .size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.
                            circular(5.0),
                            color: Colors.red,
                          ),
                          child: const Text(
                            "Add",
                            style: TextStyle(color:
                            Colors.white, fontSize: 18),
                          ),
                        ),
                        onTap: () {
                          saveData();
                        },
                      ),
                    ],
                  ),
                ),
                const Text("Customer List"),
                Container(
                    height: 250,
                    child: SavedCustomersWidget(savedCustomers)),
              ],
            ),
          ),
        ));
  }

  bool isValid() {
    _name = _nameCtrler.text;
    _mobile = _phoneCtrler.text;
    _city = _cityCtrler.text;
    _email = _emailCtrler.text;
    _phone = _phoneCtrler.text;

    if (!(_name.isNotEmpty)) {
      showSnackBar("Please enter name");
      return false;
    } else if (!(_email.isNotEmpty)) {
      showSnackBar("Please enter email");
      return false;
    } else if (!(_mobile.isNotEmpty)) {
      showSnackBar("Please enter mobile");
      return false;
    } else {
      return true;
    }
  }

  void saveData() {
    if (isValid()) {
      Customer customer = Customer(
        name: _name,
        email: _email,
        phone: _phone,
        city: _city,
      );

      Future<Customer> future = dbHelper.addCustomer(customer);
      _fetchSavedCustomers();

      future.then((_cus) {
        print('name added-${_cus.name}');
        print('email added-${_cus.email}');
        setState(() {
          AppStrings.frnName.add(_cus.name!);
          AppStrings.frnContact.add(_cus.phone!);


        });

      });
    }
  }

  showSnackBar(String value) {
    print("Print Current Value : $value");
   // _scaffoldKey.currentState?.showSnackBar(new SnackBar(content: new Text(value)));
  }

  void _fetchSavedCustomers() async {
    List<Customer> customers = await dbHelper.getSavedCustomers();
    setState(() {
      savedCustomers = customers;
    });
  }
  void fetchDeleteCustomers() async {
    List<Customer> customers = await dbHelper.deleteCustomer(1);
    setState(() {
      deleteCustomers = customers;
    });
  }
}