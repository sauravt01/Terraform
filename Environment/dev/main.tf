variable "rg" {

    type =map(object({
      name = string
        location = string
        managed_by = string
        tags = map(string)
    }))
}

module "resource_group" {
  
  source = "../../Azure_Resource_group"
rg =var.rg
 }
