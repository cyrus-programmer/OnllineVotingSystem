///contains constant strings used for apps UI
class AppStrings {
  /// The constructor parameters are only to be used to request phone number.
  /// Or friend name to block
  AppStrings({this.friendBlock, this.phoneNumber});
  final String? phoneNumber;
  final String? friendBlock;

  /// string used in [WelcomePage]
  static String welcome = "Welcome!";

  /// string used in [RegistrationPage] as title
  static String registration = "Registration";

  /// string used in [RegistrationPage]
  static String phoneNo = "Phone Number";

  /// string used in [RegistrationPage]
  static String continueLabel = "Continue";

  /// string used in [RegistrationPage]
  static String signUp = "Sign Up";

  /// string used in [RegistrationPage]
  static String resendCode = "Resend Code";

  /// string used in[RegistrationPage]
  String enterOtp() {
    return "We have sent you an SMS with the code to the number $phoneNumber";
  }

  /// string used as title for [ProfilePage]
  static String profile = "Profile";

  /// string used in [ProfilePage]
  static String firstName = "First Name";

  /// string used in [ProfilePage]
  static String lastName = "Last Name";

  /// string used in [ProfilePage]
  static String save = "Save";

  /// string used in [AllChatsPage],[NavDrawer]
  static String chats = "Chats";

  /// string used in [ChatInfoPage]
  static String lastVisit = "Last Visit";

  /// string used in [ChatInfoPage]
  static String number = "Number";

  /// string used in [ChatInfoPage]
  static String notifications = "Notifications";

  /// string used in [ChatInfoPage]
  static String search = "Search";

  /// string used in [ChatInfoPage],[ChatMediaPage]
  static String media = "Media";

  /// string used in [ChatInfoPage]
  static String block = "Block";

  /// string used in[ChatInfoPage]
  String confirmBlockUser() {
    return "Do you really want to block $friendBlock?";
  }

  /// string used in[ChatInfoPage]
  static String yesButton = "Yes";

  /// string used in[ChatInfoPage]
  static String noButton = "No";

  /// string used in [ChatSearchPage]
  static String write = "Write...";

  /// string used in [MusicPage],[NavDrawer]
  static String music = "Music";

  /// string used in [MoviePage],[NavDrawer]
  static String movies = "Movies";

  /// string used  in [MoviePage]
  static String description = "Description";

  /// string used  in [MoviePage]
  static String watch = "Watch";

  /// string used in [GamesPage],[NavDrawer]
  static String games = "Games";

  /// string used  in [SettingsPage],[NavDrawer]
  static String settings = "Settings";

  /// string used in [SettingsPage],[NotificationPage]
  static String notification = "Notification";

  /// string used in [NotificationPage]
  static String showPreview = "Show Preview";

  /// string used in [NotificationPage]
  static String showNotifications = "Show Notifications";

  /// string used in [NotificationPage]
  static String showOnLockScreen = "Show On Lock Screen";

  /// string used in [NotificationPage]
  static String sound = "Sound";

  /// string used in [SettingsPage],[PribacyPage]
  static String privacy = "Privacy";

  /// string used in [PrivacyPage],[BlockedNumbersPage]
  static String bloackedNumbers = "Blocked Numbers";

  /// string used in [PrivacyPage],[BlockedNumbersPage]
  static String unBlock = "Unblock";

  /// string used in [PrivacyPage]
  static String numberVisibility = "Number Visibility";

  /// string used in [PrivacyPage]
  static String lastSeenOnline = "Last Seen & Online";

  /// string used in [PrivacyPage]
  static String profilePhoto = "Profile Photo";

  /// string used in [SettingsPage],[LanguagePage]
  static String language = "Language";

  /// string used in [LanguagePage]
  static String french = "French";

  /// string used in [LanguagePage]
  static String english = "English";

  /// string used in [LanguagePage]
  static String arabic = "Arabic";

  /// string used in [LanguagePage]
  static String hindi = "Hindi";

  /// string used in [SettingsPage],[HelpPage]
  static String help = "Help";

  /// string used in [HelpPage]
  static String faq = "FAQ";

  /// string used in [HelpPage]
  static String privacyPolicy = "Privacy Policy";

  /// string used in [HelpPage]
  static String connectUs = "Connect Us";
}
