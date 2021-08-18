import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({Key? key}) : super(key: key);


  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  int currentIndex = 0;
  late String result = "";
  double height = 0;
  double weight = 0;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator",
        style: TextStyle(color: Colors.white),
        ),
        elevation: 20.0,
        backgroundColor: const Color(0xFF283637),

      ),
      backgroundColor: const Color(0xFF283637),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  radioButton('Man', Colors.blue, 0),
                  radioButton('Woman', Colors.pink, 1)
                ],
              ),
              const SizedBox(height: 20.0,),
              const Text("Your Height in Cm : ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0,color: Colors.white),
              ),
              const SizedBox(height: 5.0,),
              Align(
                alignment: Alignment.center,
                child: TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center   ,
                  decoration: InputDecoration(
                    hintText: "Your height in CM",
                    hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: const Color(0xFFEEEEEE),
                    border:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),

                    //hintText: "Your height in CM"
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),
              const Text("Your Weight in Kg : ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0,color: Colors.white),
              ),
              const SizedBox(height: 5.0),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Your Weight in Kg",
                  hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                  filled: true,
                  fillColor: const Color(0xFFEEEEEE),
                  border:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),

                  //hintText: "Your height in CM"
                ),
              ),
              const SizedBox(height: 20.0,),
              Container(
                width: double.infinity,
                height: 50.0,
                child: FlatButton(
                  onPressed: (){
                    setState(() {
                      height = double.parse(heightController.value.text);
                      weight= double.parse(weightController.value.text);
                    });
                    calculateBmi(height, weight);
                  },
                  color: Colors.blue,
                  child: const Text('Calculate',style: TextStyle(
                    color: Colors.white,
                  ),),
                ),
              ),
              const SizedBox(height: 20.0,),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: const Text("Your BMI is : ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0,color: Colors.white, fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 50.0,),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold,color: Colors.white),),
              ),
              const Center(child:  InfoBMI()),

            ],
          ),
        ),
      ),
    );
  }
  void calculateBmi(double height, double weight){
    double calResult = weight / ( height * height / 10000);
    String bmi = calResult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }
  void changeIndex(int index){
    setState(() {
      currentIndex = index;
    });
  }
  Widget radioButton(String value, Color color, int index){
    return  Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        height: 80.0,
        child: FlatButton(
          onPressed: (){
            changeIndex(index);
          },
          color: currentIndex == index ? color : Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(value, style: TextStyle(
              color: currentIndex == index ?  Colors.white : color,
              fontSize: 22.0,
              fontWeight: FontWeight.bold
          ),),
        ),
      ),
    );
  }
}

class InfoBMI extends StatelessWidget {
  const InfoBMI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            '',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            '',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            '',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('10-18,15',style: TextStyle(color: Colors.white),)),
            DataCell(Text('Weak',style: TextStyle(color: Colors.white),)),
            DataCell(Icon(Icons.cancel,color: Colors.red,),),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('18,5-25',style: TextStyle(color: Colors.white),)),
            DataCell(Text('Healthy',style: TextStyle(color: Colors.white),)),
            DataCell(Icon(Icons.cancel,color: Colors.red,),),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('25-30',style: TextStyle(color: Colors.white),)),
            DataCell(Text('Overweight',style: TextStyle(color: Colors.white),)),
            DataCell(Icon(Icons.check,color: Colors.green,),),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('30-40',style: TextStyle(color: Colors.white),)),
            DataCell(Text('Fat',style: TextStyle(color: Colors.white),)),
            DataCell(Icon(Icons.cancel,color: Colors.red,),),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('40-60',style: TextStyle(color: Colors.white),)),
            DataCell(Text('Obese',style: TextStyle(color: Colors.white),)),
            DataCell(Icon(Icons.cancel,color: Colors.red,),),
          ],
        ),
      ],
    );
  }
}
