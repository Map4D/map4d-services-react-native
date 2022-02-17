package com.reactnativemap4dservices;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.WritableMap;

import org.json.JSONException;
import org.json.JSONObject;

import vn.map4d.services.MFServiceCallback;
import vn.map4d.services.MFServiceOptions;
import vn.map4d.services.MFServiceTask;
import vn.map4d.services.MFServices;
import vn.map4d.services.MFServicesOptions;

class SClient {
  static void fireRequest(MFServicesOptions options, MFServiceOptions serviceOptions, @NonNull Promise promise) {
    MFServiceTask serviceTask = new MFServices(options)
      .request(serviceOptions, new MFServiceCallback<JSONObject>() {
        @Override
        public void onSuccess(@Nullable JSONObject json) {
          if (json == null) {
            promise.resolve(null);
          }
          else {
            try {
              final WritableMap data = SJsonUtils.convertJsonToMap(json);
              promise.resolve(data);
            } catch (JSONException e) {
              promise.reject(
                "Map4dServices",
                "Error when parse JSON data result !");
            }
          }
        }

        @Override
        public void onError(String code, String message) {
          promise.reject(code, message);
        }
      });
  }
}
