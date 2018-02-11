From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH][RfC] Some buttons on the Fujitsu u7[25]7 laptops are not
 working
Date: Sun, 11 Feb 2018 14:38:14 +1030
Message-ID: <20180211040814.GB12203@marvin.atrad.com.au>
References: <69f33335-962b-f3be-da8e-2eeff1ae2a49@fbihome.de>
 <20180119234547.GB24590@marvin.atrad.com.au>
 <84b872ec-ba48-6423-cb7b-48f2c3ef30d2@fbihome.de>
 <e69cad3d-067b-5a22-0f4d-0c29691037c7@fbihome.de>
 <20180209113144.GC23589@marvin.atrad.com.au>
 <20180210212330.GD2070@larwa.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:33194 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752529AbeBKEIa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 10 Feb 2018 23:08:30 -0500
Content-Disposition: inline
In-Reply-To: <20180210212330.GD2070@larwa.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Jan-Marek Glogowski <glogow@fbihome.de>, platform-driver-x86@vger.kernel.org

Hi Michel

On Sat, Feb 10, 2018 at 10:23:30PM +0100, Micha?? K??pie?? wrote:
> > With the minor changes in place I do not think this patch will cause any
> > regressions for other Fujitsu systems since it is only adding meaning to
> > bits of the flags_supported field, and older system do not have those bits
> > set.  Any comments Michel?
> 
> While the patch does not seem to break anything, I cannot say I like how
> we are approaching this.
> 
> All Jan-Marek wrote suggests that Fujitsu decided to transition from one
> way of handling hotkeys to another.  We need to handle both of them.
> Until we learned about the new U series models, it looked like the
> touchpad toggle hotkey was an exception to the rule.  Given what we know
> now, it looks more like a harbinger of further changes.

You have raised a good point.

> For me, adding support for the new systems in an elegant way would mean:
> 
>   - detecting models without dedicated hotkeys and forcing an immediate
>     release event when a "press" is detected on such models; we can take
>     a shot at bit 29 being the indicator, the worst that is going to
>     happen is that we will get double release events on some machines,

The effect of a double release depends on the way the key events go on to be
handled.  If they trigger on key-down there will be no issue.  If they go on
key-up then each key will get pressed twice for each physical action.  I
guess time will tell.

>   - keeping GIRB and S000 keymaps separate as these two hotkey handling
>     methods are completely different: the former utilizes a ring buffer,
>     the latter relies on setting bits in the return value of a function
>     and clearing them after they have been "retrieved"; the two keymaps
>     would then have to be merged into a single sparse keymap upon device
>     instantiation.
> 
> However, it is Jonathan who is the module maintainer and Jan-Marek's
> patch does not break stuff.  I am thus happy to present my vision after
> this patch gets merged.

In the interests of making things work for owners of the newer systems in
the short term I am inclined to say we merge the patch from Jan-Marek, on
the understanding that the more extensive infrastructure changes will be
needed in order to handle this in a sane way into the future.  I don't think
the proposed patch will make it any harder to effect the changes you have in
mind, will it?

I'm all for elegant solutions, so I would welcome patches working towards
the broader ideas you outlined above.  Keeping both handling methods
separate does seem to be a good idea.

> By the way, sorry about being late to the party, but severe lack of
> spare time pretty much prevents me from following this list.  CC'ing me
> directly increases the odds of eliciting a response.

No problem - I too am quite busy at the moment so I totally understand.

Regards
  jonathan
