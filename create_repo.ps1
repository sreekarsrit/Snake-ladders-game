# Script to create GitHub repository
$repoName = "Snake&Ladders-Game"
$username = "sreekar"
$description = "A classic Snake and Ladders game implementation using Python and Pygame"

# Check for GitHub token
$token = $env:GITHUB_TOKEN
if (-not $token) {
    Write-Host "GitHub token not found in environment variables." -ForegroundColor Yellow
    Write-Host "Please create a Personal Access Token at: https://github.com/settings/tokens" -ForegroundColor Yellow
    Write-Host "Then set it as: `$env:GITHUB_TOKEN = 'your-token-here'" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Or you can create the repository manually at: https://github.com/new" -ForegroundColor Yellow
    Write-Host "Repository name: $repoName" -ForegroundColor Cyan
    exit 1
}

# Create repository via GitHub API
$body = @{
    name = $repoName
    description = $description
    private = $false
} | ConvertTo-Json

$headers = @{
    Authorization = "token $token"
    Accept = "application/vnd.github.v3+json"
}

try {
    $response = Invoke-RestMethod -Uri "https://api.github.com/user/repos" -Method Post -Body $body -Headers $headers
    Write-Host "Repository created successfully!" -ForegroundColor Green
    Write-Host "Repository URL: $($response.html_url)" -ForegroundColor Cyan
    return $true
} catch {
    Write-Host "Error creating repository: $($_.Exception.Message)" -ForegroundColor Red
    if ($_.Exception.Response.StatusCode -eq 401) {
        Write-Host "Authentication failed. Please check your GitHub token." -ForegroundColor Red
    } elseif ($_.Exception.Response.StatusCode -eq 422) {
        Write-Host "Repository might already exist or name is invalid." -ForegroundColor Yellow
    }
    return $false
}

