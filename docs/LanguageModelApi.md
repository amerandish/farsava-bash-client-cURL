# LanguageModelApi

All URIs are relative to */v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getLanguageModelById**](LanguageModelApi.md#getLanguageModelById) | **GET** /speech/languagemodels/{languageModelId} | GET /speech/languagemodels/{languageModelId}
[**getLanguageModelList**](LanguageModelApi.md#getLanguageModelList) | **GET** /speech/languagemodels | GET /speech/languagemodels
[**trainLanguageModel**](LanguageModelApi.md#trainLanguageModel) | **POST** /speech/languagemodels | POST /speech/languagemodels



## getLanguageModelById

GET /speech/languagemodels/{languageModelId}

Retrieving the status of a language model with specified languageModelId. A language model is ready to use when its status is *trained*.
***

### Example

```bash
farsava-cli getLanguageModelById languageModelId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **languageModelId** | **string** | Id of the language model. | [default to null]

### Return type

[**LanguageModelResult**](LanguageModelResult.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getLanguageModelList

GET /speech/languagemodels

Returns list of user available language models. Each user can access *general* language models plus their own *custom* trained language models.
***

### Example

```bash
farsava-cli getLanguageModelList
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**array[LanguageModelResult]**](LanguageModelResult.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## trainLanguageModel

POST /speech/languagemodels

Train a custom language model using pharases provided by user. Returning a languageModelId for accessing the language model later and using this custom language model to transcribe audios. Using custom language models will boost accuracy for specific keywords/phrases and can be used for a domain-specific speech recognition.
***

### Example

```bash
farsava-cli trainLanguageModel
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **languageModelTrainRequestBody** | [**LanguageModelTrainRequestBody**](LanguageModelTrainRequestBody.md) | A json object including a name and a corpora. Corpora is a array of text data to train a custom model. This text data can be keywords/phrases. All values in the array must be a string. Name is an arbitary string you set for the custom language model name. |

### Return type

[**LanguageModelResult**](LanguageModelResult.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

