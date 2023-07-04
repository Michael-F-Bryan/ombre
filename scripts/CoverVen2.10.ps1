
#-------------------------------------------------------------#
#----Initial Declarations-------------------------------------#
#-------------------------------------------------------------#

Add-Type -AssemblyName PresentationCore, PresentationFramework

$Xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" Width="800" Height="600">
<Grid>
<Grid.ColumnDefinitions><ColumnDefinition Width="100"/><ColumnDefinition Width="250"/><ColumnDefinition Width="100"/>
<ColumnDefinition Width="250"/>
<ColumnDefinition Width="117*"/>
</Grid.ColumnDefinitions>
<Grid.RowDefinitions><RowDefinition Height="60"/><RowDefinition Height="45"/><RowDefinition Height="45"/><RowDefinition Height="45"/><RowDefinition Height="45"/><RowDefinition Height="45"/><RowDefinition Height="45"/><RowDefinition Height="45"/><RowDefinition Height="45"/><RowDefinition Height="45"/>
<RowDefinition Height="45"/>
<RowDefinition Height="45"/>
</Grid.RowDefinitions>
 <Border BorderBrush="Black" BorderThickness="0" Grid.Row="0" Grid.Column="0" Grid.ColumnSpan="5">
<StackPanel Background="#f5a623">

<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="CoverVen" Margin="0,0,0,0" FontSize="30"/>
<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="2.10 Designed by Jim Catelli , Built to Work wih RadioMobile" Margin="0,0,0,0" FontSize="10"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="1" Grid.Column="0">
<StackPanel>
<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="JobName" Margin="0,0,0,0" Name="LabJobName"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="2" Grid.Column="0">
<StackPanel>
<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="INC Longitude" Margin="0,0,0,0"/>
<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="Between 112 and 131" Margin="0,0,0,0" FontSize="10"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="3" Grid.Column="0">
<StackPanel>
<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="INC Latitude" Margin="0,0,0,0"/>
<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="Between -10 and -36" Margin="0,0,0,0" FontSize="10"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="1" Grid.Column="1">
<StackPanel>
<TextBox HorizontalAlignment="Left" VerticalAlignment="Top" Height="23" Width="225" TextWrapping="Wrap" Margin="0,0,0,0" Name="FieldJobName" Text="{Binding JobName}"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="2" Grid.Column="1">
<StackPanel>
<TextBox HorizontalAlignment="Left" VerticalAlignment="Top" Height="23" Width="225" TextWrapping="Wrap" Margin="0,0,0,0" Name="FieldLong" Text="{Binding Longitude}" ToolTip="between 112 and 130"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="3" Grid.Column="1">
<StackPanel>
<TextBox HorizontalAlignment="Left" VerticalAlignment="Top" Height="23" Width="225" TextWrapping="Wrap" Margin="0,0,0,0" Name="FieldLat" Text="{Binding Latitude}" ToolTip="-10 and -36"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="1" Grid.Column="2">
<StackPanel>
<Button Content="Run RM" HorizontalAlignment="Left" VerticalAlignment="Top" Width="95" Name="Run" Height="40"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="4" Grid.Column="0">
<StackPanel>
<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="CP Longitude" Margin="0,0,0,0"/>
<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="Between 112 and 131" Margin="0,0,0,0" FontSize="10"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="4" Grid.Column="1">
<StackPanel Margin="-3,1,3,-1">
<TextBox HorizontalAlignment="Left" VerticalAlignment="Top" Height="23" Width="0225" TextWrapping="Wrap" Margin="2,0,0,0" Text="{Binding CPLongitude}" Name="ljmdgq5j1f25y"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="5" Grid.Column="0">
<StackPanel>
<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="CP Latitude" Margin="0,0,0,0"/>
<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="Between -10 and -36" Margin="0,0,0,0" FontSize="10"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="5" Grid.Column="1">
<StackPanel>
<TextBox HorizontalAlignment="Left" VerticalAlignment="Top" Height="23" Width="225" TextWrapping="Wrap" Margin="0,0,0,0" Text="{Binding CPLatitude}" Name="ljmdgq5jy451t"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="6" Grid.Column="0">
<StackPanel>
<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="INC2 Longitude" Margin="0,0,0,0"/>
<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="Between 112 and 131" Margin="0,0,0,0" FontSize="10"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="6" Grid.Column="1">
<StackPanel>
<TextBox HorizontalAlignment="Left" VerticalAlignment="Top" Height="23" Width="225" TextWrapping="Wrap" Margin="0,0,0,0" Text="{Binding INC2Longitude}" Name="ljmdgq5j1l54t"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="7" Grid.Column="0">
<StackPanel>
<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="INC2 Latitude" Margin="0,0,0,0"/>
<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="Between -10 and -36" Margin="0,0,0,0" FontSize="10"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="7" Grid.Column="1">
<StackPanel>
<TextBox HorizontalAlignment="Left" VerticalAlignment="Top" Height="23" Width="225" TextWrapping="Wrap" Margin="0,0,0,0" Text="{Binding INC2Latitude}" Name="ljmdgq5jv2uta"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="8" Grid.Column="0">
<StackPanel>
<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="Base Gain" Margin="0,0,0,0"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="8" Grid.Column="1">
<StackPanel>
<TextBox HorizontalAlignment="Left" VerticalAlignment="Top" Height="23" Width="075" TextWrapping="Wrap" Margin="0,0,0,0" Text="{Binding BaseGain}" Name="ljmdgq5jifbxz"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="9" Grid.Column="0">
<StackPanel>
<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="Range" Margin="0,0,0,0"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="9" Grid.Column="1">
<StackPanel>
<TextBox HorizontalAlignment="Left" VerticalAlignment="Top" Height="23" Width="075" TextWrapping="Wrap" Margin="0,-1,0,0" Text="{Binding Range}" Name="ljmdgq5jfvd2u"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="10" Grid.Column="0">
<StackPanel>
<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="Resolution" Margin="0,0,0,0"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="10" Grid.Column="1">
<StackPanel>
<TextBox HorizontalAlignment="Left" VerticalAlignment="Top" Height="23" Width="75" TextWrapping="Wrap" Margin="0,-1,0,0" Text="{Binding Resolution}" Name="ljmdgq5jf5rw1"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="10" Grid.Column="2">
<StackPanel>

</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="10" Grid.Column="3">
<StackPanel>

</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="9" Grid.Column="2">
<StackPanel>

</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="9" Grid.Column="3">
<StackPanel>

</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="8" Grid.Column="2">

</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="8" Grid.Column="3">
<StackPanel>

</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="2" Grid.Column="2">
<StackPanel>

<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="Repeater Height" Height="16" Width="87"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="2" Grid.Column="3">
<StackPanel>

<TextBox HorizontalAlignment="Left" VerticalAlignment="Top" Height="32" Width="75" TextWrapping="Wrap" Text="{Binding RepeaterHeight}" Name="ljmdgq5jlkyzj"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="3" Grid.Column="2">
<StackPanel>

<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="Mobile Height" Height="16" Width="77"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="3" Grid.Column="3">
<StackPanel>
<TextBox HorizontalAlignment="Left" VerticalAlignment="Top" Height="32" Width="75" TextWrapping="Wrap" Text="{Binding MobileHeight}" Name="ljmdgq5jhciiv"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="4" Grid.Column="2">
<StackPanel>
<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="Optomistic" Height="16" Width="59"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="4" Grid.Column="3">
<StackPanel>
<CheckBox HorizontalAlignment="Left" VerticalAlignment="Top" Content="" IsChecked="{Binding optimism}" Height="32" Width="120" Name="ljmdgq5j0f9j7"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="5" Grid.Column="2">
<StackPanel>
<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="Frequency" Height="16" Width="56"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0" Grid.Row="5" Grid.Column="3">
<StackPanel>
<TextBox HorizontalAlignment="Left" VerticalAlignment="Top" Height="32" Width="75" TextWrapping="Wrap" Text="{Binding Frequency}" Name="ljmdgq5jdxepl"/>
</StackPanel>
</Border>
<Border BorderBrush="Black" BorderThickness="0">
</Border>
</Grid></Window>
"@

#-------------------------------------------------------------#
#----Control Event Handlers-----------------------------------#
#-------------------------------------------------------------#


#region Logic
#Write your code here
<#
{
{
    "JobName" : "",
    "Longitude" : "",
    "Latitude" : "",
    "RepeaterHeight" : "12",
    "MobileHeight" : "2",
    "optimism" : "True",
    "Frequency" : "174",
    "BaseGain" : "171",
    "Range" : "50",
    "Resolution" : "200",
    "WorkPath" : "C:\\WorkingDirectory\\",
    "RMPath" : "C:\\Radio_Mobile\\rmweng.exe",
    "SRTMPath" : "C:\\Radio_Mobile\\Geodata\\strm3\\"

             Invoke-RMShadGenerator `
         -JobName $JobName `
         -WorkingFolder $WorkingFolder `
         -Long $Long `
         -Lat $Lat `
         -BaseGain $BaseGain `
         -RepeaterAntennaHeight $RepeaterAntennaHeight `
         -MobileAntennaHeight $MobileAntennaHeight `
         -Freq $Freq `
         -Resolution $Resolution `
         -Range $Range `
         -SRTMPath $SRTMPath `
         -RMPath $RMPath `
         -Optomistic $State.Optimism


$JobName = $State.JobName
$Lat = [double]$State.Latitude
$Long = [double]$State.Longitude
$WorkingFolder = $State.WorkPath
$SRTMPath = $State.SRTMPath
$rmPath = $State.RMPath
$BaseGain = $State.BaseGain
$RepeaterAntennaHeight = $State.RepeaterHeight
$MobileAntennaHeight = $State.MobileHeight
$Freq = $State.Frequency
$Resolution = $State.Resolution
$Range = $State.Range



}

 Error Checking
Mandatory Fields (JobName,Long,Lat) - Done
Sanity Check LongLats - Done
Check Folders Exist
Disable Run button once pressed  Enable Reset button




     $wshell = New-Object -ComObject Wscript.Shell

$wshell.Popup("Operation Completed",0,"Done",0x1)

}



}
#>

$wshell = New-Object -ComObject Wscript.Shell


function Run-RadioMobile() {

    # When compiled with PS2EXE the variable $PSCommandPath contains no path anymore

    if ($MyInvocation.MyCommand.CommandType -eq "ExternalScript") {
        # Powershell script
        $LaunchPath = Split-Path -Parent $PSCommandPath
    }
    else {
        # PS2EXE compiled script
        $LaunchPath = Split-Path -Parent -Path ([Environment]::GetCommandLineArgs()[0])
    }

    Write-Host "Directory of executable file: " + $LaunchPath





    #Variable Rewrites

    $JobName = $State.JobName
    $Lat = [double]$State.Latitude
    $Long = [double]$State.Longitude
    $CPLat = [double]$State.CPLatitude
    $CPLong = [double]$State.CPLongitude
    $I2Lat = [double]$State.INC2Latitude
    $I2Long = [double]$State.INC2Longitude
    $WorkingFolder = "$LaunchPath" + "\WorkingDirectory\"
    $SRTMPath = "$LaunchPath" + "\Radio_Mobile\Geodata\strm3\"
    $rmPath = "$LaunchPath" + "\Radio_Mobile\rmweng.exe"
    $BaseGain = [double]$State.BaseGain
    $RepeaterAntennaHeight = [double]$State.RepeaterHeight
    $MobileAntennaHeight = [double]$State.MobileHeight
    $Freq = [double]$State.Frequency
    $Resolution = [int]$State.Resolution
    $Range = [int]$State.Range

    #Static
    [double]$LatMin = -9.0001
    [double]$LatMax = -37.0001
    [double]$LongMin = 111.0001
    [double]$LongMax = 131.0001



    #error checks

    #Mandatory Fields

    if ('' -match $State.JobName) {
        $MandatoryChecks = $False
        $wshell.Popup("Job Name Blank", 0, "Done", 0x1)
    }

    elseif ('' -eq $State.Longitude ) {
        $MandatoryChecks = $False
        $wshell.Popup("Longitude Blank", 0, "Done", 0x1)
    }

    elseif ('' -eq $State.Latitude) {
        $MandatoryChecks = $False
        $wshell.Popup("Latitude Blank", 0, "Done", 0x1)
    }
    else {
        $MandatoryChecks = $True
    }

    #LongLat Sanity



    if (($lat -le $LatMin) -and ($lat -ge $LatMax)) {
        $LatCheck = $True
    }
    else {
        $LatCheck = $false
        $wshell.Popup("Latitude Out of Bounds", 0, "Done", 0x1)
    }

    if (($Long -ge $LongMin) -and ($Long -le $LongMax)) {
        $LongCheck = $True
    }
    else {
        $LongCheck = $False
        $wshell.Popup("Longitude Out of Bounds", 0, "Done", 0x1)
    }

    if (($CPlat -le $LatMin) -and ($CPlat -ge $LatMax)) {
        $CPLatCheck = $True
    }
    else {
        $CPLatCheck = $false
        $wshell.Popup("Control Point Latitude Out of Bounds", 0, "Done", 0x1)
    }

    if (($CPLong -ge $LongMin) -and ($CPLong -le $LongMax)) {
        $CPLongCheck = $True
    }
    else {
        $CPLongCheck = $False
        $wshell.Popup("Control Point Longitude Out of Bounds", 0, "Done", 0x1)
    }

    if (($i2lat -le $LatMin) -and ($i2lat -ge $LatMax)) {
        $i2LatCheck = $True
    }
    else {
        $i2LatCheck = $false
        $wshell.Popup("Incident 2 Latitude Out of Bounds", 0, "Done", 0x1)
    }

    if (($i2Long -ge $LongMin) -and ($i2Long -le $LongMax)) {
        $i2LongCheck = $True
    }
    else {
        $i2LongCheck = $False
        $wshell.Popup("Incident 2 Longitude Out of Bounds", 0, "Done", 0x1)
    }


    ##Folder Checks
    #Check File Paths before running
    if ((Test-Path $WorkingFolder) -eq $false) {
        $WFFolderChecks = $False
        $LongCheck = $False
        $wshell.Popup("Working Path Not Found", 0, "Done", 0x1)
    }
    else {
        $WFFolderChecks = $True
    }


    if ((Test-Path $SRTMPath) -eq $false) {
        $SRTMFolderChecks = $False
        $LongCheck = $False
        $wshell.Popup("Invalid SRTM Path", 0, "Done", 0x1)
    }
    else {
        $SRTMFolderChecks = $True
    }


    if ((Test-Path $rmPath) -eq $false) {
        $RMFolderChecks = $False
        $LongCheck = $False
        $wshell.Popup("Invalid Radio Mobile Path", 0, "Done", 0x1)
    }

    else {
        $RMFolderChecks = $True
    }


    if (test-path $WorkingFolder$JobName.kml) {
        $JobFolderChecks = $False
        $LongCheck = $False
        $wshell.Popup("Jobname already exists, change the Job Name", 0, "Done", 0x1)
    }
    else {
        $JobFolderChecks = $True

    }

    if (($SRTMFolderChecks = $True) -and ($JobFolderChecks = $True) -and ($RMFolderChecks = $True) -and ($WFFolderChecks = $True)) {
        $FolderChecks = $True
    }
    else {}


    if (($LongCheck -eq $True) -and ($LatCheck -eq $True) -and ($MandatoryChecks -eq $True) -and ($FolderChecks = $True)) {
        Write-Host "Running"



        $ExistingRadioMobileInst = Get-Process -Name rmweng -ErrorAction SilentlyContinue

        Invoke-RMShadGenerator -JobName $JobName"-I" -WorkingFolder $WorkingFolder -Long $Long -Lat $Lat -BaseGain $BaseGain -RepeaterAntennaHeight $MobileAntennaHeight -MobileAntennaHeight $RepeaterAntennaHeight -Freq $Freq -Resolution $Resolution -Range $Range -SRTMPath $SRTMPath -RMPath $RMPath -Colour "Blue"
        Invoke-RMShadGenerator -JobName $JobName"-CP" -WorkingFolder $WorkingFolder -Long $CPLong -Lat $CPLat -BaseGain $BaseGain -RepeaterAntennaHeight $MobileAntennaHeight -MobileAntennaHeight $RepeaterAntennaHeight -Freq $Freq -Resolution $Resolution -Range $Range -SRTMPath $SRTMPath -RMPath $RMPath -Colour "Green"
        Invoke-RMShadGenerator -JobName $JobName"-I2" -WorkingFolder $WorkingFolder -Long $I2Long -Lat $I2Lat -BaseGain $BaseGain -RepeaterAntennaHeight $MobileAntennaHeight -MobileAntennaHeight $RepeaterAntennaHeight -Freq $Freq -Resolution $Resolution -Range $Range -SRTMPath $SRTMPath -RMPath $RMPath -Colour "Pink"

        $wshell.Popup("Running", 0, "Done", 0x1)

        $CurrentRadioMobileInst = Get-Process -Name rmweng
        while (($CurrentRadioMobileInst | where-object ID -notin $ExistingRadioMobileInst.ID) -ne $null) {
            Write-Host "RadioMobile Is still running"
            Start-Sleep -Seconds 5
            $CurrentRadioMobileInst = Get-Process -Name rmweng -ErrorAction SilentlyContinue
        }
        Write-Host "Cleaning Up"
        New-Item -ItemType Directory -Path "$WorkingFolder\$JobName"
        Get-ChildItem "$WorkingFolder$Jobname-CP" | Move-Item -Destination "$WorkingFolder$Jobname"
        Get-ChildItem "$WorkingFolder$Jobname-I" | Move-Item -Destination "$WorkingFolder$Jobname"
        Get-ChildItem "$WorkingFolder$Jobname-I2" | Move-Item -Destination "$WorkingFolder$Jobname"
        Remove-Item "$WorkingFolder$Jobname-CP" -recurse
        Remove-Item "$WorkingFolder$Jobname-I" -recurse
        Remove-Item "$WorkingFolder$Jobname-I2" -recurse
        Remove-Item "$WorkingFolder$Jobname\*.*" -Exclude *.kml, *.png, *.txt
        Invoke-Item $WorkingFolder
        Write-Host "Done"


    }

    else {
        Write-Host "ShizBroke"


    }
}

#endregion
#region RadioMobileScript

function Invoke-RMShadGenerator {
    [CmdletBinding()]
    param (
        [PSDefaultValue(Help = 171)]
        $BaseGain = 171,
        [PSDefaultValue(Help = 12)]
        $RepeaterAntennaHeight = 12,
        [PSDefaultValue(Help = 2)]
        $MobileAntennaHeight = 2,
        [PSDefaultValue(Help = 174)]
        $Freq = 174,
        [PSDefaultValue(Help = 200)]
        $Resolution = 200,
        [PSDefaultValue(Help = 50)]
        $Range = 50,
        [PSDefaultValue(Help = 'C:\Radio_Mobile\Geodata\strm3\')]
        [string]$SRTMPath = "C:\Radio_Mobile\Geodata\strm3\",
        [PSDefaultValue(Help = 'C:\Radio_Mobile\rmweng.exe')]
        [string]$RMPath = "C:\Radio_Mobile\rmweng.exe",
        [PSDefaultValue(Help = 'False')]
        [string]$Optomistic = "False",
        [string]$Colour,

        [Parameter(Mandatory)]
        [string]$JobName,
        [Parameter(Mandatory)]
        [string]$WorkingFolder,
        [Parameter(Mandatory)]
        $Long,
        [Parameter(Mandatory)]
        $Lat
    )

    $ColourOptions = @(
        [PSCustomObject]@{
            Name  = 'Yellow'
            Value = "00ffff"
        }
        [PSCustomObject]@{
            Name  = 'Orange'
            Value = "0080ff"
        }
        [PSCustomObject] {
            Name = 'Red'
            Value = "0000ff"
        }
        [PSCustomObject]@{
            Name  = 'PaleGreen'
            Value = "008000"
        }
        [PSCustomObject]@{
            Name  = 'Green'
            Value = "00ff00"
        }
        [PSCustomObject]@{
            Name  = 'Blue'
            Value = "ff0000"
        }
        [PSCustomObject]@{
            Name  = 'Purple'
            Value = "800080"
        }
        [PSCustomObject]@{
            Name  = 'Pink'
            Value = "ff00ff"
        }
        [PSCustomObject]@{
            Name  = 'Brown'
            Value = "a52a2a"
        }
        [PSCustomObject]@{
            Name  = 'Black'
            Value = "000000"
        }
        [PSCustomObject]@{
            Name  = 'Grey'
            Value = "808080"
        }
    )

    $GainLevels = @(
        [PSCustomObject]@{
            Level  = '-Vehicle-Baseline'
            Value  = $BaseGain
            Colour = "00ffff" #Yellow
        }
        [PSCustomObject]@{
            Level  = '-Vehicle-Realistic'
            Value  = $BaseGain - 5
            Colour = "0080ff" #Orange
        }
        [PSCustomObject]@{
            Level  = '-Handheld'
            Value  = $BaseGain - 10
            Colour = "0000ff" #Red
        }
    )

    if ($Optomistic -eq "True") {
        $GainLevels += @(
            [PSCustomObject]@{
                Level  = '-Optimistic'
                Value  = $BaseGain + 5
                Colour = "008000" #Pale Green
            }
        )
    }

    if ($Colour -ne '') {
        $SelectedColour = $ColourOptions | Where-Object { $_.Name -eq $Colour }
        $GainLevels = @(
            [PSCustomObject]@{
                Level  = '-Cov'
                Value  = $BaseGain
                Colour = $SelectedColour.Value
            }
        )
    }

    $JobFolder = $WorkingFolder + $JobName
    New-Item -ItemType Directory -Path $JobFolder
    $TXTPath = "$JobFolder\$JobName.txt"
    $WorkingFolder = "$JobFolder\"

    ForEach ($Gain in $GainLevels) {
        $Record = [ordered] @{
            PictureFile           = $WorkingFolder + $JobName + $Gain.Level + '.png'
            SystemGain            = $Gain.Value
            AntennaFile           = 'omni.ant'
            AntennaAzimuth        = 0
            AntennaTilt           = 0
            RepeaterAntennaHeight = $RepeaterAntennaHeight
            ElevationASL          = 0
            MobileAntennaHeight   = $MobileAntennaHeight
            Frequency             = $Freq
            Latitude              = $Lat
            Longitude             = $Long
            MapResolution         = $Resolution
            MaximumRange          = $Range
            Colour                = $Gain.Colour
            SRTMPath              = $SRTMPath
            LandcoverPath         = ''
            TXPwr4SigFile         = 0
            LandHeightDat         = ''
            PercentageVariability = 100
        }
        New-Object  -TypeName PSCustomObject -Property $Record | Export-Csv -Delimiter "`t" -Path "$WorkingFolder$JobName.txt" -Append -NoTypeInformation

        #New-Object  -TypeName PSCustomObject -Property $Record | ConvertTo-Csv -notypeinformation -Delimiter "`t" | % {$_ -replace '"',''} | Out-File   -Path "$WorkingFolder$JobName.txt" -Append
    }
    $OutputCSV = Get-Content "$WorkingFolder$JobName.txt"
    $OutputCSV | ForEach-Object { $_ -replace '"', '' } | Out-File "$WorkingFolder$JobName.txt" -Force -Confirm:$false -Encoding utf8

    ForEach ($Gain in $GainLevels) {
        Start-Process -FilePath $RMPath -WorkingDirectory "C:\Radio_Mobile\" -ArgumentList "$TXTPath"
    }

    #KML Generator.

    $KML = @"
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
  <Placemark>
    <name>$JobName</name>
    <description>$JobName Repeater Located at $Long,$Lat</description>
    <Point>
      <coordinates>$Long,$Lat,0</coordinates>
    </Point>
  </Placemark>
</kml>
"@

    New-Item  $WorkingFolder$JobName.kml
    Set-Content -Path $WorkingFolder$JobName.kml -Value $KML
}

#endregion


#-------------------------------------------------------------#
#----Script Execution-----------------------------------------#
#-------------------------------------------------------------#

$Window = [Windows.Markup.XamlReader]::Parse($Xaml)

[xml]$xml = $Xaml

$xml.SelectNodes("//*[@Name]") | ForEach-Object { Set-Variable -Name $_.Name -Value $Window.FindName($_.Name) }


$Run.Add_Click({ Run-RadioMobile $this $_ })

$State = [PSCustomObject]@{}


Function Set-Binding {
    Param($Target, $Property, $Index, $Name, $UpdateSourceTrigger)

    $Binding = New-Object System.Windows.Data.Binding
    $Binding.Path = "[" + $Index + "]"
    $Binding.Mode = [System.Windows.Data.BindingMode]::TwoWay
    if ($UpdateSourceTrigger -ne $null) { $Binding.UpdateSourceTrigger = $UpdateSourceTrigger }


    [void]$Target.SetBinding($Property, $Binding)
}

function FillDataContext($props) {

    For ($i = 0; $i -lt $props.Length; $i++) {

        $prop = $props[$i]
        $DataContext.Add($DataObject."$prop")

        $getter = [scriptblock]::Create("Write-Output `$DataContext['$i'] -noenumerate")
        $setter = [scriptblock]::Create("param(`$val) return `$DataContext['$i']=`$val")
        $State | Add-Member -Name $prop -MemberType ScriptProperty -Value  $getter -SecondValue $setter

    }
}



$DataObject = ConvertFrom-Json @"

{
    "JobName" : "",
    "Longitude" : "",
    "Latitude" : "",
    "CPLongitude" : "",
    "CPLatitude" : "",
    "INC2Longitude" : "",
    "INC2Latitude" : "",
    "RepeaterHeight" : "12",
    "MobileHeight" : "2",
    "optimism" : "True",
    "Frequency" : "174",
    "BaseGain" : "171",
    "Range" : "50",
    "Resolution" : "200",
    "WorkPath" : "C:\\WorkingDirectory\\",
    "RMPath" : "C:\\Radio_Mobile\\rmweng.exe",
    "SRTMPath" : "C:\\Radio_Mobile\\Geodata\\strm3\\"

}

"@

$DataContext = New-Object System.Collections.ObjectModel.ObservableCollection[Object]
FillDataContext @("JobName", "Longitude", "Latitude", "CPLongitude", "CPLatitude", "INC2Longitude", "INC2Latitude", "RepeaterHeight", "MobileHeight", "optimism", "Frequency", "BaseGain", "Range", "Resolution", "WorkPath", "RMPath", "SRTMPath")

$Window.DataContext = $DataContext
Set-Binding -Target $FieldJobName -Property $([System.Windows.Controls.TextBox]::TextProperty) -Index 0 -Name "JobName"
Set-Binding -Target $FieldLong -Property $([System.Windows.Controls.TextBox]::TextProperty) -Index 1 -Name "Longitude"
Set-Binding -Target $FieldLat -Property $([System.Windows.Controls.TextBox]::TextProperty) -Index 2 -Name "Latitude"
Set-Binding -Target $ljmdgq5j1f25y -Property $([System.Windows.Controls.TextBox]::TextProperty) -Index 3 -Name "CPLongitude"
Set-Binding -Target $ljmdgq5jy451t -Property $([System.Windows.Controls.TextBox]::TextProperty) -Index 4 -Name "CPLatitude"
Set-Binding -Target $ljmdgq5j1l54t -Property $([System.Windows.Controls.TextBox]::TextProperty) -Index 5 -Name "INC2Longitude"
Set-Binding -Target $ljmdgq5jv2uta -Property $([System.Windows.Controls.TextBox]::TextProperty) -Index 6 -Name "INC2Latitude"
Set-Binding -Target $ljmdgq5jifbxz -Property $([System.Windows.Controls.TextBox]::TextProperty) -Index 11 -Name "BaseGain"
Set-Binding -Target $ljmdgq5jfvd2u -Property $([System.Windows.Controls.TextBox]::TextProperty) -Index 12 -Name "Range"
Set-Binding -Target $ljmdgq5jf5rw1 -Property $([System.Windows.Controls.TextBox]::TextProperty) -Index 13 -Name "Resolution"
Set-Binding -Target $ljmdgq5jlkyzj -Property $([System.Windows.Controls.TextBox]::TextProperty) -Index 7 -Name "RepeaterHeight"
Set-Binding -Target $ljmdgq5jhciiv -Property $([System.Windows.Controls.TextBox]::TextProperty) -Index 8 -Name "MobileHeight"
Set-Binding -Target $ljmdgq5j0f9j7 -Property $([System.Windows.Controls.CheckBox]::IsCheckedProperty) -Index 9 -Name "optimism"
Set-Binding -Target $ljmdgq5jdxepl -Property $([System.Windows.Controls.TextBox]::TextProperty) -Index 10 -Name "Frequency"
$Window.ShowDialog()


