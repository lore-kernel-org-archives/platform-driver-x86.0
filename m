From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] [v4] surface pro 3: Add support driver for Surface Pro 3
 buttons
Date: Wed, 26 Aug 2015 00:22:21 -0700
Message-ID: <20150826072221.GD50910@vmdeb7>
References: <1439911825-23536-1-git-send-email-yu.c.chen@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:52628 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756160AbbHZHWc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 26 Aug 2015 03:22:32 -0400
Content-Disposition: inline
In-Reply-To: <1439911825-23536-1-git-send-email-yu.c.chen@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Chen Yu <yu.c.chen@intel.com>, joe@perches.com
Cc: akpm@linux-foundation.org, arnd@arndb.de, gregkh@linuxfoundation.org, mchehab@osg.samsung.com, davem@davemloft.net, jslaby@suse.com, tj@kernel.org, rjw@rjwysocki.net, rui.zhang@intel.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Aug 18, 2015 at 11:30:25PM +0800, Chen Yu wrote:
> Since Surface Pro 3 does not follow the specs of "Windows ACPI Design
> Guide for SoC Platform", code in drivers/input/misc/soc_array.c can
> not detect these buttons on it. According to bios implementation,
> Surface Pro 3 encapsulates these buttons in a device named "VGBI",
> with _HID "MSHW0028". When any of the buttons is pressed, a specify
> ACPI notification code for this button will be delivered to "VGBI". For
> example, if power button is pressed down, ACPI notification code of 0xc6
> will be sent by Notify(VGBI, 0xc6).
> 
> This patch leverages "VGBI" to distinguish different ACPI notification
> code from Power button, Home button, Volume button, then dispatches these
> code to input layer. Lid is already covered by acpi button driver, so
> there's no need to rewrite.
> 
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=84651
> Tested-by: Ethan Schoonover <es@ethanschoonover.com>
> Tested-by: Peter Amidon <psa.pub.0@picnicpark.org>
> Tested-by: Donavan Lance <tusklahoma@gmail.com>
> Tested-by: Stephen Just <stephenjust@gmail.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>

Joe, you provided a lot of review, are you happy with this version?

Rafael, any concerns over the justification to use ACPI instead of
platform_driver/i2c_driver as described in the comment block below?

Chen, a couple more nitpics below. No need to resend if Joe and Rafael have no objections. I'll correct and queue. For now, queued to testing. Thanks!

> ---
> v4:
>  - Add following code in driver's probe callback:
> 	if (strncmp(acpi_device_bid(device), SURFACE_BUTTON_OBJ_NAME,
> 	    strlen(SURFACE_BUTTON_OBJ_NAME)))
> 		return -ENODEV;
>    to make sure only device object name of 'VGBI' will load this driver.
>    Because it is reported that, Surface 3(no Pro) also has a device with
>    hid MSHW0028, but it is not a button device.
> 
> v3:
>  - Revert handle_surface_button_notify and keep original
>    'switch/case' in surface_button_notify. Add/fix some
>    comments for surface_button_notify.
> 
> v2:
>  - Introduce MACRO handle_surface_button_notify to make
>    it pairing the PRESS and RELEASE cases, convert dev_info
>    to dev_info_ratelimited when in error condition.
> 
> ---
>  MAINTAINERS                               |   5 +
>  drivers/platform/x86/Kconfig              |   5 +
>  drivers/platform/x86/Makefile             |   1 +
>  drivers/platform/x86/surfacepro3_button.c | 215 ++++++++++++++++++++++++++++++
>  4 files changed, 226 insertions(+)
>  create mode 100644 drivers/platform/x86/surfacepro3_button.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 569568f..eacaa41 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6721,6 +6721,11 @@ T:	git git://git.monstr.eu/linux-2.6-microblaze.git
>  S:	Supported
>  F:	arch/microblaze/
>  
> +MICROSOFT SURFACE PRO 3 BUTTON DRIVER
> +M:    Chen Yu <yu.c.chen@intel.com>

It's typical to include the list here as well:

L:	platform-driver-x86@vger.kernel.org

> +S:    Supported
> +F:    drivers/platform/x86/surfacepro3_button.c

Also, spaces should have been tabs to be consistent with existing whitespace
usage in MAINTAINERS. Consider displaying whitespace in your editor if you
don't already.

> +
>  MICROTEK X6 SCANNER
>  M:	Oliver Neukum <oliver@neukum.org>
>  S:	Maintained
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 6dc13e4..c69bb70 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -919,4 +919,9 @@ config INTEL_PMC_IPC
>  	The PMC is an ARC processor which defines IPC commands for communication
>  	with other entities in the CPU.
>  
> +config SURFACE_PRO3_BUTTON
> +	tristate "Power/home/volume buttons driver for Microsoft Surface Pro 3 tablet"
> +	depends on ACPI && INPUT
> +	---help---
> +	  This driver handles the power/home/volume buttons on the Microsoft Surface Pro 3 tablet.
>  endif # X86_PLATFORM_DEVICES
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index dda95a9..ada5128 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -60,3 +60,4 @@ obj-$(CONFIG_INTEL_SMARTCONNECT)	+= intel-smartconnect.o
>  obj-$(CONFIG_PVPANIC)           += pvpanic.o
>  obj-$(CONFIG_ALIENWARE_WMI)	+= alienware-wmi.o
>  obj-$(CONFIG_INTEL_PMC_IPC)	+= intel_pmc_ipc.o
> +obj-$(CONFIG_SURFACE_PRO3_BUTTON)	+= surfacepro3_button.o
> diff --git a/drivers/platform/x86/surfacepro3_button.c b/drivers/platform/x86/surfacepro3_button.c
> new file mode 100644
> index 0000000..6c6f11c
> --- /dev/null
> +++ b/drivers/platform/x86/surfacepro3_button.c
> @@ -0,0 +1,215 @@
> +/*
> + * power/home/volume button support for
> + * Microsoft Surface Pro 3 tablet.
> + *
> + * (C) Copyright 2015 Intel Corporation

Intel standard copyright notice:

Copyright (c) 2015, Intel Corporation.
All rights reserved.

But the (c) generally always goes after Copyright


-- 
Darren Hart
Intel Open Source Technology Center
