# Modern ISO 690 Dissertation Template (A4)

This is the **modern A4 version** of the dissertation template using the **ISO 690** bibliography standard with **LuaLaTeX/XeLaTeX** and **biblatex-iso690**.

## Features

- **Paper Size**: A4 (210mm × 297mm)
- **Bibliography Style**: ISO 690 (international standard)
- **Compiler**: LuaLaTeX or XeLaTeX
- **Bibliography Tool**: Biber (with biblatex-iso690)
- **Citation Format**: Numeric (iso-numeric style)
- **Font Support**: Full Unicode support with fontspec
- **Math Fonts**: Unicode-math for modern mathematical typesetting

## Advantages Over Legacy Version

1. **Modern Standards**: ISO 690 is the current international standard for bibliographic references
2. **Unicode Support**: Native UTF-8 encoding, no issues with special characters
3. **Advanced Bibliography**: Biblatex provides much more flexibility than BibTeX
4. **Better Font Handling**: fontspec allows easy use of any system font
5. **Automatic Field Mapping**: Legacy `lastchecked` field automatically converts to `urldate`

## Compilation

To compile this dissertation, use the following sequence:

```bash
lualatex -interaction=nonstopmode dissertation-modern-a4
biber dissertation-modern-a4
lualatex -interaction=nonstopmode dissertation-modern-a4
lualatex -interaction=nonstopmode dissertation-modern-a4
```

**Alternative with XeLaTeX:**

```bash
xelatex -interaction=nonstopmode dissertation-modern-a4
biber dissertation-modern-a4
xelatex -interaction=nonstopmode dissertation-modern-a4
xelatex -interaction=nonstopmode dissertation-modern-a4
```

Or use a LaTeX IDE like TeXstudio with:
- Main compiler: LuaLaTeX (or XeLaTeX)
- Bibliography tool: Biber

**Important**: Do NOT use pdfLaTeX with this version - it requires LuaLaTeX or XeLaTeX!

## File Structure

```
modern-iso690-a4/
├── dissertation-modern-a4.tex   # Main document file (A4)
├── dokOptions-modern-a4.tex     # Modern package imports and settings (A4)
└── content/                     # Content files
    ├── deckblatt-a4.tex     # Title page (A4)
    ├── abstract.tex         # German abstract
    ├── abstractEN.tex       # English abstract
    ├── acknowledgment.tex   # Acknowledgments
    ├── symbols.tex          # List of symbols and abbreviations
    ├── 1introduction.tex    # Chapter 1
    ├── 2stateoftheart.tex   # Chapter 2
    ├── 3descriptionproblem.tex   # Chapter 3
    ├── 4modeling.tex        # Chapter 4
    ├── 5simulations.tex     # Chapter 5
    ├── 6appliedexamples.tex # Chapter 6
    ├── 7summary.tex         # Chapter 7
    ├── 8ausblick.tex        # Chapter 8 (Outlook)
    ├── appendix.tex         # Appendix
    └── bibliography.bib     # Bibliography database
```

## Requirements

- **TeX Distribution**: TeX Live 2020+ or MiKTeX 2.9+
- **Compiler**: LuaLaTeX or XeLaTeX
- **Bibliography Tool**: Biber
- **Package**: biblatex-iso690 (usually included in full TeX distributions)

## Biblatex-iso690 Configuration

The template uses the following biblatex-iso690 settings:

```latex
\usepackage[
  backend=biber,          % Use Biber backend
  style=iso-numeric,      % ISO 690 numeric citation style
  sorting=nyt,            % Sort by name, year, title
  autolang=hyphen,        % Automatic language switching
  bibencoding=UTF8,       % UTF-8 encoding for bibliography
  doi=true,               % Include DOI
  url=true,               % Include URL
  isbn=false,             % Don't include ISBN
  maxbibnames=99,         % Show all authors
  minbibnames=99          % Show all authors
]{biblatex}
```

### Source Mapping for Legacy Compatibility

The template includes automatic field mapping to handle legacy BibTeX files:

```latex
\DeclareSourcemap{
  \maps[datatype=bibtex]{
    \map{
      \step[fieldsource=lastchecked]
      \step[fieldset=urldate, origfieldval]
    }
  }
}
```

This converts the old `lastchecked` field (used in DIN 1505) to the standard `urldate` field used by biblatex.

## Font Customization

The template uses Latin Modern fonts by default. You can easily change to other fonts in `dokOptions-modern.tex`:

```latex
% Example: Use Times-like fonts
\setmainfont{TeX Gyre Termes}
\setsansfont{TeX Gyre Heros}
\setmonofont{TeX Gyre Cursor}
\setmathfont{TeX Gyre Termes Math}

% Example: Use system fonts (if installed)
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}
```

## Language Support

The template uses **polyglossia** for language management (optimized for LuaLaTeX/XeLaTeX):

```latex
\usepackage{polyglossia}
\setmainlanguage{english}
\setotherlanguage{german}
```

Alternative: You can use **babel** instead by uncommenting the babel line in `dokOptions-modern.tex`.

## When to Use This Version

Use this modern version if:
- Your institution accepts or requires ISO 690 bibliography format
- You want modern Unicode support and better font handling
- You need advanced bibliography features (multiple bibliographies, filtering, etc.)
- You're starting a new project (recommended for all new dissertations)
- You want to use modern system fonts

For projects requiring DIN 1505 format or compatibility with older LaTeX systems, see the `legacy-din1505/` directory.

## Troubleshooting

### Common Issues

1. **"Package biblatex-iso690 not found"**
   - Solution: Update your TeX distribution or install biblatex-iso690 manually

2. **"Biber not found"**
   - Solution: Install Biber (usually included with TeX Live/MiKTeX)

3. **"Font not found"**
   - Solution: Use fonts that are installed on your system or stick with TeX Gyre fonts

4. **"Undefined control sequence \setmainfont"**
   - Solution: Make sure you're using LuaLaTeX or XeLaTeX, not pdfLaTeX

### Compilation Tips

- Always run biber after the first lualatex run
- Run lualatex at least twice after biber to resolve all references
- Use `--shell-escape` flag if you need external tools (like minted for code highlighting)

## Bibliography Fields

Standard biblatex/ISO 690 fields (examples):

- `author` - Author name(s)
- `title` - Title of the work
- `journal` - Journal name
- `year` - Publication year
- `volume` - Volume number
- `number` - Issue number
- `pages` - Page range
- `doi` - Digital Object Identifier
- `url` - URL for online resources
- `urldate` - Date of access (format: YYYY-MM-DD)
- `publisher` - Publisher name
- `address` - Publisher location

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

## Additional Resources

- [biblatex-iso690 documentation](https://ctan.org/pkg/biblatex-iso690)
- [biblatex documentation](https://ctan.org/pkg/biblatex)
- [ISO 690 standard information](https://www.iso.org/standard/43320.html)
- [LuaLaTeX guide](https://www.luatex.org/)
- [fontspec package documentation](https://ctan.org/pkg/fontspec)
