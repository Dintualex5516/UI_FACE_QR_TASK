import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';



class ChartPreview extends StatelessWidget {
  const ChartPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return Container(
      height: 100, // Increased height
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: LineChart(
        LineChartData(
          minY: 1,
          maxY: 20, // Four horizontal lines at intervals of 5: 0,5,10,15,20
          gridData: FlGridData(
            show: true,
            horizontalInterval: 5,
            drawHorizontalLine: true,
            drawVerticalLine: true,
            getDrawingHorizontalLine: (value) => FlLine(
              color: Colors.grey.shade400,
              strokeWidth: 1,
              dashArray: [4, 4],
            ),
            getDrawingVerticalLine: (value) => value == 0
                ? FlLine(
                    color: Colors.grey.shade400,
                    strokeWidth: 1,
                    dashArray: [4, 4],
                  )
                : FlLine(color: Colors.transparent),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                reservedSize: 24,
                getTitlesWidget: (value, _) {
                  const months = [
                    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
                  ];
                  if (value >= 0 && value < months.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Text(
                        months[value.toInt()],
                        style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            _buildLine([15,12,13,15,14,13,15,13,14,13,15,17], Colors.green),
            _buildLine([13,8,10,7,13,10,13.1,11.1,12.0,11,10,8], Colors.red),
            _buildLine([10,10.1,8.9,8,9.5,8,10.1,8.1,9.0,10.1,10.9,11], Colors.blue),
          ],
        ),
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      ),
    );
  }

  LineChartBarData _buildLine(List<double> yVals, Color color) {
    return LineChartBarData(
      isCurved: false,
      color: color,
      barWidth: 1,
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, barData, idx) =>
            FlDotCirclePainter(
              radius: 3,
              color: color,
              strokeWidth: 1.5,
              strokeColor: Colors.white,
            ),
      ),
      spots: List.generate(yVals.length, (i) => FlSpot(i.toDouble(), yVals[i])),
    );
  }
}
