<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">   
  <UiMod name="AutoChannel" version="1.0.5" date="2021-03-08" >
    <Author name="Idrinth"/>
    <Description text="Automatically picks a channel from party, warband, scenario and scenariogroup" />      
    <VersionSettings gameVersion="1.4.8" />      
    <Dependencies>         
      <Dependency name="EA_ChatWindow" />         
      <Dependency name="LibSlash" />      
    </Dependencies>             
    <Files>         
      <File name="autochannel.lua" />   
    </Files>      
    <SavedVariables/>             
    <OnInitialize>         
      <CallFunction name="AutoChannel.Initialize" />      
    </OnInitialize>      
    <OnUpdate/>      
    <OnShutdown/>          
  </UiMod>
</ModuleFile>