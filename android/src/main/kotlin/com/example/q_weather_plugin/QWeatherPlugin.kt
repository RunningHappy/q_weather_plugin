package com.example.q_weather_plugin
import android.content.Context
import com.qweather.sdk.bean.geo.GeoBean
import com.qweather.sdk.view.HeConfig
import com.qweather.sdk.view.QWeather
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** QWeatherPlugin */
class QWeatherPlugin(private val context: Context): FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "q_weather_plugin")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "initialize") {
      val apiKey = call.argument<String>("apiKey")
      val publicID = call.argument<String>("publicID")
      HeConfig.init(publicID, apiKey);
      result.success(true)
    } else if (call.method == "getCityLookup") {
      val location = call.argument<String>("location")
      QWeather.getGeoCityLookup(context, location, QWeather.OnResultGeoListener {
        fun onError(throwable: Throwable) {
          result.success(null)
        }

        fun onSuccess(geoBean: GeoBean?) {
          result.success(geoBean.toString())
        }
      })
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
