import 'package:test/test.dart';
import 'package:first_flutter/models/favorites.dart';


/*
 모튤 단위 테스트 사용 방법 :
 1. project dir 까지 이동
 2. 명령어 실행 : flutter test first_flutter/models/favorites_test.dart
 3. 파일 수정 후 Shift + R 앱 다시시작
 */
void main() {
  group('Testing App Provider', () {
    var favorites = Favorites();

    test('An item should be removed', () {
      var number = 45;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
      favorites.remove(number);
      expect(favorites.items.contains(number), false);
    });
  });
}