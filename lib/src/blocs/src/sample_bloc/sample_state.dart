part of 'sample_bloc.dart';

class SampleState extends Equatable {
  const SampleState({this.status = true});

  final bool status;

  @override
  List<Object?> get props => [status];

  SampleState copyWith({bool? status}) {
    return SampleState(status: status ?? this.status);
  }
}
