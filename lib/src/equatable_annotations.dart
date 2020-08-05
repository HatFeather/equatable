import 'equatable.dart';

/// The equatable annotation which is used to automatically generate
/// the equality props array for a class that extends [Equatable].
const _EquatableAnnotation equatable = _EquatableAnnotation();

/// An annotation to tell the build runner to exclude this field from
/// equality generation upon generation. This allows for selective
/// equality checking (equality based on certain fields only).
const _ExcludeEquals excludeEquals = _ExcludeEquals();

class _EquatableAnnotation extends Equatable {
  const _EquatableAnnotation() : super();

  @override
  List<Object> get props => throw UnimplementedError();
}

class _ExcludeEquals {
  const _ExcludeEquals() : super();
}
