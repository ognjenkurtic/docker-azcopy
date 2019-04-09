FROM microsoft/dotnet:2.1-runtime

RUN set -ex \
	&& apt-get update \
    && apt-get install -y --no-install-recommends \
         rsync \
         libunwind8 \
    && rm -rf /var/lib/apt/lists/* \
    && curl -L -o azcopy_linux_amd64_10.0.9.tar.gz \
    https://aka.ms/downloadazcopy-v10-linux \
    && tar -xf azcopy_linux_amd64_10.0.9.tar.gz && rm -f azcopy_linux_amd64_10.0.9.tar.gz \
	&& cp ./azcopy_linux_amd64_10.0.9/azcopy /usr/bin/ \
	&& rm -rf ./azcopy_linux_amd64_10.0.9
	
CMD ["azcopy", "--version"]
