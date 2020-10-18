import 'dart:async';
import 'dart:convert';

import 'package:moodle_flutter/models/Token.dart';
import 'package:moodle_flutter/models/User.dart';
import 'package:moodle_flutter/models/base/EventObject.dart';
import 'package:moodle_flutter/utils/constants.dart';
import 'package:http/http.dart' as http;

Future<EventObject> getTokenByLogin(String username, String password) async {
  String currentUrl = APIConstants.API_BASE_URL + APIOperations.getTokenByLogin;

  try {
    final response = await http.post(currentUrl, body: {'username': username, 'password': password});

    if (response != null) {
      if (response.statusCode == APIResponseCode.SC_OK &&
          response.body != null) {
        final responseJson = json.decode(response.body);
        Token result = Token.fromJson(responseJson);
        if (result.token != null)
          return new EventObject(id: EventConstants.LOGIN_USER_SUCCESSFUL, object: result.token);
        else
          return new EventObject(id: EventConstants.LOGIN_USER_UN_SUCCESSFUL);
      } else
        return new EventObject(id: EventConstants.LOGIN_USER_UN_SUCCESSFUL);
    } else
      return new EventObject();
  } catch (Exception) {
    return EventObject();
  }
}

Future<EventObject> fetchUserDetail(String token) async {
  String currentUrl = APIConstants.API_BASE_URL + APIOperations.fetchUserDetail + '&wstoken=' + token;

  try {
    final response = await http.get(currentUrl);

    if (response != null) {
      if (response.statusCode == APIResponseCode.SC_OK &&
          response.body != null) {
        final responseJson = json.decode(response.body);
        User user = User.fromJson(responseJson);
        if (user != null)
          return new EventObject(id: EventConstants.LOGIN_USER_SUCCESSFUL, object: user);
        else
          return new EventObject(id: EventConstants.LOGIN_USER_UN_SUCCESSFUL);
      } else
        return new EventObject(id: EventConstants.LOGIN_USER_UN_SUCCESSFUL);
    } else
      return new EventObject();
  } catch (Exception) {
    return EventObject();
  }
}

Future<EventObject> registerUser(
    String name, String emailId, String password) async {
  /*UserRequest userRequest = new UserRequest();
  User user = new User(firstname: name, lastname: emailId, username: password);

  userRequest.operation = APIOperations.REGISTER;
  userRequest.user = user;

  try {
    final encoding = APIConstants.OCTET_STREAM_ENCODING;
    final response = await http.post(APIConstants.API_BASE_URL,
        body: json.encode(userRequest.toJson()),
        encoding: Encoding.getByName(encoding));
    if (response != null) {
      if (response.statusCode == APIResponseCode.SC_OK &&
          response.body != null) {
        final responseJson = json.decode(response.body);
        UserResponse apiResponse = UserResponse.fromJson(responseJson);
        if (apiResponse.result == APIOperations.SUCCESS) {
          return new EventObject(
              id: EventConstants.USER_REGISTRATION_SUCCESSFUL, object: null);
        } else if (apiResponse.result == APIOperations.FAILURE) {
          return new EventObject(id: EventConstants.USER_ALREADY_REGISTERED);
        } else {
          return new EventObject(
              id: EventConstants.USER_REGISTRATION_UN_SUCCESSFUL);
        }
      } else {
        return new EventObject(
            id: EventConstants.USER_REGISTRATION_UN_SUCCESSFUL);
      }
    } else {
      return new EventObject();
    }
  } catch (Exception) {
    return EventObject();
  }*/
}

Future<EventObject> changePassword(
    String emailId, String oldPassword, String newPassword) async {
  /*UserRequest userRequest = new UserRequest();
  User user = new User(
      firstname: emailId, lastname: oldPassword, username: newPassword);

  userRequest.operation = APIOperations.CHANGE_PASSWORD;
  userRequest.user = user;

  try {
    final encoding = APIConstants.OCTET_STREAM_ENCODING;
    final response = await http.post(APIConstants.API_BASE_URL,
        body: json.encode(userRequest.toJson()),
        encoding: Encoding.getByName(encoding));
    if (response != null) {
      if (response.statusCode == APIResponseCode.SC_OK &&
          response.body != null) {
        final responseJson = json.decode(response.body);
        UserResponse apiResponse = UserResponse.fromJson(responseJson);
        if (apiResponse.result == APIOperations.SUCCESS) {
          return new EventObject(
              id: EventConstants.CHANGE_PASSWORD_SUCCESSFUL, object: null);
        } else if (apiResponse.result == APIOperations.FAILURE) {
          return new EventObject(id: EventConstants.INVALID_OLD_PASSWORD);
        } else {
          return new EventObject(
              id: EventConstants.CHANGE_PASSWORD_UN_SUCCESSFUL);
        }
      } else {
        return new EventObject(
            id: EventConstants.CHANGE_PASSWORD_UN_SUCCESSFUL);
      }
    } else {
      return new EventObject();
    }
  } catch (Exception) {
    return EventObject();
  }*/
}
