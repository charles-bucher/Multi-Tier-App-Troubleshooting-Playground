# File: sequence_screenshots.ps1
# Purpose: Rename screenshots sequentially and generate README Markdown

# Path to screenshots folder
$folder = "C:\Users\buche\repos\Cloud_Work\REPOS\Multi-Tier-App-Troubleshooting-Playground\screenshots"
Set-Location $folder

# Map of descriptions for each screenshot (ordered by walkthrough)
$descriptionMap = @(
    "Login Failure - User login error",
    "Dashboard Timeout - Frontend EC2 failing to reach backend",
    "Error Logs Captured - CloudWatch logs showing DB connection errors",
    "API Response Failure - Lambda misfire / API error",
    "Recovery Validation - Login restored",
    "Recovery Validation - Dashboard restored",
    "Recovery Validation - Logs clean",
    "Iteration & Monitoring - API responses validated",
    "Iteration & Monitoring - Login screen",
    "Iteration & Monitoring - Dashboard screen",
    "Iteration & Monitoring - Error logs",
    "Final Cycle - API response validated",
    "Final Cycle - Login for final cycle",
    "Final Cycle - Dashboard for final cycle",
    "Final Cycle - Error logs for final cycle",
    "Final Cycle - API response for final cycle",
    "Final Cycle - Login test screenshot"
)

# Get all screenshots PNG files in folder
$screenshots = Get-ChildItem -Filter "*.png" | Sort-Object Name

if ($screenshots.Count -ne $descriptionMap.Count) {
    Write-Warning "Number of screenshots ($($screenshots.Count)) does not match number of descriptions ($($descriptionMap.Count)). Please check!"
}

# Prepare Markdown snippet
$markdown = ""

for ($i=0; $i -lt $screenshots.Count; $i++) {
    $num = "{0:D2}" -f ($i + 1)
    $oldName = $screenshots[$i].Name
    $desc = $descriptionMap[$i]
    $newName = "Multi_${num}_$($oldName.Substring(6))" # Keep descriptive part after old number

    # Rename using git mv so Git tracks changes
    git mv $oldName $newName

    # Append to Markdown snippet
    $markdown += "![${desc}](screenshots/$newName)`r`n"
    Write-Host "Renamed $oldName -> $newName"
}

# Commit changes
git commit -m "Sequentially rename screenshots and prepare for README"

# Push to GitHub
git push origin main

# Output Markdown snippet
$markdown | Out-File -FilePath "../screenshots_readme_snippet.md"
Write-Host "Markdown snippet written to screenshots_readme_snippet.md"
Write-Host "All screenshots renamed, committed, pushed, and snippet generated!"
