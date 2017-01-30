From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 0/4][RFC] fujitsu-laptop: clean ups from Alan Jenkins
Date: Tue, 31 Jan 2017 08:53:23 +1030
Message-ID: <20170130222323.GA3343@marvin.atrad.com.au>
References: <20170130124304.GC10561@marvin.atrad.com.au>
 <20170130142817.GA11056@ozzy.nask.waw.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:52156 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753046AbdA3WYB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2017 17:24:01 -0500
Content-Disposition: inline
In-Reply-To: <20170130142817.GA11056@ozzy.nask.waw.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: platform-driver-x86@vger.kernel.org

Hi Michael

On Mon, Jan 30, 2017 at 03:28:17PM +0100, Micha?? K??pie?? wrote:
> > This series of patches for the fujitsu-laptop driver was originally
> > submitted by Alan Jenkins in September 2009.  For various reasons which are
> > entirely my fault they were never acted upon.  To remedy this they have been
> > ported to the linux-platform-drivers-x86 git tree and compile-tested. 
> > Consequently this submission is a work in progress and is posted for
> > comments and feedback.
> 
> Thanks for posting these patches.  You wrote they were compile-tested,
> could you please shed some light on which git branch did you base them
> on?

Obviously the wrong one. :-(  I can't recall the git URL off-hand but will
check this evening when I am at my development box.

> Darren's testing branch in its current state does not work for me, neither
> does Linus' master.

Which of these should I use to fit in with your work (and what is the
respective URL)?  I'm not fussed either way.

On a related note, it's probably time I worked git out properly.  Do you
know of any documentation which illustrates the workflow which allows git to
track a multi-patch series like this?  It is, from what I have picked up,
capable of generating the patches ready for emailing automatically but I
don't know how it does this.  I haven't managed to find anything helpful so
would appreciate any pointers you might be able to give.  Currently I'm
doing it all manually, which doesn't scale.  Up until this series
fujitsu-laptop hasn't had a significant patch series like this so I haven't
needed to seriously pursue it.

> I will definitely take a look and submit my comments, though I might not
> have the time to do so until somewhere in the middle of next week.  I
> guess patches that have been queued for the past 7 years or so will not
> mind another week ;)

Precisely. :-)  That's fine.  Hopefully by then I'll have it based to the
right git repo.

Regards
  jonathan
