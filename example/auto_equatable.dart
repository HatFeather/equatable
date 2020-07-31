import 'package:equatable/equatable.dart';

// This denotes where we want to place the generated equatable `props` array.
// This also gives the generated code access to private class members (so we
// can equality check private fields).
part 'auto_equatable.g.dart';

/// This is the class that we want to generate equality checking for.
/// I discovered that extension methods won't work for this feature, because
/// the `==` and `hashcode` methods need to be overriden (which extensions
/// don't support). This is an alternative solution, inspired by the
/// `json_serializable` package.
///
/// The `@equatable` annotation is used to determine which classes to generate
/// equality checking for. This annotation is located in `lib/src/equatable_annotation.dart`.
@equatable
class TrainTicket extends Equatable {
  TrainTicket({
    this.id,
    this.firstName,
    this.lastName,
    String privateMember,
  }) : _privateMember = privateMember;

  final int id;
  final String firstName;
  final String lastName;

  /// This is a private field member, the generated code still has access to
  /// this because it is `part of` this file.
  final String _privateMember;

  /// Rather than filling out the props array by hand, we use the auto generated
  /// property array (`_$TrainTicketProps(this)`). This array is generated on
  /// the fly as we write our classes after running this command:
  ///
  /// ```
  /// flutter pub run build_runner watch
  /// ```
  @override
  List<Object> get props => _$TrainTicketProps(this);
}

void demoAutoEquatable() {
  final ticketA = TrainTicket(
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    privateMember: 'secret123',
  );

  final ticketB = TrainTicket(
    id: 2,
    firstName: 'Jane',
    lastName: 'Doe',
    privateMember: 'xyz',
  );

  final sameAsTicketA = TrainTicket(
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    privateMember: 'secret123',
  );

  print(ticketA == ticketA);
  print(ticketA == ticketB);
  print(ticketA == sameAsTicketA);
}

void main() {
  demoAutoEquatable();
}
