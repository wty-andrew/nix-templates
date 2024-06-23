import click

from app.core import greet


@click.command()
@click.argument('name')
def hello(name: str) -> None:
    click.echo(greet(name))


CONTEXT_SETTINGS = dict(help_option_names=['-h', '--help'])


@click.group(context_settings=CONTEXT_SETTINGS)
def main():
    pass


main.add_command(hello)
