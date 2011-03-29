From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [RESEND PATCH] Fujitsu tablet pc extras driver
Date: Tue, 29 Mar 2011 11:33:22 +0100
Message-ID: <20110329103321.GA8969@srcf.ucam.org>
References: <20110329100322.GA7099@fais.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:60299 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751876Ab1C2Kdc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Mar 2011 06:33:32 -0400
Content-Disposition: inline
In-Reply-To: <20110329100322.GA7099@fais.local>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Robert Gerlach <khnz@gmx.de>
Cc: "Ryan H. Lewis" <me@ryanlewis.net>, platform-driver-x86@vger.kernel.org, dmitry.torokhov@gmail.com

On Tue, Mar 29, 2011 at 12:03:22PM +0200, Robert Gerlach wrote:

> +#define INTERRUPT 5
> +#define IO_BASE 0xfd70

You're binding to an ACPI device here - does it have a _CRS method? If 
so, you should retrieve the resource information from acpipnp rather 
than hardcoding it. That'll involve reworking it as an acpi driver 
rather than a platform one, but that should be easy enough.

> +/*** HELPER *******************************************************************/

Does checkpatch really not complain about that? I don't think it's a 
terribly helpful comment in any case :)

> +static int fujitsu_busywait(void)

You're sleeping, so it's not really a busywait...

> +static void fujitsu_reset(void)
> +{
> +	fujitsu_ack();
> +	if (fujitsu_busywait())
> +		printk(KERN_WARNING MODULENAME ": timeout, real reset needed!\n");
> +}

We have no idea how to do a "real" reset, I guess?

> +	error = request_irq(INTERRUPT, fujitsu_isr,
> +			IRQF_SHARED, MODULENAME, fujitsu_isr);

Any risk of the irq firing between you doing setup and requesting the 
IRQ?

Other than the above, this looks fine from the driver point of view - 
Cc:ing Dmitry so he can have a quick look at the input side of things.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
