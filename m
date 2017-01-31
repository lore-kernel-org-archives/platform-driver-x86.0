From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 0/4][RFC] fujitsu-laptop: clean ups from Alan Jenkins
Date: Tue, 31 Jan 2017 22:29:57 +1030
Message-ID: <20170131115957.GD5293@marvin.atrad.com.au>
References: <20170130124304.GC10561@marvin.atrad.com.au>
 <20170130142817.GA11056@ozzy.nask.waw.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:52630 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751656AbdAaMA2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Jan 2017 07:00:28 -0500
Content-Disposition: inline
In-Reply-To: <20170130142817.GA11056@ozzy.nask.waw.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: platform-driver-x86@vger.kernel.org

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
> on?  Darren's testing branch in its current state does not work for me,
> neither does Linus' master.

I used this git URL with "git clone":

  git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git

I think that's Darren's.  However, it seems there was a typo in a change
made in patch 1/4, and I somehow managed to miss a compile test on that
before moving on.  To fix, in the first two patches, search for
"fujitsu_latop" and replace with "fujitsu_laptop" (there's one instance per
patch).  I will see if I can work out a way to get git to generate a patch
series and if successfull will repost the series with the above fix.

Sorry for the inconvenience.

Regards
  jonathan
