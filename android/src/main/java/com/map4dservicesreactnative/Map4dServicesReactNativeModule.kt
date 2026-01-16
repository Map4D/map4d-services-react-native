package com.map4dservicesreactnative

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.annotations.ReactModule

@ReactModule(name = Map4dServicesReactNativeModule.NAME)
class Map4dServicesReactNativeModule(reactContext: ReactApplicationContext) :
  NativeMap4dServicesReactNativeSpec(reactContext) {

  override fun getName(): String {
    return NAME
  }

  // Example method
  // See https://reactnative.dev/docs/native-modules-android
  override fun multiply(a: Double, b: Double): Double {
    return a * b
  }

  companion object {
    const val NAME = "Map4dServicesReactNative"
  }
}
