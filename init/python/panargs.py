# -*- coding: utf-8 -*-
"""
panargs.py

Author: ChatGPT =), Githubonline1396529
License: Copyright (c) 2024 Githubonline1396529
Version: 0.1.1.2

This script exports Markdown files to various formats using Pandoc, incorporat-
ing options specified in the YAML front matter (`pandoc_args`) and additional
CLI arguments.

Features:
1. Support for ``pandoc_args`` in the YAML header::
   - Define Pandoc options in the Markdown YAML front matter using underscores 
     ``_`` (Instead of hyphens ``-``).
   - Automatically converts YAML keys with underscores to hyphenated CLI keys.
   - Example: ``pdf_engine`` in YAML is translated to ``--pdf-engine`` in CLI.

2. Command-line override with ``--pandoc-arguments``::
   - Append or override options defined in the YAML file with CLI arguments.

Examlpe: 
    YAML Header in Markdown file as the following::

        ---
        pandoc_args:
          output: output.pdf
          pdf_engine: xelatex
          top_level_division: chapter
        ---
        
    or, you can use ``pandoc_args`` as a list:
    
        ---
        pandoc_args:
          - output=output.pdf
          - pdf-engine=xelatex
          - top-level-division=chapter
        ---
        
    or just keep it to be the raw string:
    
        ---
        pandoc_args: "--top-level-division=chapter --pdf-engine=xelatex"
        ---

    And run the CLI command to generate::

        $ python panargs.py myfile.md

The MIT License (MIT)

Copyright (c) 2024 Githubonline1396529

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the “Software”), to deal 
in the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
SOFTWARE.
"""

import yaml
import subprocess
import argparse
from pathlib import Path

def read_yaml_header(file_path):
    """
    Reads the YAML header from a Markdown file.

    Args:
        file_path (str): The path to the Markdown file.

    Returns:
        dict: The YAML header as a dictionary, or an empty dictionary if no
              YAML header is found.
    """
    try:
        with open(file_path, "r", encoding="utf-8") as f:
            lines = f.readlines()

        if lines[0].strip() != "---":
            return {}

        yaml_lines = []
        for line in lines[1:]:
            if line.strip() == "---":
                break
            yaml_lines.append(line)

        return yaml.safe_load("\n".join(yaml_lines)) or {}
    except Exception as e:
        print(f"Error reading YAML header: {e}")
        return {}


def replace_underscore_with_hyphen(options):
    """
    Converts YAML-style keys with underscores to CLI-style keys with hyphens.

    Args:
        options (dict): A dictionary of options.

    Returns:
        dict: The modified dictionary with hyphens in keys.
    """
    return {key.replace("_", "-"): value for key, value in options.items()}


def construct_pandoc_command(file_path, yaml_options, cli_options):
    """
    Constructs the Pandoc command based on YAML and CLI options.

    Args:
        file_path (str): The input Markdown file path.
        yaml_options (dict): Options specified in the YAML header.
        cli_options (str): Additional options provided via CLI.

    Returns:
        list: The Pandoc command as a list of arguments.
    """
    command = ["pandoc", str(file_path)]

    if "pandoc_args" in yaml_options:
        if isinstance(yaml_options["pandoc_args"], dict):
            yaml_options["pandoc_args"] = replace_underscore_with_hyphen(
                yaml_options["pandoc_args"]
            )
            for key, value in yaml_options["pandoc_args"].items():
                command.append(f"--{key}={value}")
        elif isinstance(yaml_options["pandoc_args"], str):
            command.extend(yaml_options["pandoc_args"].split())
        elif isinstance(yaml_options["pandoc_args"], list):
            for option in yaml_options["pandoc_args"]:
                if isinstance(option, str):
                    command.append("--" + option)
                else:
                    raise ValueError(
                        f"Invalid list item in 'pandoc_args': {option}. "
                        f"Must be a string."
                    )

    if cli_options:
        command.extend(cli_options.split())

    return command


def main():
    """
    Main function to parse arguments, read YAML header, and execute the Pandoc
    command.
    """
    parser = argparse.ArgumentParser(
        description=(
            "Export Markdown using Pandoc with options from YAML and CLI."
            )
    )
    parser.add_argument(
        "markdown_file", type=str, help="Path to the Markdown file."
    )
    parser.add_argument(
        "--pandoc-arguments",
        type=str,
        default="",
        help="Additional Pandoc options passed via CLI.",
    )
    args = parser.parse_args()

    markdown_file = Path(args.markdown_file)
    if not markdown_file.exists():
        print(f"Error: The file {markdown_file} does not exist.")
        return

    yaml_options = read_yaml_header(markdown_file)
    command = construct_pandoc_command(
        markdown_file, yaml_options, args.pandoc_arguments
    )

    print(f"Executing command: {' '.join(command)}")
    try:
        subprocess.run(command, check=True)
        print("Document generated successfully!")
    except subprocess.CalledProcessError as e:
        print(f"Error executing Pandoc: {e}")


if __name__ == "__main__":
    main()
