param sites_TestRetryAttribute_name string = 'TestRetryAttribute'
param serverfarms_ASP_TestRetryAttribute_25f1_externalid string = '/subscriptions/aa7ef1f4-c466-4538-b29e-24b79c9b41f2/resourceGroups/shared/providers/Microsoft.Web/serverfarms/ASP-TestRetryAttribute-25f1'

resource sites_TestRetryAttribute_name_resource 'Microsoft.Web/sites@2023-12-01' = {
  name: sites_TestRetryAttribute_name
  location: 'West Europe'
  kind: 'functionapp,linux'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: 'testretryattribute.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: 'testretryattribute.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_ASP_TestRetryAttribute_25f1_externalid
    reserved: true
    dnsConfiguration: {}
    siteConfig: {
      ftpsState: 'Disabled'
      numberOfWorkers: 1
      linuxFxVersion: 'DOTNET-ISOLATED|8.0'
      functionAppScaleLimit: 1
      minTlsVersion: '1.2'
    }
    httpsOnly: true
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
}

resource sites_TestRetryAttribute_name_sites_TestRetryAttribute_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2023-12-01' = {
  parent: sites_TestRetryAttribute_name_resource
  name: '${sites_TestRetryAttribute_name}.azurewebsites.net'
  properties: {
    siteName: 'TestRetryAttribute'
    hostNameType: 'Verified'
  }
}
