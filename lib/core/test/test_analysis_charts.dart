import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:project_bills/core/shared/colors.dart';
import 'package:project_bills/core/shared/text_styles.dart';

class CategoryBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Expanded(
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 20,
            barGroups: [
              BarChartGroupData(x: 0, barRods: [
                BarChartRodData(
                    toY: 20,
                    color: ProjectColors.mainColor,
                    width: 40,
                    borderRadius: BorderRadius.circular(8)),
              ]),
              BarChartGroupData(x: 1, barRods: [
                BarChartRodData(
                    toY: 18,
                    color: ProjectColors.mainColor,
                    width: 40,
                    borderRadius: BorderRadius.circular(8)),
              ]),
              BarChartGroupData(x: 2, barRods: [
                BarChartRodData(
                    toY: 10,
                    color: ProjectColors.mainColor,
                    width: 40,
                    borderRadius: BorderRadius.circular(8)),
              ]),
            ],
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    switch (value.toInt()) {
                      case 0:
                        return Text('ملابس',
                            style: TextStyles.font16mainColorBold);
                      case 1:
                        return Text('أدوية',
                            style: TextStyles.font16mainColorBold);
                      case 2:
                        return Text('طعام',
                            style: TextStyles.font16mainColorBold);
                    }
                    return const Text('');
                  },
                  reservedSize: 30,
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            gridData: FlGridData(show: false),
          ),
        ),
      ),
    );
  }
}
