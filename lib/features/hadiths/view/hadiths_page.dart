import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/features/get_hadits/view_model/get_hadits_state.dart';
import 'package:prayer_reminder/features/get_hadits/view_model/get_hadits_view_model.dart';
import 'package:prayer_reminder/features/hadiths/view/components/app_bar_hadiths.dart';
import 'package:prayer_reminder/features/prayer_time/view/components/loading.dart';

class HadithsPage extends StatelessWidget {
  const HadithsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: appBarHadiths(context, size, theme),
      body: SafeArea(
        child: BlocBuilder<GetHaditsViewModel, GetHaditsState>(
          bloc: getIt<GetHaditsViewModel>(),
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => Loading(),
              success:
                  (hadits) => ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: hadits.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(size.width * 0.005),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                        ),
                        child: ListTile(
                          title: Text(hadits[index].arab),
                          subtitle: Text(hadits[index].id),
                        ),
                      );
                    },
                  ),
              error:
                  (error) => Text(
                    error,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: size.width * 0.035,
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.error,
                    ),
                  ),
              orElse: () => Loading(),
            );
          },
        ),
      ),
    );
  }
}
