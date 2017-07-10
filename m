From: Darren Hart <dvhart@infradead.org>
Subject: Re: r8169 broken when enabling the Atom PMC platform clocks
Date: Mon, 10 Jul 2017 09:06:30 -0700
Message-ID: <20170710160630.GA25390@fury>
References: <CAL9uMOGxNGp_dgk+u0n0EngbUOgp9jT8ZpEwk-m4LzAbhYoqzg@mail.gmail.com>
 <1499696443.22624.327.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:51688 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754503AbdGJQGo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Jul 2017 12:06:44 -0400
Content-Disposition: inline
In-Reply-To: <1499696443.22624.327.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Carlo Caione <carlo@endlessm.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, irina.tirdea@intel.com, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Stephen Boyd <sboyd@codeaurora.org>, nic_swsd@realtek.com, Linux Upstreaming Team <linux@endlessm.com>, Enric Balletbo Serra <eballetbo@gmail.com>

On Mon, Jul 10, 2017 at 05:20:43PM +0300, Andy Shevchenko wrote:
> On Mon, 2017-07-10 at 16:15 +0200, Carlo Caione wrote:
> > Hi,
> > We are working on an Asus Z550M shipping a baytrail processor. From
> > the 4.11 kernel we noticed that the system is not bootable anymore
> > since it hangs during boot when probing the r8169 driver, not even a
> > trace is available.
> > 
> > We bisected this problem down to commit 282a4e4 ("platform/x86: Enable
> > Atom PMC platform clocks").
> > 
> > We suspected that the problem is that one of the PMC clocks is being
> > used by the Ethernet board as XTAL clock and since it is not
> > explicitly claimed by the driver, it is gated at boot by the clock
> > framework, causing the system to hang.
> > 
> > We have a quirk downstream in place where we basically modified the
> > r8169 driver to claim the 25MHz pmc_plt_clk_4 clock, and this seems to
> > work fine, but we really want to find a more upstreamable and
> > definitive solution.
> 
> Can you copy in-place the hack patch you have?
> 
> > The best solution would probably be avoiding to gate the clocks at all
> > when booting if these are being already used by the firmware, but IIUC
> > this information is not always available in the enable clock register.
> 
> Yes, sounds sane.

Looking back, I've seen two instances that appear related to this patch
series. This one, and the one reported by Enric (on Cc) regarding the
Acer C200 audio.

Enric, did your issue get resolved?

In those two cases, are we able to determine programmatically if the
clock is already in use by the firmware? (via the enabled register I
presume?)

> 
> > Any idea how to approach this issue? I guess in the future we will see
> > more platforms needing a quirk like this because of fancy clock
> > routings.
> 
> As simplest way we might do DMI matching, though I prefer to avoid as
> much as possible loading kernel by quirks.
> 

This is the ultimate result of introducing these kinds of drivers well
after the release of the silicon. OEMs will do what they have to do to
get it to work, inevitably in a very platform specific way, which will
conflict with a general solution introduced later. It's unfortunate, but
the reality.

I would like to see us attempt to detect this via available means
(enable register?) and failing that, introduce the DMI quirks... it
sounds like the clocks are platform data after all...

> Pierre?
> 
> Darren, it seems not the first report regarding this series.
> Like a quick fix we perhaps need to revert enabling patch and propagate
> to stable. Opinions?

My concern with a revert is we'll just break platforms depending on the
new feature. It was first released with 4.12... so perhaps that is a
minimal risk.

What would be the long term solution? Presumably we want to enable it
again at some point?

I'd like to hear back from Pierre and Enric. If we can do this with
generic detection and a DMI based quirk, I *think* that would be
preferable.

> 
> -- 
> Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Intel Finland Oy
> 

-- 
Darren Hart
VMware Open Source Technology Center
