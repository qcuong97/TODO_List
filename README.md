# manabei_todo_app

Hướng dẫn cấu hình vài khởi chạy dự án

***Cấu hình***
 - IDE: Android Studio Bumblebee | 2021.1.1 Patch 2
 - Flutter SDK: Flutter 3.0.3
***Cài đặt****
 1. Cài đặt Android Studio https://developer.android.com
 2. Flutter - https://docs.flutter.dev/get-started/install
 3. FVM - Quản lý flutter sdk version - https://fvm.app

***Khởi chạy***

 Bước 1: 
	
  Khởi chạy "fvm flutter pub get"
		
 Bước 2: 
    Ở đây có thể bắt đầu khởi chạy kiểm thử hoặc chạy dự án trên thiết bị android
				
    Bước 2.a: Khởi chạy kiểm thử
				
        + Unit test: Khởi chạy "fvm flutter test test/models/task_test.dart"
        + Widget test: Khởi chạy "fvm flutter test test/create_todo_widget_test.dart"
        + Integration test: Khởi chạy "fvm flutter test test/test_integration.dart"
        + Chạy toàn bộ test: Khỏi chạy "fvm flutter test"
								
    Bước 2.b: Khởi chạy dự án trên máy ảo/thật (Lưu ý: nhớ tạo máy ảo hoc kết nối máy thật)
        + Khởi chạy "fvm flutter run"
