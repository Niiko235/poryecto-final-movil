# steps install dependencies 
- flutter clean
- flutter pub get 
- flutter pub upgrade


# Generate Apk 
- flutter apk --release

# Delete all branches except main
- git branch | grep -v "main" | xargs git branch -D

