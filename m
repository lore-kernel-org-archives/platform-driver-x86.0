From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 0/4][RFC v2] fujitsu-laptop: fujitsu-laptop: clean ups
 from Alan Jenkins
Date: Sat, 4 Feb 2017 09:55:34 +1030
Message-ID: <20170203232534.GA12248@marvin.atrad.com.au>
References: <20170131130741.GA6218@marvin.atrad.com.au>
 <20170203134326.GA11947@ozzy.nask.waw.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:55524 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752809AbdBCXZo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Feb 2017 18:25:44 -0500
Content-Disposition: inline
In-Reply-To: <20170203134326.GA11947@ozzy.nask.waw.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: platform-driver-x86@vger.kernel.org

Hi Michael

On Fri, Feb 03, 2017 at 02:43:26PM +0100, Micha?? K??pie?? wrote:
> > This series of patches for the fujitsu-laptop driver was originally
> > submitted by Alan Jenkins in September 2009.  For various reasons which are
> > entirely my fault they were never acted upon.  To remedy this they have been
> > ported to the linux-platform-drivers-x86 git tree and compile-tested. 
> > Consequently this submission is a work in progress and is posted for
> > comments and feedback.
> > 
> > The patches are against git://git.infradead.org/linux-platform-drivers-x86.git
> 
> Jonathan,
> 
> I can now see why you were so reluctant to review this series :)
> 
> It is basically unreviewable in the state you posted it in: multiple
> changes are packed into a single patch, commit messages are inaccurate
> at best and omissive at worst.

Yes, patch 1/4 in particular includes a lot of independent changes.  Patch 2
is not quite as bad.  The last two are fairly self contained.

Having said that, the cleanup they collectively implement is a good thing.

> In order to salvage Alan's efforts, I will rebase these patches on
> dvhart/testing, split them up, write a proper commit message for each of
> them and then repost with Alan as the author.

That sounds like a good plan.  Thanks very much for taking this on.

In the meantime I will attempt to find some time to do some runtime testing
on my S7020.  Admittedly this model uses only a small proportion of the
driver's functions, but it is important that they continue to work.

> This might take a while though - to give you a rough idea, so far I split
> patch 1/4 into eight separate patches (mostly churn, but still).

Sure, and no surprises abot the split numbers so far.

Regards
  jonathan
