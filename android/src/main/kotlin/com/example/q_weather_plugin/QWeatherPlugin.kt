package com.example.q_weather_plugin
import android.content.Context
import androidx.annotation.NonNull
import com.qweather.sdk.bean.geo.GeoBean
import com.qweather.sdk.view.HeConfig
import com.qweather.sdk.view.QWeather
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.util.Objects

/** QWeatherPlugin */
class QWeatherPlugin : FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context
  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "q_weather_plugin")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
    if (call.method == "initialize") {
      val apiKey = call.argument<String>("apiKey")
      val publicID = call.argument<String>("publicID")
      val isDev = call.argument<Boolean>("isDev")
      HeConfig.init(publicID, apiKey)
      if(Objects.equals(isDev, true)){
        HeConfig.switchToDevService()
      }else{
        HeConfig.switchToBizService()
      }
      result.success(true)
    } else if (call.method == "getCityLookup") {
      GeoApi.getGeoCityLookUp(context, call.arguments, result)
    } else if (call.method == "getGeoTopCity") {
      GeoApi.getGeoTopCity(context, call.arguments, result);
    } else if (call.method == "getGeoPoiLookup") {
      GeoApi.getGeoPoiLookup(context, call.arguments, result);
    } else if (call.method == "getGeoPoiRange") {
      GeoApi.getGeoPoiRange(context, call.arguments, result);
    } else if (call.method == "getWeatherNow") {
      WeatherApi.getWeatherNow(context, call.arguments, result);
    } else if (call.method == "getWeatherDaily") {
      WeatherApi.getWeatherDaily(context, call.arguments, result);
    } else if (call.method == "getWeatherHourly") {
      WeatherApi.getWeatherHourly(context, call.arguments, result);
    } else if (call.method == "getWeatherMinuteLy") {
      WeatherApi.getWeatherMinutely(context, call.arguments, result);
    } else if (call.method == "getGridWeatherNow") {
      GridWeatherApi.getGridWeatherNow(context, call.arguments, result);
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
