import 'package:dio/dio.dart';
import 'package:drugstore_demo/core/app_config/constans.dart';
import 'package:drugstore_demo/core/app_config/dio/dio_config.dart';
import 'package:drugstore_demo/core/services/google_api.dart';
import 'package:drugstore_demo/features/landing/data/repo/landing_repo.dart';
import 'package:drugstore_demo/features/landing/data/repo/landing_repo_impl.dart';
import 'package:drugstore_demo/features/landing/presentation/cubit/landing_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initialGetit() async {
  
  DioConfig.initial();
  getIt.registerLazySingleton(() => LandingCubit());
    getIt.registerLazySingleton<GoogleApiClient>(
    () => GoogleApiClient(
      getIt<Dio>(),
      baseUrl: mapAPI,
    ),
  );
  getIt.registerFactory<LandingRepo>(() => LandingRepoImplement(getIt<GoogleApiClient>()));
}