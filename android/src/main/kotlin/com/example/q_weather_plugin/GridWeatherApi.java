package com.example.q_weather_plugin;

import android.content.Context;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.Objects;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.HttpUrl;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okio.BufferedSink;
import org.json.JSONException;
import org.json.JSONObject;

import io.flutter.plugin.common.MethodChannel;

public class GridWeatherApi {
    /// 格点实时天气
    protected static void getGridWeatherNow(Context context, Object arguments, final MethodChannel.Result result) {
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String location = (String) param.get("location");
        Boolean isDev = (Boolean) param.get("isDev");
        String token = (String) param.get("token");
        String url = "";
        if(Objects.equals(isDev,true)){
            url = "https://devapi.qweather.com/v7/grid-weather/now";
        } else {
            url = "https://api.qweather.com/v7/grid-weather/now";
        }
        HttpUrl.Builder urlBuilder = HttpUrl.parse(url).newBuilder();
        urlBuilder.addQueryParameter("location",location);
        urlBuilder.addQueryParameter("key",token);
        OkHttpClient client = new OkHttpClient();
        Request request = new Request.Builder()
                .url(urlBuilder.build().toString())
                .get()
                .build();
        client.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                System.out.println("Fail");
                result.success("请求失败");
            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {
                System.out.println("Success");
                result.success(response.body().toString());
            }
        });
    }
}
