From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 11/14] platform/x86: dell-smbios-wmi: Add new WMI
 dispatcher driver
Date: Thu, 5 Oct 2017 10:57:45 -0700
Message-ID: <20171005175745.GE31452@fury>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <8b37d47244fbba75ea264d06d4e7966a1f8f8f7a.1507156392.git.mario.limonciello@dell.com>
 <20171005021434.GF25018@fury>
 <e94d06dcfaf34deab72a5170a95fe2e9@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e94d06dcfaf34deab72a5170a95fe2e9@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 05, 2017 at 03:12:46PM +0000, Mario.Limonciello@dell.com wrote:

> > > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > > index f0b97cb8e449..ef597f440d2e 100644
> > > --- a/drivers/platform/x86/Kconfig
> > > +++ b/drivers/platform/x86/Kconfig
> > > @@ -93,13 +93,27 @@ config ASUS_LAPTOP
> > >
> > >  config DELL_SMBIOS
> > >  	tristate "Dell SMBIOS calling interface"
> > > -	depends on DELL_SMBIOS_SMM
> > > +	depends on DELL_SMBIOS_WMI || DELL_SMBIOS_SMM
> > >  	---help---
> > >  	This module provides common functions for kernel modules using
> > >  	Dell SMBIOS.
> > 
> > You use select DELL_SMBIOS below, which implies this modules should be
> > invisible. Indeed, there is no need for the user to see the DELL_SMBIOS
> > option at all now, they can select DELL_SMBIOS_WMI and or
> > DELL_SMBIOS_SMM, no need to keep the DELL_SMBIOS option.
> > 
> So when you say make invisible, does that mean that it should never show
> up in make menuconfig and just be implicitly selected?

Right. It shouldn't have a prompt.

> 
> When I was adjusting Kconfig for your other feedback I noticed setting something
> to "select $DRIVER" that invisible driver does show up just can't be turned off.
> Is that what you mean?

No, I mean eliminate the menu entry by eliminating the prompt.

> 
> > > diff --git a/drivers/platform/x86/dell-smbios-wmi.c
> > b/drivers/platform/x86/dell-smbios-wmi.c
> > > +static void __init parse_b1_table(const struct dmi_header *dm)
> > > +{
> > > +	struct misc_bios_flags_structure *flags =
> > > +	container_of(dm, struct misc_bios_flags_structure, header);
> > > +
> > > +	/* 4 bytes header, and one word of flags */
> > 
> > Assuming specifically 8 bytes of flags, independent of arch?
> 
> Well platform/drivers/*x86*...

I was thinking 32b vs 64b x86 which have a different definition of word size.

(and depending on context, even that changes)

So... "8 bytes" ? I presume this is a fixed length independent of word size?

-- 
Darren Hart
VMware Open Source Technology Center
