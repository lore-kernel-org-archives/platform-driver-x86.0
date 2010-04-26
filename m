From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] IPC driver for Intel Mobile Internet Device (MID)
	platforms
Date: Mon, 26 Apr 2010 16:09:34 +0100
Message-ID: <20100426150934.GA9422@srcf.ucam.org>
References: <20100423143037.6744.87450.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:53896 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751995Ab0DZPJl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Apr 2010 11:09:41 -0400
Content-Disposition: inline
In-Reply-To: <20100423143037.6744.87450.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, akpm@linux.intel.com, sreedhara.ds@intel.com

On Fri, Apr 23, 2010 at 03:30:59PM +0100, Alan Cox wrote:

Seems basically fine, with a few comments inline. One not especially 
related query in passing - the graphics driver for Moorestown hasn't 
been submitted yet, and the version in Meego doesn't look like it's 
especially upstreamable. I seem to recall that Moorestown was going to 
lack port IO, so does it have VGA compatibility? If not, is there any 
use in mainline Moorestown support until support for the graphics is 
submitted?

> +/* Read single register */
> +int intel_scu_ipc_ioread8(u16 addr, u8 *data);
> +
> +/* Read two registers */
> +int intel_scu_ipc_ioread16(u16 addr, u16 *data);
> +
> +/* Read four registers */
> +int intel_scu_ipc_ioread32(u16 addr, u32 *data);

Are these comments really needed?

> + * Update single register based on the mask
> + * First element of data is register value and second element is mask value
> + */
> +int intel_scu_ipc_update_register(u16 addr, u8 data[2]);

Would seem neater as two separate arguments rather than an array...

> + * SCU runing in ARC processor communicates with other entity running in IA
> + * core through IPC mechanism which in turn messaging between IA core ad SCU.
> + * SCU has two IPC mechanism IPC-1 and IPC-2. IPC-1 is used between IA32 and
> + * SCU where IPC-2 is used between P-Unit and SCU. This driver delas with
> + * IPC-1 Driver provides an API for power control unit registers (e.g. MSIC)
> + * along with other APIs.

This isn't especially clear. I think I understand what it's talking 
about (There's a service processor and an x86, and this driver is 
responsible for handing the communication between the two - but there's 
also another IPC mechanism for talking to P-Unit, which isn't explained 
here but at a guess is some kind of hip-hop group and thus outside the 
scope of this driver?

> +#define IPC_BASE_ADDR     0xFF11C000	/* IPC1 base register address */

The address is guaranteed to be stable? This doesn't need to come from 
SFI or anything?

> +static struct intel_scu_ipc_dev  ipcdev; /* Only one for now */

If this is going to change in future then it might be sane to get it 
right now.

> +static int platform = 1;
> +module_param(platform, int, 0);
> +MODULE_PARM_DESC(platform, "1 for moorestown platform");

What do non-1 values mean? It looks like everything other than 1 
provides some default behaviour. Could you check for invalid values and 
abort in order to avoid breakage if someone depends on this?

> +static inline u8 ipc_readl(u32 offset) /* Read ipc u32 data */

read16 in places and readl in others?

> +int intel_scu_ipc_battery_cc_read(u32 *value)

I'm a bit confused by the cc functions. The actual battery code isn't in 
this driver, so why are these functions not in the battery driver?

> +int intel_scu_ipc_i2c_cntrl(u32 addr, u32 *data)

Same here. If the i2c functionality is in this device, why not keep the 
full i2c driver code here?

> +	mutex_lock(&ipclock);
> +	cmd = (addr >> 24) & 0xFF;
> +	if (cmd == IPC_I2C_READ) {
> +		writel(addr, ipcdev.i2c_base + IPC_I2C_CNTRL_ADDR);
> +		/* Write not getting updated without delay */

It needs a delay rather than a posting read?

> +/*
> + * Interrupt handler gets called when ioc bit of IPC_COMMAND_REG set to 1
> + * When ioc bit is set to 1, caller api must wait for interrupt handler called
> + * which in turn unlocks the caller api. Currently this is not used

Is this a problem? It looks like ioc can only be set if someone passes 
it in via intel_scu_ipc_simple_command() and that's a pretty obvious 
"Don't do that", but it'd be nice to get rid of the busy looping.

All of these symbols are EXPORT_SYMBOL. Is there a reason they're not 
EXPORT_SYMBOL_GPL?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
