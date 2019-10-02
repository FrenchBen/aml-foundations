FROM gitpod/workspace-full:latest

# install custom tools, runtime, etc.
#USER root
# Install custom tools, runtime, etc.
#RUN apt-get update && apt-get install -y \
#        ... \
#    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

USER gitpod
# Apply user-specific settings
RUN pip3 install ipykernel ipython jupyter matplotlib numpy pandas seaborn

USER root
RUN ipython3 kernel install

USER gitpod

# Give back control
USER root
