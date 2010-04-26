From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] IPC driver for Intel Mobile Internet Device (MID)
	platforms
Date: Mon, 26 Apr 2010 16:43:00 +0100
Message-ID: <20100426154300.GA10782@srcf.ucam.org>
References: <20100423143037.6744.87450.stgit@localhost.localdomain> <20100426150934.GA9422@srcf.ucam.org> <20100426155534.6dcaca0c@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:58119 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753347Ab0DZPnI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Apr 2010 11:43:08 -0400
Content-Disposition: inline
In-Reply-To: <20100426155534.6dcaca0c@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, akpm@linux-foundation.org, sreedhara.ds@intel.com, mingo@elte.hu

On Mon, Apr 26, 2010 at 03:55:34PM +0100, Alan Cox wrote:
> > related query in passing - the graphics driver for Moorestown hasn't 
> > been submitted yet, and the version in Meego doesn't look like it's 
> > especially upstreamable. I seem to recall that Moorestown was going
> > to lack port IO, so does it have VGA compatibility? If not, is there
> > any use in mainline Moorestown support until support for the graphics
> > is submitted?
> 
> Graphics is very very late on the merge list for obvious reasons. It's
> not even practical to start looking at upstreaming any of the graphics
> stuff until the core platform support is present and you've got a base
> platform to work from. A fair bit of the core MRST stuff is already
> merged (eg SFI).

The case I'm worried about is where the graphics driver never gets into 
a mergable state and we end up with a pile of mainline code that can't 
sanely run on the hardware. As long as the plan is to get it to avoid 
duplicating the entire Intel modesetting code and including its own TTM 
then that seems fair enough, but Intel's track record on this side of 
things hasn't been great.

> > Would seem neater as two separate arguments rather than an array...
> 
> There are patches further down the pile that correct that one funnily
> enough.

Good to know. Worth getting them in before merging, given that it 
changes the interface?

> > there's also another IPC mechanism for talking to P-Unit, which isn't
> > explained here but at a guess is some kind of hip-hop group and thus
> > outside the scope of this driver?
> 
> Correct except for the hip-hop group. Although hopefully someone will
> run out and form P-Unit at this point.

Ok. It'd be nice if the comment were slightly clearer.

> > > +#define IPC_BASE_ADDR     0xFF11C000	/* IPC1 base register
> > > address */
> > 
> > The address is guaranteed to be stable? This doesn't need to come
> > from SFI or anything?
> 
> It's stable. Getting it to come out of the "PCI" BARs  would make many
> people happy.

But not possible at the moment? Fair enough.

> > > +static int platform = 1;
> > > +module_param(platform, int, 0);
> > > +MODULE_PARM_DESC(platform, "1 for moorestown platform");
> > 
> > What do non-1 values mean? It looks like everything other than 1 
> > provides some default behaviour. Could you check for invalid values
> > and abort in order to avoid breakage if someone depends on this?
> 
> There are two message formats (don't blame me I wasn't involved !)
> depending upon the exact platform. This will eventually get
> autodetected but Ingo hasn't even responded to that patch despite
> three sends of it. We already sort of expose the needed info but at the
> moment it requires drivers go rudely grovelling into x86 boot struct
> internals because there is no wrapper function.

Ok. I'd prefer it if passing random numbers resulted in failure rather 
than default behaviour, but if there's never going to be another 
platform that uses the Moorestown format then that's not a real problem.

> > > +static inline u8 ipc_readl(u32 offset) /* Read ipc u32 data */
> > 
> > read16 in places and readl in others?
> 
> One is the exposed external API, the other is a little one line
> internal helper that does unrelated things.

It just made me double-take.

> > > +int intel_scu_ipc_battery_cc_read(u32 *value)
> > 
> > I'm a bit confused by the cc functions. The actual battery code isn't
> > in this driver, so why are these functions not in the battery driver?
> 
> Because the locking is in this driver. You can either smear the locking
> all over the kernel or put the message format aware functions in one
> place. I have some ideas how to tackle this better longer term.

Ok.

> > > +int intel_scu_ipc_i2c_cntrl(u32 addr, u32 *data)
> > 
> > Same here. If the i2c functionality is in this device, why not keep
> > the full i2c driver code here?
> 
> Good question - we don't need the I2C bit yet so we could just drop it
> for the moment and add it back layer wherever it belongs (however see
> 'smear the locking all over')

Fair enough.

> > All of these symbols are EXPORT_SYMBOL. Is there a reason they're not 
> > EXPORT_SYMBOL_GPL?
> 
> That is how I inherited the driver code and it's not a driver internal
> interface so I believe EXPORT_SYMBOL is correct based upon Linus
> description of _GPL.

Ok. We expect the platform to be usable without non-GPL drivers that 
require the IPC mechanism?
-- 
Matthew Garrett | mjg59@srcf.ucam.org
