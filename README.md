# 🚀 Facebook Notify for GitHub Actions

[GitHub Action](https://developer.github.com/actions/) for sending a Facebook notification message.

<img src="./images/facebook-message.png">

## Usage

Send custom message and see the custom variable as blow.

```
action "Send Custom Message" {
  uses = "appleboy/facebook-action@master"
  secrets = [
    "FB_PAGE_TOKEN",
    "FB_VERIFY_TOKEN",
    "FB_TO",
  ]
  args = "A new commit has been pushed. commit sha: {{ commit.sha }}"
}
```

Remove `args` to send the default message.

```
action "Send Default Message" {
  uses = "appleboy/facebook-action@master"
  secrets = [
    "FB_PAGE_TOKEN",
    "FB_VERIFY_TOKEN",
    "FB_TO",
  ]
}
```

<img src="images/facebook-workflow.png">

## Environment variables

* IMAGES - Optional. photo message
* AUDIOS - Optional. audio message
* VIDEOS - Optional. video message
* FILES - Optional. file message

### Example

```
action "Send photo message" {
  uses = "appleboy/facebook-action@master"
  secrets = [
    "FB_PAGE_TOKEN",
    "FB_VERIFY_TOKEN",
    "FB_TO",
  ]
  env = {
    IMAGES = "https://golang.org/doc/gopher/gophercolor.png"
  }
  args = "A new commit has been pushed."
}
```

## Secrets

Getting started with [Facebook Message Platform](https://developers.facebook.com/docs/messenger-platform/).

* `FB_PAGE_TOKEN`: Token is the access token of the Facebook page to send messages from..
* `FB_VERIFY_TOKEN`: The token used to verify facebook.
* `FB_TO`: Recipient is who the message was sent to (required).
* `APP_SECRET`: The app secret from the facebook developer portal.
* `FB_VERIFY`: verifying webhooks on the Facebook Developer Portal.

## Template variable

| Github Variable   | Telegram Template Variable |
|-------------------|----------------------------|
| GITHUB_REPOSITORY | repo                       |
| GITHUB_ACTOR      | repo.namespace             |
| GITHUB_SHA        | commit.sha                 |
| GITHUB_REF        | commit.ref                 |
| GITHUB_WORKFLOW   | github.workflow            |
| GITHUB_ACTION     | github.action              |
| GITHUB_EVENT_NAME | github.event.name          |
| GITHUB_EVENT_PATH | github.event.path          |
| GITHUB_WORKSPACE  | github.workspace           |
