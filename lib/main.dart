import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager_app/core/routing/app_router.dart';
import 'package:smart_ahwa_manager_app/core/routing/routers.dart';
import 'package:smart_ahwa_manager_app/logic/report_service.dart';
import 'package:smart_ahwa_manager_app/models/drink.dart';
import 'package:smart_ahwa_manager_app/models/order.dart';

void main() {
  var order1= Order(customerName: "heba", drink: Tea(), notes: "no sugar");
  var order2= Order(customerName: "ali", drink: Coffee(), notes: "extra hot");
   var order3= Order(customerName: "sara", drink: Coffee(), notes: "less ice");
  var orders=[order1,order2,order3, ];
  var reportService=ReportService();
  reportService.generateReport(orders);
  runApp(SmartAhwa(appRouter: AppRouter()));}


class SmartAhwa extends StatelessWidget {
  const SmartAhwa({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.splashScreen,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
