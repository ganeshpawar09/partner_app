import 'package:flutter/material.dart';
import 'package:partner_flutter_app/models/combine_model.dart';
import 'package:partner_flutter_app/screens/const/font.dart';
import 'package:partner_flutter_app/state/process_vedor_state.dart';
import 'package:provider/provider.dart';

class MaterialVendorScreen extends StatefulWidget {
  const MaterialVendorScreen({Key? key}) : super(key: key);

  @override
  State<MaterialVendorScreen> createState() => _MaterialVendorScreenState();
}

class _MaterialVendorScreenState extends State<MaterialVendorScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController idController = TextEditingController();
  TextEditingController vendorCodeController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController processNameController = TextEditingController();
  TextEditingController gstNoController = TextEditingController();
  TextEditingController bankAccountNoController = TextEditingController();
  TextEditingController ifscNoController = TextEditingController();
  TextEditingController nameOnCheckController = TextEditingController();
  TextEditingController upiIdController = TextEditingController();
  TextEditingController billingAddress1Controller = TextEditingController();
  TextEditingController billingAddress2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactPersonNameController = TextEditingController();
  TextEditingController contactPersonNumberController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();


  @override
  void dispose() {
    idController.dispose();
    vendorCodeController.dispose();
    companyNameController.dispose();
    processNameController.dispose();
    gstNoController.dispose();
    bankAccountNoController.dispose();
    ifscNoController.dispose();
    nameOnCheckController.dispose();
    upiIdController.dispose();
    billingAddress1Controller.dispose();
    billingAddress2Controller.dispose();
    cityController.dispose();
    stateController.dispose();
    countryController.dispose();
    pinController.dispose();
    emailController.dispose();
    contactPersonNameController.dispose();
    contactPersonNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Vendor',
          style: AppStyles.mondaB.copyWith(fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 10),
                customTextFormField("Vendor Code", vendorCodeController),
                customTextFormField("Company Name", companyNameController),
                customTextFormField("Process Name", processNameController),
                customTextFormField("GST No.", gstNoController),
                customTextFormField(
                    "Bank Account No.", bankAccountNoController),
                customTextFormField("IFSC No.", ifscNoController),
                customTextFormField("Name on Check", nameOnCheckController),
                customTextFormField("UPI Id", upiIdController),
                customTextFormField(
                    "Billing Address 1", billingAddress1Controller),
                customTextFormField(
                    "Billing Address 2", billingAddress2Controller),
                customTextFormField("City", cityController),
                customTextFormField("State", stateController),
                customTextFormField("Country", countryController),
                customTextFormField("Pin", pinController),
                customTextFormField("Email", emailController),
                customTextFormField(
                    "Contact Person Name", contactPersonNameController),
                customTextFormField(
                    "Contact Person Number", contactPersonNumberController),
                customTextFormField("Latitude", latitudeController),
                customTextFormField("Longitude", longitudeController),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    VendorDetail vendorDetail = VendorDetail(
                      id: int.tryParse(idController.text),
                      bankAccountNo: bankAccountNoController.text.isEmpty
                          ? null
                          : bankAccountNoController.text,
                      billingAdd1: billingAddress1Controller.text.isEmpty
                          ? null
                          : billingAddress1Controller.text,
                      billingAdd2: billingAddress2Controller.text.isEmpty
                          ? null
                          : billingAddress2Controller.text,
                      city: cityController.text.isEmpty
                          ? null
                          : cityController.text,
                      companyName: companyNameController.text.isEmpty
                          ? null
                          : companyNameController.text,
                      contPersonName: contactPersonNameController.text.isEmpty
                          ? null
                          : contactPersonNameController.text,
                      contPersonNumber:
                          contactPersonNumberController.text.isEmpty
                              ? null
                              : contactPersonNumberController.text,
                      country: countryController.text.isEmpty
                          ? null
                          : countryController.text,
                      email: emailController.text.isEmpty
                          ? null
                          : emailController.text,
                      gstNo: gstNoController.text.isEmpty
                          ? null
                          : gstNoController.text,
                      ifscCode: ifscNoController.text.isEmpty
                          ? null
                          : ifscNoController.text,
                      latitude: latitudeController.text.isEmpty
                          ? null
                          : latitudeController.text,
                      longitude: longitudeController.text.isEmpty
                          ? null
                          : longitudeController.text,
                      nameOnCheck: nameOnCheckController.text.isEmpty
                          ? null
                          : nameOnCheckController.text,
                      pin: _parsePin(pinController.text),
                      processName: processNameController.text.isEmpty
                          ? null
                          : processNameController.text,
                      state: stateController.text.isEmpty
                          ? null
                          : stateController.text,
                      upiId: upiIdController.text.isEmpty
                          ? null
                          : upiIdController.text,
                      vendorCode: vendorCodeController.text.isEmpty
                          ? null
                          : vendorCodeController.text,
                    );

                    await context
                        .read<ProcessVendorState>()
                        .updateVendor(vendorDetail);
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Text(
                      "Update",
                      textAlign: TextAlign.center,
                      style: AppStyles.mondaB
                          .copyWith(fontSize: 17, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 300,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget customTextFormField(String label, TextEditingController controller) {
  return Column(
    children: [
      TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        style: AppStyles.mondaN.copyWith(fontSize: 16),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          focusColor: Colors.black,
          labelStyle: AppStyles.mondaN,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: label,
        ),
      ),
      const SizedBox(
        height: 18,
      ),
    ],
  );
}

int _parsePin(String text) {
  try {
    if (text.isNotEmpty) {
      return int.parse(text);
    }
  } catch (e) {
    // Handle the case where parsing fails, e.g., return a default value.
  }
  return 0; // Default value if parsing fails or text is empty.
}
