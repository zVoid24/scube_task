import 'package:flutter/material.dart';
import 'package:scube/core/constants/app_assets.dart';

class InverterListModule extends StatelessWidget {
  const InverterListModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildInverterCard('LT_01'),
        const SizedBox(height: 12),
        _buildInverterCard('LT_01'), // Duplicate for demo
      ],
    );
  }

  Widget _buildInverterCard(String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          // Header
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const Text(
                  '495.505 kWp / 440 kW',
                  style: TextStyle(
                    color: Color(0xFF0099FF),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Grid
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildGridItem(
                        iconPath: AppAssets.lifetimeEnergy,
                        label: 'Lifetime Energy',
                        value: '352.96 MWh',
                        color: Colors.cyan.shade50,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildGridItem(
                        iconPath: AppAssets.todayEnergy,
                        label: 'Today Energy',
                        value: '273.69 kWh',
                        color: Colors.yellow.shade50,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildGridItem(
                        iconPath: AppAssets.prevMeterEnergy,
                        label: 'Prev. Meter Energy',
                        value: '0.00 MWh',
                        color: Colors.orange.shade50,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildGridItem(
                        iconPath:
                            AppAssets.livePower, // Need to verify correct icon
                        label: 'Live Power',
                        value: '352.96 MWh',
                        color: Colors.purple.shade50,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem({
    required String iconPath,
    required String label,
    required String value,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(iconPath, height: 40, width: 40, scale: 0.4),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(color: Colors.grey[600], fontSize: 10),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
