///[BaseModel] is the base class for all models.
abstract class BaseModel<T> {
  /// [toJson] is the json of model
  Map<String, dynamic> toJson();

  /// [fromJson] is the json of model
  T fromJson(Map<String, dynamic> json);
}
