# -*- coding: utf-8 -*-

"""
This package depends on libcurl source files.

Debian installation: `sudo apt install libcurl4-openssl-dev`
"""

import sys
if sys.version_info < (2,7):
    sys.exit('Sorry, Python < 2.7 is not supported')

import os
from setuptools import find_packages, setup
from setuptools.extension import Extension
from Cython.Build import cythonize

BASE_DIR = os.path.dirname(__file__)
REQ_PATH = os.path.join(BASE_DIR, "requirements.txt")

with open(REQ_PATH, "r") as f:
    REQ = [line.strip("\n") for line in f.readlines()]

ext_modules = [
    Extension(
        "cycurl.main",
        ["cycurl/main.pyx"],
        libraries=['curl'],
    ),
]

author, author_email = ("Álvaro Mondéjar Rubio", "mondejar1994@gmail.com")

install = setup(
    name="cycurl",
    version="1.0.0",
    url="https://github.com/mondeja/cycurl",
    download_url="https://github.com/mondeja/cycurl/archive/master.zip",
    author=author,
    maintainer=author,
    author_email=author_email,
    maintainer_email=author_email,
    platforms=['any'],
    license="BSD License",
    description="Cythonized Python wrapper for libcurl.",
    long_description="Cythonized Python wrapper for libcurl.",
    keywords=["wrapper", "c", "curl", "cython", "cycurl", "libcurl"],
    install_requires=REQ,
    packages=find_packages(),
    ext_modules=cythonize(ext_modules),
    classifiers=[
        "Development Status :: 5 - Production/Stable",
        "Intended Audience :: Developers",
        "Intended Audience :: Financial and Insurance Industry",
        "License :: OSI Approved :: BSD License",
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: Implementation :: PyPy",
        "Topic :: Internet :: WWW/HTTP :: Dynamic Content",
        "Topic :: Office/Business",
        "Topic :: Office/Business :: Financial",
        "Topic :: Office/Business :: Financial :: Accounting",
        "Topic :: Office/Business :: Financial :: Investment",
        "Topic :: Software Development :: Libraries",
        "Topic :: Software Development :: Libraries :: Python Modules",
    ],
    zip_safe=True,
    provides=["setup_template_cython"]
)

print(
    "\n%s v%s installation finished succesfully." % (
        install.get_name().capitalize(),
        install.get_version()
    )
)
