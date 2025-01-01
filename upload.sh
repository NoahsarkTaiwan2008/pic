#!/bin/bash

git pull

echo "Uploading to GitHub..."

# 檢查是否在 Git 專案目錄內
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Error: This is not a Git repository. Exiting..."
    exit 1
fi

# 顯示當前分支
current_branch=$(git branch --show-current)
echo "Current branch: $current_branch"

# 檢查是否有變更需要提交
if [[ -z $(git status --porcelain) ]]; then
    echo "No changes to commit. Exiting..."
    exit 0
fi

# 添加變更
git add .
if [[ $? -ne 0 ]]; then
    echo "Error: Failed to stage changes. Exiting..."
    exit 1
fi

# 提交變更
git commit -m "update"
if [[ $? -ne 0 ]]; then
    echo "Error: Commit failed. Exiting..."
    exit 1
fi

# 推送變更
git push
if [[ $? -ne 0 ]]; then
    echo "Error: Push failed. Check your network or credentials."
    exit 1
fi

echo "Upload finished successfully!"
