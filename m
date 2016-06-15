From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH 2/2] platform/x86: Drop duplicate dependencies on X86
Date: Wed, 15 Jun 2016 10:35:52 +0200
Message-ID: <20160615103552.47e9767a@endymion>
References: <20160526114323.763237f5@endymion>
	<20160608202129.GF28348@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:39002 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752183AbcFOIfz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 15 Jun 2016 04:35:55 -0400
In-Reply-To: <20160608202129.GF28348@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org

Hi Darren,

On Wed, 8 Jun 2016 13:21:29 -0700, Darren Hart wrote:
> On Thu, May 26, 2016 at 11:43:23AM +0200, Jean Delvare wrote:
> > The whole menu depends on X86 so there is no point in repeating this
> > dependency on individual driver entries.
> > 
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Cc: Darren Hart <dvhart@infradead.org>
> > ---
> >  drivers/platform/x86/Kconfig |    6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > --- linux-4.6.orig/drivers/platform/x86/Kconfig	2016-05-26 11:18:50.029103790 +0200
> > +++ linux-4.6/drivers/platform/x86/Kconfig	2016-05-26 11:35:23.704400044 +0200
> > @@ -103,7 +103,6 @@ config DELL_SMBIOS
> >  
> >  config DELL_LAPTOP
> >  	tristate "Dell Laptop Extras"
> > -	depends on X86
> >  	depends on DMI
> >  	depends on BACKLIGHT_CLASS_DEVICE
> >  	depends on ACPI_VIDEO || ACPI_VIDEO = n
> > @@ -751,7 +750,7 @@ config TOSHIBA_WMI
> >  
> >  config ACPI_CMPC
> >  	tristate "CMPC Laptop Extras"
> > -	depends on X86 && ACPI
> > +	depends on ACPI
> >  	depends on RFKILL || RFKILL=n
> >  	select INPUT
> >  	select BACKLIGHT_CLASS_DEVICE
> > @@ -850,7 +849,7 @@ config INTEL_IMR
> >  
> >  config IBM_RTL
> >  	tristate "Device driver to enable PRTL support"
> > -	depends on X86 && PCI
> > +	depends on PCI
> >  	---help---
> >  	 Enable support for IBM Premium Real Time Mode (PRTM).
> >  	 This module will allow you the enter and exit PRTM in the BIOS via
> > @@ -884,7 +883,6 @@ config XO15_EBOOK
> >  
> >  config SAMSUNG_LAPTOP
> >  	tristate "Samsung Laptop driver"
> > -	depends on X86
> >  	depends on RFKILL || RFKILL = n
> >  	depends on ACPI_VIDEO || ACPI_VIDEO = n
> >  	depends on BACKLIGHT_CLASS_DEVICE
> > 
> 
> Was there a reason you omitted removing the X86 depends from SENSORS_HDAPS and
> INTEL_PMC_CORE?

INTEL_PMC_CORE did not exist in the tree I was working on. For
SENSORS_HDAPS, probably I stupidly grepped for "depends on X86" and
that did not catch SENSORS_HDAPS because X86 was listed as a second
dependency on the same line there.

> I've dropped these as well and queued this for 4.8, please let me know if you
> deliberately left these in.

You did well, thank you.

-- 
Jean Delvare
SUSE L3 Support
