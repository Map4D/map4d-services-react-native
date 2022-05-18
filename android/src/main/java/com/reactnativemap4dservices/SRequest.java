package com.reactnativemap4dservices;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReadableMap;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import vn.map4d.services.MFMethod;
import vn.map4d.services.MFRequestParams;
import vn.map4d.services.MFServiceOptions;

public class SRequest {
  static MFServiceOptions buildSuggestionsRequestWithData(@NonNull ReadableMap params) {
    MFServiceOptions.Builder serviceOptionsBuilder = new MFServiceOptions.Builder();
    serviceOptionsBuilder.url("/sdk/autosuggest");
    serviceOptionsBuilder.method(MFMethod.GET);

    MFRequestParams requestParams = new MFRequestParams();
    if (params.hasKey("text") && !params.isNull("text")) {
      String text = params.getString("text");
      requestParams.put("text", text);
    }

    if (params.hasKey("acronym") && !params.isNull("acronym")) {
      boolean acronym = params.getBoolean("acronym");
      requestParams.put("acronym", String.valueOf(acronym));
    }

    if (params.hasKey("location") && !params.isNull("location")) {
      String location = SConverter.toLocation(params.getMap("location"));
      requestParams.put("location", location);
    }
    serviceOptionsBuilder.params(requestParams);
    return serviceOptionsBuilder.build();
  }

  static MFServiceOptions buildPlaceDetailRequestWithId(@NonNull String placeId) {
    MFServiceOptions.Builder serviceOptionsBuilder = new MFServiceOptions.Builder();
    StringBuilder urlBuilder = new StringBuilder("/sdk/place/detail");
    serviceOptionsBuilder.method(MFMethod.GET);
    if (placeId != null) {
      urlBuilder.append("/").append(placeId);
    }
    serviceOptionsBuilder.url(urlBuilder.toString());
    return serviceOptionsBuilder.build();
  }

  static MFServiceOptions buildTextSearchRequestWithData(@NonNull ReadableMap params) {
    MFServiceOptions.Builder serviceOptionsBuilder = new MFServiceOptions.Builder();
    serviceOptionsBuilder.url("/sdk/place/text-search");
    serviceOptionsBuilder.method(MFMethod.GET);

    MFRequestParams requestParams = new MFRequestParams();
    if (params.hasKey("text") && !params.isNull("text")) {
      String text = params.getString("text");
      requestParams.put("text", text);
    }

    if (params.hasKey("location") && !params.isNull("location")) {
      String location = SConverter.toLocation(params.getMap("location"));
      requestParams.put("location", location);
    }

    if (params.hasKey("types")  && !params.isNull("types")) {
      String types = SConverter.toTypes(params.getArray("types"));
      requestParams.put("types", types);
    }

    if (params.hasKey("datetime") && !params.isNull("datetime")) {
      String datetime = SConverter.toDatetime(params.getDouble("datetime"));
      requestParams.put("datetime", datetime);
    }
    serviceOptionsBuilder.params(requestParams);
    return serviceOptionsBuilder.build();
  }

  static MFServiceOptions buildNearbySearchRequestWithData(@NonNull ReadableMap params) {
    MFServiceOptions.Builder serviceOptionsBuilder = new MFServiceOptions.Builder();
    serviceOptionsBuilder.url("/sdk/place/nearby-search");
    serviceOptionsBuilder.method(MFMethod.GET);

    MFRequestParams requestParams = new MFRequestParams();
    if (params.hasKey("location") && !params.isNull("location")) {
      String location = SConverter.toLocation(params.getMap("location"));
      requestParams.put("location", location);
    }

    if (params.hasKey("radius")  && !params.isNull("radius")) {
      String radius = String.valueOf(params.getInt("radius"));
      requestParams.put("radius", radius);
    }

    if (params.hasKey("text") && !params.isNull("text")) {
      String text = params.getString("text");
      requestParams.put("text", text);
    }

    if (params.hasKey("types")  && !params.isNull("types")) {
      String types = SConverter.toTypes(params.getArray("types"));
      requestParams.put("types", types);
    }

    if (params.hasKey("tags") && !params.isNull("tags")) {
      String tags = SConverter.toTags(params.getArray("tags"));
      requestParams.put("tags", tags);
    }

    if (params.hasKey("datetime") && !params.isNull("datetime")) {
      String datetime = SConverter.toDatetime(params.getDouble("datetime"));
      requestParams.put("datetime", datetime);
    }

    serviceOptionsBuilder.params(requestParams);
    return serviceOptionsBuilder.build();
  }

  static MFServiceOptions buildViewboxSearchRequestWithData(@NonNull ReadableMap params) {
    MFServiceOptions.Builder serviceOptionsBuilder = new MFServiceOptions.Builder();
    serviceOptionsBuilder.url("/sdk/place/viewbox-search");
    serviceOptionsBuilder.method(MFMethod.GET);

    MFRequestParams requestParams = new MFRequestParams();
    if (params.hasKey("viewbox") && !params.isNull("viewbox")) {
      String viewbox = SConverter.toViewbox(params.getMap("viewbox"));
      requestParams.put("viewbox", viewbox);
    }

    if (params.hasKey("text") && !params.isNull("text")) {
      String text = params.getString("text");
      requestParams.put("text", text);
    }

    if (params.hasKey("types") && !params.isNull("types")) {
      String types = SConverter.toTypes(params.getArray("types"));
      requestParams.put("types", types);
    }

    if (params.hasKey("tags") && !params.isNull("tags")) {
      String tags = SConverter.toTags(params.getArray("tags"));
      requestParams.put("tags", tags);
    }

    if (params.hasKey("datetime") && !params.isNull("datetime")) {
      String datetime = SConverter.toDatetime(params.getDouble("datetime"));
      requestParams.put("datetime", datetime);
    }
    serviceOptionsBuilder.params(requestParams);
    return serviceOptionsBuilder.build();
  }

  static MFServiceOptions buildGeocodingRequestWithData(@NonNull ReadableMap params) {
    MFServiceOptions.Builder serviceOptionsBuilder = new MFServiceOptions.Builder();
    serviceOptionsBuilder.url("/sdk/v2/geocode");
    serviceOptionsBuilder.method(MFMethod.GET);

    MFRequestParams requestParams = new MFRequestParams();
    if (params.hasKey("address") && !params.isNull("address")) {
      String address = params.getString("address");
      requestParams.put("address", address);
    }

    if (params.hasKey("location") && !params.isNull("location")) {
      String location = SConverter.toLocation(params.getMap("location"));
      requestParams.put("location", location);
    }

    if (params.hasKey("viewbox") && !params.isNull("viewbox")) {
      String viewbox = SConverter.toViewbox(params.getMap("viewbox"));
      requestParams.put("viewbox", viewbox);
    }
    serviceOptionsBuilder.params(requestParams);
    return serviceOptionsBuilder.build();
  }

  static MFServiceOptions buildDirectionsRequestWithData(@NonNull ReadableMap params) {
    MFServiceOptions.Builder serviceOptionsBuilder = new MFServiceOptions.Builder();
    serviceOptionsBuilder.url("/sdk/route");
    serviceOptionsBuilder.method(MFMethod.GET);

    MFRequestParams requestParams = new MFRequestParams();

    if (params.hasKey("origin") && !params.isNull("origin")) {
      String origin = SConverter.toLocation(params.getMap("origin"));
      requestParams.put("origin", origin);
    }

    if (params.hasKey("destination") && !params.isNull("destination")) {
      String destination = SConverter.toLocation(params.getMap("destination"));
      requestParams.put("destination", destination);
    }

    if (params.hasKey("mode") && !params.isNull("mode")) {
      String mode = params.getString("mode");
      requestParams.put("mode", mode);
    }

    if (params.hasKey("weighting") && !params.isNull("weighting")) {
      int weighting = SConverter.toWeighting(params.getString("weighting"));
      requestParams.put("weighting", String.valueOf(weighting));
    }

    if (params.hasKey("language") && !params.isNull("language")) {
      String language = params.getString("language");
      requestParams.put("language", language);
    }

    if (params.hasKey("waypoints") && !params.isNull("waypoints")) {
      String waypoints = SConverter.toLocationList(params.getArray("waypoints"));
      requestParams.put("points", waypoints);
    }

    if (params.hasKey("restriction") && !params.isNull("restriction")) {
      ReadableMap restrictionMap = params.getMap("restriction");
      String avoid = SConverter.toAvoid(restrictionMap);
      if (avoid != null && !avoid.isEmpty()) {
        requestParams.put("avoid", avoid);
      }

      String avoidRoads = SConverter.toAvoidRoads(restrictionMap);
      if (avoidRoads != null) {
        requestParams.put("avoidRoads", avoidRoads);
      }
    }

    serviceOptionsBuilder.params(requestParams);
    return serviceOptionsBuilder.build();
  }

  static MFServiceOptions buildRouteETARequestWithData(@NonNull ReadableMap params) {
    MFServiceOptions.Builder serviceOptionsBuilder = new MFServiceOptions.Builder();
    serviceOptionsBuilder.url("/sdk/route/eta");
    serviceOptionsBuilder.method(MFMethod.POST);

    JSONObject jsonObject = new JSONObject();
    try {
      if (params.hasKey("origins") && !params.isNull("origins")) {
        JSONArray origins = SConverter.toOriginJsonArray(params.getArray("origins"));
        jsonObject.put("origins", origins);
      }

      if (params.hasKey("destination") && !params.isNull("destination")) {
        String destination = SConverter.toLocation(params.getMap("destination"));
        jsonObject.put("destination", destination);
      }

      if (params.hasKey("mode") && !params.isNull("mode")) {
        String mode = params.getString("mode");
        jsonObject.put("mode", mode);
      }

      if (params.hasKey("weighting") && !params.isNull("weighting")) {
        int weighting = SConverter.toWeighting(params.getString("weighting"));
        jsonObject.put("weighting", String.valueOf(weighting));
      }

      if (params.hasKey("language") && !params.isNull("language")) {
        String language = params.getString("language");
        jsonObject.put("language", language);
      }

      if (params.hasKey("restriction") && !params.isNull("restriction")) {
        ReadableMap restrictionMap = params.getMap("restriction");
        String avoid = SConverter.toAvoid(restrictionMap);
        if (avoid != null && !avoid.isEmpty()) {
          jsonObject.put("avoid", avoid);
        }

        String avoidRoads = SConverter.toAvoidRoads(restrictionMap);
        if (avoidRoads != null) {
          jsonObject.put("avoidRoads", avoidRoads);
        }
      }
    } catch (JSONException e) {
      e.printStackTrace();
    }

    serviceOptionsBuilder.json(jsonObject.toString());
    return serviceOptionsBuilder.build();
  }

  static MFServiceOptions buildDistanceMatrixRequestWithData(@NonNull ReadableMap params) {
    MFServiceOptions.Builder serviceOptionsBuilder = new MFServiceOptions.Builder();
    serviceOptionsBuilder.url("/sdk/route/matrix");
    serviceOptionsBuilder.method(MFMethod.GET);

    MFRequestParams requestParams = new MFRequestParams();

    if (params.hasKey("origins") && !params.isNull("origins")) {
      String origins = SConverter.toLocationList(params.getArray("origins"));
      requestParams.put("origins", origins);
    }

    if (params.hasKey("destinations") && !params.isNull("destinations")) {
      String destinations = SConverter.toLocationList(params.getArray("destinations"));
      requestParams.put("destinations", destinations);
    }

    if (params.hasKey("mode") && !params.isNull("mode")) {
      String mode = params.getString("mode");
      requestParams.put("mode", mode);
    }

    if (params.hasKey("weighting") && !params.isNull("weighting")) {
      int weighting = SConverter.toWeighting(params.getString("weighting"));
      requestParams.put("weighting", String.valueOf(weighting));
    }

    if (params.hasKey("language") && !params.isNull("language")) {
      String language = params.getString("language");
      requestParams.put("language", language);
    }

    if (params.hasKey("restriction") && !params.isNull("restriction")) {
      ReadableMap restrictionMap = params.getMap("restriction");
      String avoid = SConverter.toAvoid(restrictionMap);
      if (avoid != null && !avoid.isEmpty()) {
        requestParams.put("avoid", avoid);
      }

      String avoidRoads = SConverter.toAvoidRoads(restrictionMap);
      if (avoidRoads != null) {
        requestParams.put("avoidRoads", avoidRoads);
      }
    }

    serviceOptionsBuilder.params(requestParams);
    return serviceOptionsBuilder.build();
  }

  static MFServiceOptions buildGraphRouteRequestWithData(@NonNull ReadableMap params) {
    MFServiceOptions.Builder serviceOptionsBuilder = new MFServiceOptions.Builder();
    serviceOptionsBuilder.url("/sdk/route/graph");
    serviceOptionsBuilder.method(MFMethod.GET);

    MFRequestParams requestParams = new MFRequestParams();

    if (params.hasKey("locations") && !params.isNull("locations")) {
      String points = SConverter.toLocationList(params.getArray("locations"));
      requestParams.put("points", points);
    }

    if (params.hasKey("mode") && !params.isNull("mode")) {
      String mode = params.getString("mode");
      requestParams.put("mode", mode);
    }

    if (params.hasKey("weighting") && !params.isNull("weighting")) {
      int weighting = SConverter.toWeighting(params.getString("weighting"));
      requestParams.put("weighting", String.valueOf(weighting));
    }

    if (params.hasKey("language") && !params.isNull("language")) {
      String language = params.getString("language");
      requestParams.put("language", language);
    }

    if (params.hasKey("restriction") && !params.isNull("restriction")) {
      ReadableMap restrictionMap = params.getMap("restriction");
      String avoid = SConverter.toAvoid(restrictionMap);
      if (avoid != null && !avoid.isEmpty()) {
        requestParams.put("avoid", avoid);
      }

      String avoidRoads = SConverter.toAvoidRoads(restrictionMap);
      if (avoidRoads != null) {
        requestParams.put("avoidRoads", avoidRoads);
      }
    }

    serviceOptionsBuilder.params(requestParams);
    return serviceOptionsBuilder.build();
  }
}
