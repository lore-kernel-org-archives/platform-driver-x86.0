From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/8] fujitsu-laptop: use sparse keymaps for input event
 handling
Date: Wed, 29 Mar 2017 12:28:31 -0700
Message-ID: <20170329192831.GB15472@localhost.localdomain>
References: <20170320093224.18541-1-kernel@kempniu.pl>
 <20170324104959.GA31520@marvin.atrad.com.au>
 <20170327235719.GE23486@marvin.atrad.com.au>
 <20170328061618.GA3694@ozzy.nask.waw.pl>
 <20170328230029.GA29146@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:55896 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753049AbdC2T2f (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Mar 2017 15:28:35 -0400
Content-Disposition: inline
In-Reply-To: <20170328230029.GA29146@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 29, 2017 at 09:30:29AM +1030, Jonathan Woithe wrote:
> On Tue, Mar 28, 2017 at 08:16:18AM +0200, Micha?? K??pie?? wrote:
> > > On Fri, Mar 24, 2017 at 09:19:59PM +1030, Jonathan Woithe wrote:
> > > > On Mon, Mar 20, 2017 at 10:32:16AM +0100, Micha?? K??pie?? wrote:
> > > > > This series simplifies handling of both brightness key and hotkey input
> > > > > events on Fujitsu laptops by making use of sparse keymaps.  This not
> > > > > only makes the driver shorter and, hopefully, cleaner, but also enables
> > > > > us to get rid of the keycodeX fields inside struct fujitsu_bl, which
> > > > > facilitates further cleanups.  Also, to simplify error handling, input
> > > > > devices registered by fujitsu-laptop are migrated to the devres API
> > > > > along the way.
> > > > > :
> > > I have completed my initial review of this patch series.  Aside from the
> > > single recommendation about patch 7/8 (posted separately) it looks good.
> > > I await your thoughts regarding patch 7/8 so we can finalise and sign off on
> > > this series.
> > 
> > Thanks for the review, Jonathan.  I agree with your remark regarding the
> > potentially confusing name of the variable holding the S64x0 keymap.
> > 
> > As in the past, we have at least two options: I can either post v2 of
> > all eight patches with three characters changed or you can provide your
> > Reviewed-by for v1, in which case I will kindly ask the maintainers to
> > run:
> > 
> >     sed -i 's|s6400|s64x0|;' drivers/platform/x86/fujitsu-laptop.c
> > 
> > after applying patch 7/8.  Given that this series does a bit more than
> > the cleanup series I posted previously, I sense it might be a good idea
> > to defer submitting v2 until after subsystem maintainers review v1, just
> > in case they find more issues.  If that happens, I will post v2 to avoid
> > confusion.  If not, then v1 can be applied with the one-liner above
> > taken into account (or I can post v2 anyway if that would be preferred
> > by Darren and Andy).
> > 
> > In other words, I am happy to follow whatever route you and the
> > subsystem maintainers suggest and I just want to avoid spamming the
> > mailing list.
> 
> I would be interested to hear what Darren and Andy's preference would be,
> and have no issue with following that.  My personal thought is that it's
> best to have a patch series v2 submitted with the keymap fix since I think
> that reduces the potential confusion now and in the future.  It makes it
> clear what exactly is being signed off on in any Reviewed-By tags.  This

No concerns applying the minor fix. It's very common to say "With XXX,
Reviewed-by: ...", so I that's fine.

> approach also removes the need for Darren or Andy to special case the
> eventual merge of the series (having to remember to do the replacement),
> which in turn reduces the chances of little errors creeping in.  However, if
> Darren and Andy are happy with an alternative then we can go with that.
> 
> As to whether v2 is held until Darren or Andy do their own review, I guess
> it makes sense in case they have other suggestions which are similarly
> trivial to implement.

Completing my review now...

> 
> Regards
>   jonathan
> 

-- 
Darren Hart
VMware Open Source Technology Center
