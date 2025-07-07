import 'package:flutter_test/flutter_test.dart';
import 'package:post_app_testing/utils/command.dart';
import 'package:post_app_testing/utils/result.dart';

void main() {
  group('Command0', () {
    test('executes and sets result to Ok', () async {
      final command = Command0<int>(() async {
       return Result.ok(42);
      });

      expect(command.running, isFalse);
      expect(command.result, isNull);

      final future = command.execute();
      expect(command.running, isTrue);

      await future;

      expect(command.running, isFalse);
      expect(command.result, isA<Ok<int>>());
      expect((command.result as Ok<int>).value, equals(42));
      expect(command.completed, isTrue);
      expect(command.error, isFalse);
    });

    test('executes and sets result to Error', () async {
      final command = Command0<int>(() async {
        return Result.error(Exception('An error occurred'));
      });

      await command.execute();

      expect(command.result, isA<Error>());
      expect(command.completed, isFalse);
      expect(command.error, isTrue);
    });

    test('clearResult resets state', () async {
      final command = Command0<int>(() async {
        return Result.ok(100);
      });

      await command.execute();
      expect(command.completed, isTrue);

      command.clearResult();
      expect(command.result, isNull);
      expect(command.completed, isFalse);
      expect(command.error, isFalse);
    });
  });
  group('Command1', () {
    test('executes with argument and returns Ok', () async {
      final command = Command1<String, int>((int number) async {
        return Result.ok('value: $number');
      });

      await command.execute(5);

      expect(command.result, isA<Ok<String>>());
      expect((command.result as Ok<String>).value, equals('value: 5'));
    });
  });

  test('notifies listeners', () async {
    final command = Command0<int>(() async => Result.ok(10));
    var notified = false;
    command.addListener(() {
      notified = true;
    });

    await command.execute();

    expect(notified, isTrue);
  });
}
