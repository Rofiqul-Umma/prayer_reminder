import 'package:flutter/material.dart';
import 'package:prayer_reminder/features/task_manager/view/all_task_page.dart';
import 'package:prayer_reminder/features/task_manager/view/cancelled_page.dart';
import 'package:prayer_reminder/features/task_manager/view/completed_page.dart';
import 'package:prayer_reminder/features/task_manager/view/components/card_canceled.dart';
import 'package:prayer_reminder/features/task_manager/view/components/card_completed.dart';
import 'package:prayer_reminder/features/task_manager/view/components/card_total.dart';
import 'package:prayer_reminder/features/task_manager/view/components/card_todo.dart';
import 'package:prayer_reminder/features/task_manager/view/todos_page.dart';

class GridTaskStatus extends StatelessWidget {
  final TextEditingController titleC;
  final TextEditingController descC;
  final TextEditingController timeC;
  const GridTaskStatus({
    super.key,
    required this.titleC,
    required this.descC,
    required this.timeC,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final isMobile = size.width < 600;
    return SizedBox(
      height: isMobile ? size.height * 0.3 : size.height * 0.2,
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isMobile ? 2 : 4,
          childAspectRatio: 1.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          TodosPage(titleC: titleC, descC: descC, timeC: timeC),
                ),
              );
            },
            child: CardTodo(),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => CompletedPage(
                        titleC: titleC,
                        descC: descC,
                        timeC: timeC,
                      ),
                ),
              );
            },
            child: CardCompleted(),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => AllTaskPage(
                        titleC: titleC,
                        descC: descC,
                        timeC: timeC,
                      ),
                ),
              );
            },
            child: CardTotal(),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => CancelledPage(
                        titleC: titleC,
                        descC: descC,
                        timeC: timeC,
                      ),
                ),
              );
            },
            child: CardCanceled(),
          ),
        ],
      ),
    );
  }
}
