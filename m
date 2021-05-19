Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F650C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:23:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C27C60FDA
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:23:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238874AbhESNY3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 09:24:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27077 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353577AbhESNY1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 09:24:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621430587;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0jmhXsyF0ugx4FPf4D5s9Z88adwRxEUPVpeuYn2DrBQ=;
        b=HOcvpPdampvs0Dz1Uz29IeW8oJ9FGAjyAvU6ABMaLcCGC0Zl6PdBJ/2GGnFxTvefyzzfCv
        RGhbWwJ/ARWSVjtPznVhyM+Tr40F4whqduT6jAEykF3kyImHCu1m6nQbXfW4ZkKzAVtdnb
        9OmKceTospD1O6bnvGu0qDqTiNCOh0k=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-ppBkzjk8O8-lIZNx6PAgZw-1; Wed, 19 May 2021 09:23:04 -0400
X-MC-Unique: ppBkzjk8O8-lIZNx6PAgZw-1
Received: by mail-ed1-f72.google.com with SMTP id h18-20020a05640250d2b029038cc3938914so7693523edb.17
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 06:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0jmhXsyF0ugx4FPf4D5s9Z88adwRxEUPVpeuYn2DrBQ=;
        b=KGnuiy0IK2HqmR5WqqlFOUVe0xYVvIFSQW3ybXO+S097NWAMGm8XOPDjXuAJ1tLowD
         1Kr5zR5E4onSqw6DSJohNh2ZJeajyrNWfZg8zXOYeSgaT8YgafWTzapDRQN51J8DnN8U
         Wzo8bn4R7dXwfwOBXIcEKTh3R2YYfRPCRJoN6L1yA2obREfcx7lqrDVENo3qoUB7vxY1
         1+IUF9QQeNcrZZili0B63i4LMC5unRJh5aMwqOPd1k2zDe8llPz84u7XOD3iNET+MbsX
         bfDArntxQ9l8Rbv/ONhl9hFw+mqHrqaZh/dt0H3Z+622mVIIg44KcQ8doK1phfKJNm+Q
         5FBg==
X-Gm-Message-State: AOAM5300P6z9wOjKfsaH3Bpc4FxuFgVsShExR9kl8xidil/CCk1NTMmv
        X4IhGV1c0IggA/NImX6XzX3brHlQwhZTogFbJfWhD2uipYHzXqxQfBZKVxj+h91X3mhkntDHqL6
        0S9LGnUjdY82r+V6jVN2zb/3Zj/N1HH5m+w==
X-Received: by 2002:a17:906:4806:: with SMTP id w6mr12444878ejq.180.1621430581784;
        Wed, 19 May 2021 06:23:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZlVzHJUNzxdXJCT/6UXxHJU6RU540PDR6HySLZVDAvngKdIDXwQ6dt9ry1vlRWApT7uMLwg==
X-Received: by 2002:a17:906:4806:: with SMTP id w6mr12444843ejq.180.1621430581535;
        Wed, 19 May 2021 06:23:01 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id w14sm16076436edj.6.2021.05.19.06.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 06:23:01 -0700 (PDT)
Subject: Re: [PATCH 1/1] platform/x86: intel_int0002_vgpio: Only call
 enable_irq_wake() when using s2idle
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maxim Mikityanskiy <maxtram95@gmail.com>
References: <20210512125523.55215-1-hdegoede@redhat.com>
 <20210512125523.55215-2-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <78cee448-e85b-8f51-f5f8-61b9883d8c96@redhat.com>
Date:   Wed, 19 May 2021 15:23:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210512125523.55215-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/12/21 2:55 PM, Hans de Goede wrote:
> Commit 871f1f2bcb01 ("platform/x86: intel_int0002_vgpio: Only implement
> irq_set_wake on Bay Trail") stopped passing irq_set_wake requests on to
> the parents IRQ because this was breaking suspend (causing immediate
> wakeups) on an Asus E202SA.
> 
> This workaround for the Asus E202SA is causing wakeup by USB keyboard to
> not work on other devices with Airmont CPU cores such as the Medion Akoya
> E1239T. In hindsight the problem with the Asus E202SA has nothing to do
> with Silvermont vs Airmont CPU cores, so the differentiation between the
> 2 types of CPU cores introduced by the previous fix is wrong.
> 
> The real issue at hand is s2idle vs S3 suspend where the suspend is
> mostly handled by firmware. The parent IRQ for the INT0002 device is shared
> with the ACPI SCI and the real problem is that the INT0002 code should not
> be messing with the wakeup settings of that IRQ when suspend/resume is
> being handled by the firmware.
> 
> Note that on systems which support both s2idle and S3 suspend, which
> suspend method to use can be changed at runtime.
> 
> This patch fixes both the Asus E202SA spurious wakeups issue as well as
> the wakeup by USB keyboard not working on the Medion Akoya E1239T issue.
> 
> These are both fixed by replacing the old workaround with delaying the
> enable_irq_wake(parent_irq) call till system-suspend time and protecting
> it with a !pm_suspend_via_firmware() check so that we still do not call
> it on devices using firmware-based (S3) suspend such as the Asus E202SA.
> 
> Note rather then adding #ifdef CONFIG_PM_SLEEP, this commit simply adds
> a "depends on PM_SLEEP" to the Kconfig since this drivers whole purpose
> is to deal with wakeup events, so using it without CONFIG_PM_SLEEP makes
> no sense.
> 
> Cc: Maxim Mikityanskiy <maxtram95@gmail.com>
> Fixes: 871f1f2bcb01 ("platform/x86: intel_int0002_vgpio: Only implement irq_set_wake on Bay Trail")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans branch now and I will also include this
in the next pdx86-fixes pull-req for 5.13.

Regards,

Hans



> ---
>  drivers/platform/x86/Kconfig               |  2 +-
>  drivers/platform/x86/intel_int0002_vgpio.c | 80 +++++++++++++++-------
>  2 files changed, 57 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 4b67e74a747b..c2f608d5f1b7 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -713,7 +713,7 @@ config INTEL_HID_EVENT
>  
>  config INTEL_INT0002_VGPIO
>  	tristate "Intel ACPI INT0002 Virtual GPIO driver"
> -	depends on GPIOLIB && ACPI
> +	depends on GPIOLIB && ACPI && PM_SLEEP
>  	select GPIOLIB_IRQCHIP
>  	help
>  	  Some peripherals on Bay Trail and Cherry Trail platforms signal a
> diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
> index 289c6655d425..569342aa8926 100644
> --- a/drivers/platform/x86/intel_int0002_vgpio.c
> +++ b/drivers/platform/x86/intel_int0002_vgpio.c
> @@ -51,6 +51,12 @@
>  #define GPE0A_STS_PORT			0x420
>  #define GPE0A_EN_PORT			0x428
>  
> +struct int0002_data {
> +	struct gpio_chip chip;
> +	int parent_irq;
> +	int wake_enable_count;
> +};
> +
>  /*
>   * As this is not a real GPIO at all, but just a hack to model an event in
>   * ACPI the get / set functions are dummy functions.
> @@ -98,14 +104,16 @@ static void int0002_irq_mask(struct irq_data *data)
>  static int int0002_irq_set_wake(struct irq_data *data, unsigned int on)
>  {
>  	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
> -	struct platform_device *pdev = to_platform_device(chip->parent);
> -	int irq = platform_get_irq(pdev, 0);
> +	struct int0002_data *int0002 = container_of(chip, struct int0002_data, chip);
>  
> -	/* Propagate to parent irq */
> +	/*
> +	 * Applying of the wakeup flag to our parent IRQ is delayed till system
> +	 * suspend, because we only want to do this when using s2idle.
> +	 */
>  	if (on)
> -		enable_irq_wake(irq);
> +		int0002->wake_enable_count++;
>  	else
> -		disable_irq_wake(irq);
> +		int0002->wake_enable_count--;
>  
>  	return 0;
>  }
> @@ -135,7 +143,7 @@ static bool int0002_check_wake(void *data)
>  	return (gpe_sts_reg & GPE0A_PME_B0_STS_BIT);
>  }
>  
> -static struct irq_chip int0002_byt_irqchip = {
> +static struct irq_chip int0002_irqchip = {
>  	.name			= DRV_NAME,
>  	.irq_ack		= int0002_irq_ack,
>  	.irq_mask		= int0002_irq_mask,
> @@ -143,21 +151,9 @@ static struct irq_chip int0002_byt_irqchip = {
>  	.irq_set_wake		= int0002_irq_set_wake,
>  };
>  
> -static struct irq_chip int0002_cht_irqchip = {
> -	.name			= DRV_NAME,
> -	.irq_ack		= int0002_irq_ack,
> -	.irq_mask		= int0002_irq_mask,
> -	.irq_unmask		= int0002_irq_unmask,
> -	/*
> -	 * No set_wake, on CHT the IRQ is typically shared with the ACPI SCI
> -	 * and we don't want to mess with the ACPI SCI irq settings.
> -	 */
> -	.flags			= IRQCHIP_SKIP_SET_WAKE,
> -};
> -
>  static const struct x86_cpu_id int0002_cpu_ids[] = {
> -	X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT,	&int0002_byt_irqchip),
> -	X86_MATCH_INTEL_FAM6_MODEL(ATOM_AIRMONT,	&int0002_cht_irqchip),
> +	X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(ATOM_AIRMONT, NULL),
>  	{}
>  };
>  
> @@ -172,8 +168,9 @@ static int int0002_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	const struct x86_cpu_id *cpu_id;
> -	struct gpio_chip *chip;
> +	struct int0002_data *int0002;
>  	struct gpio_irq_chip *girq;
> +	struct gpio_chip *chip;
>  	int irq, ret;
>  
>  	/* Menlow has a different INT0002 device? <sigh> */
> @@ -185,10 +182,13 @@ static int int0002_probe(struct platform_device *pdev)
>  	if (irq < 0)
>  		return irq;
>  
> -	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> -	if (!chip)
> +	int0002 = devm_kzalloc(dev, sizeof(*int0002), GFP_KERNEL);
> +	if (!int0002)
>  		return -ENOMEM;
>  
> +	int0002->parent_irq = irq;
> +
> +	chip = &int0002->chip;
>  	chip->label = DRV_NAME;
>  	chip->parent = dev;
>  	chip->owner = THIS_MODULE;
> @@ -214,7 +214,7 @@ static int int0002_probe(struct platform_device *pdev)
>  	}
>  
>  	girq = &chip->irq;
> -	girq->chip = (struct irq_chip *)cpu_id->driver_data;
> +	girq->chip = &int0002_irqchip;
>  	/* This let us handle the parent IRQ in the driver */
>  	girq->parent_handler = NULL;
>  	girq->num_parents = 0;
> @@ -230,6 +230,7 @@ static int int0002_probe(struct platform_device *pdev)
>  
>  	acpi_register_wakeup_handler(irq, int0002_check_wake, NULL);
>  	device_init_wakeup(dev, true);
> +	dev_set_drvdata(dev, int0002);
>  	return 0;
>  }
>  
> @@ -240,6 +241,36 @@ static int int0002_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static int int0002_suspend(struct device *dev)
> +{
> +	struct int0002_data *int0002 = dev_get_drvdata(dev);
> +
> +	/*
> +	 * The INT0002 parent IRQ is often shared with the ACPI GPE IRQ, don't
> +	 * muck with it when firmware based suspend is used, otherwise we may
> +	 * cause spurious wakeups from firmware managed suspend.
> +	 */
> +	if (!pm_suspend_via_firmware() && int0002->wake_enable_count)
> +		enable_irq_wake(int0002->parent_irq);
> +
> +	return 0;
> +}
> +
> +static int int0002_resume(struct device *dev)
> +{
> +	struct int0002_data *int0002 = dev_get_drvdata(dev);
> +
> +	if (!pm_suspend_via_firmware() && int0002->wake_enable_count)
> +		disable_irq_wake(int0002->parent_irq);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops int0002_pm_ops = {
> +	.suspend = int0002_suspend,
> +	.resume = int0002_resume,
> +};
> +
>  static const struct acpi_device_id int0002_acpi_ids[] = {
>  	{ "INT0002", 0 },
>  	{ },
> @@ -250,6 +281,7 @@ static struct platform_driver int0002_driver = {
>  	.driver = {
>  		.name			= DRV_NAME,
>  		.acpi_match_table	= int0002_acpi_ids,
> +		.pm			= &int0002_pm_ops,
>  	},
>  	.probe	= int0002_probe,
>  	.remove	= int0002_remove,
> 

