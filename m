From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Don't oops when FUJ02E3 is
 not presnt
Date: Tue, 19 Sep 2017 17:50:47 +0930
Message-ID: <20170919082047.GG10399@marvin.atrad.com.au>
References: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
 <20170919040648.GA8426@kmp-mobile.hq.kempniu.pl>
 <20170919042150.GD10399@marvin.atrad.com.au>
 <20170919044224.GA10213@kmp-mobile.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:39640 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750713AbdISIV1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Sep 2017 04:21:27 -0400
Content-Disposition: inline
In-Reply-To: <20170919044224.GA10213@kmp-mobile.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Tue, Sep 19, 2017 at 06:42:24AM +0200, Micha?? K??pie?? wrote:
> > > I need to refresh my memory a bit and think about next steps.  I still
> > > have one more cleanup series queued that is worth posting and I also
> > > need to fix radio LED detection.  My spare time is still very limited,
> > > but I will do my best to post something soon.
> > 
> > In the meantime, I think we ought to consider pushing the proposed patch in
> > order to restore functionality for the S6120 - as it stands the code oopses,
> > which isn't great.  Is there any reason not to do so?
> 
> It might only be worth considering to check whether device is NULL
> inside call_fext_func() in order to prevent any further issues like this
> in the future.  However, for now bl_update_status() is the only place in
> fujitsu-laptop using the fext module-wide variable, so the patch is okay
> as it is, too.

I like the idea of addressing this locally in bl_update_status() as per the
suggested patch.  That may make further cleanup work easier since the module
wide variable was something which was to be possibly removed (although this
S6120 may force a rethink of these plans as you mentioned earlier).  Having
said that, guarding against further bugs like this is tempting.

Since the proposed fix addresses the problem I'm happy for it to be pushed
out as is:

Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

That will at least stop the oops in the interim while the remaining clean up
patch is prepared.  Addressing this problem permanently could be something
that's rolled into that clean up work if it is deemed significant enough.

Darren, Andy: can we push this fix?  It is probably something which should
go to -stable too.

Regards
  jonathan
