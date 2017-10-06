From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 11/14] platform/x86: dell-smbios-wmi: Add new WMI
 dispatcher driver
Date: Fri, 6 Oct 2017 09:44:40 -0700
Message-ID: <20171006164440.GC12321@fury>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <8b37d47244fbba75ea264d06d4e7966a1f8f8f7a.1507156392.git.mario.limonciello@dell.com>
 <20171005021434.GF25018@fury>
 <e94d06dcfaf34deab72a5170a95fe2e9@ausx13mpc120.AMER.DELL.COM>
 <20171005175745.GE31452@fury>
 <1cf6f4e539e24b60879c8274e580cfb3@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:60586 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751423AbdJFQoo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Oct 2017 12:44:44 -0400
Content-Disposition: inline
In-Reply-To: <1cf6f4e539e24b60879c8274e580cfb3@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com

On Thu, Oct 05, 2017 at 07:47:38PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Darren Hart [mailto:dvhart@infradead.org]
> > Sent: Thursday, October 5, 2017 12:58 PM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: andy.shevchenko@gmail.com; linux-kernel@vger.kernel.org; platform-
> > driver-x86@vger.kernel.org; luto@kernel.org; quasisec@google.com;
> > pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de;
> > greg@kroah.com
> > Subject: Re: [PATCH v4 11/14] platform/x86: dell-smbios-wmi: Add new WMI
> > dispatcher driver
> > 
> > On Thu, Oct 05, 2017 at 03:12:46PM +0000, Mario.Limonciello@dell.com wrote:
> > 
> > > > > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > > > > index f0b97cb8e449..ef597f440d2e 100644
> > > > > --- a/drivers/platform/x86/Kconfig
> > > > > +++ b/drivers/platform/x86/Kconfig
> > > > > @@ -93,13 +93,27 @@ config ASUS_LAPTOP
> > > > >
> > > > >  config DELL_SMBIOS
> > > > >  	tristate "Dell SMBIOS calling interface"
> > > > > -	depends on DELL_SMBIOS_SMM
> > > > > +	depends on DELL_SMBIOS_WMI || DELL_SMBIOS_SMM
> > > > >  	---help---
> > > > >  	This module provides common functions for kernel modules using
> > > > >  	Dell SMBIOS.
> > > >
> > > > You use select DELL_SMBIOS below, which implies this modules should be
> > > > invisible. Indeed, there is no need for the user to see the DELL_SMBIOS
> > > > option at all now, they can select DELL_SMBIOS_WMI and or
> > > > DELL_SMBIOS_SMM, no need to keep the DELL_SMBIOS option.
> > > >
> > > So when you say make invisible, does that mean that it should never show
> > > up in make menuconfig and just be implicitly selected?
> > 
> > Right. It shouldn't have a prompt.
> > 
> > >
> > > When I was adjusting Kconfig for your other feedback I noticed setting
> > something
> > > to "select $DRIVER" that invisible driver does show up just can't be turned off.
> > > Is that what you mean?
> > 
> > No, I mean eliminate the menu entry by eliminating the prompt.
> Do you have an example of a driver that does it this way? 
> When I tried, CONFIG_DELL_WMI_DESCRIPTOR doesn't get saved to .config
> and then doesn't compile into a module anymore.

Just eliminating the prompt will hide DELL_SMBIOS from menuconfig:

config DELL_SMBIOS
	tristate
	depends on DELL_SMBIOS_WMI || DELL_SMBIOS_SMM

-- 
Darren Hart
VMware Open Source Technology Center
