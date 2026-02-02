import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:data/lib.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sample_event.dart';
part 'sample_state.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  SampleBloc({required IAuthRepository sampleRespository})
    : _sampleRespository = sampleRespository,
      super(const SampleState()) {
    on<InitializeSSample>(_onInitializeSSample, transformer: sequential());
  }
  final IAuthRepository _sampleRespository;

  void _onInitializeSSample(
    InitializeSSample event,
    Emitter<SampleState> emit,
  ) {
    try {
      _sampleRespository.login(
        const LoginRequest(email: 'sample', password: 'sample'),
      );
      emit(state.copyWith(status: true));
    } catch (error) {
      emit(state.copyWith(status: false));
    }
  }
}
