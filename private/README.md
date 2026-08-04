# 🔒 Private Analytics Module

This folder contains GameAnalytics integration code and credentials.
It is **gitignored** — never pushed to GitHub.

## 🔑 How to get the full module

Only repository administrators have access to the complete implementation.
Contact an admin to receive the full module files via secure channel.

## 📁 Expected file structure

```
private/
├── README.md                              ← You are here (tracked in git)
├── .gitkeep                               ← Directory marker
└── gameanalytics/
    ├── .gitkeep                           ← Directory marker
    ├── GameAnalyticsConfig.SAMPLE.hx      ← Template (tracked in git)
    ├── GameAnalyticsConfig.hx             ← REAL CREDENTIALS (never commit!)
    ├── GameAnalytics.hx                   ← Main REST API client (private)
    └── GameAnalyticsTypes.hx              ← Event type definitions (private)
```

## 🛠️ Setup Instructions (for team members)

### 1. Get the private files
Ask an admin for the complete `private/` folder contents.

### 2. Configure credentials
Copy `GameAnalyticsConfig.SAMPLE.hx` → `GameAnalyticsConfig.hx`
Fill in the real GameAnalytics game key and secret key.

### 3. Build normally
No build flag is required. The build checks for all three private `.hx` files
and enables GameAnalytics automatically when they are present. If any file is
missing, the public bridge compiles as a no-op.

### 4. Verify
The game should now send analytics events to GameAnalytics.
Check the GameAnalytics dashboard for incoming data.

## 🏗️ Architecture

This module uses the **GameAnalytics REST API v2** directly (not the outdated Haxe SDK):

- **No external dependencies** — uses only `haxe.Http`, `haxe.crypto.Hmac`, `haxe.Json`
- **Event batching** — events are queued and sent in batches every 10 seconds
- **HMAC-SHA256 signing** — all requests are authenticated with the secret key
- **Graceful degradation** — network errors are silently handled, events are discarded after retry exhaustion

## ⚠️ Security Notes

- **Never commit `GameAnalyticsConfig.hx`** — it contains real API keys
- **Never commit the private `.hx` source files** to the public repo
- If keys are accidentally exposed, rotate them immediately in the GameAnalytics dashboard

## GitHub Actions

Trusted workflows restore the private module from encrypted repository secrets:

- `NOVA_GA_IMPL_B64`
- `NOVA_GA_TYPES_B64`
- `NOVA_GA_CONFIG_B64`

The restore step writes all three sources before Lime starts. Fork pull
requests receive no repository secrets and compile without analytics.
