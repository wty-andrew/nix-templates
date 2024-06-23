from click.testing import CliRunner

from app.cli.commands.hello import hello


def test_hello():
    runner = CliRunner()
    result = runner.invoke(hello, ['John'])
    assert result.exit_code == 0
    assert result.output == 'Hello, John!\n'
