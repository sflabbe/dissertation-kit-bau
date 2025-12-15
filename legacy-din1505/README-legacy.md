# Legacy DIN 1505 Dissertation Template

This is the **legacy version** of the dissertation template using the **DIN 1505** bibliography standard with **pdflatex**.

## Features

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
pdflatex dissertation
bibtex dissertation
pdflatex dissertation
pdflatex dissertation
```

Or use a LaTeX IDE like TeXstudio, TeXmaker, or Overleaf with the build sequence set to:
- Main compiler: pdfLaTeX
- Bibliography tool: BibTeX

## File Structure

```
legacy-din1505/
├── dissertation.tex          # Main document file
├── dokOptions.tex           # Package imports and settings
├── plaindin-upgraded.bst    # Fixed DIN 1505 bibliography style
└── content/                 # Content files
    ├── deckblatt.tex       # Title page
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
- The template uses A5 paper size by default; change to A4 in `dissertation.tex` if needed

## When to Use This Version

Use this legacy version if:
- Your institution requires DIN 1505 bibliography format
- You need compatibility with older LaTeX systems
- You prefer the traditional BibTeX workflow over Biblatex/Biber
- You're working with existing DIN 1505 bibliographies

For modern projects with ISO 690 standard and Unicode support, see the `modern-iso690/` directory.
