Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA271C61DA3
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Feb 2023 09:56:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233606AbjBUJ4M (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Feb 2023 04:56:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234039AbjBUJ4L (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Feb 2023 04:56:11 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CA964481
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Feb 2023 01:55:44 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="316312108"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="316312108"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 01:55:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="673621851"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="673621851"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 21 Feb 2023 01:55:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pUPN4-009uQf-2m;
        Tue, 21 Feb 2023 11:55:38 +0200
Date:   Tue, 21 Feb 2023 11:55:38 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/9] platform/x86: x86-android-tablets: Move core code
 into new core.c file
Message-ID: <Y/SVGhEhC94ICG39@smile.fi.intel.com>
References: <20230220221212.196009-1-hdegoede@redhat.com>
 <20230220221212.196009-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220221212.196009-3-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Feb 20, 2023 at 11:12:05PM +0100, Hans de Goede wrote:
> Move the helpers to get irqs + gpios as well as the core code for
> instantiating all the devices missing from ACPI into a new core.c file.

...

> +static int gpiochip_find_match_label(struct gpio_chip *gc, void *data)
> +{
> +	return gc->label && !strcmp(gc->label, data);
> +}

Can we actually export find_chip_by_name() from GPIOLIB and reuse it here?
(Perhaps it may require a separate patch(es) to be added)

...

> +	case X86_ACPI_IRQ_TYPE_GPIOINT:
> +		/* Like acpi_dev_gpio_irq_get(), but without parsing ACPI resources */
> +		ret = x86_android_tablet_get_gpiod(data->chip, data->index, &gpiod);
> +		if (ret)
> +			return ret;
> +
> +		irq = gpiod_to_irq(gpiod);
> +		if (irq < 0) {
> +			pr_err("error %d getting IRQ %s %d\n", irq, data->chip, data->index);
> +			return irq;
> +		}
> +
> +		irq_type = acpi_dev_get_irq_type(data->trigger, data->polarity);
> +		if (irq_type != IRQ_TYPE_NONE && irq_type != irq_get_trigger_type(irq))
> +			irq_set_irq_type(irq, irq_type);
> +
> +		return irq;

Similar Q here.

...

> +static void x86_android_tablet_cleanup(void)
> +{
> +	int i;

unsigned?

> +	for (i = 0; i < serdev_count; i++) {
> +		if (serdevs[i])

Interesting that serdev requires this check in the callers.

> +			serdev_device_remove(serdevs[i]);
> +	}
> +
> +	kfree(serdevs);
> +
> +	for (i = 0; i < pdev_count; i++)
> +		platform_device_unregister(pdevs[i]);
> +
> +	kfree(pdevs);
> +
> +	for (i = 0; i < i2c_client_count; i++)
> +		i2c_unregister_device(i2c_clients[i]);
> +
> +	kfree(i2c_clients);
> +
> +	if (exit_handler)
> +		exit_handler();
> +
> +	for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
> +		gpiod_remove_lookup_table(gpiod_lookup_tables[i]);
> +
> +	software_node_unregister(bat_swnode);
> +}

...

> +extern const struct dmi_system_id x86_android_tablet_ids[];

Why not in the header?

...

> +	gpiod_lookup_tables = dev_info->gpiod_lookup_tables;
> +	for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
> +		gpiod_add_lookup_table(gpiod_lookup_tables[i]);

gpiod_add_lookup_tables() ?

...

> +#ifndef __X86_ANDROID_TABLETS_H
> +#define __X86_ANDROID_TABLETS_H

> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/machine.h>

I don't see users of these headers here (forward declarations may do the job).

...

> +#include <linux/platform_device.h>

Ditto.

And seems missing other forward declaration(s?), like software_node.

-- 
With Best Regards,
Andy Shevchenko


