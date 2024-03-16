terraform {
  required_providers {
    heroku = {
      source  = "heroku/heroku"
      version = "~> 5.0"
    }
  }
}
provider "heroku" {
  api_key = var.heroku_api_key
}

resource "heroku_app" "test" {
  name   = "test-32165478965412345987564"
  region = "us"
}