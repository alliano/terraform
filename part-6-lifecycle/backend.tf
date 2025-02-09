terraform {
  # jadi backed ini digunakan untuk menyimpan state, by default teraform menggunakna local namun kita bisa juga kalo
  # mau menyimpan nya di gcs atau s3 atapun pada object storeage lainya
  #   https://developer.hashicorp.com/terraform/language/backend/local
  backend "local" {
    path = "./backend/terraform.tfstate"
  }
}