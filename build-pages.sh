if [ -d ".github/.pages" ]; then
    rm -rf ".github/.pages"
    echo "Cleaned up existing documentation directory"
fi

if [ -d ".build" ]; then
    rm -rf ".build"
    echo "Cleaned up existing build directory"
fi

mkdir -p .github/.pages

swift package --allow-writing-to-directory .github/.pages \
generate-documentation \
--disable-indexing \
--transform-for-static-hosting \
--hosting-base-path GeoMagSwift \
--output-path .github/.pages

if [ $? -ne 0 ]; then
    echo "Error: Failed to generate documentation"
    exit 1
fi

cat > .github/.pages/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Redirecting...</title>
</head>
<body>
    <script>
        window.location.href = './documentation/geomagswift';
    </script>
</body>
</html>
EOF
