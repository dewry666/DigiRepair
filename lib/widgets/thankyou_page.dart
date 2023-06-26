import 'package:flutter/material.dart';
import 'package:repair_service_ui/pages/request_service_flow.dart';
import 'package:repair_service_ui/utils/helper.dart';
import 'package:repair_service_ui/widgets/primary_button.dart';

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF283643), // Set the app bar color to #283643
        automaticallyImplyLeading: false, // Remove back button
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/done.png', // Replace with your image path
              width: 250,
              height: 250,
            ),
            SizedBox(height: 5.0),
            Text(
              'All Done!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'Thank you for choosing our exceptional service',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            SizedBox(
            height: 20.0,
          ),
           SizedBox(
                width: 300.0, // Set the desired width
                height: 60.0, // Set the desired height
                child: PrimaryButton(
                  text: "Back to Start",
                  onPressed: () {
                    Helper.nextPage(context, RequestServiceFlow());
                  },
                ))
          ],
        ),
      ),
    );
  }
}
