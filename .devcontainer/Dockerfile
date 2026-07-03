FROM mcr.microsoft.com/devcontainers/python:1-3.11-bullseye

# The base image ships an apt source for dl.yarnpkg.com (Yarn), signed with a
# key whose signing subkey expired 2026-01-23. That makes `apt-get update`
# fail with an unsigned-repository error, which aborts devcontainer feature
# installs (e.g. nvidia-cuda) that run apt-get update during their build.
# This project doesn't use Yarn/Node.js, so drop the broken source instead
# of depending on Yarn to rotate their key.
RUN rm -f /etc/apt/sources.list.d/yarn.list
