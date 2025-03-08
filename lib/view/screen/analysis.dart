import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../core/shared/colors.dart';
import '../../core/shared/text_styles.dart';
import 'analysis_customize.dart';

class Analysis extends StatelessWidget {
  const Analysis({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
                onPressed: () {
                  // Navigate to payment screen
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AnalysisCustomize()));
                },
                child: Text('تخصيص',style: TextStyles.font18whiteW600,),
              style: ElevatedButton.styleFrom(
                backgroundColor: ProjectColors.mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(' مصروفات شهر اكتوبر ', style: TextStyles.font22mainColorW600),
            const SizedBox(height: 20),
            Container(
              height: 450,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 30,
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
            const SizedBox(height: 10),
            Divider(),
            const SizedBox(height: 10),
            Text(' مصروفات شهر نوفمبر ', style: TextStyles.font22mainColorW600),
            const SizedBox(height: 20),
            Container(
              height: 450,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 30,
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
          ],
        ),
      ),
    );
  }
}
