import 'package:flutter/material.dart';
import 'package:scube/core/constants/app_assets.dart';

class TotalValuesModule extends StatelessWidget {
  const TotalValuesModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row 1: Total Num of PV Module (Full Width)
        _buildCard(
          iconPath: AppAssets.totalPvModule,
          title: 'Total Num of PV Module',
          value: '6372 pcs. (585 Wp each)',
          isFullWidth: true,
        ),
        const SizedBox(height: 8),
        // Row 2: Total AC Capacity | Total DC Capacity
        Row(
          children: [
            Expanded(
              child: _buildCard(
                iconPath: AppAssets.totalAcCapacity,
                title: 'Total AC Capacity',
                value: '3000 KW',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildCard(
                iconPath: AppAssets.totalDcCapacity,
                title: 'Total DC Capacity',
                value: '3.727 MWp',
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Row 3: Date of Commissioning | Number of Inverter
        Row(
          children: [
            Expanded(
              child: _buildCard(
                iconPath: AppAssets.dateCommissioning,
                title: 'Date of Commissioning',
                value: '17/07/2024',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildCard(
                iconPath: AppAssets.numberOfInverter,
                title: 'Number of Inverter',
                value: '30',
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Row 4: Total AC Capacity | Total DC Capacity (Duplicate as per screenshot)
        Row(
          children: [
            Expanded(
              child: _buildCard(
                iconPath: AppAssets.totalAcCapacity,
                title: 'Total AC Capacity',
                value: '3000 KW',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildCard(
                iconPath: AppAssets.totalDcCapacity,
                title: 'Total DC Capacity',
                value: '3.727 MWp',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCard({
    required String iconPath,
    required String title,
    required String value,
    bool isFullWidth = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
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
      child: Row(
        children: [
          Image.asset(iconPath, height: 32, width: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.grey[700], fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
