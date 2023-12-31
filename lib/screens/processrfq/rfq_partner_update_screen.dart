// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'package:partner_flutter_app/state/process_rfq_state.dart';
// import 'package:partner_flutter_app/widgets/drawer.dart';

// class RfqPartnerDetailScreen extends StatefulWidget {
//   static const routeName = '/rfq-partner-details-screens';
//   @override
//   _RfqPartnerDetailState createState() => _RfqPartnerDetailState();
// }

// class _RfqPartnerDetailState extends State<RfqPartnerDetailScreen> {
//   final rfqCostController = TextEditingController();
//   final rfqLeadController = TextEditingController();

//   void onAdd() {
//     final String val1 = rfqCostController.text;
//     final String val2 = rfqLeadController.text;
//     final dynamic id = ModalRoute.of(context)!.settings.arguments;
//     print(id);
//     if (val1.isNotEmpty && val2.isNotEmpty) {
//       Provider.of<ProcessRFQState>(context, listen: false)
//           .updateProcessRFQ(id, int.parse(val1));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final dynamic id = ModalRoute.of(context)!.settings.arguments;
//     final rfq = Provider.of<ProcessRFQState>(context).singlerfqitem(id);
//     return Scaffold(
//       appBar: AppBar(title: Text('Enter Details')),
//       drawer: CustomAppDrawer(),
//       body: ListView(
//         padding: const EdgeInsets.all(8),
//         children: [
//           Container(
//               child: Column(
//             children: [
//               TextField(
//                 controller: rfqCostController,
//                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//               ),
//               TextField(
//                 controller: rfqLeadController,
//                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//               ),
//               ElevatedButton(
//                   child: Text('Add'),
//                   onPressed: () {
//                     onAdd();
//                     Navigator.of(context).pop();
//                   })
//             ],
//           ))
//         ],
//       ),
//     );
//   }
// }
