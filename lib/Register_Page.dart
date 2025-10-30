import 'package:flutter/material.dart';
import 'package:project_dart_1/Main_Menu.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController txtConfirmPassword = TextEditingController();
  TextEditingController txtUsername= TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  String statusRegister = "Register Status";
  String? selectedGender;
  DateTime? selectedDate;
  TextEditingController txtDate = TextEditingController();



  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Scaffold(
      appBar: AppBar(title: Text("Register Page"),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome to the Register Page!", 
            style: TextStyle(fontSize: 18,color: Colors.blueGrey, fontWeight: FontWeight.bold),),
            Text("Please Register using your username and password."),
            //image dari resources
            //SizedBox(height: 10),
            // Center(
            //   child: Image.asset(
            //     'assets/gambar.png',
            //     width: 100,
            //     height: 100,
            //   ),
            // ),
            //buatlah isian username dan password
            
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: TextField(
                controller: txtUsername,
                decoration: InputDecoration(
                  labelText: "username",
                  hintText: "Enter your username",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            TextField(
              
              controller: txtPassword,
              obscureText: true, // untuk menyembunyikan karakter password
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                border: OutlineInputBorder(), 
              ),
            ),

            SizedBox(height: 10),
Text("Select Gender:", style: TextStyle(fontWeight: FontWeight.bold)),

RadioListTile<String>(
  title: const Text('Male'),
  value: 'Male',
  groupValue: selectedGender,
  onChanged: (value) {
    setState(() {
      selectedGender = value;
    });
  },
),

RadioListTile<String>(
  title: const Text('Female'),
  value: 'Female',
  groupValue: selectedGender,
  onChanged: (value) {
    setState(() {
      selectedGender = value;
    });
  },
),

SizedBox(height: 10),
Text("Date of Birth:", style: TextStyle(fontWeight: FontWeight.bold)),
TextField(
  controller: txtDate,
  readOnly: true,
  decoration: InputDecoration(
    hintText: 'Select your birth date',
    border: OutlineInputBorder(),
    suffixIcon: Icon(Icons.calendar_today),
  ),
  onTap: () async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        txtDate.text = "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      });
    }
  },
),



            //Regiter button
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    //jika username dan password adalah admin maka muncul snackbar
                    if (txtUsername.text.isNotEmpty &&
    txtPassword.text.isNotEmpty &&
    selectedGender != null &&
    selectedDate != null) {

                      
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Register Successfull")),
                      );
                      setState(() {
                        statusRegister = "Register Successfull";
                        print(statusRegister);
                      });
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => MainMenu()),
                        );
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Tolong di isi username, password, gender dan juga tanggalnya")),
                      );
                      setState(() {
                        statusRegister = "Register Error";
                        print(statusRegister);
                      });
                    }
                  },
                  child: Text("Register"),
                ),
              ),
            ),
            Text(statusRegister),
            
          ],
        ),
      ),
    );
  }
}