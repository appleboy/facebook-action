workflow "Send Notification" {
  on = "push"
  resolves = [
    "Send Custom Message",
    "Send Default Message",
    "Send Photo Message",
  ]
}

action "Send Custom Message" {
  uses = "appleboy/facebook-action@master"
  secrets = [
    "FB_PAGE_TOKEN",
    "FB_VERIFY_TOKEN",
    "FB_TO",
  ]
  args = "A new commit has been pushed. commit: {{ commit.sha }}"
}

action "Send Default Message" {
  uses = "appleboy/facebook-action@master"
  secrets = [
    "FB_PAGE_TOKEN",
    "FB_VERIFY_TOKEN",
    "FB_TO",
  ]
}

action "Send Photo Message" {
  uses = "appleboy/facebook-action@master"
  env = {
    PHOTO = "tests/github.png"
  }
  secrets = [
    "FB_PAGE_TOKEN",
    "FB_VERIFY_TOKEN",
    "FB_TO",
  ]
  args = "send photo message."
}
