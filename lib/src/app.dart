import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:noah_ark_base_app_flutter/src/core/config/app_config.dart';
import 'package:noah_ark_base_app_flutter/src/core/database/app_database.dart';
import 'package:noah_ark_base_app_flutter/src/core/network/api_client.dart';
import 'package:noah_ark_base_app_flutter/src/core/routing/app_router.dart';
import 'package:noah_ark_base_app_flutter/src/core/security/token_storage.dart';
import 'package:noah_ark_base_app_flutter/src/core/theme/app_theme.dart';
import 'package:noah_ark_base_app_flutter/src/core/theme/church_colors.dart';
import 'package:noah_ark_base_app_flutter/src/features/auth/data/auth_repository.dart';
import 'package:noah_ark_base_app_flutter/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:noah_ark_base_app_flutter/src/features/bulletins/data/bulletins_repository.dart';
import 'package:noah_ark_base_app_flutter/src/features/bulletins/presentation/bloc/bulletins_bloc.dart';
import 'package:noah_ark_base_app_flutter/src/features/devotional/data/devotional_repository.dart';
import 'package:noah_ark_base_app_flutter/src/features/devotional/presentation/bloc/devotional_bloc.dart';
import 'package:noah_ark_base_app_flutter/src/features/events/data/events_repository.dart';
import 'package:noah_ark_base_app_flutter/src/features/events/presentation/bloc/events_bloc.dart';
import 'package:noah_ark_base_app_flutter/src/features/giving/data/giving_repository.dart';
import 'package:noah_ark_base_app_flutter/src/features/giving/presentation/bloc/giving_bloc.dart';
import 'package:noah_ark_base_app_flutter/src/features/groups/data/groups_repository.dart';
import 'package:noah_ark_base_app_flutter/src/features/groups/presentation/bloc/groups_bloc.dart';
import 'package:noah_ark_base_app_flutter/src/features/hymns/data/hymns_repository.dart';
import 'package:noah_ark_base_app_flutter/src/features/hymns/presentation/bloc/hymns_bloc.dart';
import 'package:noah_ark_base_app_flutter/src/features/prayer/data/prayer_repository.dart';
import 'package:noah_ark_base_app_flutter/src/features/prayer/presentation/bloc/prayer_bloc.dart';
import 'package:noah_ark_base_app_flutter/src/features/sermons/data/sermons_repository.dart';
import 'package:noah_ark_base_app_flutter/src/features/sermons/presentation/bloc/sermons_bloc.dart';

class NoahArkApp extends StatefulWidget {
  final AppConfig appConfig;
  final AppDatabase database;
  final ApiClient apiClient;
  final TokenStorage tokenStorage;

  /// The church's colors, chosen once at launch; see `ThemeRepository`.
  final ChurchTheme churchTheme;

  const NoahArkApp({
    super.key,
    required this.appConfig,
    required this.database,
    required this.apiClient,
    required this.tokenStorage,
    required this.churchTheme,
  });

  @override
  State<NoahArkApp> createState() => _NoahArkAppState();
}

class _NoahArkAppState extends State<NoahArkApp> {
  late final GoRouter _router;
  late final AuthRepository _authRepository;
  late final DevotionalRepository _devotionalRepository;
  late final HymnsRepository _hymnsRepository;
  late final EventsRepository _eventsRepository;
  late final PrayerRepository _prayerRepository;
  late final GivingRepository _givingRepository;
  late final BulletinsRepository _bulletinsRepository;
  late final SermonsRepository _sermonsRepository;
  late final GroupsRepository _groupsRepository;

  @override
  void initState() {
    super.initState();
    _router = createAppRouter();

    _authRepository = AuthRepository(
      apiClient: widget.apiClient,
      tokenStorage: widget.tokenStorage,
    );

    _devotionalRepository = DevotionalRepository(
      apiClient: widget.apiClient,
      db: widget.database,
    );

    _hymnsRepository = HymnsRepository(
      apiClient: widget.apiClient,
      db: widget.database,
      appConfig: widget.appConfig,
    );

    _eventsRepository = EventsRepository(
      apiClient: widget.apiClient,
    );

    _prayerRepository = PrayerRepository(
      apiClient: widget.apiClient,
    );

    _givingRepository = GivingRepository(
      apiClient: widget.apiClient,
    );

    _bulletinsRepository = BulletinsRepository(
      apiClient: widget.apiClient,
      database: widget.database,
      config: widget.appConfig,
    );

    _sermonsRepository = SermonsRepository(
      apiClient: widget.apiClient,
    );

    _groupsRepository = GroupsRepository(
      apiClient: widget.apiClient,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AppConfig>.value(value: widget.appConfig),
        RepositoryProvider<AppDatabase>.value(value: widget.database),
        RepositoryProvider<TokenStorage>.value(value: widget.tokenStorage),
        RepositoryProvider<AuthRepository>.value(value: _authRepository),
        RepositoryProvider<DevotionalRepository>.value(value: _devotionalRepository),
        RepositoryProvider<HymnsRepository>.value(value: _hymnsRepository),
        RepositoryProvider<EventsRepository>.value(value: _eventsRepository),
        RepositoryProvider<PrayerRepository>.value(value: _prayerRepository),
        RepositoryProvider<GivingRepository>.value(value: _givingRepository),
        RepositoryProvider<BulletinsRepository>.value(value: _bulletinsRepository),
        RepositoryProvider<SermonsRepository>.value(value: _sermonsRepository),
        RepositoryProvider<GroupsRepository>.value(value: _groupsRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (ctx) => AuthBloc(authRepository: _authRepository)..add(const AuthCheckRequested()),
          ),
          BlocProvider<DevotionalBloc>(
            create: (ctx) => DevotionalBloc(repository: _devotionalRepository)..add(const DevotionalFetchRequested()),
          ),
          BlocProvider<HymnsBloc>(
            create: (ctx) => HymnsBloc(repository: _hymnsRepository)..add(const HymnsFetchRequested()),
          ),
          BlocProvider<EventsBloc>(
            create: (ctx) => EventsBloc(repository: _eventsRepository)..add(const EventsFetchRequested()),
          ),
          BlocProvider<PrayerBloc>(
            create: (ctx) => PrayerBloc(repository: _prayerRepository)..add(const PrayerChainFetchRequested()),
          ),
          BlocProvider<GivingBloc>(
            create: (ctx) => GivingBloc(repository: _givingRepository)..add(const GivingOverviewFetchRequested()),
          ),
          BlocProvider<BulletinsBloc>(
            create: (ctx) => BulletinsBloc(repository: _bulletinsRepository)..add(const LoadBulletins()),
          ),
          BlocProvider<SermonsBloc>(
            create: (ctx) => SermonsBloc(repository: _sermonsRepository)..add(const LoadSermons()),
          ),
          BlocProvider<GroupsBloc>(
            create: (ctx) => GroupsBloc(repository: _groupsRepository)..add(const LoadGroups()),
          ),
        ],
        child: MaterialApp.router(
          title: widget.appConfig.churchName,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(widget.churchTheme),
          darkTheme: AppTheme.dark(widget.churchTheme),
          themeMode: ThemeMode.system,
          routerConfig: _router,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ne', 'NP'),
          ],
        ),
      ),
    );
  }
}
