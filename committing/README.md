# Committing Guidelines

This is an example directory that contains version control configuration, such as Git hooks, commit templates, and defaults for all team members, as well as a README describing general guidelines for making merge requests (MRs), proceeding with Code Reviews (CRs), and commit style.

## Table of Contents

I. [Commit Style](#commit-style) <br />
II. [Merge Requests and Code Reviews](#merge-requests-and-code-reviews) <br />
III. [Noteworthy Git Commands](#noteworthy-git-commands) <br />
IV. [Further Reading](#further-reading)

## Commit Style

Please follow [the template](template.txt) for any commit messages.
[...]

## Merge Requests and Code Reviews

We follow a Forking Workflow [...]

## Noteworthy Git Commands

- `git rebase -i` - interactive rebase -- read the inline directions
- `git commit --amend` - amend changes into the previous commit
- `git reflog` - history of all references made in the past 30 days
  - useful if you made a mistake and need to backtrack to a previous version of the repo
- `git diff` - get the diff between any two commits
  - useful to check before pushing any code to make sure you didn't make any mistakes
- `git log` - get the log of all commits up to a certain commit
  - also useful to check before pushing any code to verify the commits you are pushing and their messages

## Further Reading

1. [Forking Workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/forking-workflow)
    - [GitLab Merge Requests](https://docs.gitlab.com/ee/gitlab-basics/add-merge-request.html)
1. Rebase Workflow Resources and Rationale
    - [Feature Workflow = Bugfix Workflow](http://reinh.com/blog/2009/03/02/a-git-workflow-for-agile-teams.html)
    - [Linearity of Commits](http://kensheedlo.com/essays/why-you-should-use-a-rebase-workflow/)
    - [Readability and Bug Locality](http://www.darwinweb.net/articles/the-case-for-git-rebase)
