variable "namespaces_config" {
  type = map(object(
    {
      labels = object({
        l1 = string
        l2 = string
      })

      annotations = object({
        a1 = string
        a2 = string
      })
    }
  ))
  description = "Pools configuration"
}