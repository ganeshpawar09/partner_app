import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:partner_flutter_app/models/combine_model.dart';
import 'package:partner_flutter_app/screens/const/font.dart';
import 'package:partner_flutter_app/screens/process/widget/process_update_section.dart';
import 'package:partner_flutter_app/state/order_item_state.dart';
import 'package:partner_flutter_app/state/order_process_state.dart';
import 'package:provider/provider.dart';

class ProcessDetailScreen extends StatefulWidget {
  final OrderProcess orderProcess;
  const ProcessDetailScreen({Key? key, required this.orderProcess})
      : super(key: key);

  @override
  State<ProcessDetailScreen> createState() => _ProcessDetailScreenState();
}

class _ProcessDetailScreenState extends State<ProcessDetailScreen> {
  ErpOrderItem? orderitem;

  Future<ErpOrderItem?> fetchData(BuildContext context) async {
    try {
      print('Before fetching data');
      await context
          .read<OrderItemState>()
          .getErpOrderItemByProcess(widget.orderProcess);
      orderitem = context.read<OrderItemState>().erpOrderItemByProcess;

      print('After fetching data');
    } catch (error) {
      print('Error fetching data: $error');
    }

    return context.read<OrderItemState>().erpOrderItemByProcess;
  }

  void refresh(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ProcessDetailScreen(orderProcess: widget.orderProcess),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    OrderProcess process = widget.orderProcess;

    String processId = process.processId!;
    double processCost = process.cost!;
    double processCostTax = processCost * 0.12;
    double processCostTotal = processCost * 1.12;
    String processName = process.processName!;
    bool processStatus = process.completed ?? false;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Process Update Details",
            style: AppStyles.mondaB.copyWith(fontSize: 22),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                // showSearch(
                // context: context, delegate: ProductSearch(screen: "process"));
              },
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: <Widget>[
                    customTitle("Process Details:"),
                    customRow("Process Id: ", processId),
                    customRow("Process Name: ", processName.toUpperCase()),
                    status(processStatus),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Process Drawing: ",
                          style: AppStyles.mondaN.copyWith(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        // DownloadButton(
                        //   url:
                        //       '$serversite/api/process_drawing_download/${process.id}/',
                        //   filetype: filetype,
                        //   filename: filename,
                        //   buttonname: 'filename',
                        // ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FutureBuilder<ErpOrderItem?>(
                      future: fetchData(context),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          );
                        } else if (snapshot.hasError ||
                            !snapshot.hasData ||
                            snapshot.data == null) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Chech Your Internet Connection",
                                  textAlign: TextAlign.center,
                                  style:
                                      AppStyles.mondaN.copyWith(fontSize: 16),
                                ),
                                IconButton(
                                  onPressed: () {
                                    refresh(context);
                                  },
                                  icon: const Icon(
                                    Icons.refresh,
                                    size: 45,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Column(
                            children: [
                              customTitle("Material Details:"),
                              customRow("Material Type Name",
                                  orderitem!.materialDetail!.materialTypeName!),
                              customRow("Material Name",
                                  orderitem!.materialDetail!.materialName!),
                              customRow("Dimensions",
                                  "${orderitem!.document!.dimensionX} x ${orderitem!.document!.dimensionY} x ${orderitem!.document!.dimensionZ} mm"),
                            ],
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    customTitle("Billing Details"),
                    customRow("Total Cost: ", processCost.toStringAsFixed(2)),
                    customRow("GST (12%): ", processCostTax.toStringAsFixed(2)),
                    customRow("Total: ",
                        "\u{20B9} ${processCostTotal.toStringAsFixed(2)}"),
                  ],
                ),
              ),
              ProcessUpdateSection(orderProcess: widget.orderProcess),
            ],
          ),
        ));
  }
}

Widget status(bool status) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Status:",
          style:
              AppStyles.mondaN.copyWith(fontSize: 16, color: Colors.black54)),
      status
          ? Text(
              ('Completed'),
              style:
                  AppStyles.mondaB.copyWith(fontSize: 17, color: Colors.green),
            )
          : Text(('Not Completed'),
              style:
                  AppStyles.mondaB.copyWith(fontSize: 17, color: Colors.red)),
    ],
  );
}

Widget customTitle(String text) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: AppStyles.mondaB.copyWith(fontSize: 20),
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}

Widget customRow(String title, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: AppStyles.mondaN.copyWith(fontSize: 16, color: Colors.black54),
      ),
      Expanded(
        child: Text(
          value,
          textAlign: TextAlign.end,
          style: AppStyles.mondaB.copyWith(fontSize: 17),
        ),
      ),
    ],
  );
}
