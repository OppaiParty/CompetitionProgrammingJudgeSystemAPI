FROM ubuntu

RUN apt-get update\ 
		&& apt-get install -y wget monodevelop

RUN apt-get install -y ruby python clang time binutils npm python-software-properties curl apt-transport-https mono-devel mono-mcs
RUN curl http://dist.crystal-lang.org/apt/setup.sh | bash
RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 09617FD37CC06B54
RUN echo "deb http://dist.crystal-lang.org/apt crystal main" > /etc/apt/sources.list.d/crystal.list
RUN apt-get install -y crystal


RUN mkdir /judge
WORKDIR /judge
COPY . /judge

CMD ["ruby","Setup.rb"]
