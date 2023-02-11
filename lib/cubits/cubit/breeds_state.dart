part of 'breeds_cubit.dart';

@freezed
class BreedsState with _$BreedsState {
  const factory BreedsState.initial() = _Initial;
  const factory BreedsState.loading() = _Loading;
  const factory BreedsState.success(List<CatBreed> breeds) = _Success;
  const factory BreedsState.failed(String error) = _Failed;
}
