import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resistor_app/config/constants/padding.dart';
import 'package:resistor_app/presentation/blocs/resistor_bloc/resistor_bloc.dart';
import 'package:resistor_app/presentation/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FourBandsView extends StatelessWidget {
  const FourBandsView({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Modular.get<ResistorBloc>(),
      child: _Body(width: width),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ResistorBloc, ResistorState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppPadding.extraLarge,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.model.resistor.resistance,
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      state.model.resistor.tolerance,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.extraLarge,
          ),
          child: FourBandResistor(
            width: width - (AppPadding.extraLarge * 2),
            height: (width - (AppPadding.extraLarge * 2)) * 0.3,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppPadding.extraLarge),
          child: Center(
            child: Text(
              '* ${AppLocalizations.of(context)?.touchToSelectColor ?? ''}',
              style: GoogleFonts.mulish(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
