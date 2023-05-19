terraform {
  backend "gcs" {
    bucket  = "managment-382811-bucket"
    prefix  = "terraform/state"
  }
}
