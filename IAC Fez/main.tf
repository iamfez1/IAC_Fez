resource "azurerm_resource_group" "rg-appservice-eastus" {
  name     = "rg-appservice-eastus"
  location = "eastus"
}

resource "azurerm_app_service_plan" "app-fez" {
  name                = "app-fez"
  location            = azurerm_resource_group.rg-appservice-eastus.location
  resource_group_name = azurerm_resource_group.rg-appservice-eastus.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}
resource "azurerm_app_service" "app-fez-appservice" {
  name                = "app-fez-appservice"
  location            = azurerm_resource_group.rg-appservice-eastus.location
  resource_group_name = azurerm_resource_group.rg-appservice-eastus.name
  app_service_plan_id = azurerm_app_service_plan.app-fez.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}
