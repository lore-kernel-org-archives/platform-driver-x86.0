From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH][v2] asus-rbtn: new driver for asus radio button for
 Windows 8
Date: Wed, 24 Jun 2015 21:04:56 -0700
Message-ID: <20150625040456.GC18285@vmdeb7>
References: <1435114671-24380-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:41780 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751196AbbFYEE7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 25 Jun 2015 00:04:59 -0400
Content-Disposition: inline
In-Reply-To: <1435114671-24380-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: corentin.chary@gmail.com, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org

On Wed, Jun 24, 2015 at 10:57:51AM +0800, Alex Hung wrote:
> ASUS introduced a new approach to handle wireless hotkey
> since Windows 8.  When the hotkey is pressed, BIOS generates
> a notification 0x88 to a new ACPI device, ATK4001.  This
> new driver not only translates the notification to KEY_RFKILL
> but also toggles its LED accordingly.
> 
> Signed-off-by: Alex Hung <alex.hung@canonical.com>
> ---
>  MAINTAINERS                      |   6 +
>  drivers/platform/x86/Kconfig     |  11 ++
>  drivers/platform/x86/Makefile    |   1 +
>  drivers/platform/x86/asus-rbtn.c | 240 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 258 insertions(+)
>  create mode 100644 drivers/platform/x86/asus-rbtn.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d8afd29..03711ce 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1673,6 +1673,12 @@ S:	Maintained
>  F:	drivers/platform/x86/asus*.c
>  F:	drivers/platform/x86/eeepc*.c
>  
> +ASUS RADIO BUTTON DRIVER
> +M:	Alex Hung <alex.hung@canonical.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/asus-rbtn.c
> +
>  ASYNCHRONOUS TRANSFERS/TRANSFORMS (IOAT) API
>  R:	Dan Williams <dan.j.williams@intel.com>
>  W:	http://sourceforge.net/projects/xscaleiop
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index f9f205c..a8ac885 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -516,6 +516,17 @@ config EEEPC_LAPTOP
>  	  If you have an Eee PC laptop, say Y or M here. If this driver
>  	  doesn't work on your Eee PC, try eeepc-wmi instead.
>  
> +config ASUS_RBTN
> +	tristate "ASUS radio button"
> +	depends on ACPI
> +	depends on INPUT
> +	help
> +	 This driver provides supports for new ASUS radio button for Windows 8.

s/supports/support/

Also, avoid using "new" in the Kconfig as this lives forever, in 10 years, it
won't be so new :-)

Consider:

"This driver supports the ASUS radio button for Windows 8."

(And maybe fix the entry for HP_WIRELESS while you're at it in a separate patch)

...

> +static int asus_rbtn_input_setup(void)
> +{
> +	int err;
> +
> +	asusrb_input_dev = input_allocate_device();
> +	if (!asusrb_input_dev)
> +		return -ENOMEM;
> +
> +	asusrb_input_dev->name = "ASUS radio hotkeys";
> +	asusrb_input_dev->phys = "atk4001/input0";
> +	asusrb_input_dev->id.bustype = BUS_HOST;
> +	asusrb_input_dev->evbit[0] = BIT(EV_KEY);
> +	set_bit(KEY_RFKILL, asusrb_input_dev->keybit);
> +
> +	err = input_register_device(asusrb_input_dev);
> +	if (err)
> +		goto err_free_dev;
> +
> +	return 0;
> +
> +err_free_dev:
> +	input_free_device(asusrb_input_dev);
> +	return err;

I missed this on the first round. There is no need for a goto here at all:

int ret;
...
ret = input_register_Device(asusrb_input_dev);
if (ret)
	input_free_device(asusrb_input_dev);
return ret;

Much nicer IMHO.

Do you have a strong preference for err over ret? In most cases in this driver,
ret would be the more typical choice in my experience.

I suppose this is modeled after hp-wireless which has the same error path in
hp_wireless_input_setup I mentioned above and uses err throughout - consistency
is a good thing. I won't argue over the ret/err thing as there is precedent in
this subsystem for similar drivers.

-- 
Darren Hart
Intel Open Source Technology Center
