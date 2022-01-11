Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40846C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jan 2022 10:14:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbiAKKO4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jan 2022 05:14:56 -0500
Received: from mail.v3.sk ([167.172.186.51]:36662 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237611AbiAKKO4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jan 2022 05:14:56 -0500
X-Greylist: delayed 467 seconds by postgrey-1.27 at vger.kernel.org; Tue, 11 Jan 2022 05:14:56 EST
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 97A53DF5E5;
        Tue, 11 Jan 2022 09:56:00 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id HwdSB5Pbv2J9; Tue, 11 Jan 2022 09:56:00 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 18771E20B7;
        Tue, 11 Jan 2022 09:56:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id X310WGQ83c9U; Tue, 11 Jan 2022 09:55:59 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id C7837DF5E5;
        Tue, 11 Jan 2022 09:55:59 +0000 (UTC)
Date:   Tue, 11 Jan 2022 11:06:59 +0100
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/3] platform/x86: x86-android-tablets: Add support for
 disabling ACPI _AEI handlers
Message-ID: <Yd1Ww7InM/+voqk2@demiurge.local>
References: <20220110103952.48760-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220110103952.48760-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jan 10, 2022 at 11:39:50AM +0100, Hans de Goede wrote:
> Some of the broken DSDTs on these devices often also include broken / wrong
> _AEI (ACPI Event Interrupt) handlers, which can cause e.g. interrupt storms
> by listening to a floating GPIO pin.
> 
> Add support for disabling these and disable them on the Asus ME176C and
> TF103C tablets.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

The whole series looks good to me. Feel free to slap on:

Reviewed-By: Lubomir Rintel <lkundrak@V3.sk>

Regards
Lubo

> ---
>  drivers/platform/x86/x86-android-tablets.c | 23 ++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
> index 3ba63ad91b28..d125d7a5189a 100644
> --- a/drivers/platform/x86/x86-android-tablets.c
> +++ b/drivers/platform/x86/x86-android-tablets.c
> @@ -26,6 +26,7 @@
>  #include <linux/string.h>
>  /* For gpio_get_desc() which is EXPORT_SYMBOL_GPL() */
>  #include "../../gpio/gpiolib.h"
> +#include "../../gpio/gpiolib-acpi.h"
>  
>  /*
>   * Helper code to get Linux IRQ numbers given a description of the IRQ source
> @@ -47,7 +48,7 @@ struct x86_acpi_irq_data {
>  	int polarity; /* ACPI_ACTIVE_HIGH / ACPI_ACTIVE_LOW / ACPI_ACTIVE_BOTH */
>  };
>  
> -static int x86_acpi_irq_helper_gpiochip_find(struct gpio_chip *gc, void *data)
> +static int gpiochip_find_match_label(struct gpio_chip *gc, void *data)
>  {
>  	return gc->label && !strcmp(gc->label, data);
>  }
> @@ -73,7 +74,7 @@ static int x86_acpi_irq_helper_get(const struct x86_acpi_irq_data *data)
>  		return irq;
>  	case X86_ACPI_IRQ_TYPE_GPIOINT:
>  		/* Like acpi_dev_gpio_irq_get(), but without parsing ACPI resources */
> -		chip = gpiochip_find(data->chip, x86_acpi_irq_helper_gpiochip_find);
> +		chip = gpiochip_find(data->chip, gpiochip_find_match_label);
>  		if (!chip) {
>  			pr_err("error cannot find GPIO chip %s\n", data->chip);
>  			return -ENODEV;
> @@ -143,6 +144,7 @@ struct x86_serdev_info {
>  };
>  
>  struct x86_dev_info {
> +	char *invalid_aei_gpiochip;
>  	const char * const *modules;
>  	struct gpiod_lookup_table **gpiod_lookup_tables;
>  	const struct x86_i2c_client_info *i2c_client_info;
> @@ -317,6 +319,7 @@ static const struct x86_dev_info asus_me176c_info __initconst = {
>  	.serdev_count = ARRAY_SIZE(asus_me176c_serdevs),
>  	.gpiod_lookup_tables = asus_me176c_gpios,
>  	.modules = bq24190_modules,
> +	.invalid_aei_gpiochip = "INT33FC:02",
>  };
>  
>  /* Asus TF103C tablets have an Android factory img with everything hardcoded */
> @@ -417,6 +420,7 @@ static const struct x86_dev_info asus_tf103c_info __initconst = {
>  	.pdev_count = ARRAY_SIZE(int3496_pdevs),
>  	.gpiod_lookup_tables = asus_tf103c_gpios,
>  	.modules = bq24190_modules,
> +	.invalid_aei_gpiochip = "INT33FC:02",
>  };
>  
>  /*
> @@ -795,6 +799,7 @@ static __init int x86_android_tablet_init(void)
>  {
>  	const struct x86_dev_info *dev_info;
>  	const struct dmi_system_id *id;
> +	struct gpio_chip *chip;
>  	int i, ret = 0;
>  
>  	id = dmi_first_match(x86_android_tablet_ids);
> @@ -803,6 +808,20 @@ static __init int x86_android_tablet_init(void)
>  
>  	dev_info = id->driver_data;
>  
> +	/*
> +	 * The broken DSDTs on these devices often also include broken
> +	 * _AEI (ACPI Event Interrupt) handlers, disable these.
> +	 */
> +	if (dev_info->invalid_aei_gpiochip) {
> +		chip = gpiochip_find(dev_info->invalid_aei_gpiochip,
> +				     gpiochip_find_match_label);
> +		if (!chip) {
> +			pr_err("error cannot find GPIO chip %s\n", dev_info->invalid_aei_gpiochip);
> +			return -ENODEV;
> +		}
> +		acpi_gpiochip_free_interrupts(chip);
> +	}
> +
>  	/*
>  	 * Since this runs from module_init() it cannot use -EPROBE_DEFER,
>  	 * instead pre-load any modules which are listed as requirements.
> -- 
> 2.33.1
> 
