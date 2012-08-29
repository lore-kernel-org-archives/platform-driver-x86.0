From: Chris Wilson <chris@qwirx.com>
Subject: Re: [PATCH 2/4] soekris-net6501: Add a board driver to create
 leds-net6501 device.
Date: Wed, 29 Aug 2012 14:32:33 +0100 (BST)
Message-ID: <alpine.DEB.2.02.1208291432040.12396@lap-x201>
References: <1344860636-23328-1-git-send-email-chris+github@qwirx.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from one-mail.aptivate.org ([87.106.150.205]:51347 "EHLO
	one-mail.aptivate.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753722Ab2H2Ncy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Aug 2012 09:32:54 -0400
In-Reply-To: <1344860636-23328-1-git-send-email-chris+github@qwirx.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Chris Wilson <chris+github@qwirx.com>
Cc: platform-driver-x86@vger.kernel.org, bryan.wu@canonical.com, chris+github@aptivate.org

Dear sirs,

Do you have any feedback on my patch?

Thanks, Chris.

On Mon, 13 Aug 2012, Chris Wilson wrote:

> Bryan Wu says of creating the platform_device in the leds driver:
>
>> This is wrong, platform_device should be created in machine board
>> files not in the drivers. For x86, please take a look at
>> drivers/platform/x86/. And for leds-hp6xx.c, I didn't find any user of
>> this in arch/sh. So probably we can drop it sometime.
>>
>> I also suggest you can just add this driver into the machine board
>> file of this Soekris machine in drivers/platform/x86/ like other
>> machines do...
>
> So I did. Currently I don't know of any reliable way to detect the
> hardware platform, the device that's listening on the LED GPIO
> I/O ports isn't on the PCI bus and there is no ACPI support on this
> system, so I can't see anything to do except unconditionally create
> the platform_device.
>
> Signed-off-by: Chris Wilson <chris+github@qwirx.com>
> ---
> drivers/platform/x86/Kconfig           |   10 +++++
> drivers/platform/x86/Makefile          |    1 +
> drivers/platform/x86/soekris-net6501.c |   58 ++++++++++++++++++++++++++++++++
> 3 files changed, 69 insertions(+), 0 deletions(-)
> create mode 100644 drivers/platform/x86/soekris-net6501.c
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 2a262f5..17a4d1d 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -766,4 +766,14 @@ config APPLE_GMUX
> 	  graphics as well as the backlight. Currently only backlight
> 	  control is supported by the driver.
>
> +config SOEKRIS_NET6501
> +	tristate "Soekris Net6501 Extras"
> +	depends on X86
> +	---help---
> +	  This driver provides support for the Ready and Error LEDs on the
> +	  Soekris Net6501, along with leds-net6501.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called soekris-net6501.
> +
> endif # X86_PLATFORM_DEVICES
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index bf7e4f9..ba96e46 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -50,3 +50,4 @@ obj-$(CONFIG_INTEL_MID_POWER_BUTTON)	+= intel_mid_powerbtn.o
> obj-$(CONFIG_INTEL_OAKTRAIL)	+= intel_oaktrail.o
> obj-$(CONFIG_SAMSUNG_Q10)	+= samsung-q10.o
> obj-$(CONFIG_APPLE_GMUX)	+= apple-gmux.o
> +obj-$(CONFIG_SOEKRIS_NET6501)	+= soekris-net6501.o
> diff --git a/drivers/platform/x86/soekris-net6501.c b/drivers/platform/x86/soekris-net6501.c
> new file mode 100644
> index 0000000..e908841
> --- /dev/null
> +++ b/drivers/platform/x86/soekris-net6501.c
> @@ -0,0 +1,58 @@
> +/*
> + *  Written by Chris Wilson <chris+soekris@aptivate.org>
> + *  Based on classmate-laptop.c by Thadeu Lima de Souza Cascardo
> + *
> + *  This driver does nothing except make leds-net6501 work, by creating its
> + *  platform device, as requested by Bryan Wu.
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License along
> + *  with this program; if not, write to the Free Software Foundation, Inc.,
> + *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +MODULE_LICENSE("GPL");
> +
> +#define NET6501_LEDS_DEVICE "leds-net6501"
> +
> +static struct platform_device *pd;
> +
> +static int net6501_init(void)
> +{
> +	pd = platform_device_register_simple(NET6501_LEDS_DEVICE, -1, NULL, 0);
> +
> +	if (IS_ERR(pd)) {
> +		printk(KERN_WARNING NET6501_LEDS_DEVICE ": failed to register "
> +			"platform device: error %ld\n", PTR_ERR(pd));
> +		return PTR_ERR(pd);
> +	}
> +
> +	dev_info(&pd->dev, "Soekris Net6501 board driver\n");
> +	return 0;
> +}
> +
> +static void net6501_exit(void)
> +{
> +	platform_device_unregister(pd);
> +}
> +
> +module_init(net6501_init);
> +module_exit(net6501_exit);
> +
> +MODULE_AUTHOR("Chris Wilson <chris+soekris@aptivate.org>");
> +MODULE_DESCRIPTION("Soekris Net6051 board driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:soekris-net6501");
>

-- 
_____ __     _
\  __/ / ,__(_)_  | Chris Wilson <chris+sig@qwirx.com> Cambs UK |
/ (_/ ,\/ _/ /_ \ | Security/C/C++/Java/Ruby/Perl/SQL Developer |
\__/_/_/_//_/___/ | We are GNU : free your mind & your software |
