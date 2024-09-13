variable "config" {
  description = <<EOF
  Configuration for the Azure Storage Container.
  `container_name`: The name of the Azure Storage Container. This is the unique name that identifies the container within the storage account.
  `storage_account_name`: The name of the Azure Storage Account where the container will be created. This is the name of the storage account resource in Azure.
  `container_access_type`: The access type for the container. This can be one of the following values:
    - "private": The container and its blobs can only be accessed by the storage account owner.
    - "blob": The container and its blobs can be accessed anonymously over the Internet.
    - "container": The container can be listed anonymously over the Internet, but access to the blobs is restricted to the storage account owner.
  EOF
  type = object({
    container_name        = string
    storage_account_name  = string
    container_access_type = optional(string)
  })
}