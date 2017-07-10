From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: r8169 broken when enabling the Atom PMC platform clocks
Date: Mon, 10 Jul 2017 21:46:00 +0300
Message-ID: <1499712360.22624.332.camel@linux.intel.com>
References: <CAL9uMOGxNGp_dgk+u0n0EngbUOgp9jT8ZpEwk-m4LzAbhYoqzg@mail.gmail.com>
         <1499696443.22624.327.camel@linux.intel.com> <20170710160630.GA25390@fury>
         <CAL9uMOESYq+17igx+GMEJA+MYACddjj9WpsfQSq19ty_kfKbUw@mail.gmail.com>
         <CAL9uMOHju-_e2krDAG4CEy82NkLM9rFAhBr5G-LxXQYvzAQBiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:45363 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754292AbdGJSqF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Jul 2017 14:46:05 -0400
In-Reply-To: <CAL9uMOHju-_e2krDAG4CEy82NkLM9rFAhBr5G-LxXQYvzAQBiA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Carlo Caione <carlo@endlessm.com>, Darren Hart <dvhart@infradead.org>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Stephen Boyd <sboyd@codeaurora.org>, nic_swsd@realtek.com, Linux Upstreaming Team <linux@endlessm.com>, Enric Balletbo Serra <eballetbo@gmail.com>

On Mon, 2017-07-10 at 20:23 +0200, Carlo Caione wrote:
> On Mon, Jul 10, 2017 at 7:50 PM, Carlo Caione <carlo@endlessm.com>
> wrote:
> > On Mon, Jul 10, 2017 at 6:06 PM, Darren Hart <dvhart@infradead.org>
> > wrote:
> > > On Mon, Jul 10, 2017 at 05:20:43PM +0300, Andy Shevchenko wrote:
> > > > On Mon, 2017-07-10 at 16:15 +0200, Carlo Caione wrote:

>>>>> The best solution would probably be avoiding to gate the clocks at
>>>>> all
> > > > > when booting if these are being already used by the firmware,
> > > > > but IIUC
> > > > > this information is not always available in the enable clock
> > > > > register.

> > > In those two cases, are we able to determine programmatically if
> > > the
> > > clock is already in use by the firmware? (via the enabled register
> > > I
> > > presume?)

> I checked again the enable registers in plt_clk_register() and I can
> actually see that the pmc_plt_clk_4 is already enabled at boot by the
> firmware. So yeah, at least in my case we are able to determine
> programmatically if the clock is used already by the firmware.

So, then it should be trivial to update the PMC clock driver to follow
firmware settings.

Please, Cc Enric when send the patch / new mail regarding topic.

Thanks, for investigating this!

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
