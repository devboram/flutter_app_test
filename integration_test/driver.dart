import 'package:integration_test/integration_test_driver.dart';


/// 이 코드는 통합 테스트 드라이버를 활성화한 다음 테스트가 실행될 때까지 기다립니다.
/// 응답 데이터는 integration_response_data.json테스트가 실행된 후에 명명 된 파일에 저장됩니다 .
Future<void> main() => integrationDriver();