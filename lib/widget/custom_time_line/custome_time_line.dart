import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineStep {
  final String title;
  final String time;

  TimelineStep({required this.title, required this.time});
}

class DeliveryTimeline extends StatelessWidget {
  final List<TimelineStep> steps;
  final String currentStatus;

  const DeliveryTimeline({
    Key? key,
    required this.steps,
    required this.currentStatus,
  }) : super(key: key);

  int getCurrentIndex() {
    return steps.indexWhere((step) => step.title == currentStatus);
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = getCurrentIndex();

    return Column(
      children: List.generate(steps.length, (index) {
        bool isCompleted = index < currentIndex;
        bool isCurrent = index == currentIndex;

        return TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          isFirst: index == 0,
          isLast: index == steps.length - 1,
          indicatorStyle: IndicatorStyle(
            width: 24,
            height: 24,
            indicator: Container(
              decoration: BoxDecoration(
                color: isCompleted || isCurrent ? Colors.green : Colors.white,
                border: Border.all(color:  isCompleted || isCurrent ? Colors.green : Colors.grey, width: 2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  isCurrent && index == steps.length - 1
                      ? Icons.check
                      : Icons.circle,
                  size: 14,
                  color: isCompleted || isCurrent ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ),
          beforeLineStyle: LineStyle(
            color: Colors.grey.shade300,
            thickness: 2,
          ),
          afterLineStyle: LineStyle(
            color: Colors.grey.shade300,
            thickness: 2,
          ),
          endChild: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                steps[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(steps[index].time),
            ),
          ),
        );
      }),
    );
  }
}
