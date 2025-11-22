# Push-Repo.ps1
# Stage, commit (if needed), and push changes to GitHub

# Path to your repo (update if needed)
$repoPath = "C:\Users\buche\repos\Cloud_Work\repos\Multi-Tier-App-Troubleshooting-Playground"

# Go to repo folder
Set-Location $repoPath

# Check for changes
$changes = git status --porcelain

if ($changes) {
    # Prompt for commit message
    $commitMessage = Read-Host "Changes detected. Enter commit message"

    # Stage all changes
    git add .

    # Commit changes
    git commit -m "$commitMessage"

    Write-Host "`n✅ Changes committed."
} else {
    Write-Host "`nNo changes to commit."
}

# Push to remote main branch
git push origin main

Write-Host "`n🚀 Repo successfully pushed to GitHub!"
