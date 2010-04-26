From: Alan Cox <alan@linux.intel.com>
Subject: Re: [PATCH] IPC driver for Intel Mobile Internet Device (MID)
 platforms
Date: Mon, 26 Apr 2010 15:55:34 +0100
Message-ID: <20100426155534.6dcaca0c@linux.intel.com>
References: <20100423143037.6744.87450.stgit@localhost.localdomain>
	<20100426150934.GA9422@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.89]:19285 "EHLO
	fmsmga101.fm.intel.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751590Ab0DZPbe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Apr 2010 11:31:34 -0400
In-Reply-To: <20100426150934.GA9422@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, akpm@linux.intel.com, sreedhara.ds@intel.com, mingo@elte.hu

> related query in passing - the graphics driver for Moorestown hasn't 
> been submitted yet, and the version in Meego doesn't look like it's 
> especially upstreamable. I seem to recall that Moorestown was going
> to lack port IO, so does it have VGA compatibility? If not, is there
> any use in mainline Moorestown support until support for the graphics
> is submitted?

Graphics is very very late on the merge list for obvious reasons. It's
not even practical to start looking at upstreaming any of the graphics
stuff until the core platform support is present and you've got a base
platform to work from. A fair bit of the core MRST stuff is already
merged (eg SFI).
 
> > +/* Read single register */
> > +int intel_scu_ipc_ioread8(u16 addr, u8 *data);
> > +
> > +/* Read two registers */
> > +int intel_scu_ipc_ioread16(u16 addr, u16 *data);
> > +
> > +/* Read four registers */
> > +int intel_scu_ipc_ioread32(u16 addr, u32 *data);
> 
> Are these comments really needed?

I left them in because the IPC is seeing four 8bit registers on its
side not one 32bit 'register'. It's not usually an important
distinction but it can be.

> > + * Update single register based on the mask
> > + * First element of data is register value and second element is
> > mask value
> > + */
> > +int intel_scu_ipc_update_register(u16 addr, u8 data[2]);
> 
> Would seem neater as two separate arguments rather than an array...

There are patches further down the pile that correct that one funnily
enough.

> there's also another IPC mechanism for talking to P-Unit, which isn't
> explained here but at a guess is some kind of hip-hop group and thus
> outside the scope of this driver?

Correct except for the hip-hop group. Although hopefully someone will
run out and form P-Unit at this point.

> > +#define IPC_BASE_ADDR     0xFF11C000	/* IPC1 base register
> > address */
> 
> The address is guaranteed to be stable? This doesn't need to come
> from SFI or anything?

It's stable. Getting it to come out of the "PCI" BARs  would make many
people happy.

> > +static struct intel_scu_ipc_dev  ipcdev; /* Only one for now */
> 
> If this is going to change in future then it might be sane to get it 
> right now.

I can't possibly comment on unreleased product and plans but I'm quite
happy with it as is.

> > +static int platform = 1;
> > +module_param(platform, int, 0);
> > +MODULE_PARM_DESC(platform, "1 for moorestown platform");
> 
> What do non-1 values mean? It looks like everything other than 1 
> provides some default behaviour. Could you check for invalid values
> and abort in order to avoid breakage if someone depends on this?

There are two message formats (don't blame me I wasn't involved !)
depending upon the exact platform. This will eventually get
autodetected but Ingo hasn't even responded to that patch despite
three sends of it. We already sort of expose the needed info but at the
moment it requires drivers go rudely grovelling into x86 boot struct
internals because there is no wrapper function.

(cc Ingo to prod him again)

> > +static inline u8 ipc_readl(u32 offset) /* Read ipc u32 data */
> 
> read16 in places and readl in others?

One is the exposed external API, the other is a little one line
internal helper that does unrelated things.

> > +int intel_scu_ipc_battery_cc_read(u32 *value)
> 
> I'm a bit confused by the cc functions. The actual battery code isn't
> in this driver, so why are these functions not in the battery driver?

Because the locking is in this driver. You can either smear the locking
all over the kernel or put the message format aware functions in one
place. I have some ideas how to tackle this better longer term.

> > +int intel_scu_ipc_i2c_cntrl(u32 addr, u32 *data)
> 
> Same here. If the i2c functionality is in this device, why not keep
> the full i2c driver code here?

Good question - we don't need the I2C bit yet so we could just drop it
for the moment and add it back layer wherever it belongs (however see
'smear the locking all over')

> 
> > +	mutex_lock(&ipclock);
> > +	cmd = (addr >> 24) & 0xFF;
> > +	if (cmd == IPC_I2C_READ) {
> > +		writel(addr, ipcdev.i2c_base + IPC_I2C_CNTRL_ADDR);
> > +		/* Write not getting updated without delay */
> 
> It needs a delay rather than a posting read?

It's not PCI bus, it's magic ;)

> > +/*
> > + * Interrupt handler gets called when ioc bit of IPC_COMMAND_REG
> > set to 1
> > + * When ioc bit is set to 1, caller api must wait for interrupt
> > handler called
> > + * which in turn unlocks the caller api. Currently this is not used
> 
> Is this a problem? It looks like ioc can only be set if someone
> passes it in via intel_scu_ipc_simple_command() and that's a pretty
> obvious "Don't do that", but it'd be nice to get rid of the busy
> looping.

If anything the direction will continue to be not using the interrupt.
We catch the IRQ just in case an IRQ pops up from somewhere.

> All of these symbols are EXPORT_SYMBOL. Is there a reason they're not 
> EXPORT_SYMBOL_GPL?

That is how I inherited the driver code and it's not a driver internal
interface so I believe EXPORT_SYMBOL is correct based upon Linus
description of _GPL.



