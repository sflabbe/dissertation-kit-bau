# Legacy DIN 1505 Dissertation Template (A4)

This is the **legacy A4 version** of the dissertation template using the **DIN 1505** bibliography standard with **pdflatex**.

## Features

- **Paper Size**: A4 (210mm × 297mm)
- **Bibliography Style**: DIN 1505 Part 2 (German standard from Jan. 1984)
- **Compiler**: pdfLaTeX
- **BibTeX Style**: `plaindin-upgraded.bst` (modified 2024 with bug fixes)
- **Citation Format**: Numeric, sorted alphabetically by author

## Bug Fixes in plaindin-upgraded.bst

The `plaindin-upgraded.bst` file includes the following fixes over the original `myplaindin.bst`:

1. **Fixed März macro**: Changed `{"M{\^^b a}rz"}` to `{"M{\"a}rz"}` for proper German umlaut rendering
2. **Separated URL/DOI/URN handling**:
   - `format.url` now only handles URL field with "URL: " prefix
   - `format.doi.urn` properly formats DOI with `https://doi.org/` and "DOI: " prefix
   - URN formatted with "URN: " prefix
   - No more duplicate output of DOI/URN when URL is also present
3. **Simplified begin.bib**: Removed complex `\doi` and `\Url` commands, keeping only simple `\providecommand{\url}[1]{\texttt{#1}}`
4. **Fixed format.article.crossref**: Corrected malformed LaTeX code in crossref formatting

## Compilation

To compile this dissertation, use the following sequence:

```bash
pdflatex -interaction=nonstopmode dissertation-a4
bibtex dissertation-a4
pdflatex -interaction=nonstopmode dissertation-a4
pdflatex -interaction=nonstopmode dissertation-a4
```

Or use a LaTeX IDE like TeXstudio, TeXmaker, or Overleaf with the build sequence set to:
- Main compiler: pdfLaTeX
- Bibliography tool: BibTeX

## File Structure

```
legacy-din1505-a4/
├── dissertation-a4.tex          # Main document file
├── dokOptions-a4.tex           # Package imports and settings
├── plaindin-upgraded.bst    # Fixed DIN 1505 bibliography style
└── content/                 # Content files
    ├── deckblatt-a4.tex    # Title page (A4)
    ├── abstract.tex        # German abstract
    ├── abstractEN.tex      # English abstract
    ├── acknowledgment.tex  # Acknowledgments
    ├── symbols.tex         # List of symbols and abbreviations
    ├── 1introduction.tex   # Chapter 1
    ├── 2stateoftheart.tex  # Chapter 2
    ├── 3descriptionproblem.tex  # Chapter 3
    ├── 4modeling.tex       # Chapter 4
    ├── 5simulations.tex    # Chapter 5
    ├── 6appliedexamples.tex # Chapter 6
    ├── 7summary.tex        # Chapter 7
    ├── 8ausblick.tex       # Chapter 8 (Outlook)
    ├── appendix.tex        # Appendix
    └── bibliography.bib    # Bibliography database
```

## Requirements

- **TeX Distribution**: TeX Live 2020+ or MiKTeX 2.9+
- **Compiler**: pdfLaTeX
- **Bibliography Tool**: BibTeX

## Notes

- This version is compatible with traditional pdfLaTeX workflows
- Uses natbib for citation management
- DIN 1505 is an older German standard; for modern projects, consider using the ISO 690 version
- The template uses A5 paper size by default; change to A4 in `dissertation-a4.tex` if needed

## When to Use This Version

Use this legacy A4 version if:
- Your institution requires DIN 1505 bibliography format
- You need compatibility with older LaTeX systems
- You prefer the traditional BibTeX workflow over Biblatex/Biber
- You're working with existing DIN 1505 bibliographies

For modern projects with ISO 690 standard and Unicode support, see the `modern-iso690/` directory.

## Deckblatt (Title Page) Geometry

The A4 deckblatt (title page) uses a **geometry override** to ensure consistent, symmetric layout regardless of document-wide settings like `bindingoffset` and `headheight`.

### Implementation Details

The title page applies `\newgeometry` at the beginning and `\restoregeometry` at the end:

```latex
\begin{titlepage}
\thispagestyle{empty}
\newgeometry{
  a4paper,
  left=25mm,
  right=25mm,
  top=25mm,
  bottom=25mm,
  bindingoffset=0mm,      % Centered physically on page
  includehead=false,      % No header space reserved
  includefoot=false,      % No footer space reserved
  headheight=0pt,
  headsep=0pt,
  footskip=0pt
}
% ... title page content ...
\restoregeometry
\end{titlepage}
```

### Why This Is Necessary

Without the geometry override, the title page would be affected by:
- **bindingoffset**: The document uses `bindingoffset=15mm` for double-sided printing, which would shift the title page content to the right
- **headheight/headsep**: Even though the title page uses `\thispagestyle{empty}`, the space for headers is still reserved in the text block, causing vertical drift

The override ensures:
1. ✅ Title page is always centered physically on the A4 page
2. ✅ Layout is stable regardless of document margin settings
3. ✅ Visual consistency between legacy (pdfLaTeX) and modern (LuaLaTeX) versions

### Testing

To verify title page alignment, use the testing tools in the `tools/` directory:

```bash
cd tools
./diff_deckblatt_a4.sh
```

This script compiles both legacy and modern title pages and creates a visual diff. See `tools/README.md` for details.
