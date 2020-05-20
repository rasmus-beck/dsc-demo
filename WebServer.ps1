Configuration WebServerConfiguration
{  
  # Requires Install-Module -Name xWebAdministration
  Import-DscResource -ModuleName 'PSDesiredStateConfiguration'  
  Import-DscResource -ModuleName 'xWebAdministration'

  WindowsFeature Web-Server {
    Name = "Web-Server"
    Ensure = "Present"
  }

  WindowsFeature Web-Mgmt-Tools {
    Name = "Web-Mgmt-Tools"
    Ensure = "Present"
  }
  
  WindowsFeature Web-Default-Doc {
    Name = "Web-Default-Doc"
    Ensure = "Present"
  }

  xIisLogging 'Logging'
  {
      LogPath = 'C:\IISLogFiles'
      LogCustomFields    = @(
          MSFT_xLogCustomField
          {
              LogFieldName = 'TraceId'
              SourceName   = 'X-TraceId'
              SourceType   = 'ResponseHeader'
          }
          MSFT_xLogCustomField
          {
              LogFieldName = 'ApplicationVersion'
              SourceName   = 'X-ApplicationVersion'
              SourceType   = 'ResponseHeader'
          }
      )
  }
}