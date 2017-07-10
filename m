From: Carlo Caione <carlo@endlessm.com>
Subject: Re: r8169 broken when enabling the Atom PMC platform clocks
Date: Mon, 10 Jul 2017 20:23:05 +0200
Message-ID: <CAL9uMOHju-_e2krDAG4CEy82NkLM9rFAhBr5G-LxXQYvzAQBiA@mail.gmail.com>
References: <CAL9uMOGxNGp_dgk+u0n0EngbUOgp9jT8ZpEwk-m4LzAbhYoqzg@mail.gmail.com>
 <1499696443.22624.327.camel@linux.intel.com> <20170710160630.GA25390@fury> <CAL9uMOESYq+17igx+GMEJA+MYACddjj9WpsfQSq19ty_kfKbUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ua0-f181.google.com ([209.85.217.181]:36626 "EHLO
        mail-ua0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752509AbdGJSXH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Jul 2017 14:23:07 -0400
Received: by mail-ua0-f181.google.com with SMTP id g40so59782940uaa.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Jul 2017 11:23:07 -0700 (PDT)
In-Reply-To: <CAL9uMOESYq+17igx+GMEJA+MYACddjj9WpsfQSq19ty_kfKbUw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Stephen Boyd <sboyd@codeaurora.org>, nic_swsd@realtek.com, Linux Upstreaming Team <linux@endlessm.com>, Enric Balletbo Serra <eballetbo@gmail.com>

On Mon, Jul 10, 2017 at 7:50 PM, Carlo Caione <carlo@endlessm.com> wrote:
> On Mon, Jul 10, 2017 at 6:06 PM, Darren Hart <dvhart@infradead.org> wrote:
>> On Mon, Jul 10, 2017 at 05:20:43PM +0300, Andy Shevchenko wrote:
>>> On Mon, 2017-07-10 at 16:15 +0200, Carlo Caione wrote:
>>> > Hi,
>>> > We are working on an Asus Z550M shipping a baytrail processor. From
>>> > the 4.11 kernel we noticed that the system is not bootable anymore
>>> > since it hangs during boot when probing the r8169 driver, not even a
>>> > trace is available.
>>> >
>>> > We bisected this problem down to commit 282a4e4 ("platform/x86: Enable
>>> > Atom PMC platform clocks").
>>> >
>>> > We suspected that the problem is that one of the PMC clocks is being
>>> > used by the Ethernet board as XTAL clock and since it is not
>>> > explicitly claimed by the driver, it is gated at boot by the clock
>>> > framework, causing the system to hang.
>>> >
>>> > We have a quirk downstream in place where we basically modified the
>>> > r8169 driver to claim the 25MHz pmc_plt_clk_4 clock, and this seems to
>>> > work fine, but we really want to find a more upstreamable and
>>> > definitive solution.
>>>
>>> Can you copy in-place the hack patch you have?
>>>
>>> > The best solution would probably be avoiding to gate the clocks at all
>>> > when booting if these are being already used by the firmware, but IIUC
>>> > this information is not always available in the enable clock register.
>>>
>>> Yes, sounds sane.
>>
>> Looking back, I've seen two instances that appear related to this patch
>> series. This one, and the one reported by Enric (on Cc) regarding the
>> Acer C200 audio.
>>
>> Enric, did your issue get resolved?
>>
>> In those two cases, are we able to determine programmatically if the
>> clock is already in use by the firmware? (via the enabled register I
>> presume?)
>
> Just tested this and the answer is no.
> __clk_is_enabled() on the pmc_plt_clk_4 clock before
> clk_prepare_enable() returns 0.

Uhm, this is not true actually. I tested this in the r8169 driver at
probe time, so a bit too late if the clock framework already disabled
those clocks.
I checked again the enable registers in plt_clk_register() and I can
actually see that the pmc_plt_clk_4 is already enabled at boot by the
firmware. So yeah, at least in my case we are able to determine
programmatically if the clock is used already by the firmware.

-- 
Carlo Caione  |  +39.340.80.30.096  |  Endless
