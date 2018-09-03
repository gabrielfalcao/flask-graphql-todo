# -*- coding: utf-8 -*-
import click


@click.group()
def todographql_cli_entrypoint():
    pass


@click.command(name="version")
def show_version():
    click.echo("Todo GraphQL Application - version 0.0.0")


entrypoint.add_command(show_version)


if __name__ == "__main__":
    todographql_cli_entrypoint()
