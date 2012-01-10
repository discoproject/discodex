#!/usr/bin/env python
import os
from distutils.core import setup

def ispackage(path):
    return os.path.isdir(path) and '__init__.py' in os.listdir(path)

def packages(dirpath):
    for name in os.listdir(dirpath):
        path = os.path.join(dirpath, name)
        if ispackage(path):
            yield name
            for subpackage in packages(path):
                yield '%s.%s' % (name, subpackage)

package_dir = os.path.join(os.path.realpath(os.path.dirname(__file__)), 'lib')

setup(name='discodex',
      version=os.getenv('DISCODEX_VERSION'),
      description='intuitive data indexing',
      author='Nokia Research Center',
      package_dir={'': 'lib'},
      packages=list(packages(package_dir)))
