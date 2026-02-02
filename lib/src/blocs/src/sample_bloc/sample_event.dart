part of 'sample_event.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object?> get props => [];
}

class InitializeSignUp extends SignupEvent {
  const InitializeSignUp({required this.identity});
  final IdentityDataDTO identity;
}

class StagedPasswordRequested extends SignupEvent {
  const StagedPasswordRequested({required this.passwordInfo});
  final AttributesDataDTO passwordInfo;
}

class SignUpPersonalInfoRequested extends SignupEvent {
  const SignUpPersonalInfoRequested({required this.personalInfo});
  final PersonalDataDTO personalInfo;
}

class SignUpEmailRequested extends SignupEvent {
  const SignUpEmailRequested({
    required this.identity,
    required this.personalInfo,
    required this.attributes,
  });
  final IdentityDataDTO identity;
  final PersonalDataDTO personalInfo;
  final AttributesDataDTO attributes;
}

class SignUpAddressRequested extends SignupEvent {
  const SignUpAddressRequested({required this.addressInfo});
  final AddressDataDTO addressInfo;
}

class SignupRegisterRequest extends SignupEvent {
  const SignupRegisterRequest();
}
