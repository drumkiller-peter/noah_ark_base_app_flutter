/// API path constants matching the Noah Ark Solutions backend routes.
class ApiEndpoints {
  // Authentication & Tenancy
  static const String churchRegister = '/auth/register';
  static const String memberRegister = '/auth/member/register';
  static const String login = '/auth/login';
  static const String guestToken = '/auth/guest-token';
  static const String refreshToken = '/auth/refresh';
  static const String logout = '/auth/logout';
  static const String me = '/auth/me';

  // Events & Calendar
  static const String events = '/events';
  static String eventDetails(int id) => '/events/$id';
  static String eventRsvp(int id) => '/events/$id/rsvp';
  static String eventRsvps(int id) => '/events/$id/rsvps';

  // Devotional & Daily Quotes (Platform-wide catalogue)
  static const String dailyQuotes = '/daily-quotes';
  static String dailyQuoteDetails(int id) => '/daily-quotes/$id';

  // Funds & Donations
  static const String funds = '/funds';
  static const String fundBalance = '/funds/balance';
  static const String fundReconcile = '/funds/reconcile';
  static String fundDetails(int id) => '/funds/$id';
  static String fundDonors(int id) => '/funds/$id/donors';
  static const String donations = '/donations';
  static const String donationSummary = '/donations/summary';
  static String donationDetails(int id) => '/donations/$id';

  // Pastoral Care & Prayer Requests
  static const String prayers = '/prayers';
  static String prayerDetails(int id) => '/prayers/$id';
  static String prayerIntercession(int id) => '/prayers/$id/intercede';
  static String prayerPastoralNotes(int id) => '/prayers/$id/pastoral-notes';

  // Worship & Hymns
  static const String hymns = '/hymns';
  static String hymnDetails(int id) => '/hymns/$id';
  static const String hymnBookmarks = '/hymns/bookmarks';

  // Fellowships & Groups
  static const String groups = '/groups';
  static String groupDetails(int id) => '/groups/$id';
  static String groupPosts(int id) => '/groups/$id/posts';

  // Communication & Bulletins
  static const String bulletins = '/bulletins';
  static const String announcements = '/announcements';

  // Sermons
  static const String sermons = '/sermons';

  // The church's colors, readable with a guest token
  static const String theme = '/theme';
}
