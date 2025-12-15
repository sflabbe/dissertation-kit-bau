# Dissertation Kit - KIT Template (Dual Version)

This repository contains **two complete LaTeX dissertation templates** based on the Karlsruhe Institute of Technology (KIT) format.

## 📦 Two Versions Available

### Choose Your Version:

| Feature | Legacy (DIN 1505) | Modern (ISO 690) |
|---------|-------------------|------------------|
| **Standard** | DIN 1505 Teil 2 (1984) | ISO 690 (current) |
| **Engine** | pdfLaTeX | LuaLaTeX / XeLaTeX |
| **Bibliography** | BibTeX + .bst | biblatex + biber |
| **Fonts** | Traditional LaTeX | Modern Unicode fonts |
| **Status** | Stable, proven | Current standard |
| **Best for** | Older requirements, compatibility | New dissertations, modern features |

---

## 🎯 **Recommended: Modern ISO 690 Version**

📂 **Location:** `modern-iso690/`

**Why choose this:**
- ✅ Current ISO 690 standard (replaces old DIN 1505)
- ✅ Better Unicode and font support
- ✅ Easier bibliography management
- ✅ Modern LaTeX best practices
- ✅ Better handling of URLs, DOIs
- ✅ Automatic `lastchecked` → `urldate` conversion

**Quick start:**
```bash
cd modern-iso690/
lualatex dissertation-modern
biber dissertation-modern
lualatex dissertation-modern
lualatex dissertation-modern
```

📖 **See:** [`modern-iso690/README-modern.md`](modern-iso690/README-modern.md)

---

## 🔧 Legacy DIN 1505 Version

📂 **Location:** `legacy-din1505/`

**When to use this:**
- Required by older institutional guidelines
- Working with existing pdfLaTeX-only workflows
- Maximum compatibility with older systems

**Quick start:**
```bash
cd legacy-din1505/
pdflatex dissertation
bibtex dissertation
pdflatex dissertation
pdflatex dissertation
```

📖 **See:** [`legacy-din1505/README-legacy.md`](legacy-din1505/README-legacy.md)

---

## 📊 What's Included

Both versions include:
- ✅ Complete front matter (title page, abstracts, acknowledgments)
- ✅ 8 chapter templates with generic academic content
- ✅ Appendix with mathematical derivations
- ✅ Bibliography with 15 sample references
- ✅ Nomenclature/symbols list
- ✅ Proper cross-referencing structure
- ✅ Table and figure placeholders

**Content is completely generic** - no specific research topic, ready to customize for your work.

---

## 🎓 Template Structure

```
dissertation-kit-bau/
│
├── modern-iso690/              ← RECOMMENDED
│   ├── dissertation-modern.tex     (Main document)
│   ├── dokOptions-modern.tex       (Modern packages + biblatex)
│   ├── README-modern.md            (Full documentation)
│   └── content/                    (All chapters)
│
├── legacy-din1505/             ← For compatibility
│   ├── dissertation.tex            (Main document)
│   ├── dokOptions.tex              (Traditional packages)
│   ├── plaindin-upgraded.bst       (Fixed DIN 1505 style)
│   ├── README-legacy.md            (Full documentation)
│   └── content/                    (All chapters)
│
└── README.md                   ← You are here
```

---

## 🚀 First-Time Setup

### Modern Version (Recommended)

1. **Install Requirements:**
   - LuaLaTeX or XeLaTeX (included in TeX Live / MiKTeX)
   - Biber (bibliography processor)
   - Package: `biblatex-iso690`

2. **Edit Content:**
   ```bash
   cd modern-iso690/
   # Edit dissertation-modern.tex - change author name
   # Edit content/*.tex files with your research
   # Edit content/bibliography.bib with your references
   ```

3. **Compile:**
   ```bash
   lualatex dissertation-modern
   biber dissertation-modern
   lualatex dissertation-modern
   lualatex dissertation-modern
   ```

### Legacy Version

1. **Install Requirements:**
   - pdfLaTeX (standard LaTeX distribution)
   - BibTeX (standard with LaTeX)

2. **Edit Content:**
   ```bash
   cd legacy-din1505/
   # Edit dissertation.tex - change author name
   # Edit content/*.tex files with your research
   # Edit content/bibliography.bib with your references
   ```

3. **Compile:**
   ```bash
   pdflatex dissertation
   bibtex dissertation
   makeindex dissertation.nlo -s nomencl.ist -o dissertation.nls
   pdflatex dissertation
   pdflatex dissertation
   ```

---

## 📝 Customization

### Change Author Name

**Modern version:** Edit `modern-iso690/dissertation-modern.tex`
```latex
\newcommand{\autor}{Your Name Here}
```

**Legacy version:** Edit `legacy-din1505/dissertation.tex`
```latex
\newcommand{\autor}{Your Name Here}
```

### Change Title

Both versions - edit same lines:
```latex
\newcommand{\pdftitle}{Your Dissertation Title}
\newcommand{\headtitle}{Your Dissertation Title}
```

### Change Fonts (Modern Version Only)

Edit `modern-iso690/dokOptions-modern.tex`:
```latex
\setmainfont{Times New Roman}  % or any system font
\setsansfont{Arial}
\setmonofont{Courier New}
```

---

## 🔍 Key Differences

### Bibliography Fields

| BibTeX Field | Legacy | Modern |
|-------------|--------|---------|
| `lastchecked` | Supported | Auto-converts to `urldate` |
| `urldate` | Not used | Preferred |
| DOI format | Manual | Automatic linking |

### Compilation

| Step | Legacy | Modern |
|------|--------|---------|
| **1** | pdflatex | lualatex/xelatex |
| **2** | bibtex | biber |
| **3** | pdflatex | lualatex/xelatex |
| **4** | pdflatex | lualatex/xelatex |

---

## 💡 Tips

**For Modern Version:**
- Use UTF-8 encoding everywhere (native support)
- System fonts work directly with `\setmainfont{}`
- Bibliography formatting is automatic
- Better math font support

**For Legacy Version:**
- Stick to ASCII or proper LaTeX escaping (`\"a` for ä)
- Use only Type 1 / Computer Modern fonts
- More manual bibliography control
- Traditional but very stable

---

## 🐛 Troubleshooting

### Modern Version

**Error: "Package biblatex-iso690 not found"**
```bash
# TeX Live
tlmgr install biblatex-iso690

# MiKTeX (automatic on first compile)
```

**Error: "Biber not found"**
```bash
tlmgr install biber  # TeX Live
# MiKTeX: Should be installed by default
```

### Legacy Version

**Warning: "Citation undefined"**
- Make sure you run: `pdflatex → bibtex → pdflatex → pdflatex`
- Check that `.bib` file paths are correct

**Error: "plaindin-upgraded.bst not found"**
- Verify file is in same directory as `dissertation.tex`
- Or place in: `~/texmf/bibtex/bst/`

---

## 📚 Documentation

- **Modern version:** [`modern-iso690/README-modern.md`](modern-iso690/README-modern.md)
- **Legacy version:** [`legacy-din1505/README-legacy.md`](legacy-din1505/README-legacy.md)

---

## 📄 License

- **Template structure:** Free to use and modify
- **BST file (legacy):** K.F. Lorenzen (1994-2006), modified 2024
  - May be modified if renamed
  - See `plaindin-upgraded.bst` header for details

---

## 🤝 Contributing

If you find bugs or have improvements:
1. Please specify which version (modern/legacy)
2. Include minimal example to reproduce
3. Open an issue on the repository

---

## ⚡ Quick Decision Guide

**Start with Modern version if:**
- ✅ Starting a new dissertation now
- ✅ Want current bibliography standards
- ✅ Need Unicode / special characters
- ✅ Using modern LaTeX distribution (TeX Live 2020+)

**Use Legacy version if:**
- ✅ Required by department guidelines
- ✅ Working on an older system
- ✅ Collaborating with users who need pdfLaTeX
- ✅ Maximum compatibility is priority

**Still unsure?** → Try the **Modern version** first. It's easier to work with and meets current standards.

---

**Need help?** Check the detailed README in each version directory!
