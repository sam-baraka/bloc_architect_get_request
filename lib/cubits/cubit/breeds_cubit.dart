import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lewinsky_architecture/models/cat_breed/cat_breed.dart';
import 'package:lewinsky_architecture/services/api_service/api_service.dart';

part 'breeds_state.dart';
part 'breeds_cubit.freezed.dart';

class BreedsCubit extends Cubit<BreedsState> {
  BreedsCubit() : super(const BreedsState.initial());
  getBreeds() async {
    emit(const BreedsState.loading());
    try {
      List breeds = await ApiService.getData();
      emit(BreedsState.success(
          breeds.map((e) => CatBreed.fromJson(e)).toList()));
    } catch (e) {
      emit(BreedsState.failed(e.toString()));
    }
  }
}
