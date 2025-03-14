package com.example.q_weather_plugin;

import android.content.Context;
import com.google.gson.Gson;
import com.qweather.sdk.bean.weather.WeatherNowBean;
import com.qweather.sdk.bean.weather.WeatherDailyBean;
import com.qweather.sdk.bean.weather.WeatherHourlyBean;
import com.qweather.sdk.bean.grid.GridMinutelyBean;
import com.qweather.sdk.view.QWeather;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import io.flutter.plugin.common.MethodChannel;

public class WeatherApi {
    /// 实时天气
    protected static void getWeatherNow(Context context, Object arguments, final MethodChannel.Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String location = (String) param.get("location");
        QWeather.OnResultWeatherNowListener onResultWeatherNowListener = new QWeather.OnResultWeatherNowListener() {
            @Override
            public void onError(Throwable throwable) {
                System.out.println(throwable.getLocalizedMessage());
                result.success("请求失败");
            }
            @Override
            public void onSuccess(WeatherNowBean weatherNowBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(weatherNowBean);
                result.success(jsonStr);
            }
        };
        QWeather.getWeatherNow(context, location, onResultWeatherNowListener);
    }
    /// 每日天气预报
    protected static void getWeatherDaily(Context context, Object arguments, final MethodChannel.Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String location = (String) param.get("location");
        int days = (int) param.get("days");
        QWeather.OnResultWeatherDailyListener onResultWeatherDailyListener = new QWeather.OnResultWeatherDailyListener() {
            @Override
            public void onError(Throwable throwable) {
                System.out.println(throwable.getLocalizedMessage());
                result.success("请求失败");
            }
            @Override
            public void onSuccess(WeatherDailyBean weatherDailyBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(weatherDailyBean);
                result.success(jsonStr);
            }
        };
        if(Objects.equals(days,3)){
            QWeather.getWeather3D(context, location, onResultWeatherDailyListener);
        } else if (Objects.equals(days,7)) {
            QWeather.getWeather7D(context, location, onResultWeatherDailyListener);
        } else if (Objects.equals(days,10)) {
            QWeather.getWeather10D(context, location, onResultWeatherDailyListener);
        } else if (Objects.equals(days,15)) {
            QWeather.getWeather15D(context, location, onResultWeatherDailyListener);
        } else {
            QWeather.getWeather30D(context, location, onResultWeatherDailyListener);
        }
    }
    /// 逐小时天气预报
    protected static void getWeatherHourly(Context context, Object arguments, final MethodChannel.Result result) {
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String location = (String) param.get("location");
        int hours = (int) param.get("hours");
        QWeather.OnResultWeatherHourlyListener onResultWeatherHourlyListener = new QWeather.OnResultWeatherHourlyListener() {
            @Override
            public void onError(Throwable throwable) {
                System.out.println(throwable.getLocalizedMessage());
                result.success("请求失败");
            }
            @Override
            public void onSuccess(WeatherHourlyBean weatherHourlyBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(weatherHourlyBean);
                result.success(jsonStr);
            }
        };
        if(Objects.equals(hours,24)){
            QWeather.getWeather24Hourly(context, location, onResultWeatherHourlyListener);
        } else if (Objects.equals(hours,72)) {
            QWeather.getWeather72Hourly(context, location, onResultWeatherHourlyListener);
        } else {
            QWeather.getWeather168Hourly(context, location, onResultWeatherHourlyListener);
        }
    }
    /// 分钟级降水
    protected static void getWeatherMinutely(Context context, Object arguments, final MethodChannel.Result result) {
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String location = (String) param.get("location");
        QWeather.OnResultMinutelyListener onResultMinutelyListener = new QWeather.OnResultMinutelyListener() {
            @Override
            public void onError(Throwable throwable) {
                System.out.println(throwable.getLocalizedMessage());
                result.success("请求失败");
            }
            @Override
            public void onSuccess(GridMinutelyBean gridMinutelyBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(gridMinutelyBean);
                result.success(jsonStr);
            }
        };
        QWeather.getMinutely(context, Double.parseDouble(location.split(",")[0]), Double.parseDouble(location.split(",")[1]), onResultMinutelyListener);
    }
}
