package com.reactnativemap4dservices;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

class SConverter {
  private static String toAvoidPath(ReadableArray array) {
    if (array == null) {
      return null;
    }
    StringBuilder resultBuilder = new StringBuilder();
    for (int i = 0; i < array.size(); ++i) {
      resultBuilder.append(toLocation(array.getMap(i)));
      if (i < array.size() - 1) {
        resultBuilder.append(",");
      }
    }
    return resultBuilder.toString();
  }

  static String toLocation(ReadableMap map) {
    if (map == null) {
      return null;
    }
    double lat = map.getDouble("latitude");
    double lng = map.getDouble("longitude");
    return lat + "," + lng;
  }

  static String toViewbox(ReadableMap map) {
    if (map == null) {
      return null;
    }
    String southWest = toLocation(map.getMap("southwest"));
    String northEast = toLocation(map.getMap("northeast"));
    return southWest + "," + northEast;
  }

  static String toDatetime(double time) {
    long datetime = (long) time;
    return String.valueOf(datetime);
  }

  static String toTypes(@NonNull ReadableArray types) {
    StringBuilder result = new StringBuilder();
    for (int i = 0; i < types.size(); ++i) {
      if (i > 0) {
        result.append("&types=");
      }
      result.append(types.getString(i));
    }
    return result.toString();
  }

  static String toTags(@NonNull ReadableArray tags) {
    StringBuilder result = new StringBuilder();
    for (int i = 0; i < tags.size(); ++i) {
      if (i > 0) {
        result.append("&tags=");
      }
      result.append(tags.getString(i));
    }
    return result.toString();
  }

  static int toWeighting(@NonNull String weighting) {
    switch (weighting) {
      case "shortest":
        return 0;
      case "fastest":
        return 1;
      case "balance":
        return 2;
      default:
        return 3;
    }
  }

  static String toLocationList(ReadableArray map) {
    if (map == null) {
      return null;
    }

    StringBuilder result = new StringBuilder();
    for (int i = 0; i < map.size(); ++i) {
      result.append(toLocation(map.getMap(i)));
      if (i < map.size() - 1) {
        result.append(";");
      }
    }
    return result.toString();
  }

  static JSONArray toOriginJsonArray(ReadableArray origins) {
    if (origins == null) {
      return null;
    }
    JSONArray originsJsonArray = null;
    if (origins != null && origins.size() > 0) {
      originsJsonArray = new JSONArray();
    }
    for (int i = 0; i < origins.size(); ++i) {
      ReadableMap origin = origins.getMap(i);
      try {
        JSONObject originJsonObject = new JSONObject();
        String alias = origin.getString("alias");
        originJsonObject.put("alias", alias);
        originJsonObject.put("location", toLocation(origin));
        originsJsonArray.put(originJsonObject);
      } catch (JSONException e) {
        e.printStackTrace();
      }
    }
    return originsJsonArray;
  }

  static String toAvoid(ReadableMap map) {
    if (map == null) {
      return null;
    }
    StringBuilder resultBuilder = new StringBuilder();
    if (map.hasKey("location")) {
      String location = toLocation(map.getMap("location"));
      if (location != null) {
        resultBuilder.append(location);
        if (map.hasKey("radius")) {
          int radius = map.getInt("radius");
          resultBuilder.append(",").append(radius);
        }
      }
    }
    else if (map.hasKey("viewbox")) {
      resultBuilder.append(toViewbox(map.getMap("viewbox")));
    }
    else if (map.hasKey("path")) {
      resultBuilder.append(toAvoidPath(map.getArray("path")));
    }

    return resultBuilder.toString();
  }

  static String toAvoidRoads(ReadableMap map) {
    if (map == null) {
      return null;
    }
    if (map.hasKey("types")) {
      StringBuilder resultBuilder = new StringBuilder();
      ReadableArray array = map.getArray("types");
      for (int i = 0; i < array.size(); ++i) {
        String type = array.getString(i);
        resultBuilder.append(type);
        if (i < array.size() - 1) {
          resultBuilder.append(",");
        }
      }
      return resultBuilder.toString();
    }
    return null;
  }
}
