provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://192.168.122.111:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "d0a43b9f-a174-c908-e02a-7d5bb3a7ebce"
      secret_id = "6e4a2159-e301-6a4e-1ace-c9ecc76f573f"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv"
  name  = "test-secret"
}

resource "aws_instance" "server" {
  ami           = "ami-0ec10929233384c7f"
  instance_type = "t3.micro"

  tags = {
    secret = data.vault_kv_secret_v2.example.data["user"]
    }
}
