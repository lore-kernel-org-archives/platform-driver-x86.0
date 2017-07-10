From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: r8169 broken when enabling the Atom PMC platform clocks
Date: Mon, 10 Jul 2017 17:20:43 +0300
Message-ID: <1499696443.22624.327.camel@linux.intel.com>
References: <CAL9uMOGxNGp_dgk+u0n0EngbUOgp9jT8ZpEwk-m4LzAbhYoqzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:20658 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932284AbdGJOUs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Jul 2017 10:20:48 -0400
In-Reply-To: <CAL9uMOGxNGp_dgk+u0n0EngbUOgp9jT8ZpEwk-m4LzAbhYoqzg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Carlo Caione <carlo@endlessm.com>, Platform Driver <platform-driver-x86@vger.kernel.org>
Cc: Darren Hart <dvhart@infradead.org>, irina.tirdea@intel.com, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Stephen Boyd <sboyd@codeaurora.org>, nic_swsd@realtek.com, Linux Upstreaming Team <linux@endlessm.com>

On Mon, 2017-07-10 at 16:15 +0200, Carlo Caione wrote:
> Hi,
> We are working on an Asus Z550M shipping a baytrail processor. From
> the 4.11 kernel we noticed that the system is not bootable anymore
> since it hangs during boot when probing the r8169 driver, not even a
> trace is available.
> 
> We bisected this problem down to commit 282a4e4 ("platform/x86: Enable
> Atom PMC platform clocks").
> 
> We suspected that the problem is that one of the PMC clocks is being
> used by the Ethernet board as XTAL clock and since it is not
> explicitly claimed by the driver, it is gated at boot by the clock
> framework, causing the system to hang.
> 
> We have a quirk downstream in place where we basically modified the
> r8169 driver to claim the 25MHz pmc_plt_clk_4 clock, and this seems to
> work fine, but we really want to find a more upstreamable and
> definitive solution.

Can you copy in-place the hack patch you have?

> The best solution would probably be avoiding to gate the clocks at all
> when booting if these are being already used by the firmware, but IIUC
> this information is not always available in the enable clock register.

Yes, sounds sane.

> Any idea how to approach this issue? I guess in the future we will see
> more platforms needing a quirk like this because of fancy clock
> routings.

As simplest way we might do DMI matching, though I prefer to avoid as
much as possible loading kernel by quirks.

Pierre?

Darren, it seems not the first report regarding this series.
Like a quick fix we perhaps need to revert enabling patch and propagate
to stable. Opinions?

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
