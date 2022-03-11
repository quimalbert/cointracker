import 'package:cointracker/shared/infrastructure/load_user_local_datasource.dart';

class ReadUserDataUseCase {
  Future<Map<String, dynamic>> call() async {
    return await LoadUserRemoteDataSource().readUserData();
  }
}
