import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unbiased/data/categoryTag/category_repo_impl.dart';
import 'package:unbiased/data/categoryTag/category_tag_repo.dart';
import 'package:unbiased/data/feed/feed_repo.dart';
import 'package:unbiased/data/feed/feed_repo_impl.dart';
import 'package:unbiased/data/auth/auth_repo.dart';
import 'package:unbiased/data/auth/auth_repo_impl.dart';
import 'package:unbiased/domain/providers/api_client_provider.dart';

final authRepositoryProvider = Provider<AuthRepo>(
  (ref) => AuthRepoImpl(
    ref.read(apiClientProvider),
  ),
);

final categoryTagRepositoryProvider = Provider<CategoryTagRepo>(
  (ref) => CategoryTagRepoImpl(
    ref.read(apiClientProvider),
  ),
);
final feedRepositoryProvider = Provider<FeedRepo>(
  (ref) => FeedRepoImpl(
    ref.read(apiClientProvider),
  ),
);
