# dart_scheme_impl (skeleton)

This is skeleton code that, when complete, will allow you to build the online
61A Scheme interpreter.

**Note:** 61A Staff members don't need to use this repo. We have a private staff
implementation of it in the dart_scheme_impl repo on our GitHub org.

To use, clone [dart_scheme][] and [scheme_web_interpreter][] into a single
directory. Then, clone this repo into that same directory and call it
`dart_scheme_impl`.

```
mkdir scheme && cd scheme
git clone git@github.com:Cal-CS-61A-Staff/dart_scheme.git
git clone git@github.com:Cal-CS-61A-Staff/scheme_web_interpreter.git
git clone git@github.com:jathak/scheme_impl_skeleton.git dart_scheme_impl
```

## Implementing

You'll need to implement the various commented TODOs in `lib/impl.dart`.
I've included the UnimplementedAsync mixin by default, since define-async and
lambda-async are not commonly used. If you want them (effectively, async/await
in Scheme), see the methods of `ProjectInterface` in the main repo.

While I'm licensing this under the BSD 3-clause license to maintain consistency
with the rest of the project, I ask that you please do not publicly distribute
the *source code* that you implement here (dart2js builds are fine). We reuse
the project that this code is based on each semester and would prefer that we
did not have solutions floating around.

Additionally, if you are a Berkeley student, **publicly distributing an
implementation of `ProjectInterface` constitutes academic dishonesty as
described in our [course policies][policy]**, as the implementation is close
enough to the Scheme project's to be considered distribution of solutions,
despite the change of language from Python to Dart. This applies even if you are
not currently taking 61A.

### An Alternate Option

You can contact me either by [email][] or on [Twitter][] and I can send you
a completed version of `impl.dart`, provided you don't plan to take 61A now or
in the future (if you're a high school student or a current Berkeley student who
hasn't taken 61A, I won't provide this to you, even if you have no plans to take
it, just as a precaution).

## Usage

You can run `dart bin/main.dart` to get a CLI interpreter.

You can also build the [scheme_web_interpreter][] app and run in a browser.

There is a suite of Scheme test cases that you can run with
`dart test/scm.dart`. You can add additional cases to `tests.scm`. Some
of these tests were written by me, others came from the 61A Scheme
project, which in turn mostly came from the original SICP textbook.




[dart_scheme]: https://github.com/Cal-CS-61A-Staff/dart_scheme
[scheme_web_interpreter]: https://github.com/Cal-CS-61A-Staff/scheme_web_interpreter
[project]: http://fa17.cs61a.org
[policy]: https://cs61a.org/articles/about.html
[email]: mailto:jthakar@berkeley.edu
[Twitter]: https://twitter.com/jathak
