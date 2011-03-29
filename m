From: Robert Gerlach <khnz@gmx.de>
Subject: Re: [RESEND PATCH] Fujitsu tablet pc extras driver
Date: Tue, 29 Mar 2011 14:11:03 +0200
Message-ID: <20110329121103.GA5922@knothebonkz.local>
References: <20110329100322.GA7099@fais.local>
 <20110329103321.GA8969@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.22]:47411 "HELO
	mailout-de.gmx.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752084Ab1C2MLX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Mar 2011 08:11:23 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.its-rgerlach.de (Postfix) with ESMTP id 4DED6E6E
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Mar 2011 14:11:19 +0200 (CEST)
Received: from mail.its-rgerlach.de ([127.0.0.1])
	by localhost (fais.luebbenau.local [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6beQxwgvfU6E for <platform-driver-x86@vger.kernel.org>;
	Tue, 29 Mar 2011 14:11:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.its-rgerlach.de (Postfix) with ESMTP id 6DC7C2357
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Mar 2011 14:11:14 +0200 (CEST)
Content-Disposition: inline
In-Reply-To: <20110329103321.GA8969@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: "Ryan H. Lewis" <me@ryanlewis.net>, platform-driver-x86@vger.kernel.org

On Tue, Mar 29, 2011 at 11:33:22AM +0100, Matthew Garrett wrote:
> On Tue, Mar 29, 2011 at 12:03:22PM +0200, Robert Gerlach wrote:
> 
> > +#define INTERRUPT 5
> > +#define IO_BASE 0xfd70
> 
> You're binding to an ACPI device here - does it have a _CRS method? If 
> so, you should retrieve the resource information from acpipnp rather 
> than hardcoding it. That'll involve reworking it as an acpi driver 
> rather than a platform one, but that should be easy enough.

Yes, it have a _CRS, but I removed the code because it is always the same
IRQ and IO range. I'll reimplement with the first device it make it
necessary.

> > +/*** HELPER *******************************************************************/
> 
> Does checkpatch really not complain about that? I don't think it's a 
> terribly helpful comment in any case :)

True, I'll remove it.

> > +static int fujitsu_busywait(void)
> 
> You're sleeping, so it's not really a busywait...
> 
> > +static void fujitsu_reset(void)
> > +{
> > +	fujitsu_ack();
> > +	if (fujitsu_busywait())
> > +		printk(KERN_WARNING MODULENAME ": timeout, real reset needed!\n");
> > +}
> 
> We have no idea how to do a "real" reset, I guess?

No, I'm not sure if it possible to reset the device. But in over 4 years,
I never see this happen. But I want to keep it, maybe I need to
reinvestigate someday.

> > +	error = request_irq(INTERRUPT, fujitsu_isr,
> > +			IRQF_SHARED, MODULENAME, fujitsu_isr);
> 
> Any risk of the irq firing between you doing setup and requesting the 
> IRQ?

Theoretically yes. I will check it.

> Other than the above, this looks fine from the driver point of view - 
> Cc:ing Dmitry so he can have a quick look at the input side of things.

I'll make a new patch.

Thank you.

> -- 
> Matthew Garrett | mjg59@srcf.ucam.org
