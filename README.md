# WODLog

개인용 크로스핏 운동 기록 앱입니다. Flutter 기반으로 Android와 iOS에서 실행하며,
기록과 통계는 우선 기기 안에 저장합니다.

## 개발 환경

- Flutter stable
- Dart SDK (Flutter와 함께 설치)
- Xcode (iOS 빌드)
- Android Studio 및 Android SDK (Android 빌드)

## 시작하기

```sh
flutter pub get
flutter run
```

## 현재 구현

- 오늘 운동 세션 생성 및 실시간 조회
- Drift/SQLite 데이터베이스 기반과 핵심 운동 기록 테이블

세부 범위와 단계별 완료 조건은 Notion의 [개발 로드맵](https://app.notion.com/p/407ef63c537b81b78a0bd93019c3560e?pvs=204)을 참고합니다.
