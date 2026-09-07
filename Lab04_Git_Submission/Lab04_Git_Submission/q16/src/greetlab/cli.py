import argparse


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--name", required=True)
    a = p.parse_args()

    name = a.name.strip()
    if not name:
        p.error("--name must not be blank")

    print(f"Hello, {name}!")
