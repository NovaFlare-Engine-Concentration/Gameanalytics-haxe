package gameanalytics;

/**
 * GameAnalytics Configuration Template
 *
 * Copy this file to GameAnalyticsConfig.hx and fill in your real keys.
 * NEVER commit GameAnalyticsConfig.hx to the public repository!
 *
 * Get your keys from: https://go.gameanalytics.com/ → Settings → Game Keys
 */
class GameAnalyticsConfig {
    /** GameAnalytics Game Key (public identifier) */
    public static var GAME_KEY:String = "YOUR_GAME_KEY_HERE";

    /** GameAnalytics Secret Key (for request signing — KEEP PRIVATE!) */
    public static var SECRET_KEY:String = "YOUR_SECRET_KEY_HERE";

    /** Application build version sent with every event */
    public static var BUILD_VERSION:String = "1.0.0";

    /** Enable verbose logging (disable for production builds) */
    public static var VERBOSE_LOGGING:Bool = false;

    /** Submit sandbox/test events (disable for production) */
    public static var SANDBOX_MODE:Bool = false;
}
