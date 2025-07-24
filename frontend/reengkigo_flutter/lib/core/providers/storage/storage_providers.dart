import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/services/storage_service.dart';

part 'storage_providers.g.dart';

@riverpod
Future<SharedPreferences> sharedPreferences(Ref ref) async {
  return await SharedPreferences.getInstance();
}

@riverpod
Future<StorageService> storageService(Ref ref) async {
  final sharedPrefs = await ref.watch(sharedPreferencesProvider.future);
  return StorageService(sharedPrefs);
}