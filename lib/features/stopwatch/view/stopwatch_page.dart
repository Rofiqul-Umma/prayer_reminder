import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/core/custom_app_bar_back.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/features/speech_to_text/view_model/speech_to_text_state.dart';
import 'package:prayer_reminder/features/speech_to_text/view_model/speech_to_text_view_model.dart';
import 'package:prayer_reminder/features/stopwatch/view/components/custom_button.dart';
import 'package:prayer_reminder/features/stopwatch/view/components/timer_counter.dart';
import 'package:prayer_reminder/features/stopwatch/view_model/stopwatch_state.dart';
import 'package:prayer_reminder/features/stopwatch/view_model/stopwatch_view_model.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final stopwatchVM = getIt.get<StopwatchViewModel>();
    final sttVM = getIt.get<SpeechToTextViewModel>();
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: customAppBarBack('Stopwatch', context, [
        BlocConsumer<SpeechToTextViewModel, SpeechToTextState>(
          listener: (context, state) {
            state.maybeWhen(
              listening: (command) {
                if (command.contains('start') ||
                    command.contains('go') ||
                    command.contains('continue')) {
                  stopwatchVM.start();
                } else if (command.contains('pause')) {
                  stopwatchVM.pause();
                } else if (command.contains('reset')) {
                  stopwatchVM.reset();
                }
              },
              orElse: () {},
            );
          },
          bloc: sttVM,
          builder: (context, state) {
            return IconButton(
              icon: Icon(
                state.maybeWhen(
                  listening: (_) => HugeIcons.strokeRoundedMic01,
                  orElse: () => HugeIcons.strokeRoundedMicOff01,
                ),
              ),
              onPressed: () async {
                await sttVM.init();
                sttVM.startListening();
              },
            );
          },
        ),
      ]),
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.5,
            decoration: BoxDecoration(color: theme.cardColor),
            child: BlocBuilder<StopwatchViewModel, StopWatchState>(
              bloc: getIt<StopwatchViewModel>(),
              builder: (context, state) {
                return state.maybeWhen(
                  running: (time) => TimerCounter(time: time),
                  paused: (time) => TimerCounter(time: time),
                  orElse: () => TimerCounter(),
                );
              },
            ),
          ),
          SizedBox(height: size.height * 0.1),
          BlocBuilder<StopwatchViewModel, StopWatchState>(
            bloc: getIt<StopwatchViewModel>(),
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    onPressed:
                        () => state.maybeWhen(
                          orElse: () => stopwatchVM.start(),
                          running: (_) => stopwatchVM.pause(),
                          paused: (_) => stopwatchVM.start(),
                        ),
                    color: theme.cardColor,
                    icon: state.maybeWhen(
                      running: (_) => HugeIcons.strokeRoundedPause,
                      orElse: () => HugeIcons.strokeRoundedPlay,
                    ),
                  ),
                  CustomButton(
                    onPressed: () => stopwatchVM.reset(),
                    icon: HugeIcons.strokeRoundedRefresh,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
