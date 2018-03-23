<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="AzureCloudServiceDemo" generation="1" functional="0" release="0" Id="ee2d0dd5-bee4-4528-95c2-2f8a4d53cd07" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="AzureCloudServiceDemoGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="WebRoleDemo:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/LB:WebRoleDemo:Endpoint1" />
          </inToChannel>
        </inPort>
        <inPort name="WebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" protocol="tcp">
          <inToChannel>
            <lBChannelMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/LB:WebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="Certificate|WebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/MapCertificate|WebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
          </maps>
        </aCS>
        <aCS name="WebRoleDemo:APPINSIGHTS_INSTRUMENTATIONKEY" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/MapWebRoleDemo:APPINSIGHTS_INSTRUMENTATIONKEY" />
          </maps>
        </aCS>
        <aCS name="WebRoleDemo:AzureConnection" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/MapWebRoleDemo:AzureConnection" />
          </maps>
        </aCS>
        <aCS name="WebRoleDemo:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/MapWebRoleDemo:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="WebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/MapWebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" />
          </maps>
        </aCS>
        <aCS name="WebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/MapWebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" />
          </maps>
        </aCS>
        <aCS name="WebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/MapWebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" />
          </maps>
        </aCS>
        <aCS name="WebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/MapWebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" />
          </maps>
        </aCS>
        <aCS name="WebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/MapWebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" />
          </maps>
        </aCS>
        <aCS name="WebRoleDemoInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/MapWebRoleDemoInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:WebRoleDemo:Endpoint1">
          <toPorts>
            <inPortMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/WebRoleDemo/Endpoint1" />
          </toPorts>
        </lBChannel>
        <lBChannel name="LB:WebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput">
          <toPorts>
            <inPortMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/WebRoleDemo/Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" />
          </toPorts>
        </lBChannel>
        <sFSwitchChannel name="SW:WebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp">
          <toPorts>
            <inPortMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/WebRoleDemo/Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" />
          </toPorts>
        </sFSwitchChannel>
      </channels>
      <maps>
        <map name="MapCertificate|WebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" kind="Identity">
          <certificate>
            <certificateMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/WebRoleDemo/Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
          </certificate>
        </map>
        <map name="MapWebRoleDemo:APPINSIGHTS_INSTRUMENTATIONKEY" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/WebRoleDemo/APPINSIGHTS_INSTRUMENTATIONKEY" />
          </setting>
        </map>
        <map name="MapWebRoleDemo:AzureConnection" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/WebRoleDemo/AzureConnection" />
          </setting>
        </map>
        <map name="MapWebRoleDemo:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/WebRoleDemo/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapWebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/WebRoleDemo/Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" />
          </setting>
        </map>
        <map name="MapWebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/WebRoleDemo/Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" />
          </setting>
        </map>
        <map name="MapWebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/WebRoleDemo/Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" />
          </setting>
        </map>
        <map name="MapWebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/WebRoleDemo/Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" />
          </setting>
        </map>
        <map name="MapWebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/WebRoleDemo/Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" />
          </setting>
        </map>
        <map name="MapWebRoleDemoInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/WebRoleDemoInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="WebRoleDemo" generation="1" functional="0" release="0" software="C:\Sandbox\AzureCloudServiceDemo\AzureCloudServiceDemo\csx\Release\roles\WebRoleDemo" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
              <inPort name="Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" protocol="tcp" />
              <inPort name="Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" protocol="tcp" portRanges="3389" />
              <outPort name="WebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" protocol="tcp">
                <outToChannel>
                  <sFSwitchChannelMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/SW:WebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" />
                </outToChannel>
              </outPort>
            </componentports>
            <settings>
              <aCS name="APPINSIGHTS_INSTRUMENTATIONKEY" defaultValue="" />
              <aCS name="AzureConnection" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;WebRoleDemo&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;WebRoleDemo&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp&quot; /&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
            <storedcertificates>
              <storedCertificate name="Stored0Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" certificateStore="My" certificateLocation="System">
                <certificate>
                  <certificateMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/WebRoleDemo/Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
                </certificate>
              </storedCertificate>
            </storedcertificates>
            <certificates>
              <certificate name="Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
            </certificates>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/WebRoleDemoInstances" />
            <sCSPolicyUpdateDomainMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/WebRoleDemoUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/WebRoleDemoFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="WebRoleDemoUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="WebRoleDemoFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="WebRoleDemoInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="67cec8aa-6e68-435a-9c1b-0f3de82bc230" ref="Microsoft.RedDog.Contract\ServiceContract\AzureCloudServiceDemoContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="7742ee21-2cb1-4252-9f3c-237b86fb2d2b" ref="Microsoft.RedDog.Contract\Interface\WebRoleDemo:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/WebRoleDemo:Endpoint1" />
          </inPort>
        </interfaceReference>
        <interfaceReference Id="a99b3622-4fc7-4616-a277-a609f519d31d" ref="Microsoft.RedDog.Contract\Interface\WebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/AzureCloudServiceDemo/AzureCloudServiceDemoGroup/WebRoleDemo:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>