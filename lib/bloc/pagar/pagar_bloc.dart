import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stripe_app/models/models.dart';

part 'pagar_event.dart';
part 'pagar_state.dart';

class PagarBloc extends Bloc<PagarEvent, PagarState> {
  PagarBloc() : super(const PagarState()) {
    on<OnSeleccionarTarjeta>(
      (event, emit) => emit(
        state.copyWith(tarjetaActiva: true, tarjeta: event.tarjeta),
      ),
    );
    on<OnDesactivarTarjeta>((event, emit) => emit(state.copyWith(
      tarjetaActiva: false
    )));
  }
}
