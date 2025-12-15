# Dissertation Kit - KIT Template

This repository contains a LaTeX template for dissertations based on the Karlsruhe Institute of Technology (KIT) format.

## Files

- `dissertation.tex` - Main LaTeX document
- `myplaindin.bst` - Bibliography style file (DIN 1505 German citation standard)
- `dokOptions` - Document options and package configurations (referenced but not included)

## Structure

The dissertation is structured as follows:

### Front Matter
- Title page (`content/deckblatt`)
- German abstract (`content/abstract`)
- English abstract (`content/abstractEN`)
- Acknowledgments (`content/acknowledgment`)
- Table of contents
- List of abbreviations and symbols (`content/symbols`)

### Main Content
1. Introduction (`content/1introduction`)
2. State of the Art (`content/2stateoftheart`)
3. Problem Description (`content/3descriptionproblem`)
4. Modeling (`content/4modeling`)
5. Simulations (`content/5simulations`)
6. Applied Examples (`content/6appliedexamples`)
7. Summary (`content/7summary`)
8. Outlook (`content/8ausblick`)

### Back Matter
- Appendix (`content/appendix`)
- List of figures
- List of tables
- List of algorithms
- Bibliography (`content/bibliography`)

## Usage

1. Replace the placeholder author name in `dissertation.tex`:
   ```latex
   \newcommand{\autor}{Author Name}
   ```

2. Create the required content files in the `content/` directory

3. Ensure you have the `dokOptions` file with necessary package configurations

4. Compile the document using your preferred LaTeX compiler (pdflatex, xelatex, etc.)

## Configuration

- **Page size**: A5 paper (change to `a4paper` in `\documentclass` if needed)
- **Font size**: 10pt
- **Languages**: English (primary), German
- **Citation style**: DIN 1505 (German standard)

## Notes

- The template uses the KOMA-Script `scrbook` class
- Content files should be created separately in a `content/` subdirectory
- The bibliography style follows German DIN 1505 Teil 2 standards
