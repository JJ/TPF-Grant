# April, 2018. Second month of the grant.

We will set as the official beginning of the grant April 1st, 2018,
which was a Sunday. The *official* end was, then, May 31st, a Thursday.

Let's list the contributions made during the month of May.

## Issues closed

[Here's the table of issues closed during May](/report/issues-May-2018.md). Some
of them, the oldest ones, include some
comments. The
[April report has been updated](/report/issues-April-2018.md); there
was a bug in the `glob` implementation and prevented it from working.

Using the Perl 6 scripts included in this repo, I have closed more than 80
issues during April:

![Issues closed by me and others](illos/closed-issues-may.png)

I eventually erased the `JJ TPF grant` label since it seemed to be
discouraging people from working themselves on the issues. I just
organized myself to close at least two issues per day, as was my
initial compromise.

In fact, those issues are, on average, more than 7 month old, or more
than 210 days, while the average for the rest of the contributors is a
bit more than ~1 month. 

> And that's mainly due to the fact
> that [issue #114](https://github.com/perl6/doc/issues/114), which was
> 1000 days old, was closed by someone else, although I did most of
> the commits to close it by creating several new pages that were
> missing from the roadmap since the very beginning.

That means that many of the issues addressed were part of the
backlog that was accumulation, and weren't, in fact, being addressed,
making the number of issues accumulate to the tune of a few tens every
month. If we look at the general 

In fact, this has allowed to buck the trend that pushed the number of
unsolved issues upward, and in fact has meant the biggest monthly
difference between the number of open anc closed issues, as can be
seen below.

![Open and closed issues + difference](illos/issues-open-closed-diff.png)

In fact, this high number of closed issues has allowed finally to
bring the total number of issues below 175 at the beginning of June. 


## Contributions via commits


Last month I contributed almost as many commits as the rest of the
authors together, 

![Commits by JJ and the rest](illos/commits-april.png)


Not all commits are the same, and some of them were more notable than
others, but all of them equally valuable to make the Perl 6
documentation a great resource.

## Other contributions

Sometimes working on a issue took me in many unexpected directions,
and some amount of work had to be done in some other
places. Contributions I'd like to note are

* Configuring
  [Shippable to run fast tests](https://app.shippable.com/github/perl6/doc/runs?branchName=master),
  which now take 3 minutes in average. It is not running the whole
  test suite, but at least shows early sign of trouble for pull
  requests and so on.
  
* Configuring [Travis](https://travis-ci.org/perl6/doc) with two
  different binaries, which now take 10 minutes only for the Docker
  version to run the whole test suite. An intermittent error with that
  test suit has been (mostly) fixed too. 
  
* [`Pod::To::BigPage`](https://github.com/perl6/perl6-pod-to-bigpage),
  which was used by the Perl 6 Docs to generate a single page, has
  been extensively refactored to avoid errors and generate HTML instead
  of XHTML. More than 40 commits have been made to that repository,
  mostly during this period. There is still some work to be done.
  
* [Contributions to StackOverflow](https://stackoverflow.com/questions/tagged/perl6),
  and encouragement of everyone (to the point of being annoying at
  times) to contribute their questions and answers there
  too. [StackOverflow](http://data.stackexchange.com/stackoverflow/query/847857/perl6-questions-per-month#graph) has
  seen the highest number of questions ever in April.
  
* [The website has seen its highest number of visitors in March and April](http://www.p6c.org/stats/doc.perl6.org#Unique%20visitors%20in%20each%20month).
  
## Conclusion

I would say I have reached most of the objectives I set out to do
during this month. It has been a great experience, and I will try to
continue in the same line of work during this month of May, although I
will try to focus on more complicated issues, and also the oldest
ones. 

