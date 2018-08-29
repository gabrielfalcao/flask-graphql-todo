Writing a Todo GraphQL API in Python 3.6
########################################

Welcome to the cult of Clean Code, Extreme Programming and Test-Driven Development.


Programme
=========

- Craft enterprise-grade code with test-driven-design
- Learn to build a robust test pyramid with unit, functional and acceptance tests.
- Learn to keep the code maintainable and clean while always keeping an eye in complexity.


Stack
=====

This tutorial will use the following python libraries for the application code:

- Flask - HTTP Framework
- Graphene - A GraphQL framework
- Chemist - SQLAlchemy-based active-record


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

   pipenv install --python 3.6 flask graphene chemist alembic


Dev-only dependencies
---------------------

.. code:: bash

   pipenv install --python 3.6 --dev coverage flake8 mccabe nose rednose sphinx sphinx-rtd-theme sure
