import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/network/network_info_implementation.dart';

@GenerateMocks([InternetConnectionChecker])
import 'network_info_implementation_test.mocks.dart';

void main() {
  late NetworkInfoImplementation networkInfo;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImplementation(mockInternetConnectionChecker);
  });

  test('should return true when there is an internet connection', () async {
    when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => true);

    final result = await networkInfo.isConnected;

    expect(result, true);
  });

  test('should return false when there is no internet connection', () async {
    when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => false);

    final result = await networkInfo.isConnected;

    expect(result, false);
  });
}
