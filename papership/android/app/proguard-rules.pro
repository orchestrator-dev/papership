# Retrofit
-keep class retrofit2.** { *; }
-keepattributes Signature
-keepattributes Exceptions

# Freezed / JsonSerializable (if any Java counterparts exist)
-keep class **.Freezed** { *; }
-keep class **.$* { *; }

# Injectable
-keep class **.Injectable** { *; }
