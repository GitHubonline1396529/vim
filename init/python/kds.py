"""
Name: kds.py
Author: ChatGPT, Githubonline1396529
Version: 0.0.1.2
Date: 2025/3/16
License: Copyright (c) 2025

This script is an interactive CLI for `kd`, the crystal clear command-line
dictionary. It allows users to input queries, pass additional options to `kd`,
and read queries from a file.

See Also: 
  kd, a crystal clear command-line dictionary, written in Go, supported 
  Linux/Win/Mac <https://github.com/Karmenzind/kd>.
"""

import argparse
import subprocess
import sys
import re
import shutil
import readline # Enhance the interactive of `input()`

def print_info():
    """Prints information about the script and its usage."""
    print(
        """
This script is used to interact with `kd`, the crystal clear command
line dictionary. Every sequence you type down here will be passed to
`kd`. Use "/help" for help message.

See Also: 
  kd, a crystal clear command-line dictionary, written in Go, supported 
  Linux/Win/Mac <https://github.com/Karmenzind/kd>.
"""
    )

def print_internal_commands_help():
    """Prints available internal commands."""
    print(
        """
Internal Commands:

/c, /clear - to clear outputs.
/q, /quit  - to quit.
/h, /help  - to show this message.
"""
    )

def detect_input_type(user_input):
    """ Determines the type of user input and whether `-t` should be used.

    Args: 
        user_input (str): The command or query entered by the user.

    Returns:
        bool: False if the `-t` argument shouldn't be used automantically, 
            True otherwise.
    """
    # If contains Chinese characters or input is longer than 5 characters.
    if re.search(r"[\u4e00-\u9fff]", user_input):
        # If Contains Chinese punctuation
        if (
                re.search(r"[，。！？、；：“”‘’（）【】]", user_input)
                or len(user_input) >= 5
            ):
            return True  # Use `-t`
        return False  # Do not use `-t`
    else:
        words = user_input.split()
        return len(words) > 1  # Use `-t` if more than one word.

def process_input(user_input, kd_options):
    """ Processes user input and interacts with `kd` accordingly.

    Args:
        user_input (str): The command or query entered by the user.
        kd_options (str): Additional options for the `kd` command.

    Returns:
        bool: False if the program should quit, True otherwise.
    """
    user_input = user_input.strip()

    if user_input == "/quit" or user_input == "/q":
        print("Quit kd.")
        return False
    elif user_input == "/help" or user_input == "/h":
        print_info()
        print()
        print_internal_commands_help()
    elif user_input == "/clear" or user_input == "/c":
        subprocess.run(
            "cls" if sys.platform == "win32" else "clear", shell=True
        )
    else:
        use_t = detect_input_type(user_input)
        command = (
            ["kd"]
            + kd_options.split()
            + (["-t"] if use_t else [])
            + user_input.split()
        )
        subprocess.run(command, shell=True)

    return True

def main():
    """ Main function to parse arguments and run interactive mode or file 
    input processing.
    """
    parser = argparse.ArgumentParser(
        description="Interactive CLI for `kd` dictionary."
    )
    parser.add_argument(
        "-o",
        "--options",
        type=str,
        default="",
        help="Options to pass to `kd`.",
    )
    parser.add_argument(
        "-f", "--file", type=str, help="Read queries from file."
    )

    args = parser.parse_args()
    kd_options = args.options.strip()

    # If `kd` is not executable, show error message and exit.
    if not shutil.which("kd"):
        print("Error: `kd` is not installed or not in PATH.")
        sys.exit(1)

    print_info()

    if args.file:
        try:
            with open(args.file, "r", encoding="utf-8") as f:
                for line in f:
                    if not process_input(line, kd_options):
                        break
        except FileNotFoundError:
            print(f"Error: File '{args.file}' not found.")
            sys.exit(1)
    else:
        while True:
            print("")  # Print a blank line
            user_input = input(f"KD {kd_options}> ")
            if not process_input(user_input, kd_options):
                break

if __name__ == "__main__":
    main()


