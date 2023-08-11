import 'package:flutter/material.dart';
import 'package:flutter_ui_assignment/Widgets/Simple%20Input%20Field.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key});

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  final totalBillController = TextEditingController();
  final totalTipController = TextEditingController();
  final totalPeopleController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  static const Color containerColor = Color(0xFFf5f8fb);
  static const Color textBlack = Color(0xFF232323);
  static const Color textLightBlack = Color(0xFF717171);
  static const Color clearButtonColor = Color(0xFFFF7511);

  double tipAmountCalculate() {
    return double.parse(totalBillController.text.isEmpty
            ? "0.00"
            : totalBillController.text) *
        (double.parse(totalTipController.text.isEmpty
                ? "0.00"
                : totalTipController.text) /
            100);
  }

  double totalBillCalculate() {
    return (double.parse(totalBillController.text.isEmpty
            ? "0.00"
            : totalBillController.text) +
        double.parse(totalBillController.text.isEmpty
                ? "0.00"
                : totalBillController.text) *
            (double.parse(totalTipController.text.isEmpty
                    ? "0.00"
                    : totalTipController.text) /
                100));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Tip Calculator", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[50],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height - 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        const Text("Total Bill",
                            style: TextStyle(color: textLightBlack)),
                        Text("\$ ${totalBillCalculate().toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                                color: textBlack)),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Persons",
                                style: TextStyle(color: textLightBlack)),
                            Text("Tip Amount",
                                style: TextStyle(color: textLightBlack)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(totalPeopleController.text,
                                style: TextStyle(
                                    color: textBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)),
                            Text(
                                "\$ ${tipAmountCalculate().toStringAsFixed(2)}",
                                style: TextStyle(
                                    color: textBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Amount Per Person",
                              style: TextStyle(color: textLightBlack)),
                          Text(
                              "\$ ${(totalBillCalculate() / double.parse(totalPeopleController.text.isEmpty ? "0.00" : totalPeopleController.text)).toStringAsFixed(2)}",
                              style: TextStyle(
                                  color: textBlack,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700)),
                        ],
                      )),

                  const Spacer(),

                  // SizedBox(
                  //   height: size.height* 0.25,
                  // ),

                  SimpleInputField(
                    controller: totalBillController,
                    title: "Total Bill",
                    iconData: Icons.attach_money,
                    hintText: "Enter Total Bill amount",
                  ),
                  SimpleInputField(
                    controller: totalTipController,
                    title: "Tip Percentage",
                    iconData: Icons.percent,
                    hintText: "Enter Tip Percentage",
                  ),
                  SimpleInputField(
                    controller: totalPeopleController,
                    title: "Number of People",
                    iconData: Icons.people,
                    hintText: "Enter Total number of people",
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              formKey.currentState!.validate();
                              formKey.currentState!.save();
                              if (formKey.currentState!.validate()) {
                                print("Inputs are valid");
                              } else {
                                print("Inputs are not valid");
                              }
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: const Text("Calculate",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // totalBillController.text = "0.00";
                            // totalTipController.text = "0.00";
                            // totalPeopleController.text = "0.00";

                            totalBillController.clear();
                            totalTipController.clear();
                            totalPeopleController.clear();
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          decoration: BoxDecoration(
                            color: clearButtonColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text("Clear",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//
// const Text("Total Bill", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700, color: textBlack),),
// const SizedBox(height: 5 ,),
// TextFormField(
//
// keyboardType: TextInputType.number,
// decoration: InputDecoration(
// hintText: "Enter Total Bill amount",
// hintStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textLightBlack),
// suffixIcon: const Icon(Icons.attach_money, color: textBlack,),
// fillColor: containerColor,
// filled: true,
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(5),
// borderSide: const BorderSide(width: 0, color: Colors.transparent),
// ),
// enabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(5),
// borderSide: const BorderSide(width: 0, color: Colors.transparent),
// ),
// focusedBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(5),
// borderSide: const BorderSide(width: 0, color: Colors.transparent),
// ),
//
//
// ),
//
// onFieldSubmitted: (value) {
// if(value.isEmpty){
// totalBillController.text = "0.00";
// }
// totalBillController.text = value.toString();
// formKey.currentState!.save();
// setState(() {
//
// });
// },
// ),
