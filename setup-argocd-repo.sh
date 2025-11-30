#!/bin/bash

# اسکریپت برای تنظیم repository در Git و Argo CD Application

if [ -z "$1" ]; then
    echo "استفاده: ./setup-argocd-repo.sh <REPO_URL>"
    echo "مثال: ./setup-argocd-repo.sh https://github.com/username/repo.git"
    exit 1
fi

REPO_URL="$1"

echo "تنظیم remote repository به: $REPO_URL"
git remote set-url origin "$REPO_URL"

echo "به‌روزرسانی argocd-application.yaml..."
sed -i "s|repoURL:.*|repoURL: $REPO_URL|g" argocd-application.yaml

echo "✓ تنظیمات انجام شد!"
echo ""
echo "برای commit و push تغییرات:"
echo "  git add argocd-application.yaml"
echo "  git commit -m 'Update Argo CD application with repo URL'"
echo "  git push origin master"
echo ""
echo "برای اعمال Application در Argo CD:"
echo "  kubectl apply -f argocd-application.yaml"

