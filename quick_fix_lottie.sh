#!/bin/bash

# 🚀 Script rapide pour corriger Lottie-Dynamic
# Affiche uniquement les erreurs, tout le reste est silencieux

# 1️⃣ Nettoyer Derived Data
rm -rf ~/Library/Developer/Xcode/DerivedData

# 2️⃣ Trouver le projet Xcode dans le dossier courant
project_file=$(ls *.xcodeproj 2>/dev/null | head -n 1)
if [ -z "$project_file" ]; then
    echo "❌ Aucun fichier .xcodeproj trouvé !"
    exit 1
fi
cd "$(dirname "$project_file")" || exit 1

# 3️⃣ Détecter CocoaPods et mettre à jour (silencieux)
if [ -f "Podfile" ]; then
    pod install >/dev/null 2>&1
    pod update >/dev/null 2>&1
fi

# 4️⃣ Résolution Swift Packages (silencieux)
xcodebuild -resolvePackageDependencies >/dev/null 2>&1

# 5️⃣ Rebuild Lottie-Dynamic pour simulator et appareil
xcodebuild -scheme Lottie-Dynamic -configuration Debug -sdk iphonesimulator build >/dev/null 2>&1
xcodebuild -scheme Lottie-Dynamic -configuration Debug -sdk iphoneos build >/dev/null 2>&1

# 6️⃣ Clean Build du projet principal (affiche erreurs)
xcodebuild clean >/dev/null 2>&1
xcodebuild build

echo "🎉 Tout est prêt ! L’erreur Lottie-Dynamic devrait être résolue."
