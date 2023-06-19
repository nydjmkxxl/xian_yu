enum Env { dev, prod }

class Config {
  static const String baseUrl = 'https://test.bjnuoche.com/mcapi/';
  static const String accessToken =
      'eyJhbGciOiJIUzI1NiIsIlR5cGUiOiJKd3QiLCJ0eXAiOiJKV1QifQ.eyJ1c2VyaWQiOiI0MjUifQ.pZoQbDdhFy7_Po2FxeHKQDJ_STBVeElnkukpjNQzxL4';
  static const Env env = Env.dev;
  static const String privateDatabaseName = 'private.db';
  static const String publicDatabaseName = 'public.db';
}
