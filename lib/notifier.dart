import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Details extends ConsumerStatefulWidget {
  const Details({super.key});

  @override
  ConsumerState<Details> createState() => _DetailsAddingState();
}

class _DetailsAddingState extends ConsumerState<Details> {
  final TextEditingController number = TextEditingController();
  final TextEditingController halfNum = TextEditingController();

  void _calculateHalf() {
    final inputNumber = double.tryParse(number.text);
    if (inputNumber != null) {
      final half = inputNumber / 2;
      halfNum.text = half.toString();
    } else {
      halfNum.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(width * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: number,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                fontSize: width * 0.04,
                fontWeight: FontWeight.w400,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                labelText: "Number",
                labelStyle: TextStyle(
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w600,
                ),
                hintText: "Please enter your number",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: width * 0.05,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(width * 0.03),
                ),
              ),
              onChanged: (value) {
                _calculateHalf();
                // Call the function when input changes
              },
            ),
            TextFormField(
              controller: halfNum,
              keyboardType: TextInputType.number,
              readOnly: true, // Make this field read-only
              style: TextStyle(
                fontSize: width * 0.04,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                labelText: "Half",
                labelStyle: TextStyle(
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w600,
                ),
                hintText: "Half of the number",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: width * 0.05,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(width * 0.03),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}