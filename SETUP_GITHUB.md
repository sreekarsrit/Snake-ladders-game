# Setting up GitHub Repository

## Option 1: Create Repository Manually (Easiest)

1. Go to https://github.com/new
2. Repository name: `Snake&Ladders-Game`
3. Description: "A classic Snake and Ladders game implementation using Python and Pygame"
4. Choose Public or Private
5. **DO NOT** initialize with README, .gitignore, or license (we already have these)
6. Click "Create repository"

Then run:
```powershell
cd "E:\Snake&Ladders-Game"
git push -u origin main
```

## Option 2: Use GitHub CLI (If Installed)

```powershell
gh repo create Snake&Ladders-Game --public --source=. --remote=origin --push
```

## Option 3: Use Personal Access Token

1. Create a token at: https://github.com/settings/tokens
2. Give it `repo` permissions
3. Run:
```powershell
$env:GITHUB_TOKEN = 'your-token-here'
powershell -ExecutionPolicy Bypass -File create_repo.ps1
git push -u origin main
```

