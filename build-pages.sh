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