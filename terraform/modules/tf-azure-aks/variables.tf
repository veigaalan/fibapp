variable "name" {
    description = "(Required) Specifies the name of the storage account. Changing this forces a new resource to be created."
    type = string
}

variable "location" {
    description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
    type = string
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type = string
  default = null  
}

variable "resource_group_name" {
  description = "Resource Group name."
  type = string
}

variable "service_principal_client_id" {
  description = "The Client ID of the Service Principal assigned to Kubernetes"
}

variable "service_principal_client_secret" {
  description = "The Client Secret of the Service Principal assigned to Kubernetes"
}
