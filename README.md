# food_delivery

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile developme3nt, and a full API reference.


Mốt số thứ cần thay đổi:
    -	Database: sử dụng firebase, nếu như muốn đổi database hoặc phát triển thêm ,chỉnh sửa URL và API key và tên bảng tới Database trong các file sau
        o	Scoped-model/user_scoped_model.dart (dòng 44, 81, 154, 160)
        o	Scoped-model/food_model.dart (dòng 39, 72, 116, 146)
    -	Việc giao tiếp dữ liệu giữa food_details_page và orderpage thông qua biến tĩnh nằm trong file src/data/global
    -	Có sử dụng một vài package có sẵn, vậy nên để tránh lỗi, hãy cài đặt các package dưới đây trước khi “flutter run”
        o	http : http | https://pub.dev/packages/http
        o	scoped_model: scoped_model | https://pub.dev/packages/scoped_model
        o	material: material |  https://pub.dev/packages/material
    -   Muốn thêm ảnh thì thêm vào file assets rồi sau đó vào file pubspec.yaml để khai báo và sử dụng mà không phải ghi rõ path
