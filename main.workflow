workflow "Create Record" {
  resolves = "publish"
}

action "create" {
  uses = "popperized/zenodo/create@master"
  secrets = ["ZENODO_API_TOKEN"]
  env = {
    ZENODO_METADATA_PATH = "./metadata.json"
  }
}

action "upload" {
  needs = "create"
  uses = "popperized/zenodo/upload@master"
  secrets = ["ZENODO_API_TOKEN"]
  env = {
    ZENODO_UPLOAD_PATH = "./files"
  }
}

action "publish" {
  needs="upload"
  uses = "popperized/zenodo/publish@master"
  secrets = [ "ZENODO_API_TOKEN" ]
}
