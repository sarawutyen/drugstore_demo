import 'package:drugstore_demo/features/landing/cubit/landing_cubit.dart';
import 'package:drugstore_demo/features/widgets/map/cubit/map_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initialGetit() async {
  getIt.registerLazySingleton(() => MapCubit());
  getIt.registerLazySingleton(() => LandingCubit());
}