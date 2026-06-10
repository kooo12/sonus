# Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
-dontwarn io.flutter.embedding.**

# Firebase and Google Play Services
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }

# ExoPlayer (used by just_audio / audio_service)
-keep class com.google.android.exoplayer2.** { *; }
-keep interface com.google.android.exoplayer2.** { *; }
-dontwarn com.google.android.exoplayer2.**

# AndroidX Media & Media3 (used by audio_service / just_audio)
-keep class androidx.media2.** { *; }
-keep class androidx.media.** { *; }
-keep class androidx.media3.** { *; }
-keep class android.support.v4.media.** { *; }

# Audio Service
-keep class com.ryanheise.audioservice.** { *; }

# Audio Session
-keep class com.ryanheise.audiosession.** { *; }

# Just Audio
-keep class com.ryanheise.just_audio.** { *; }

# Awesome Notifications
-keep class me.carda.awesome_notifications.** { *; }
-keep class me.carda.awesome_notifications.core.** { *; }
-keep class androidx.core.app.NotificationCompat** { *; }

# Permission Handler
-keep class com.baseflow.permissionhandler.** { *; }

# Connectivity Plus
-keep class dev.fluttercommunity.plus.connectivity.** { *; }

# Package Info Plus
-keep class dev.fluttercommunity.plus.packageinfo.** { *; }

# Path Provider
-keep class io.flutter.plugins.pathprovider.** { *; }

# Shared Preferences
-keep class io.flutter.plugins.sharedpreferences.** { *; }

# Url Launcher
-keep class io.flutter.plugins.urllauncher.** { *; }

# Flutter Secure Storage
-keep class com.it_nomads.fluttersecurestorage.** { *; }

# Dio / Http / Networking
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okhttp3.**
-dontwarn okio.**

# AndroidX Lifecycle
-keep class androidx.lifecycle.DefaultLifecycleObserver

# Prevent obfuscation of generic types
-keepattributes Signature,InnerClasses,EnclosingMethod

# Keep Gson / Json serialization annotations
-keepattributes *Annotation*
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}

# AndroidX Core
-keep class androidx.core.** { *; }

# Suppress warnings for Play Core missing classes (referenced by Flutter Engine)
-dontwarn com.google.android.play.core.splitcompat.SplitCompatApplication
