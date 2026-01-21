import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scube/features/dashboard/presentation/widgets/environment_card.dart';
import 'package:scube/features/dashboard/presentation/widgets/metric_card.dart';
import 'package:scube/features/dashboard/presentation/widgets/data_list_item.dart';
import 'package:scube/core/constants/app_assets.dart';
import 'package:scube/features/dashboard/presentation/widgets/total_values_module.dart';
import 'package:scube/features/dashboard/presentation/widgets/inverter_list_module.dart';
import 'package:scube/features/dashboard/presentation/screens/second_page_screen.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          '1st Page',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.red),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Navigation Button
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondPageScreen(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00C2FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      '2nd Page Navigate >',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Metrics Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 1.3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: const [
                MetricCard(
                  iconPath: AppAssets.liveAcPower,
                  value: '10000 kW',
                  label: 'Live AC Power',
                  color: Colors.green,
                ),
                MetricCard(
                  iconPath: AppAssets.plantGeneration,
                  value: '82.58 %',
                  label: 'Plant Generation',
                  color: Colors.blue,
                ),
                MetricCard(
                  iconPath: AppAssets.livePr,
                  value: '85.61 %',
                  label: 'Live PR',
                  color: Colors.purple,
                ),
                MetricCard(
                  iconPath: AppAssets.cumulativePr,
                  value: '27.58 %',
                  label: 'Cumulative PR',
                  color: Colors.blue,
                ),
                MetricCard(
                  iconPath: AppAssets.returnPv,
                  value: '10000 ৳',
                  label: 'Return PV',
                  color: Colors.orange,
                ),
                MetricCard(
                  iconPath: AppAssets.totalEnergy,
                  value: '10000 kWh',
                  label: 'Total Energy',
                  color: Colors.teal,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Divider(height: 1),
                  const DataListItem(
                    label: 'AC Max Power',
                    value1: '1636.50 kW',
                    value2: '2121.88 kW',
                    isEven: false,
                  ),
                  const DataListItem(
                    label: 'Net Energy',
                    value1: '6439.16 kWh',
                    value2: '4875.77 kWh',
                    isEven: true,
                  ),
                  const DataListItem(
                    label: 'Specific Yield',
                    value1: '1.25 kWh/kWp',
                    value2: '0.94 kWh/kWp',
                    isEven: false,
                  ),
                  const DataListItem(
                    label: 'Net Energy',
                    value1: '6439.16 kWh',
                    value2: '4875.77 kWh',
                    isEven: true,
                  ),
                  const DataListItem(
                    label: 'Specific Yield',
                    value1: '1.25 kWh/kWp',
                    value2: '0.94 kWh/kWp',
                    isEven: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // 3rd Module: Total Values
            const TotalValuesModule(),
            const SizedBox(height: 16),
            // 4th Module: Inverter List
            const InverterListModule(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
