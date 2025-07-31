# 🎮 Ren'Py Launcher (for Linux)

**[IN DEVELOPMENT]**  
A minimalist launcher for Ren'Py-based visual novels and games. Built with Python and Tkinter for Linux systems.

## 📦 Requirements

- Python 3
- Tkinter (`sudo apt install python3-tk`)
- Ren'Py games in subfolders with a `.sh` launcher script

## 📁 Directory Setup

You must specify the path to your game directory in the script:

```python
GAMES_DIR = Path("/your/path")  # Set this to your Ren'Py games folder
