# Final report 

Here's the final report, referring to the set
of
[objectives stated](http://news.perlfoundation.org/2018/02/grant-proposal-curating-and-im.html) in
the original proposal. Monthly reports are [here for April](April.md)
and [this one for May](May.md).

## Working on all outstanding issues and address all of the issues in 2015, 2016 and 2017

Well, this was kind of ambitious. There are now 25 issues which were
opened in 2015 and 2016, but most of them are marked either
`wishlist`, `external` or `NOT-SPECCED`.

These are the issues closed per creation year, during and before the
grant.

| Year | Issues |
| ---- | ------ |
| 2015 | 9      |
| 2016 | 65     | 
| 2017 | 65     |
| 2018 | 179    |

I have checked out all issues in 2015 and 2016, and most issues in
2017, labeling them, in some cases commenting. However, there's a lot
of work to be done, mostly in `big` issues such
as
[this one on exceptions](https://github.com/perl6/doc/issues/516). I
have, however, happily contributed to
closing [the *roadmap* issue](https://github.com/perl6/doc/issues/114)
by creating all remaining pages.

> More needed pages appeared after closing that one, but they are in
> other issues and are left for future work.


## Creating a set of rules for existing and new contributions and enforce those rules in the test suite

[Issue](https://github.com/perl6/doc/blob/master/.github/issue_template.md) and
[pull request templates](https://github.com/perl6/doc/blob/master/.github/pull_request_template.md) have
been added to the
site. The
[style guides](https://github.com/perl6/doc/tree/master/writing-docs),
have been updated several times, and now include
a
[Squashathon Howto](https://github.com/perl6/doc/blob/master/writing-docs/SQUASHATHONS.md).

Several tests have been
added:
[testing fake links](https://github.com/perl6/doc/blob/master/xt/links-not-links.t),
[normalizes some words](https://github.com/perl6/doc/blob/master/xt/word-variants.t). 
[Tests have been ordered and reorganized](https://github.com/perl6/doc/tree/master/t).

In general, this objective has been pretty much achieved, but there's
still a lot of work to do.

## Assigning outstanding issues during the grant and create a system for assigning work to volunteers

Well, I simply could not do this. I realized very soon that people want
to work on whatever they feel like working, and assigning issues in
general is considered rather rude. I did highlight some issues to be
worked on during the Squashathon, and decided on labeling as "help
needed" a single issue. I highlighted some issues in the IRC channel,
to very little success. Most issues are not assigned, and most commits
still do not match an issue. But that's the nature of volunteer
work. You have to live with that.

## Creating an entry page with a tutorial for complete beginners with very little or no knowledge of programming, with the intent of providing a good landing page for the language

I could not find a way to do this, and besides, there are very good
pages that do that, like [Perl 6 Intro](https://perl6intro.com). I did
create
an
[article on the Perl 6 squashathon](https://dev.to/jj/squashing-perl-6-documentation-bugs-one-at-a-time-4ojn),
and
[how to help with the documentation](https://dev.to/jj/we-need-your-help-with-the-perl-6-documentation-1e82). I
also
[helped with every day Stack Overflow questions](https://stackoverflow.com/questions/tagged/perl6),
which are probably a better resource for newcomers. Instead of a
single page, creating several possible entry channels is a much better
strategy.


## Contributing to Perl and general open source conferences with entry-level tutorials and learning material.

A talk
on [Perl 6 documentation](http://www.perlworkshop.nl/nlpw2018/talks)
has been submitted, and accepted, for the Dutch Perl Workshop, and
[again at the Perl 6 conference in Glasgow](http://act.perlconference.org/tpc-2018-glasgow/talk/7409),
which is yet to be accepted.

## Writing articles in websites such as The Practical Dev (https://dev.to), HackerNoon or Medium with practical "30 minutes" tutorials to perform usual tasks in Perl6.

Besides the articles mentioned above, 
[on the Perl 6 squashathon](https://dev.to/jj/squashing-perl-6-documentation-bugs-one-at-a-time-4ojn),
and
[how to help with the documentation](https://dev.to/jj/we-need-your-help-with-the-perl-6-documentation-1e82),
I have tried to talk about it in comments such
as [this one](https://dev.to/jj/comment/3eib)
or [this one](https://dev.to/jj/comment/3j12). I did contribute
several
tutorials
[among these about #perl6 in dev.to](https://dev.to/t/perl6), but that
was before the grant. I will definitely write more in the future, as
well as update [my book](https://dev.to/t/perl6) to help newcomers to
the language, and also attract newcomers by making Perl 6 their first
language.

## Main intention: attract new users and retain them.

It is difficult to assess right now. As indicated in
the [May report](May.md), there is record interest in StackOverflow
and record visits in the website during these two months. I have put a
lot of effort to the point of annoyance insisting that people post
their questions in StackOverflow, so that the language is exposed to
the wide programming community. It remains to be seen if this trend
sustains itself in the future. I'll continue staking out StackOverflow
answering questions, and also looking for possible documentation
errors or missing parts to work on them, and improve the documentation
even more.

# Deliverables

* [x] Addressing 5 doc issues per day on average, minimum 2 issues per day. Reduce the amount of open issues by at least 120.
* [x] Write guidelines for contributions and write test code for
  enforcing it.
* [ ] Analyze landing pages and site paths and contribute to work on preferred landing pages. Produce report to improve usability of the site. 
* [ ] Contribute 1 entry-level tutorial per week, to be published
  preferably on non-perl publications (Medium, dev.to, HackerNoon).
* [x] Monitor StackOverflow and answer and/or identify needs to be
  addressed in documentation. Contribute to work on those pages or
  create new ones.
* [x] Hang out at the IRC channel to help newcomers in general and
  identify possible problems in documentation; address them when
  needed. In general, monitor all possible channels where people might
  need help with Perl6 and, besides helping when needed, try to
  identify possible problems in the documentation.
* [x] Refactor documentation tests and write new ones to make new
  additions follow guidelines. This is already in an issue in the
  GitHub repo.
  
On the two missing deliverables: the [statistics are good in general](http://www.p6c.org/stats/doc.perl6.org#Pageviews%20per%20visit),
but do not allow a fine analysis on the path followed, and what people
are looking for. The main pages
are [the language page](https://docs.perl6.org/language.html), and the
one on [operators](https://docs.perl6.org/language/operators). An
[attempt to add Google Analytics](https://github.com/perl6/doc/issues/1862) was
met with opposition, and usability does not seem to be a big
concern. So the deliverable on this area would be "This is not needed
or wanted". 

On the second deliverable, well, I did create the following
entry-level "tutorials":

* [Mathematics with Perl 6](https://docs.perl6.org/language/math)
* [Perl 6 data structures](https://docs.perl6.org/language/structures)
* [Iterating and iterators](https://docs.perl6.org/language/iterating)
* [Contexts](https://docs.perl6.org/language/contexts).

But they are *in* the documentation site, which makes easier to find
them and also link them to the rest of the pages. In general, as I say
above, entry-level tutorials are welcome, but they have a lower
priority than finishing or starting much-needed tutorials which are
part of the documentation.

# Conclusions

In general, I would say that the main objective of this grant, which
was to improve the documentation, was achieved, not only by closing
the outstanding issues, but also playing attention to channels where
Perl 6 is mentioned and creating issues on the repo when it was
needed. The work on mining the repository has allowed me, and maybe
the whole community through the published reports, to understand how
this fully volunteer works and how work done is matched to work
needed, which, in general, happens in a self-organized way. 

I have laid out the foundations for helping this repo in a more
relaxed way in the future, and also analyze the dynamics of the
repository and propose some focused work in the future, in the
framework of things like the Google Summer of Code, Hacktoberfest or
any other world-wide event, funded or not, where people can contribute
to repositories. This will help getting more work done in the future,
and prioritize issues so that time devoted by myself, and others, to
the repo is optimized. 
