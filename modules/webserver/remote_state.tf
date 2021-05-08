data "terraform_remote_state" "rds" {
  backend = "s3"
  config  = {
    bucket = var.remote_state["bucket"]
    key    = var.remote_state["key"]        #"${var.remote_state["workspace_key_prefix"]}/${var.env}/${var.remote_state["key"]}" 
    region = var.remote_state["region"]
   }                                                                      
  }