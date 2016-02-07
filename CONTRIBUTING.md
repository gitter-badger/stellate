# How to Contribute

This document contains information for Collaborators of the Stellate website project regarding maintaining the code, documentation and issues.

## Coding Standards and Guidelines

To keep the code of Stellate clean and compliant to one and not hundreds of ways of writing code we follow several guidelines and code standards:
* [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide/blob/master/README.md)
* [JavaScript Standard Style](https://github.com/feross/standard#rules)
* [Ruby on Rails Style Guide](https://github.com/bbatsov/rails-style-guide/blob/master/README.md)
* [GitHub Flow](https://guides.github.com/introduction/flow/index.html)

## Getting Started

* Make sure you have a [GitHub account](https://github.com/signup/free)
* [Fork](https://github.com/stellate/stellate/fork) the repository on GitHub.

## Making Changes

* Create a new branch for your changes (following the guidelines of [GitHub Flow](https://guides.github.com/introduction/flow/index.html))
  * The branch should usually fork from the `master` branch.
* Add a few commits, implementing the changes you want or the bug you want to squash!
  * Make sure to reduce an unnecessary high amount of commits by using `git rebase -i`
  * Check for unnecessary whitespace with `git diff --check` before committing.
* Make sure you have added the necessary tests for your changes, or adjusted them, if you made major changes to an already existing feature.
* Run _all_ the tests to assure nothing else was accidentally broken.

### Commit Conventions

We mostly follow the [Angular.js commit conventions](https://gist.github.com/brianclements/841ea7bffdb01346392c), with some exceptions:
  * Omit the scope

## Submitting Changes

* Open a pull request [on `master`](https://github.com/stellate/stellate/pull/new/master).
  * If you are a collaborator and create a branch on this repo, please make sure to name it the following: `{github-username}/{feature-name}`. If there are multiple people who are supposed to work on this branch, just name it after the feature/bug/whatever.
* Feedback to your pull request will be given by any core team member using [Reviewable](https://reviewable.io)
  * After adjusting your changes, above step will be repeated,
* If everything is fine and all the tests are passing your changes will be merged into the `master` branch.
* If the branch was merged with Reviewable, it was deleted after merging. If not, please do so yourself.

## Pull Requests

Courtesy should always be shown to individuals submitting pull requests to the Stellate project.

Collaborators should feel free to take full responsibility for managing pull requests they feel qualified to handle, as long as this is done while being mindful of these guidelines, the opinions of other Collaborators and guidance of the Core Group.

### Involving the Core Group

Collaborators may opt to elevate pull requests or issues to the admin group for discussion by mentioning @stellate/core. This should be done where a pull request:
  * has a significant impact on the codebase,
  * is inherently controversial; or
  * has failed to reach consensus amongst the Collaborators who are actively participating in the discussion.
The Core group should serve as the final arbiter where required.

---

_Adapted from the wonderful [nodejs.org](https://github.com/nodejs/nodejs.org/blob/master/CONTRIBUTING.md) and [Puppet](https://github.com/puppetlabs/puppet/blob/master/CONTRIBUTING.md) contribution guides_
