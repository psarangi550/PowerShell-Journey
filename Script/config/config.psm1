function Application-Log-Start{
    [CmdletBinding()]
    Param(
        [Parameter()]
        [String]$format
    )
    $log_filename=".\report_"+$format+".log"
    Start-Transcript $log_filename -Append -NoClobber
}

function Application-Log-Stop{
    [CmdletBinding()]
    Param()
    Stop-Transcript
}
