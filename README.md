# 🚀 Facebook Notify for GitHub Actions

[GitHub Action](https://developer.github.com/actions/) for sending a Facebook notification message.

![facebook-message](./images/facebook-message.png)

## Usage

Send custom message and see the custom variable as blow.

```yml
name: facebook message
on: [push]
jobs:

  build:
    name: Build
    runs-on: ubuntu-latest
    steps:

    - name: send custom message
      uses: appleboy/facebook-action@master
      env:
        FB_PAGE_TOKEN: ${{ secrets.FB_PAGE_TOKEN }}
        FB_VERIFY_TOKEN: ${{ secrets.FB_VERIFY_TOKEN }}
        FB_TO: ${{ secrets.FB_TO }}
      with:
        args: The ${{ github.event_name }} event triggered this step.
```

Remove `args` to send the default message.

```yml
- name: send default message
  uses: appleboy/facebook-action@master
  env:
    FB_PAGE_TOKEN: ${{ secrets.FB_PAGE_TOKEN }}
    FB_VERIFY_TOKEN: ${{ secrets.FB_VERIFY_TOKEN }}
    FB_TO: ${{ secrets.FB_TO }}
```

![facebook-workflow](./images/facebook-workflow.png)

## Input variables

* images - Optional. photo message
* audios - Optional. audio message
* videos - Optional. video message
* files - Optional. file message

### Example

```yml
- name: send gopher image message
  uses: appleboy/facebook-action@master
  with:
    message: send photo message
    images: "https://golang.org/doc/gopher/gophercolor.png"
  env:
    FB_PAGE_TOKEN: ${{ secrets.FB_PAGE_TOKEN }}
    FB_VERIFY_TOKEN: ${{ secrets.FB_VERIFY_TOKEN }}
    FB_TO: ${{ secrets.FB_TO }}
```

## Secrets

Getting started with [Facebook Message Platform](https://developers.facebook.com/docs/messenger-platform/).

* `FB_PAGE_TOKEN`: Token is the access token of the Facebook page to send messages from..
* `FB_VERIFY_TOKEN`: The token used to verify facebook.
* `FB_TO`: Recipient is who the message was sent to (required).
* `APP_SECRET`: The app secret from the facebook developer portal.
* `FB_VERIFY`: verifying webhooks on the Facebook Developer Portal.

## Template variable

| Github Variable   | facebook Template Variable |
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
