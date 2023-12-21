// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:partner_flutter_app/screens/download/download_button.dart';
// import 'package:partner_flutter_app/screens/griddashboard.dart';
// import 'package:partner_flutter_app/state/partner_details_state.dart';
// import 'package:partner_flutter_app/state/process_state.dart';
// import 'package:partner_flutter_app/state/rfq_partner_price_state.dart';
// import 'package:partner_flutter_app/widgets/drawer.dart';
// import 'package:provider/provider.dart';

// // class Test extends StatefulWidget {
// //   static const routeName = '/test-screens';

// //   @override
// //   _TestState createState() => _TestState();
// // }

// // class _TestState extends State<Test> {
// //   @override
// //   Widget build(BuildContext context) {
// //     DateTime now = new DateTime.now();
// //     DateTime date = new DateTime(now.year, now.month, now.day);
// //     String filename = 'test.pdf';
// //     final companyname =
// //         Provider.of<GetPartnerDetails>(context).getcompanyname();
// //     return Scaffold(
// //       backgroundColor: Color(0xfff3f3f3),
// //       body: Center(
// //         // child: DownloadButton(url: 'https://www.eagleburgmann.com/media/admin-area/media-data-base-website/stp-documents/emg/emg-100-g60.stp-1/download',),
// //         child: DownloadButton(url: 'http://192.168.1.107:8000/api/download/5/',filetype:'pdf',filename:filename),
// //       ),
// //     );
// //   }
// // }


// class Test extends StatelessWidget {
//   static const routeName = '/test-screens';
//   const Test({Key? key}) : super(key: key);

//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: const MyStatelessWidget(),
//       ),
//     );
//   }
// }

// class MyStatelessWidget extends StatelessWidget {
//   const MyStatelessWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DataTable(
//       columns: const <DataColumn>[
//         DataColumn(
//           label: Text(
//             'Name',
//             style: TextStyle(fontStyle: FontStyle.italic),
//           ),
//         ),
//         DataColumn(
//           label: Text(
//             'Age',
//             style: TextStyle(fontStyle: FontStyle.italic),
//           ),
//         ),
//         DataColumn(
//           label: Text(
//             'Role',
//             style: TextStyle(fontStyle: FontStyle.italic),
//           ),
//         ),
//       ],
//       rows: const <DataRow>[
//         DataRow(
//           cells: <DataCell>[
//             DataCell(Text('Sarah')),
//             DataCell(Text('19')),
//             DataCell(Text('Student')),
//           ],
//         ),
//         DataRow(
//           cells: <DataCell>[
//             DataCell(Text('Janine')),
//             DataCell(Text('43')),
//             DataCell(Text('Professor')),
//           ],
//         ),
//         DataRow(
//           cells: <DataCell>[
//             DataCell(Text('William')),
//             DataCell(Text('27')),
//             DataCell(Text('Associate Professor')),
//           ],
//         ),
//       ],
//     );
//   }
// }

// // class ProcessDetailsScreens extends StatefulWidget {
// //   static const routeName = '/process-details-screens';
// //   @override
// //   _ProcessDetailsScreens createState() => _ProcessDetailsScreens();
// // }

// // class _ProcessDetailsScreens extends State<ProcessDetailsScreens> {  
// //   @override
// //   Widget build(BuildContext context) {
// //     Widget payNow = InkWell(
// // //      onTap: () => Navigator.of(context)
// // //          .push(MaterialPageRoute(builder: (_) => ViewProductPage())),
// //       child: Container(
// //         height: 80,
// //         width: MediaQuery.of(context).size.width / 1.5,
// //         decoration: BoxDecoration(
// //             boxShadow: [
// //               BoxShadow(
// //                 color: Color.fromRGBO(0, 0, 0, 0.16),
// //                 offset: Offset(0, 5),
// //                 blurRadius: 10.0,
// //               )
// //             ],
// //             borderRadius: BorderRadius.circular(9.0)),
// //         child: Center(
// //           child: Text("Pay Now",
// //               style: const TextStyle(
// //                   color: const Color(0xfffefefe),
// //                   fontWeight: FontWeight.w600,
// //                   fontStyle: FontStyle.normal,
// //                   fontSize: 20.0)),
// //         ),
// //       ),
// //     );

// //     return Material(
// //         color: Colors.white,
// //         child: SafeArea(
// //           child: LayoutBuilder(
// //               builder: (_, constraints) => SingleChildScrollView(
// //                   physics: ClampingScrollPhysics(),
// //                   child: ConstrainedBox(
// //                       constraints: BoxConstraints(
// //                         minHeight: constraints.maxHeight,
// //                       ),
// //                       child: Padding(
// //                           padding: const EdgeInsets.only(top: kToolbarHeight),
// //                           child: Column(children: <Widget>[
// //                             Padding(
// //                               padding: EdgeInsets.symmetric(horizontal: 16.0),
// //                               child: Row(
// //                                 mainAxisAlignment:
// //                                     MainAxisAlignment.spaceBetween,
// //                                 children: <Widget>[
// //                                   Text(
// //                                     'Unpaid',
// //                                     style: TextStyle(
// //                                       color: Color(0xffa29aac),
// //                                       fontSize: 22,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   CloseButton()
// //                                 ],
// //                               ),
// //                             ),
// //                             Container(
// //                               margin: const EdgeInsets.all(16.0),
// //                               padding: const EdgeInsets.fromLTRB(
// //                                   16.0, 0, 16.0, 16.0),
// //                               decoration: BoxDecoration(
// //                                   color: Colors.white,
// //                                   // boxShadow: shadow,
// //                                   borderRadius: BorderRadius.only(
// //                                       bottomLeft: Radius.circular(10),
// //                                       bottomRight: Radius.circular(10))),
// //                               child: Column(
// //                                 mainAxisSize: MainAxisSize.min,
// //                                 children: <Widget>[
// //                                   ListTile(
// //                                     title: Text('Process ID',
// //                                       style: TextStyle(
// //                                           fontSize: 20,
// //                                           fontWeight: FontWeight.bold),
// //                                     ),
// //                                     trailing: Text('Process Name'),
// //                                   ),
// //                                   ListTile(
// //                                     title: Text('Process Name',
// //                                     style: TextStyle(
// //                                           fontSize: 20,
// //                                           fontWeight: FontWeight.bold),                                    
// //                                     ),
// //                                     trailing: Text('test'),
// //                                   ),                                  
// //                                   ListTile(
// //                                     title: Text('Barcode ID',
// //                                     style: TextStyle(
// //                                           fontSize: 20,
// //                                           fontWeight: FontWeight.bold),                                    
// //                                     ),
// //                                     trailing: Text('1.25'),
// //                                   ),
// //                                   ListTile(
// //                                     title: Text('Download Drawing File',
// //                                     style: TextStyle(
// //                                           fontSize: 20,
// //                                           fontWeight: FontWeight.bold),                                    
// //                                     ),
// //                                     trailing: Text('76.93'),
// //                                   ),
// //                                   ListTile(
// //                                     title: Text('Amount',
// //                                     style: TextStyle(
// //                                           fontSize: 20,
// //                                           fontWeight: FontWeight.bold),                                    
// //                                     ),
// //                                     trailing: Text('-10.93'),
// //                                   ),
// //                                   Divider(),
// //                                   ListTile(
// //                                     title: Text(
// //                                       'Total',
// //                                       style: TextStyle(
// //                                           fontSize: 20,
// //                                           fontWeight: FontWeight.bold),
// //                                     ),
// //                                     trailing: Text(
// //                                       '\$ 66.93',
// //                                       style: TextStyle(
// //                                           fontSize: 20,
// //                                           fontWeight: FontWeight.bold),
// //                                     ),
// //                                   )
// //                                 ],
// //                               ),
// //                             ),
// //                             SizedBox(
// //                               height: 24,
// //                             ),
// //                             Padding(
// //                               padding: const EdgeInsets.only(bottom: 20),
// //                               child: payNow,
// //                             )
// //                           ]))))),
// //         ));
// //   }
// // }
