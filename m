From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 0/4][RFC] fujitsu-laptop: clean ups from Alan Jenkins
Date: Thu, 2 Feb 2017 15:16:56 +0100
Message-ID: <20170202141656.GA23345@ozzy.nask.waw.pl>
References: <20170130124304.GC10561@marvin.atrad.com.au>
 <20170130142817.GA11056@ozzy.nask.waw.pl>
 <20170130222323.GA3343@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:35087 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751501AbdBBORB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Feb 2017 09:17:01 -0500
Received: by mail-lf0-f65.google.com with SMTP id v186so1535326lfa.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Feb 2017 06:17:00 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170130222323.GA3343@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: platform-driver-x86@vger.kernel.org

> Hi Michael
> 
> On Mon, Jan 30, 2017 at 03:28:17PM +0100, Micha?? K??pie?? wrote:
> > > This series of patches for the fujitsu-laptop driver was originally
> > > submitted by Alan Jenkins in September 2009.  For various reasons which are
> > > entirely my fault they were never acted upon.  To remedy this they have been
> > > ported to the linux-platform-drivers-x86 git tree and compile-tested. 
> > > Consequently this submission is a work in progress and is posted for
> > > comments and feedback.
> > 
> > Thanks for posting these patches.  You wrote they were compile-tested,
> > could you please shed some light on which git branch did you base them
> > on?
> 
> Obviously the wrong one. :-(  I can't recall the git URL off-hand but will
> check this evening when I am at my development box.
> 
> > Darren's testing branch in its current state does not work for me, neither
> > does Linus' master.
> 
> Which of these should I use to fit in with your work (and what is the
> respective URL)?  I'm not fussed either way.

I am always basing my platform-driver-x86 patches on dvhart/testing,
i.e. the "testing" branch available inside Darren's git repository.

> On a related note, it's probably time I worked git out properly.  Do you
> know of any documentation which illustrates the workflow which allows git to
> track a multi-patch series like this?  It is, from what I have picked up,
> capable of generating the patches ready for emailing automatically but I
> don't know how it does this.  I haven't managed to find anything helpful so
> would appreciate any pointers you might be able to give.

I cannot recall any single guide or tutorial that made Git click for me,
I simply got accustomed to the way it works over time.  However, below
is a crash course for your convenience.

From the mail headers I can see you are using Mutt, so first save local
copies of all the messages containing the patches you would like to
apply, each in a separate file.  Then do something like this (the first
command takes a while to complete):

    $ git clone git://git.infradead.org/linux-platform-drivers-x86.git
    $ cd linux-platform-drivers-x86
    $ git checkout -t -b fujitsu-patches origin/testing
    $ git am /path/to/patch1.patch
    $ git am /path/to/patch2.patch
    ...
    $ git am /path/to/patchN.patch

If any of the "git am" commands fails, it means the given patch does not
apply cleanly to the currently checked out branch.  This will likely be
the case for patches that are many years old, so instead you might want
to consider applying changes manually by editing fujitsu-laptop.c and
doing "git commit -a" after each patch.

If you run "git branch -vv", you will see how your local branch compares
to the remote branch (i.e. how many patches ahead it is).

The whole series can be automatically posted using "git send-email",
though make sure to configure it appropriately before (see "man
git-send-email") and test it extensively by sending patches to yourself
to make sure that whatever "git send-email" produces matches the
expected format (some useful switches to read about: --annotate,
--cover-letter, --subject-prefix).

Mutt also enables you to directly pipe e-mails through "git am", though
you need to make sure it knows where to find your local git repository,
either by starting Mutt in the right folder or using --git-dir and
--work-tree.  You can even use a little bit of macro magic to apply an
entire patch series at once (assuming it is properly threaded).

Also worth mentioning is that my setup is actually a bit different as I
use Linus' git repository as the "origin" remote and Darren's git
repository as another remote called "dvhart".  This way I do not need to
keep multiple copies of the entire kernel source tree if I want to
submit a patch for a different subsystem.

You will likely also want to play around with "git fetch", "git stash",
"git reset --hard", "git rebase -i", to name a few (in no particular
order).

In case you are interested, I am happy to provide further help off-list.

> Currently I'm
> doing it all manually, which doesn't scale.  Up until this series
> fujitsu-laptop hasn't had a significant patch series like this so I haven't
> needed to seriously pursue it.
> 
> > I will definitely take a look and submit my comments, though I might not
> > have the time to do so until somewhere in the middle of next week.  I
> > guess patches that have been queued for the past 7 years or so will not
> > mind another week ;)
> 
> Precisely. :-)  That's fine.  Hopefully by then I'll have it based to the
> right git repo.

I saw the v2 you posted and it applies nicely to dvhart/master, which is
enough for me to do some preliminary testing and comment on the
contents, thanks.

-- 
Best regards,
Michał Kępień
