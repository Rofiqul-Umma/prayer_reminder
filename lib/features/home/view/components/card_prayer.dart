import 'package:flutter/material.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_state.dart';
import 'package:prayer_reminder/features/notification/notification_service.dart';

class CardPrayer extends StatelessWidget {
  final int index;
  final GetPrayerSuccessState state;
  const CardPrayer({super.key, required this.index, required this.state});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: ListTile(
          onTap: () {
            print("Tapped on ${state.data[index].name}");
            NotificationService().showNotification(
              id: 1,
              title: "TEST NOTIF",
              body: "TEST BODY",
            );
          },
          title: Text(
            state.data[index].name,
            style: TextStyle(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          trailing: Text(
            state.data[index].time,
            style: TextStyle(
              fontSize: size.width * 0.03,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
