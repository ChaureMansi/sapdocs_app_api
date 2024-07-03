import 'package:bloc/bloc.dart';
import 'package:sapdocs_app_api/RegisterScreen/data/repository.dart';
import 'package:sapdocs_app_api/RegisterScreen/presenatation/bloc/register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository registerRepository;

  RegisterBloc({required this.registerRepository}) : super(RegisterInitial()) {
    on<RegisterSubmitted>((event, emit) async {
      emit(RegisterLoading());

      try {
        await registerRepository.register(
          email: event.email,
          password: event.password,
          confirmPassword: event.confirmPassword,
          mobile: event.mobile,
          role: event.role,
          specialization: event.specialization,
          experience: event.experience,
          disease: event.disease,
          age: event.age,
        );
        print('Registration successful');
        emit(RegisterSuccess());
      } catch (e) {
        print('Registration failed: ${e.toString()}');
        emit(RegisterFailure(error: e.toString()));
      }
    });
  }
}
