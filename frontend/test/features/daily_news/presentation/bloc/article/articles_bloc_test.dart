import 'package:flutter_test/flutter_test.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecases/create_article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecases/get_articles.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/articles_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/articles_event.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/articles_state.dart';

void main() {
  group('ArticlesBloc', () {
    test('emits loading and success when articles are loaded', () async {
      final repository = ArticleRepositoryImpl();
      final bloc = ArticlesBloc(
        GetArticlesUseCase(repository),
        CreateArticleUseCase(repository),
      );

      final emittedStatesFuture = bloc.stream.take(2).toList();

      bloc.add(const LoadArticles());

      final emittedStates = await emittedStatesFuture;

      expect(emittedStates[0].status, ArticlesStatus.loading);
      expect(emittedStates[1].status, ArticlesStatus.success);
      expect(emittedStates[1].articles, hasLength(3));

      await bloc.close();
    });

    test('emits submitting and success when an article is created', () async {
      final repository = ArticleRepositoryImpl();
      final bloc = ArticlesBloc(
        GetArticlesUseCase(repository),
        CreateArticleUseCase(repository),
      );

      final emittedStatesFuture = bloc.stream.take(2).toList();

      bloc.add(
        const CreateArticleRequested(
          authorName: 'Hugo',
          title: 'Create flow works',
          description: 'The form writes into the in-memory repository.',
          content: 'After saving, the list should contain the new article.',
        ),
      );

      final emittedStates = await emittedStatesFuture;

      expect(emittedStates[0].status, ArticlesStatus.submitting);
      expect(emittedStates[1].status, ArticlesStatus.success);
      expect(emittedStates[1].articles, hasLength(4));
      expect(emittedStates[1].articles.first.title, 'Create flow works');

      await bloc.close();
    });
  });
}
