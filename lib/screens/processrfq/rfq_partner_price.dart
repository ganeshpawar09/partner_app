// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'package:partner_flutter_app/barcode_scan/widgets/product_search.dart';
// import 'package:partner_flutter_app/screens/download/download_button.dart';
// import 'package:partner_flutter_app/server_url.dart';
// import 'package:partner_flutter_app/state/process_rfq_state.dart';
// import 'package:partner_flutter_app/widgets/drawer.dart';
// import 'package:provider/provider.dart';
// //import 'package:intl/intl.dart';

// class RfqPartner extends StatefulWidget {
//   const RfqPartner({Key? key}) : super(key: key);

//   @override
//   _RfqPartnerState createState() => _RfqPartnerState();
// }

// class _RfqPartnerState extends State<RfqPartner> {
// // class RfqPartner extends StatelessWidget {

//   final rfqCostController = TextEditingController();
//   void updatePrice(int id) {
//     final String val1 = rfqCostController.text;
//     if (val1.isNotEmpty) {
//       Provider.of<ProcessRFQState>(context, listen: false)
//           .updateProcessRFQ(id, int.parse(val1))
//           .then((value) => Navigator.push(
//               context, MaterialPageRoute(builder: (context) => RfqPartner())));
//     }
//   }

//   Future<void> showInformationDialog(BuildContext context, int id) async {
//     return await showDialog(
//         context: context,
//         builder: (context) {
//           bool isChecked = false;
//           print('id is $id');
//           return StatefulBuilder(builder: (context, setState) {
//             return AlertDialog(
//               content: Form(
//                   // key: _formKey,
//                   child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   TextField(
//                     controller: rfqCostController,
//                     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'Enter Price',
//                       labelText: "Price ",
//                     ),
//                   ),
//                 ],
//               )),
//               actions: <Widget>[
//                 TextButton(
//                   child: Text('Submit'),
//                   onPressed: () {
//                     updatePrice(id);
//                   },
//                 ),
//               ],
//             );
//           });
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final data = Provider.of<ProcessRFQState>(context).processRFQList;
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("RFQ Dashboard"),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.search),
//               onPressed: () {
//                 showSearch(context: context, delegate: ProductSearch());
//               },
//             ),
//           ],
//         ),
//         drawer: CustomAppDrawer(),
//         body: Padding(
//           padding: EdgeInsets.all(1),
//           child: ListView.builder(
//               itemCount: data.length,
//               itemBuilder: (BuildContext context, int index) =>
//                   buildTripCard(context, index)),
//           /*return Container(
//             child: new ListView.builder(
//                 itemCount: data.length,
//                 itemBuilder: (BuildContext context, int index) =>
//                     buildTripCard(context, index)),
//           );
//           */
//         ));
//   }

//   Widget buildTripCard(BuildContext context, int index) {
//     final data = Provider.of<ProcessRFQState>(context).processRFQList;
//     final dataSingle = data[index];

//     var drawingPath = dataSingle.process!.processDrawing;
//     print("drawingpath $drawingPath");
//     var drawingSplit = drawingPath!.split('.');
//     var drawingSplitname = drawingPath.split('/');
//     String drawingFilename = drawingSplitname.last;
//     String drawingFiletype = drawingSplit.last;

//     var partPath = dataSingle.process!.processPartFile;
//     var partSplit = partPath!.split('.');
//     var partSplitname = partPath.split('/');
//     String partFilename = partSplitname.last;
//     String partFiletype = partSplit.last;

//     int currentId;

//     var startDateSplit = dataSingle.process?.startDate;
//     var startDateList = startDateSplit?.split('T') ?? '29-11-12';
//     // String start_date = start_date_list!.first;

//     var end_date_split = dataSingle.process?.endDate;
//     var end_date_list = end_date_split?.split('T');
//     // String end_date = end_date_list.first;

//     // ignore: avoid_unnecessary_containers
//     return Container(
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
//                 child: Row(children: <Widget>[
//                   Text(
//                     ('Process id: ${dataSingle.process!.processId}'),
//                     style: GoogleFonts.monda(
//                         textStyle: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600)),
//                   ),
//                   const Spacer(),
//                   Text(
//                     ('Target Price: ${dataSingle.process!.targetCost}'),
//                     style: GoogleFonts.monda(
//                         textStyle: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600)),
//                   ),
//                 ]),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
//                 child: Row(children: <Widget>[
//                   Text(
//                     //"${DateFormat('dd/MM/yyyy').format(trip.startDate).toString()} - ${DateFormat('dd/MM/yyyy').format(trip.endDate).toString()}"),
//                     // ('Start Date: ${start_date}'),
//                     ('Start Date:'),
//                     style: GoogleFonts.monda(
//                         textStyle: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600)),
//                   ),
//                   Spacer(),
//                   Text(
//                     ('Your Price: ${dataSingle.rfqCost.toString()}'),
//                     style: GoogleFonts.monda(
//                         textStyle: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600)),
//                   ),
//                 ]),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
//                 child: Row(children: <Widget>[
//                   Text(
//                     //"${DateFormat('dd/MM/yyyy').format(trip.startDate).toString()} - ${DateFormat('dd/MM/yyyy').format(trip.endDate).toString()}"),
//                     // ('End Date: ${end_date}'),
//                     ('End Date:'),
//                     style: GoogleFonts.monda(
//                         textStyle: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600)),
//                   ),
//                 ]),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
//                 child: Row(children: <Widget>[
//                   Text(
//                     //"${DateFormat('dd/MM/yyyy').format(trip.startDate).toString()} - ${DateFormat('dd/MM/yyyy').format(trip.endDate).toString()}"),
//                     // ('End Date: ${end_date}'),
//                     ('Part File Name:$partFilename'),
//                     style: GoogleFonts.monda(
//                         textStyle: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600)),
//                   ),
//                 ]),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
//                 child: Row(children: <Widget>[
//                   Text(
//                     //"${DateFormat('dd/MM/yyyy').format(trip.startDate).toString()} - ${DateFormat('dd/MM/yyyy').format(trip.endDate).toString()}"),
//                     // ('End Date: ${end_date}'),
//                     ('Drawing File Name:$drawingFilename'),
//                     style: GoogleFonts.monda(
//                         textStyle: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600)),
//                   ),
//                 ]),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
//                 child: dataSingle.process!.targetCost == 0.0
//                     // if

//                     ? Row(
//                         children: <Widget>[
//                           DownloadButton(
//                               url:
//                                   '$serversite/api/process_file_download/${dataSingle.process!.id}/',
//                               filetype: partFiletype,
//                               filename: partFilename,
//                               buttonname: 'File ${partFiletype}'),
//                           Spacer(),
//                           DownloadButton(
//                               url:
//                                   '$serversite/api/process_drawing_download/${dataSingle.process!.id}/',
//                               filetype: drawingFiletype,
//                               filename: drawingFilename,
//                               buttonname: 'Drawing'),
//                           Spacer(),
//                           ElevatedButton(
//                             child: Text("Give Offer"),
//                             onPressed: () async {
// //                              current_id = dataSingle.process!.id;
//                               await showInformationDialog(
//                                   context, dataSingle.id!);
//                               print('object');
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                         ],
//                       )
//                     // else

//                     : Row(
//                         children: <Widget>[
//                           DownloadButton(
//                               url:
//                                   '$serversite/api/process_file_download/${dataSingle.process!.id}/',
//                               filetype: partFiletype,
//                               filename: partFilename,
//                               buttonname: 'File ${partFiletype}'),
//                           Spacer(),
//                           DownloadButton(
//                               url:
//                                   '$serversite/api/process_drawing_download/${dataSingle.process!.id}/',
//                               filetype: drawingFiletype,
//                               filename: drawingFilename,
//                               buttonname: 'Drawing'),
//                           Spacer(),
//                           ElevatedButton(
//                             child: Text("Give Offer"),
//                             onPressed: () async {
// //                              current_id = dataSingle.process!.id;
//                               await showInformationDialog(
//                                   context, dataSingle.id!);
//                               print('object');
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                         ],
//                       ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
