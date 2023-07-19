def test_awscli_is_installed(host):
  cmd = host.run("aws --version")
  assert cmd.stdout.startswith("aws-cli")

def test_githubcli_is_installed(host):
  cmd = host.run("gh --version")
  assert cmd.stdout.startswith("gh")

def test_jqlikes_is_installed(host):
  cmd = host.run("jq --version")
  assert cmd.stdout.startswith("jq")

def test_python_is_installed(host):
  cmd = host.run("python --version")
  assert cmd.stdout.startswith("Python")
