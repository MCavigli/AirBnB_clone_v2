#!/usr/bin/python3
# module with method that cleans specified number of archives

from fabric.api import *


env.user = 'ubuntu'
env.hosts = ['35.231.100.106', '35.237.151.115']


def do_clean(number=0):
    """ deletes out of date archives """
    with lcd('/versions'):
        if number == 0 or number == 1:
            local('ls -ltr | head -n -1 | rm -rfv')
        else:
            local('ls -ltr | head -n -{} | rm -rfv'.format(number))
    with cd('data/web_static/releases'):
        if number == 0 or number == 1:
            run('ls -ltr | head -n - 1 | rm -rfv')
        else:
            run('ls -ltr | head -n -{} | rm -rfv'.format(number))
