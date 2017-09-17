FROM debian

LABEL maintainer="Alexandre Buisine <alexandrejabuisine@gmail.com>"

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update \
 && apt-get install -yqq --no-install-recommends \
	curl \
	unzip \
	openjdk-8-jre-headless
 # && apt-get -yqq clean \
 # && rm -rf /var/lib/apt/lists/*

WORKDIR /home
RUN curl -Lkso mfi.zip https://dl.ubnt.com/mfi/2.1.11/mFi.unix.zip \
 && unzip mfi.zip \
 && rm mfi.zip

WORKDIR /home/mFi

EXPOSE 6080 6443 6880 6843

ENTRYPOINT ["java", "-jar", "lib/ace.jar"]
CMD ["start"]