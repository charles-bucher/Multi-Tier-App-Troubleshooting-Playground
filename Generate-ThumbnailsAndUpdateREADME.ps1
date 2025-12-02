# Paths
$repoPath = "C:\Users\buche\repos\Cloud_Work\REPOS\Multi-Tier-App-Troubleshooting-Playground"
$screenshotsPath = Join-Path $repoPath "screenshots"
$thumbPath = Join-Path $screenshotsPath "thumb"
$readmePath = Join-Path $repoPath "README.md"

# Create thumbnail folder if it doesn't exist
if (!(Test-Path $thumbPath)) { New-Item -ItemType Directory -Path $thumbPath }

# Get all images in screenshots folder (exclude thumbnails folder)
$images = Get-ChildItem $screenshotsPath -Include *.png,*.jpg -Recurse | Where-Object { $_.FullName -notlike "*\thumb\*" }

# Resize images to thumbnails (200px width) and save in thumb folder
foreach ($img in $images) {
    $thumbFile = Join-Path $thumbPath $img.Name
    $image = [System.Drawing.Image]::FromFile($img.FullName)
    $ratio = $image.Height / $image.Width
    $thumbWidth = 200
    $thumbHeight = [math]::Round($thumbWidth * $ratio)
    $thumb = New-Object System.Drawing.Bitmap $thumbWidth, $thumbHeight
    $graphics = [System.Drawing.Graphics]::FromImage($thumb)
    $graphics.DrawImage($image, 0, 0, $thumbWidth, $thumbHeight)
    $thumb.Save($thumbFile)
    $graphics.Dispose()
    $thumb.Dispose()
    $image.Dispose()
}

# Update README.md
$readme = Get-Content $readmePath

$startMarker = "<!-- SCREENSHOT-GALLERY-START -->"
$endMarker = "<!-- SCREENSHOT-GALLERY-END -->"

$galleryLines = @()
$galleryLines += $startMarker
foreach ($img in $images) {
    $fileName = $img.Name
    $galleryLines += "[![${fileName}](screenshots/thumb/$fileName)](screenshots/$fileName)"
}
$galleryLines += $endMarker

if ($readme -match "$startMarker(.|\n)*?$endMarker") {
    $readme = [regex]::Replace($readme, "$startMarker(.|\n)*?$endMarker", ($galleryLines -join "`n"))
} else {
    $readme += "`n" + ($galleryLines -join "`n")
}

$readme | Set-Content $readmePath

Write-Host "Thumbnails generated and README.md updated successfully!"
