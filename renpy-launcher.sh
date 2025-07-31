#!/usr/bin/env python3

import os
import subprocess
import tkinter as tk
from pathlib import Path
from tkinter import ttk, messagebox

# Where your games are stored
GAMES_DIR = Path("/your/path")

# Scan for .sh launchers in 1-level deep subfolders
def find_games():
    return sorted(GAMES_DIR.glob("**/*.sh"))

games = find_games()

# No games? Show error and bounce
if not games:
    messagebox.showerror("Ren'Py Launcher", "No .sh launchers found in your Ren'Py folder!")
    exit(1)

# ---- GUI ----
root = tk.Tk()
root.title("Ren'Py Game Launcher")
root.geometry("400x600")
root.resizable(False, True)

style = ttk.Style()
style.theme_use("clam")

main_frame = ttk.Frame(root, padding=20)
main_frame.pack(fill=tk.BOTH, expand=True)

title_label = ttk.Label(main_frame, text="🎮 Select a Ren'Py Game:", font=("Segoe UI", 14, "bold"))
title_label.pack(pady=(0, 20))

# Create a button for each game
for game_path in games:
    game_name = game_path.stem

    def launch(path=game_path):
        if os.access(path, os.X_OK):
            subprocess.Popen([str(path)], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        else:
            messagebox.showerror("Execution Error", f"❌ {path.name} is not executable.\nTry:\nchmod +x \"{path}\"")

    button = ttk.Button(main_frame, text=game_name, command=launch)
    button.pack(fill=tk.X, pady=5)
