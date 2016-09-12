From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [patch v1] x86/platform/mellanox: introduce support for Mellanox
 systems platform
Date: Mon, 12 Sep 2016 09:04:57 +0200
Message-ID: <20160912070457.GA4590@kroah.com>
References: <1473661798-112691-1-git-send-email-vadimp@mellanox.com>
 <20160912061237.GB11230@kroah.com>
 <AM5PR0501MB2097F4FF64CD69BD634B8CCEA2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:56969 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932302AbcILHEx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Sep 2016 03:04:53 -0400
Content-Disposition: inline
In-Reply-To: <AM5PR0501MB2097F4FF64CD69BD634B8CCEA2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "davem@davemloft.net" <davem@davemloft.net>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>

On Mon, Sep 12, 2016 at 06:44:03AM +0000, Vadim Pasternak wrote:
> 
> 
> > -----Original Message-----
> > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > Sent: Monday, September 12, 2016 9:13 AM
> > To: Vadim Pasternak <vadimp@mellanox.com>
> > Cc: tglx@linutronix.de; mingo@redhat.com; hpa@zytor.com;
> > davem@davemloft.net; geert@linux-m68k.org; akpm@linux-foundation.org;
> > kvalo@codeaurora.org; mchehab@kernel.org; linux@roeck-us.net;
> > x86@kernel.org; linux-kernel@vger.kernel.org; platform-driver-
> > x86@vger.kernel.org; jiri@resnulli.us
> > Subject: Re: [patch v1] x86/platform/mellanox: introduce support for Mellanox
> > systems platform
> > 
> > On Mon, Sep 12, 2016 at 06:29:58AM +0000, vadimp@mellanox.com wrote:
> > > From: Vadim Pasternak <vadimp@mellanox.com>
> > >
> > > Enable system support for the Mellanox Technologies platform, which
> > > provides support for the next Mellanox basic systems: "msx6710",
> > > "msx6720", "msb7700", "msn2700", "msx1410", "msn2410", "msb7800",
> > > "msn2740", "msn2100" and also various number of derivative systems
> > > from the above basic types.
> > 
> > What does "system support" mean?
> > 
> > Why can't this just be a "normal" PCI driver, as you are just accessing a PCI
> > device and doing something with it, seems odd to claim it is a "platform" driver.
> > 
> 
> This driver also activates probes to create i2c platform driver and muxes.

And how does it do that?  Through the PCI device?

> For ARM and PPC based systems I can activate such stuff through dts.
> To be honest I don't know what is the right way to do such things for
> x86 systems.

How is it found in a x86 system, in ACPI?

> If I will move PCI related stuff to separate driver, could you suggest
> some right location for that?

Depends on what it does.

> For example, could I have the code like in f.e. in
> arch/x86/platform/ts5500/ts5500.c as a platform initialization code? 

How does it talk to the hardware for this?

thanks,

greg k-h
