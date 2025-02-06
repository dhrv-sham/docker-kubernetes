# dockerfile image container
FROM  python:3.13.1

ADD  main.py .
RUN  pip install requests beautifulsoup4


CMD [ "python" , "./main.py"]