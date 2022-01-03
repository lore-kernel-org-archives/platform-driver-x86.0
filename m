Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA32C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  3 Jan 2022 11:19:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbiACLTN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 3 Jan 2022 06:19:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25019 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229527AbiACLTN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Jan 2022 06:19:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641208752;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/oquQqsOnc90ld8e15gWpcLrgYGtKLMEwjAunXG+rsE=;
        b=a/ZpsPoLOS4CftqsTUO7/Smoevd764XZJpWWwuAvY2mDfuzK5tqi4gZVR77Mybjdu8pyCg
        uSbf+6GLAjV7RziH3iNFWMqF2baJBLHtBktwwGiw7Ycmz31ZftetxB9Qtt9rjNJG7i5k/E
        AkmR5ESv26uxTq+NjBouU89ICb/pUYY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-qQcEZr49MW2aLI6WMCnMCg-1; Mon, 03 Jan 2022 06:19:11 -0500
X-MC-Unique: qQcEZr49MW2aLI6WMCnMCg-1
Received: by mail-ed1-f70.google.com with SMTP id q15-20020a056402518f00b003f87abf9c37so22581458edd.15
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Jan 2022 03:19:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/oquQqsOnc90ld8e15gWpcLrgYGtKLMEwjAunXG+rsE=;
        b=qWvNOLaRc6ITcynQh3UdH/kmw5+4NaX1ef+0cOGlE4rhUukhacXqx27geNsdIlAx5I
         V7zNCIu1L37VgOODKEWHx8Km7TcI9UXiyCTN8S1dhUX0BZZzGdBi3jIERXFuhrKiDvIH
         otCSKWItsY1pKE+WQcj1O7f4/Hwj7D1rHdZu0vCfT9Xqb9NG8b2y+qrAipHMUoymsUEQ
         eMHpDzcJ8FiRSgwonZhs4NiaFAyIt4YoqmZIbbhj+q0YZ74DT3ZdusdeOw+6aYv5cmDM
         g8VZ41vvp1tN0j71mpsIkibdO1dr7jxrOiF+a/b+68Dc1s+dXdK6O6LBABv1vl0a00qZ
         nhaQ==
X-Gm-Message-State: AOAM530AcWZmoYpGxYvrBRx+jpqcKkdO3GWSEh8ztlbbDTq4+Jt7+3Cl
        LuVAdU0vyul4HFZxvlFs6j1RpI41vx34y1sq0wcFFZkF4VKlnLZzSisUsQb1/nMVNang3Dqn+i9
        XByVrETCjeas/8vCRO1KIedkZ3t2N92YDwQ==
X-Received: by 2002:a17:907:1b0d:: with SMTP id mp13mr35568391ejc.29.1641208750231;
        Mon, 03 Jan 2022 03:19:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXr3tG7+xMPPDQAf/JfuOYTDLPEK5vt1aSB3ZyRDo5o29ygezUuQl6ZxJN2P0YMrjho6lBdw==
X-Received: by 2002:a17:907:1b0d:: with SMTP id mp13mr35568376ejc.29.1641208750051;
        Mon, 03 Jan 2022 03:19:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id h13sm7891675edt.61.2022.01.03.03.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jan 2022 03:19:09 -0800 (PST)
Message-ID: <ac47dd3e-c072-cdd0-6bb8-213aeed0a49e@redhat.com>
Date:   Mon, 3 Jan 2022 12:19:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 4/4] platform/x86: Add crystal_cove_charger driver
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211225115509.94891-1-hdegoede@redhat.com>
 <20211225115509.94891-5-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211225115509.94891-5-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi all,

On 12/25/21 12:55, Hans de Goede wrote:
> Driver for the external-charger IRQ pass-through function of the
> Bay Trail Crystal Cove PMIC.
> 
> Note this is NOT a power_supply class driver, it just deals with IRQ
> pass-through, this requires this separate driver because the PMIC's
> level 2 interrupt for this must be explicitly acked.
> 
> This new driver gets enabled by the existing X86_ANDROID_TABLETS Kconfig
> option because the x86-android-tablets module is the only user of the
> exported external-charger IRQ.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

(with the discussed move to the drivers/platform/x86/intel folder)

Regards,

Hans



> ---
>  drivers/platform/x86/Makefile               |   2 +-
>  drivers/platform/x86/crystal_cove_charger.c | 153 ++++++++++++++++++++
>  2 files changed, 154 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/platform/x86/crystal_cove_charger.c
> 
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index bd20b435c22b..cce124e3acab 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -114,7 +114,7 @@ obj-$(CONFIG_I2C_MULTI_INSTANTIATE)	+= i2c-multi-instantiate.o
>  obj-$(CONFIG_MLX_PLATFORM)		+= mlx-platform.o
>  obj-$(CONFIG_TOUCHSCREEN_DMI)		+= touchscreen_dmi.o
>  obj-$(CONFIG_WIRELESS_HOTKEY)		+= wireless-hotkey.o
> -obj-$(CONFIG_X86_ANDROID_TABLETS)	+= x86-android-tablets.o
> +obj-$(CONFIG_X86_ANDROID_TABLETS)	+= x86-android-tablets.o crystal_cove_charger.o
>  
>  # Intel uncore drivers
>  obj-$(CONFIG_INTEL_IPS)				+= intel_ips.o
> diff --git a/drivers/platform/x86/crystal_cove_charger.c b/drivers/platform/x86/crystal_cove_charger.c
> new file mode 100644
> index 000000000000..382c19806b12
> --- /dev/null
> +++ b/drivers/platform/x86/crystal_cove_charger.c
> @@ -0,0 +1,153 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Driver for the external-charger IRQ pass-through function of the
> + * Bay Trail Crystal Cove PMIC.
> + *
> + * Note this is NOT a power_supply class driver, it just deals with IRQ
> + * pass-through, this requires this separate driver because the PMIC's
> + * level 2 interrupt for this must be explicitly acked.
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/mfd/intel_soc_pmic.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define CHGRIRQ_REG					0x0a
> +
> +struct crystal_cove_charger_data {
> +	struct mutex buslock; /* irq_bus_lock */
> +	struct irq_chip irqchip;
> +	struct regmap *regmap;
> +	struct irq_domain *irq_domain;
> +	int irq;
> +	int charger_irq;
> +	bool irq_enabled;
> +	bool irq_is_enabled;
> +};
> +
> +static irqreturn_t crystal_cove_charger_irq(int irq, void *data)
> +{
> +	struct crystal_cove_charger_data *charger = data;
> +
> +	/* No need to read CHGRIRQ_REG as there is only 1 IRQ */
> +	handle_nested_irq(charger->charger_irq);
> +
> +	/* Ack CHGRIRQ 0 */
> +	regmap_write(charger->regmap, CHGRIRQ_REG, BIT(0));
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void crystal_cove_charger_irq_bus_lock(struct irq_data *data)
> +{
> +	struct crystal_cove_charger_data *charger = irq_data_get_irq_chip_data(data);
> +
> +	mutex_lock(&charger->buslock);
> +}
> +
> +static void crystal_cove_charger_irq_bus_sync_unlock(struct irq_data *data)
> +{
> +	struct crystal_cove_charger_data *charger = irq_data_get_irq_chip_data(data);
> +
> +	if (charger->irq_is_enabled != charger->irq_enabled) {
> +		if (charger->irq_enabled)
> +			enable_irq(charger->irq);
> +		else
> +			disable_irq(charger->irq);
> +
> +		charger->irq_is_enabled = charger->irq_enabled;
> +	}
> +
> +	mutex_unlock(&charger->buslock);
> +}
> +
> +static void crystal_cove_charger_irq_unmask(struct irq_data *data)
> +{
> +	struct crystal_cove_charger_data *charger = irq_data_get_irq_chip_data(data);
> +
> +	charger->irq_enabled = true;
> +}
> +
> +static void crystal_cove_charger_irq_mask(struct irq_data *data)
> +{
> +	struct crystal_cove_charger_data *charger = irq_data_get_irq_chip_data(data);
> +
> +	charger->irq_enabled = false;
> +}
> +
> +static void crystal_cove_charger_rm_irq_domain(void *data)
> +{
> +	struct crystal_cove_charger_data *charger = data;
> +
> +	irq_domain_remove(charger->irq_domain);
> +}
> +
> +static int crystal_cove_charger_probe(struct platform_device *pdev)
> +{
> +	struct intel_soc_pmic *pmic = dev_get_drvdata(pdev->dev.parent);
> +	struct crystal_cove_charger_data *charger;
> +	int ret;
> +
> +	charger = devm_kzalloc(&pdev->dev, sizeof(*charger), GFP_KERNEL);
> +	if (!charger)
> +		return -ENOMEM;
> +
> +	charger->regmap = pmic->regmap;
> +	mutex_init(&charger->buslock);
> +
> +	charger->irq = platform_get_irq(pdev, 0);
> +	if (charger->irq < 0)
> +		return charger->irq;
> +
> +	charger->irq_domain = irq_domain_create_linear(dev_fwnode(pdev->dev.parent), 1,
> +						       &irq_domain_simple_ops, NULL);
> +	if (!charger->irq_domain)
> +		return -ENOMEM;
> +
> +	/* Distuingish IRQ domain from others sharing (MFD) the same fwnode */
> +	irq_domain_update_bus_token(charger->irq_domain, DOMAIN_BUS_WAKEUP);
> +
> +	ret = devm_add_action_or_reset(&pdev->dev, crystal_cove_charger_rm_irq_domain, charger);
> +	if (ret)
> +		return ret;
> +
> +	charger->charger_irq = irq_create_mapping(charger->irq_domain, 0);
> +	if (!charger->charger_irq)
> +		return -ENOMEM;
> +
> +	charger->irqchip.name = KBUILD_MODNAME;
> +	charger->irqchip.irq_unmask = crystal_cove_charger_irq_unmask;
> +	charger->irqchip.irq_mask = crystal_cove_charger_irq_mask;
> +	charger->irqchip.irq_bus_lock = crystal_cove_charger_irq_bus_lock;
> +	charger->irqchip.irq_bus_sync_unlock = crystal_cove_charger_irq_bus_sync_unlock;
> +
> +	irq_set_chip_data(charger->charger_irq, charger);
> +	irq_set_chip_and_handler(charger->charger_irq, &charger->irqchip, handle_simple_irq);
> +	irq_set_nested_thread(charger->charger_irq, true);
> +	irq_set_noprobe(charger->charger_irq);
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, charger->irq, NULL,
> +					crystal_cove_charger_irq,
> +					IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +					KBUILD_MODNAME, charger);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "requesting irq\n");
> +
> +	return 0;
> +}
> +
> +static struct platform_driver crystal_cove_charger_driver = {
> +	.probe = crystal_cove_charger_probe,
> +	.driver = {
> +		.name = "crystal_cove_charger",
> +	},
> +};
> +module_platform_driver(crystal_cove_charger_driver);
> +
> +MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com");
> +MODULE_DESCRIPTION("Bay Trail Crystal Cove external charger IRQ pass-through");
> +MODULE_LICENSE("GPL");
> 

