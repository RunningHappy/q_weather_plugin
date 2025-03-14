package com.example.q_weather_plugin;
import android.content.Context;
import com.google.gson.Gson;
import com.qweather.sdk.bean.base.Lang;
import com.qweather.sdk.bean.base.Range;
import com.qweather.sdk.bean.base.Type;
import com.qweather.sdk.bean.geo.GeoBean;
import com.qweather.sdk.bean.geo.GeoPoiBean;
import com.qweather.sdk.view.QWeather;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import io.flutter.plugin.common.MethodChannel;

public class GeoApi {
    /// 城市信息查询
    protected static void getGeoCityLookUp(Context context, Object arguments, final MethodChannel.Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String location = (String) param.get("location");
        QWeather.OnResultGeoListener onResultGeoListener = new QWeather.OnResultGeoListener() {
            @Override
            public void onError(Throwable throwable) {
                result.success("请求失败");
            }
            @Override
            public void onSuccess(GeoBean geoBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(geoBean);
                jsonStr = jsonStr.replace("locationBean", "locations");
                result.success(jsonStr);
            }
        };
        QWeather.getGeoCityLookup(context, location, onResultGeoListener);
    }
    /// 热门城市查询
    protected static void getGeoTopCity(Context context, Object arguments, final MethodChannel.Result result) {
        QWeather.OnResultGeoListener onResultGeoListener = new QWeather.OnResultGeoListener() {
            @Override
            public void onError(Throwable throwable) {
                result.success("请求失败");
            }
            @Override
            public void onSuccess(GeoBean geoBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(geoBean);
                jsonStr = jsonStr.replace("locationBean", "locations");
                result.success(jsonStr);
            }
        };
        QWeather.getGeoTopCity(context, onResultGeoListener);
    }
    /// POI搜索
    protected static void getGeoPoiLookup(Context context, Object arguments, final MethodChannel.Result result) {
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String location = (String) param.get("location");
        String type = (String) param.get("type");
        Type poiType;
        if(Objects.equals(type, "SCENIC")){
            poiType = Type.SCENIC;
        }else if(Objects.equals(type,"CSTA")){
            poiType = Type.CSTA;
        }else {
            poiType = Type.TSTA;
        }
        QWeather.OnResultGeoPoiListener onResultGeoPoiListener = new QWeather.OnResultGeoPoiListener() {
            @Override
            public void onError(Throwable throwable) {
                result.success("请求失败");
            }
            @Override
            public void onSuccess(GeoPoiBean geoPoiBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(geoPoiBean);
                jsonStr = jsonStr.replace("poiList", "locations");
                result.success(jsonStr);
            }
        };
        QWeather.getGeoPoiLookup(context, location, poiType, onResultGeoPoiListener);
    }
    /// POI范围搜索
    protected static void getGeoPoiRange(Context context, Object arguments, final MethodChannel.Result result) {
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String location = (String) param.get("location");
        String type = (String) param.get("type");
        Type poiType;
        if(Objects.equals(type, "SCENIC")){
            poiType = Type.SCENIC;
        }else if(Objects.equals(type,"CSTA")){
            poiType = Type.CSTA;
        }else {
            poiType = Type.TSTA;
        }
        QWeather.OnResultGeoPoiListener onResultGeoPoiListener = new QWeather.OnResultGeoPoiListener() {
            @Override
            public void onError(Throwable throwable) {
                result.success("请求失败");
            }
            @Override
            public void onSuccess(GeoPoiBean geoPoiBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(geoPoiBean);
                jsonStr = jsonStr.replace("poiList", "locations");
                result.success(jsonStr);
            }
        };
        QWeather.getGeoPoiRange(context, location, 10,poiType, Lang.ZH_HANS, onResultGeoPoiListener);
    }
}

