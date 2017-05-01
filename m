From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4] platform/x86: ideapad-laptop: Add sysfs interface for
 touchpad state
Date: Mon, 1 May 2017 12:16:30 -0700
Message-ID: <20170501191630.GD29387@fury>
References: <20170217184756.15181-1-rrs@debian.org>
 <1487759058.9334.7.camel@debian.org>
 <CAHp75VcGYLSsnDgb_dzD0NVCK+aR6w7jZWfR+4nN-BfnAcdRWA@mail.gmail.com>
 <1493448775.9725.5.camel@debian.org>
 <CAHp75Vds7Vc3aJWpOO8uqo-y+PzUO+PNrhsjnHxGRs4WXt935A@mail.gmail.com>
 <20170501160543.GA29387@fury>
 <1493663247.10973.1.camel@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:36222 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750741AbdEATQd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 May 2017 15:16:33 -0400
Content-Disposition: inline
In-Reply-To: <1493663247.10973.1.camel@debian.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ritesh Raj Sarraf <rrs@debian.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 01, 2017 at 11:57:27PM +0530, Ritesh Raj Sarraf wrote:
> On Mon, 2017-05-01 at 09:05 -0700, Darren Hart wrote:
> > > sysfs ABI for drivers that provide input interface is quite strong for
> > > my opinion. It means I'm not totally objecting, but I would accept it
> > > if and only if there is nothing else could be done.
> > 
> > Agreed, we've recently wanted to remove certain sysfs attributes from another
> > driver as they were obsolete and better implemented in other ways, but once
> > they
> > are there, are hands are tied.
> > 
> > That said, we will support getting these systems functional. From what I see
> > in
> > the patch you are implementing a polling sysfs interface. Have you verified
> > that
> > there is no event we can capture and send the SW_TABLET_MODE along to the
> > input
> > system?
> 
> I believe it does generate an event (at least on my Yoga 2 13 variant). IIRC,
> when I talked to Andy initially about the driver's limitation, we did do an
> exercise [1] to determine if an event was generated.
> 
> Cooking this patch (sysfs interface) was much quicker and easy. I looked at the
> other example drivers, that do SW_TABLET_MODE, but left it there. I don't think
> I have all the necessary information to get that done for the ideapad driver.
> 
> 
> [1] https://patchwork.kernel.org/patch/9546987/

Thanks. We really want to avoid user-space having to write platform specific
sysfs attribute access to determine system state for common things like "should
I show the on screen keyboard?". That doesn't scale and will result in a very
sparse support matrix in general.

Something I am not particularly well versed in is the issue with hotkeys,
xinput, and only working in Xorg rather than wayland. Where in the stack is this
limitation created? I assume it is above the kernel - no reason Wayland can't
read SW_TABLET_MODE from the input subsystem correct?

I believe I have a couple systems which will replicate this issue so I'll try to
spend some time with them to see what else might be done.

-- 
Darren Hart
VMware Open Source Technology Center
