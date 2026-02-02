import 'dart:async';
import 'dart:developer';

part 'sample_event.dart';
part 'sample_state.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  SampleBloc({required ISampleRepository sampleRespository})
    : _sampleRespository = sampleRespository,
      super(const SampleState()) {
    on<InitializeSSample>(_onInitializeSSample, transformer: sequential());
  }
  final ISampleRepository _sampleRespository;

  static final _logger = AppLogger.getLogger('SampleBloc');

  void _onInitializeSSample(
    InitializeSSample event,
    Emitter<SampleState> emit,
  ) {
    try {
      final IdentityDataDTO identityData = IdentityDataDTO(
        mobileNumber: event.identity.mobileNumber,
        email: event.identity.email,
      );
      final SignUpDTO signUpDTO = SignUpDTO(identity: identityData);
      emit(state.copyWith(signUpDto: signUpDTO));
    } catch (error, stackTrace) {
      _logger.errorWithContext(
        error,
        stackTrace,
        operation: '_onInitializeSignUp (Unknown)',
      );
    }
  }
}
