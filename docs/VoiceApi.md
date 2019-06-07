# VoiceApi

All URIs are relative to */v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getVoicesList**](VoiceApi.md#getVoicesList) | **GET** /voice/speakers | GET /voice/speakers
[**synthesize**](VoiceApi.md#synthesize) | **POST** /voice/tts | POST /voice/tts
[**voiceHealthCheck**](VoiceApi.md#voiceHealthCheck) | **GET** /voice/healthcheck | GET /voice/healthcheck



## getVoicesList

GET /voice/speakers

This endpoint retrieves the list of available speakers for speech synthesization. Each speaker has a unique *voiceId* which can be used to synthesize speech. The result aslo includes each speaker langauge, gender and name.
***

### Example

```bash
farsava-cli getVoicesList
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**array[VoiceSelectionParams]**](VoiceSelectionParams.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## synthesize

POST /voice/tts

## Synthesizes speech synchronously 
***
Receives text and data configs and synthesize speech in different voices and format using state-of-the-art deep neural networks. This service synthesizes speech synchronously and the results will be available after all text input has been processed. 
***
Using *config* object you can can specify audio configs such as *audioEncoding* and *sampleRateHertz*. We will support different languages so you can choose the *languageCode*. using *voiceSelectionParams* you can choose between the supported voices with specifying voiceId. Voices differ in gender, tone and style.

### Example

```bash
farsava-cli synthesize
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tTSRequestBody** | [**TTSRequestBody**](TTSRequestBody.md) | Receives a json including input text, voice parameteres and audio config. |

### Return type

[**TTSResponseBody**](TTSResponseBody.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## voiceHealthCheck

GET /voice/healthcheck

## voice health check endpoint.
***
This endpoint will return a simple json including **service status** and **API version**.

### Example

```bash
farsava-cli voiceHealthCheck
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**HealthCheckResponseBody**](HealthCheckResponseBody.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

