# Farsava API Bash client

## Overview

This is a Bash client script for accessing Farsava API service.

The script uses cURL underneath for making all REST calls.

## Usage

```shell
# Make sure the script has executable rights
$ chmod u+x farsava-cli

# Print the list of operations available on the service
$ ./farsava-cli -h

# Print the service description
$ ./farsava-cli --about

# Print detailed information about specific operation
$ ./farsava-cli <operationId> -h

# Make GET request
./farsava-cli --host http://<hostname>:<port> --accept xml <operationId> <queryParam1>=<value1> <header_key1>:<header_value2>

# Make GET request using arbitrary curl options (must be passed before <operationId>) to an SSL service using username:password
farsava-cli -k -sS --tlsv1.2 --host https://<hostname> -u <user>:<password> --accept xml <operationId> <queryParam1>=<value1> <header_key1>:<header_value2>

# Make POST request
$ echo '<body_content>' | farsava-cli --host <hostname> --content-type json <operationId> -

# Make POST request with simple JSON content, e.g.:
# {
#   "key1": "value1",
#   "key2": "value2",
#   "key3": 23
# }
$ echo '<body_content>' | farsava-cli --host <hostname> --content-type json <operationId> key1==value1 key2=value2 key3:=23 -

# Preview the cURL command without actually executing it
$ farsava-cli --host http://<hostname>:<port> --dry-run <operationid>

```

## Docker image

You can easily create a Docker image containing a preconfigured environment
for using the REST Bash client including working autocompletion and short
welcome message with basic instructions, using the generated Dockerfile:

```shell
docker build -t my-rest-client .
docker run -it my-rest-client
```

By default you will be logged into a Zsh environment which has much more
advanced auto completion, but you can switch to Bash, where basic autocompletion
is also available.

## Shell completion

### Bash

The generated bash-completion script can be either directly loaded to the current Bash session using:

```shell
source farsava-cli.bash-completion
```

Alternatively, the script can be copied to the `/etc/bash-completion.d` (or on OSX with Homebrew to `/usr/local/etc/bash-completion.d`):

```shell
sudo cp farsava-cli.bash-completion /etc/bash-completion.d/farsava-cli
```

#### OS X

On OSX you might need to install bash-completion using Homebrew:

```shell
brew install bash-completion
```

and add the following to the `~/.bashrc`:

```shell
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
```

### Zsh

In Zsh, the generated `_farsava-cli` Zsh completion file must be copied to one of the folders under `$FPATH` variable.

## Documentation for API Endpoints

All URIs are relative to */v1*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*LanguageModelApi* | [**getLanguageModelById**](docs/LanguageModelApi.md#getlanguagemodelbyid) | **GET** /speech/languagemodels/{languageModelId} | GET /speech/languagemodels/{languageModelId}
*LanguageModelApi* | [**getLanguageModelList**](docs/LanguageModelApi.md#getlanguagemodellist) | **GET** /speech/languagemodels | GET /speech/languagemodels
*LanguageModelApi* | [**trainLanguageModel**](docs/LanguageModelApi.md#trainlanguagemodel) | **POST** /speech/languagemodels | POST /speech/languagemodels
*SpeechApi* | [**deleteTranscription**](docs/SpeechApi.md#deletetranscription) | **DELETE** /speech/transcriptions/{transcriptionId} | DELETE /speech/transcriptions/{transcriptionId}
*SpeechApi* | [**getTranscription**](docs/SpeechApi.md#gettranscription) | **GET** /speech/transcriptions/{transcriptionId} | GET /speech/transcriptions/{transcriptionId}
*SpeechApi* | [**recognize**](docs/SpeechApi.md#recognize) | **POST** /speech/asr | POST /speech/asr
*SpeechApi* | [**recognizeLive**](docs/SpeechApi.md#recognizelive) | **GET** /speech/asrlive | GET /speech/asrlive
*SpeechApi* | [**recognizeLongRunning**](docs/SpeechApi.md#recognizelongrunning) | **POST** /speech/asrlongrunning | POST /speech/asrlongrunning
*SpeechApi* | [**speechHealthCheck**](docs/SpeechApi.md#speechhealthcheck) | **GET** /speech/healthcheck | GET /speech/healthcheck
*VoiceApi* | [**getVoicesList**](docs/VoiceApi.md#getvoiceslist) | **GET** /voice/speakers | GET /voice/speakers
*VoiceApi* | [**synthesize**](docs/VoiceApi.md#synthesize) | **POST** /voice/tts | POST /voice/tts
*VoiceApi* | [**voiceHealthCheck**](docs/VoiceApi.md#voicehealthcheck) | **GET** /voice/healthcheck | GET /voice/healthcheck


## Documentation For Models

 - [ASRRequestBodyData](docs/ASRRequestBodyData.md)
 - [ASRRequestBodyURI](docs/ASRRequestBodyURI.md)
 - [ASRResponseBody](docs/ASRResponseBody.md)
 - [ASRStatus](docs/ASRStatus.md)
 - [AudioEncoding](docs/AudioEncoding.md)
 - [Error](docs/Error.md)
 - [HealthCheckResponseBody](docs/HealthCheckResponseBody.md)
 - [LMStatus](docs/LMStatus.md)
 - [LanguageCode](docs/LanguageCode.md)
 - [LanguageModelResult](docs/LanguageModelResult.md)
 - [LanguageModelTrainRequestBody](docs/LanguageModelTrainRequestBody.md)
 - [RecognitionAudioData](docs/RecognitionAudioData.md)
 - [RecognitionAudioURI](docs/RecognitionAudioURI.md)
 - [RecognitionConfig](docs/RecognitionConfig.md)
 - [SpeechRecognitionModel](docs/SpeechRecognitionModel.md)
 - [SpeechRecognitionResult](docs/SpeechRecognitionResult.md)
 - [SynthesisInput](docs/SynthesisInput.md)
 - [TTSAudioConfig](docs/TTSAudioConfig.md)
 - [TTSRequestBody](docs/TTSRequestBody.md)
 - [TTSResponseBody](docs/TTSResponseBody.md)
 - [TTSVoiceGender](docs/TTSVoiceGender.md)
 - [VoiceSelectionParams](docs/VoiceSelectionParams.md)
 - [WordInfo](docs/WordInfo.md)


## Documentation For Authorization


## bearerAuth

- **Type**: HTTP basic authentication

