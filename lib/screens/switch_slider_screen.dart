import 'package:bloc_statemanagement/bloc/switch/switch_bloc.dart';
import 'package:bloc_statemanagement/bloc/switch/switch_event.dart';
import 'package:bloc_statemanagement/bloc/switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchSliderScreen extends StatelessWidget {
  const SwitchSliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notifications'),
                BlocBuilder<SwitchBloc, SwitchState>(
                  /* As both Slider and Switch are in single bloc so changing
                  any one will also build the other one , so to handle this we use this
                  */
                  buildWhen: (previous, current) =>
                      previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    return Switch(
                      value: state.isSwitch,
                      onChanged: (value) {
                        context
                            .read<SwitchBloc>()
                            .add(EnableOrDisableNotifications());
                      },
                    );
                  },
                )
              ],
            ),
            const SizedBox(height: 12),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                return Column(
                  children: [
                    Container(
                      height: 200,
                      color: Colors.red.withOpacity(state.slider),
                    ),
                    const SizedBox(height: 12),
                    Slider(
                      value: state.slider,
                      onChanged: (value) {
                        context
                            .read<SwitchBloc>()
                            .add(SliderEvent(sliderValue: value));
                      },
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
