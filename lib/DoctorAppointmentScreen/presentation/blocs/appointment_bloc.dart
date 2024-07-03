import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sapdocs_app_api/DoctorAppointmentScreen/data/models/appointment_model.dart';
import 'package:sapdocs_app_api/DoctorAppointmentScreen/domain/repositories/appointment_repository.dart';
part 'appointment_event.dart';
part 'appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final AppointmentRepository appointmentRepository;

  AppointmentBloc(this.appointmentRepository) : super(AppointmentInitial()) {
    on<LoadAppointments>((event, emit) async {
      emit(AppointmentLoading());
      try {
        final appointments = await appointmentRepository.getAppointments();
        emit(AppointmentLoaded(appointments));
      } catch (e) {
        emit(AppointmentError(e.toString()));
      }
    });
  }
}
