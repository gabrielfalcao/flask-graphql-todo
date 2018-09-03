Writing a Todo GraphQL API in Python 3.6
########################################

.. toctree::
   :maxdepth: 3
   :caption:


Welcome to the cult of Clean Code, Extreme Programming and Test-Driven
Development.

Programme
=========

- Craft enterprise-grade code with test-driven-design
- Learn to build a robust test pyramid with unit, functional and acceptance tests.
- Learn to keep the code maintainable and clean while always keeping an eye in complexity.
- A standalone python web application with its own command line
- Deploy to digital ocean with Ansible.

Stack
=====

This tutorial will use the following python libraries for the application code:

- Flask - HTTP Framework
- Graphene - A GraphQL framework
- Chemist - SQLAlchemy-based active-record
- Click - A tool to create command-line tools that are easy to use.

Dev Stack
---------

- Alembic - For SQL migrations
- Nose + Rednose + Coverage - For a complete test runner
- Flake8 + mccabe - for static checking of coding style and complexity


Install Dependencies
====================

Let's use `pipenv <https://pipenv.readthedocs.io/en/latest/>`_ to
handle all python nuances regarding: python version, virtual
environment and dependency management.

.. note:: ThoughtBot has written an excellent `introduction to pipenv
   <https://robots.thoughtbot.com/how-to-manage-your-python-projects-with-pipenv>`_.

.. code:: bash

   pipenv install --python 3.6 click flask graphene chemist alembic


Dev-only dependencies
---------------------

.. code:: bash

   pipenv install --python 3.6 --dev coverage flake8 mccabe nose rednose sphinx sphinx-rtd-theme sure


Writing a hello-world application
=================================

Let's start the project with a clean structure, first create an empty python module:

.. code:: bash

   mkdir todographql
   touch todographql/{__init__.py,cli.py}


Your file structure should look like this:


.. code:: bash

   tree

   ├── Pipfile
   ├── Pipfile.lock
   └── todographql
       ├── __init__.py
       └── cli.py


.. note:: We just created an python module named ``todographql``,
          opening an interpreter in the project dir and running the
          command ``import todographql`` should work.


Create the command-line tool
----------------------------

Edit ``todographql/cli.py`` and add the code below:

.. code:: python

   # -*- coding: utf-8 -*-
   import click


   @click.group()
   def todographql_cli_entrypoint():
       pass


   @click.command(name="version")
   def show_version():
       click.echo("Todo GraphQL Application - version 0.0.0")


   entrypoint.add_command(show_version)


   if __name__ == "__main__":
       todographql_cli_entrypoint()



Prepare the local development tools
===================================

Write a Makefile
----------------

Make (and GNU Make) is one of the oldest build tools available to unix
systems. Being available for Mac and Linux makes it a great candidate
for a build tool that works seamlessly to developers with different
environments.

We will write a makefile with tasks that will boost our productivity
along this tutorial and the development cycle of your projects.

Here is a list of the tasks we want to automate:

- install dependencies
- run the development server
- run migrations
- run tests
- deploy application to the cloud

So our make targets will be, respectively:

.. code:: bash

   make
   make run
   make sql
   make tests
   make deploy

What that translates to, is that any time you need to perform any of
those tasks, just open up a terminal in your project directory and run
any of those commands.

Don't worry if you're not familiar with this concept, we will cover it
in more detail here later.


.. note:: Makefiles **require** tabs instead of spaces. Missing on
          that will give you a syntax error. Keep an eye on that.


the code
~~~~~~~~

.. code:: makefile

   deps:
           pipenv install --dev
           python setup.py develop

   run:
           pipenv run todographql/cli.py run

   tests: unit functional

   unit functional:
           nosetests tests/$@

   deploy:
           ansible-playbook provisioning/playbook.yml

   .PHONY: tests
