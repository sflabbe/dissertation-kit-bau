# Tools Directory

This directory contains testing and debugging tools for the dissertation template.

## Files

### Titlepage Harness Files

- **`titlepage_legacy_a4.tex`**: Minimal standalone file to compile ONLY the legacy A4 deckblatt
- **`titlepage_modern_a4.tex`**: Minimal standalone file to compile ONLY the modern A4 deckblatt

These harness files are useful for quick testing of titlepage layout changes without compiling the entire dissertation.

### Visual Diff Script

- **`diff_deckblatt_a4.sh`**: Automated visual comparison tool

## Usage

### Compiling Individual Titlepages

```bash
cd tools

# Legacy A4 (pdfLaTeX)
pdflatex titlepage_legacy_a4.tex

# Modern A4 (LuaLaTeX)
lualatex titlepage_modern_a4.tex
```

### Running Visual Comparison

Requirements:
- `pdflatex` (for legacy)
- `lualatex` (for modern)
- `pdftoppm` (from poppler-utils package)
- `imagemagick` (optional, for pixel-by-pixel comparison)

Install on Ubuntu/Debian:
```bash
sudo apt-get install texlive-full poppler-utils imagemagick
```

Run the comparison:
```bash
cd tools
./diff_deckblatt_a4.sh
```

The script will:
1. Compile both titlepages
2. Convert PDFs to PNG at 200 DPI
3. Compare images using ImageMagick (if available)
4. Report differences

Output files:
- `titlepage_legacy_a4.pdf` / `.png`
- `titlepage_modern_a4.pdf` / `.png`
- `titlepage_diff.png` (visual diff with differences highlighted in red)

### Interpreting Results

- **AE metric = 0**: Perfect match (unlikely due to font rendering differences)
- **AE metric < 1000**: Minor differences (typically font anti-aliasing), acceptable
- **AE metric > 1000**: Significant layout differences, review required

## Purpose

These tools verify that the modern A4 deckblatt (LuaLaTeX) matches the legacy A4 deckblatt (pdfLaTeX) layout despite:
- Different LaTeX engines (pdfLaTeX vs LuaLaTeX)
- Different font rendering (mathptmx/phv vs TeX Gyre Termes/Heros)
- Potential geometry drift from bindingoffset and header/footer spacing

The `\newgeometry` fix in both deckblatt files ensures stable, symmetric layout regardless of document-wide geometry settings.
