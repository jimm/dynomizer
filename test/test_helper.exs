ExUnit.start

Ecto.Adapters.SQL.Sandbox.mode(Dynomizer.Repo, :manual)

# The test task does not load non-test files in the test directory.
# This require could be moved to the test module(s) that use it.
Code.require_file("test/lib/dynomizer/mock_heroku.ex")
