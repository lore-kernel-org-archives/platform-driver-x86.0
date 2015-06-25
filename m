From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH][v2] asus-rbtn: new driver for asus radio button for
 Windows 8
Date: Thu, 25 Jun 2015 08:58:04 +0200
Message-ID: <1435215484.4528.96.camel@tiscali.nl>
References: <1435114671-24380-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lb1-smtp-cloud6.xs4all.net ([194.109.24.24]:34768 "EHLO
	lb1-smtp-cloud6.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751017AbbFYG6Q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 25 Jun 2015 02:58:16 -0400
In-Reply-To: <1435114671-24380-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>, dvhart@infradead.org, corentin.chary@gmail.com
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org

On Wed, 2015-06-24 at 10:57 +0800, Alex Hung wrote:
> --- /dev/null
> +++ b/drivers/platform/x86/asus-rbtn.c

> +MODULE_ALIAS("acpi*:ATK4001:*");

This looked odd. It turned out this is the pattern that
scripts/mod/file2alias.c::do_acpi_entry() creates. 

> +static const struct acpi_device_id asusrb_ids[] = {
> +	{"ATK4001", 0},
> +	{"", 0},
> +};

I think you should just put
    MODULE_DEVICE_TABLE(acpi, asusrb_ids);

here, like all other drivers do, and drop the odd looking alias.

All others drivers except drivers/platform/x86/hp-wireless.c, that is.
(I noticed that you also wrote that driver.) It should just use
MODULE_DEVICE_TABLE() too

> +static int __init asusrb_init(void)
> +{
> +	int err;
> +
> +	[...]
> +
> +	asuspl_dev = platform_device_alloc("asus-rbtn", -1);
> +	if (!asuspl_dev) {
> +		err = -ENOMEM;
> +		goto err_device_alloc;
> +	}
> +	err = platform_device_add(asuspl_dev);
> +	if (err)
> +		goto err_device_add;
> +
> +	return 0;
> +
> +err_device_add:
> +	platform_device_put(asuspl_dev);
> +err_device_alloc:
> +	platform_driver_unregister(&asuspl_driver);
> +err_driver_reg:
> +	return err;
> +}
> +
> +static void __exit asusrb_exit(void)
> +{
> +	pr_info("Exiting ATK4001 module\n");
> +	acpi_bus_unregister_driver(&asusrb_driver);
> +
> +	if (asuspl_dev) {

If asusrb_exit() will be run asusrb_init() must have completed
successfully before, right? And is there a way for asuspl_dev to be
NULL after asusrb_init() succeeded?

> +		platform_device_unregister(asuspl_dev);
> +		platform_driver_unregister(&asuspl_driver);
> +	}
> +}
> +
> +module_init(asusrb_init);
> +module_exit(asusrb_exit);

Thanks,


Paul Bolle
