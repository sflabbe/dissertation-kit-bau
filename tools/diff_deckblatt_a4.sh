#!/bin/bash
# Visual diff script for A4 deckblatt comparison (legacy vs modern)
#
# Usage: ./diff_deckblatt_a4.sh
#
# Requirements:
# - pdflatex (for legacy)
# - lualatex (for modern)
# - pdftoppm (from poppler-utils)
# - imagemagick (for compare, optional)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "========================================="
echo "A4 Deckblatt Visual Diff Tool"
echo "========================================="

# Clean old artifacts
rm -f titlepage_legacy_a4.pdf titlepage_modern_a4.pdf
rm -f titlepage_legacy_a4.png titlepage_modern_a4.png
rm -f titlepage_diff.png

# Compile legacy (pdfLaTeX)
echo ""
echo "[1/4] Compiling legacy A4 deckblatt (pdfLaTeX)..."
pdflatex -interaction=nonstopmode titlepage_legacy_a4.tex > titlepage_legacy_a4.log 2>&1 || {
    echo "ERROR: pdflatex compilation failed. Check titlepage_legacy_a4.log"
    exit 1
}
echo "      ✓ titlepage_legacy_a4.pdf created"

# Compile modern (LuaLaTeX)
echo ""
echo "[2/4] Compiling modern A4 deckblatt (LuaLaTeX)..."
lualatex -interaction=nonstopmode titlepage_modern_a4.tex > titlepage_modern_a4.log 2>&1 || {
    echo "ERROR: lualatex compilation failed. Check titlepage_modern_a4.log"
    exit 1
}
echo "      ✓ titlepage_modern_a4.pdf created"

# Convert to PNG (200 DPI)
echo ""
echo "[3/4] Converting PDFs to PNG (200 DPI)..."
pdftoppm -png -r 200 -singlefile titlepage_legacy_a4.pdf titlepage_legacy_a4
pdftoppm -png -r 200 -singlefile titlepage_modern_a4.pdf titlepage_modern_a4
echo "      ✓ titlepage_legacy_a4.png"
echo "      ✓ titlepage_modern_a4.png"

# Compare with ImageMagick (if available)
echo ""
echo "[4/4] Visual comparison..."
if command -v compare &> /dev/null; then
    # ImageMagick compare: compute metric and generate diff image
    DIFF_METRIC=$(compare -metric AE titlepage_legacy_a4.png titlepage_modern_a4.png titlepage_diff.png 2>&1 || true)
    echo "      ImageMagick AE metric: $DIFF_METRIC pixels differ"
    echo "      ✓ titlepage_diff.png created (red = differences)"

    if [ "$DIFF_METRIC" -eq 0 ]; then
        echo ""
        echo "✅ PASS: Images are IDENTICAL (metric = 0)"
    elif [ "$DIFF_METRIC" -lt 1000 ]; then
        echo ""
        echo "⚠️  MINOR DIFF: $DIFF_METRIC pixels differ (likely font anti-aliasing)"
        echo "   This is acceptable if layout is visually correct."
    else
        echo ""
        echo "❌ FAIL: $DIFF_METRIC pixels differ (significant difference)"
        echo "   Review titlepage_diff.png to see differences."
    fi
else
    echo "      ImageMagick 'compare' not found (install with: apt-get install imagemagick)"
    echo "      Manual review required: compare titlepage_legacy_a4.png and titlepage_modern_a4.png"
fi

echo ""
echo "========================================="
echo "Output files:"
echo "  - titlepage_legacy_a4.pdf / .png"
echo "  - titlepage_modern_a4.pdf / .png"
if [ -f titlepage_diff.png ]; then
    echo "  - titlepage_diff.png (visual diff)"
fi
echo "========================================="
