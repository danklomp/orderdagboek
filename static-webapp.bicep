@description('Name of the Static Web App')
param staticWebAppName string = 'positiecalculator'

@description('Location for the Static Web App')
param location string = resourceGroup().location

@description('SKU for the Static Web App')
param sku string = 'Free'

resource staticWebApp 'Microsoft.Web/staticSites@2022-03-01' = {
  name: staticWebAppName
  location: location
  sku: {
    name: sku
    tier: sku
  }
  properties: {
    repositoryUrl: 'https://github.com/danklomp/orderdagboek'
    branch: 'main'
    buildProperties: {
      appLocation: 'app'
      apiLocation: 'api'
      outputLocation: 'build'
    }
  }
}

output staticWebAppUrl string = staticWebApp.properties.defaultHostname
