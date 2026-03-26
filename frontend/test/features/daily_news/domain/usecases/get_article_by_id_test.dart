import 'package:flutter_test/flutter_test.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecases/get_article_by_id.dart';

void main() {
  group('GetArticleByIdUseCase', () {
    test('returns the article when the id exists', () async {
      final useCase = GetArticleByIdUseCase(ArticleRepositoryImpl());

      final article = await useCase(params: 2);

      expect(article, isNotNull);
      expect(article!.author, 'Grace Hopper');
      expect(article.title, 'Why public tech products need simpler writing');
    });

    test('returns null when the id does not exist', () async {
      final useCase = GetArticleByIdUseCase(ArticleRepositoryImpl());

      final article = await useCase(params: 999);

      expect(article, isNull);
    });
  });
}
