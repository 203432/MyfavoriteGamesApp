import 'package:gamingapp/features/videogames/data/datasource/videogame_remote_datasource.dart';
import 'package:gamingapp/features/videogames/domain/usecases/add_videogame_usecase.dart';
import 'package:gamingapp/features/videogames/domain/usecases/delete_videogame_usecase.dart';
import 'package:gamingapp/features/videogames/domain/usecases/get_videogames_usecase.dart';
import 'package:gamingapp/features/videogames/domain/usecases/update_videogame_usecase.dart';

import 'features/videogames/data/repositories/videogame_repository_impl.dart';

class UsecaseConfig {
  GetVideoGamesUseCase? getVideoGameUsecase;
  VideoGameRepositoryImpl? videoGameRepositoryImpl;
  VideoGameRemoteDataSourceImpl? videoGameRemoteDataSourceImp;
  AddVideoGameUsecase? addVideoGameUsecase;
  DeleteVideoGameUseCase? deleteVideoGameUseCase;
  UpdateVideoGameUseCase? updateVideoGameUseCase;

  UsecaseConfig() {
    videoGameRemoteDataSourceImp = VideoGameRemoteDataSourceImpl();
    videoGameRepositoryImpl = VideoGameRepositoryImpl(
        videoGameRemoteDataSource: videoGameRemoteDataSourceImp!);
    getVideoGameUsecase = GetVideoGamesUseCase(videoGameRepositoryImpl!);
    addVideoGameUsecase = AddVideoGameUsecase(videoGameRepositoryImpl!);
    deleteVideoGameUseCase = DeleteVideoGameUseCase(videoGameRepositoryImpl!);
    updateVideoGameUseCase = UpdateVideoGameUseCase(videoGameRepositoryImpl!);
  }
}
