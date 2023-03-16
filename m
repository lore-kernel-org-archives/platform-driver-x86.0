Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C2BC6FD19
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Mar 2023 13:43:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbjCPNng (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Mar 2023 09:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjCPNne (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 09:43:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0340EBBB20
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 06:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678974168;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rgnenO9VogQZ8bMnAvhuQJgtEXdwehTf+zZMwAuRnP8=;
        b=Y+pO+BcwkmDT+EmuN0CXtJ9CPo6IkO/Egy0qRaI5wc77LpVHrVCFrJ/j/ee/xBCAUuhiRy
        6ovL3dJCFZetnz4cI+ZR6d/tK/8KzKEft2bIF7A4jWk/c3WDMiT0R7Tg008Gk2mxJjcJiB
        D49tinqIMwyVPkyIKN1tOYlrgnKaaJU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-mVjkOQI_MOmzcDOrxw-crw-1; Thu, 16 Mar 2023 09:42:46 -0400
X-MC-Unique: mVjkOQI_MOmzcDOrxw-crw-1
Received: by mail-ed1-f71.google.com with SMTP id h11-20020a0564020e8b00b004e59d4722a3so3113668eda.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 06:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678974165;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rgnenO9VogQZ8bMnAvhuQJgtEXdwehTf+zZMwAuRnP8=;
        b=6Ga2RjUnsd5W1GrheSzR8Jxw83L2hNS/RV0oTWTsc52kKEEkreBoW/TahV0m8H8i1V
         5ogIvs/9xSRVlhjbCca+LlG2giC4DOD2AqqIvUiSJ4CZk6KdRXnIfSHycQoU8dunkWzz
         fUlm4sHc9aeosnbB5vTdWB34Wl1cfV6wCwE4aVeYMg2Px9+h88gyuR0kAcSPl8+bwaD9
         tgKhBDOUt1KHOExbpD8ReuBfoj9zLbDdPWiTRLQHbsvN/isiUwQPJVM39EjNBOyMv29M
         XN1k+oXZHJBkuofg/M4uWdGCTDuTrj1xJkb8u8DbifjJvh1Nonfeuq0nN8gYJ13PcZoS
         SRcQ==
X-Gm-Message-State: AO0yUKW0x7yiFeraejGmLnzwP9h/V9HUTw8Jfp/ENzVRXcSVsvfiXwJx
        th94L5hRIw2vGlcZoItLPfdzfnAXLFCeyC41LOY/oDnbTpj46DBniPhfCp4Hcfp3HVQPhrYt6Ru
        TQYuaHR7MucQ7hxiyKq5SUVT4/njOyXQ9kw==
X-Received: by 2002:a17:907:6295:b0:92f:500c:5935 with SMTP id nd21-20020a170907629500b0092f500c5935mr7223668ejc.19.1678974165816;
        Thu, 16 Mar 2023 06:42:45 -0700 (PDT)
X-Google-Smtp-Source: AK7set9/oNXdfU3JSt2iHIg03Z6B4DN5PpPj9Mpo1+1ZJiaMCtd+jKO0rXDzZ3uYeACW6Lj5e/Bu6A==
X-Received: by 2002:a17:907:6295:b0:92f:500c:5935 with SMTP id nd21-20020a170907629500b0092f500c5935mr7223636ejc.19.1678974165442;
        Thu, 16 Mar 2023 06:42:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g11-20020a170906348b00b0092b4602f506sm3848430ejb.73.2023.03.16.06.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 06:42:45 -0700 (PDT)
Message-ID: <875e41d3-350e-c73f-a3fb-b3ecd3f6539c@redhat.com>
Date:   Thu, 16 Mar 2023 14:42:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: Add intel_bytcrc_pwrsrc driver
Content-Language: en-US, nl
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20230303221928.285477-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230303221928.285477-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/3/23 23:19, Hans de Goede wrote:
> Add a new driver for the power-, wake- and reset-source functionality
> of the Bay Trail (BYT) version of the Crystal Cove PMIC.
> 
> The main functionality here is detecting which power-sources (USB /
> DC in / battery) are active. This is normally exposed to userspace as
> a power_supply class charger device with an online sysfs attribute.
> 
> But if a charger is online or not is already exposed on BYT-CRC devices
> through either an ACPI AC power_supply device, or through a native driver
> for the battery charger chip (e.g. a BQ24292i).
> 
> So instead of adding duplicate info under the power_supply class this
> driver exports the info through debugfs and likewise adds debugfs files
> for the reset- and wake-source info / registers.
> 
> Despite this driver only exporting debugfs bits it is still useful to
> have this driver because it clears the wake- and reset-source registers
> after reading them. Not clearing these can have undesirable side-effects.
> 
> Specifically if the WAKESRC register contains 0x01 (wake by powerbutton)
> on reboot then the firmware on some tablets turns the reboot into
> a poweroff. I guess this may be necessary to make long power-presses turn
> into a poweroff somehow?
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/intel/Kconfig         |  10 ++
>  drivers/platform/x86/intel/Makefile        |   2 +
>  drivers/platform/x86/intel/bytcrc_pwrsrc.c | 181 +++++++++++++++++++++
>  3 files changed, 193 insertions(+)
>  create mode 100644 drivers/platform/x86/intel/bytcrc_pwrsrc.c
> 
> diff --git a/drivers/platform/x86/intel/Kconfig b/drivers/platform/x86/intel/Kconfig
> index bbbd9e54e9ee..e9dc0c021029 100644
> --- a/drivers/platform/x86/intel/Kconfig
> +++ b/drivers/platform/x86/intel/Kconfig
> @@ -80,6 +80,16 @@ config INTEL_BXTWC_PMIC_TMU
>  	  This driver enables the alarm wakeup functionality in the TMU unit of
>  	  Whiskey Cove PMIC.
>  
> +config INTEL_BYTCRC_PWRSRC
> +	tristate "Intel Bay Trail Crystal Cove power source driver"
> +	depends on INTEL_SOC_PMIC
> +	help
> +	  This option adds a power source driver for Crystal Cove PMICs
> +	  on Intel Bay Trail devices.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called intel_bytcrc_pwrsrc.
> +
>  config INTEL_CHTDC_TI_PWRBTN
>  	tristate "Intel Cherry Trail Dollar Cove TI power button driver"
>  	depends on INTEL_SOC_PMIC_CHTDC_TI
> diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/intel/Makefile
> index 411df4040427..c1d5fe05e3f3 100644
> --- a/drivers/platform/x86/intel/Makefile
> +++ b/drivers/platform/x86/intel/Makefile
> @@ -38,6 +38,8 @@ intel_bxtwc_tmu-y			:= bxtwc_tmu.o
>  obj-$(CONFIG_INTEL_BXTWC_PMIC_TMU)	+= intel_bxtwc_tmu.o
>  intel_crystal_cove_charger-y		:= crystal_cove_charger.o
>  obj-$(CONFIG_X86_ANDROID_TABLETS)	+= intel_crystal_cove_charger.o
> +intel_bytcrc_pwrsrc-y			:= bytcrc_pwrsrc.o
> +obj-$(CONFIG_INTEL_BYTCRC_PWRSRC)	+= intel_bytcrc_pwrsrc.o
>  intel_chtdc_ti_pwrbtn-y			:= chtdc_ti_pwrbtn.o
>  obj-$(CONFIG_INTEL_CHTDC_TI_PWRBTN)	+= intel_chtdc_ti_pwrbtn.o
>  intel_chtwc_int33fe-y			:= chtwc_int33fe.o
> diff --git a/drivers/platform/x86/intel/bytcrc_pwrsrc.c b/drivers/platform/x86/intel/bytcrc_pwrsrc.c
> new file mode 100644
> index 000000000000..8a022b90d12d
> --- /dev/null
> +++ b/drivers/platform/x86/intel/bytcrc_pwrsrc.c
> @@ -0,0 +1,181 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Power-source driver for Bay Trail Crystal Cove PMIC
> + *
> + * Copyright (c) 2023 Hans de Goede <hdegoede@redhat.com>
> + *
> + * Based on intel_crystalcove_pwrsrc.c from Android kernel sources, which is:
> + * Copyright (C) 2013 Intel Corporation
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/mfd/intel_soc_pmic.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define CRYSTALCOVE_SPWRSRC_REG		0x1E
> +#define CRYSTALCOVE_RESETSRC0_REG	0x20
> +#define CRYSTALCOVE_RESETSRC1_REG	0x21
> +#define CRYSTALCOVE_WAKESRC_REG		0x22
> +
> +struct crc_pwrsrc_data {
> +	struct regmap *regmap;
> +	struct dentry *debug_dentry;
> +	unsigned int resetsrc0;
> +	unsigned int resetsrc1;
> +	unsigned int wakesrc;
> +};
> +
> +static const char * const pwrsrc_pwrsrc_info[] = {
> +	/* bit 0 */ "USB",
> +	/* bit 1 */ "DC in",
> +	/* bit 2 */ "Battery",
> +	NULL,
> +};
> +
> +static const char * const pwrsrc_resetsrc0_info[] = {
> +	/* bit 0 */ "SOC reporting a thermal event",
> +	/* bit 1 */ "critical PMIC temperature",
> +	/* bit 2 */ "critical system temperature",
> +	/* bit 3 */ "critical battery temperature",
> +	/* bit 4 */ "VSYS under voltage",
> +	/* bit 5 */ "VSYS over voltage",
> +	/* bit 6 */ "battery removal",
> +	NULL,
> +};
> +
> +static const char * const pwrsrc_resetsrc1_info[] = {
> +	/* bit 0 */ "VCRIT threshold",
> +	/* bit 1 */ "BATID reporting battery removal",
> +	/* bit 2 */ "user pressing the power button",
> +	NULL,
> +};
> +
> +static const char * const pwrsrc_wakesrc_info[] = {
> +	/* bit 0 */ "user pressing the power button",
> +	/* bit 1 */ "a battery insertion",
> +	/* bit 2 */ "a USB charger insertion",
> +	/* bit 3 */ "an adapter insertion",
> +	NULL,
> +};
> +
> +static void crc_pwrsrc_log(struct seq_file *seq, const char *prefix,
> +			   const char * const *info, unsigned int reg_val)
> +{
> +	int i;
> +
> +	for (i = 0; info[i]; i++) {
> +		if (reg_val & BIT(i))
> +			seq_printf(seq, "%s by %s\n", prefix, info[i]);
> +	}
> +}
> +
> +static int pwrsrc_show(struct seq_file *seq, void *unused)
> +{
> +	struct crc_pwrsrc_data *data = seq->private;
> +	unsigned int reg_val;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, CRYSTALCOVE_SPWRSRC_REG, &reg_val);
> +	if (ret)
> +		return ret;
> +
> +	crc_pwrsrc_log(seq, "System powered", pwrsrc_pwrsrc_info, reg_val);
> +	return 0;
> +}
> +
> +static int resetsrc_show(struct seq_file *seq, void *unused)
> +{
> +	struct crc_pwrsrc_data *data = seq->private;
> +
> +	crc_pwrsrc_log(seq, "Last shutdown caused", pwrsrc_resetsrc0_info, data->resetsrc0);
> +	crc_pwrsrc_log(seq, "Last shutdown caused", pwrsrc_resetsrc1_info, data->resetsrc1);
> +	return 0;
> +}
> +
> +static int wakesrc_show(struct seq_file *seq, void *unused)
> +{
> +	struct crc_pwrsrc_data *data = seq->private;
> +
> +	crc_pwrsrc_log(seq, "Last wake caused", pwrsrc_wakesrc_info, data->wakesrc);
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(pwrsrc);
> +DEFINE_SHOW_ATTRIBUTE(resetsrc);
> +DEFINE_SHOW_ATTRIBUTE(wakesrc);
> +
> +static int crc_pwrsrc_read_and_clear(struct crc_pwrsrc_data *data,
> +				     unsigned int reg, unsigned int *val)
> +{
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, reg, val);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_write(data->regmap, reg, *val);
> +}
> +
> +static int crc_pwrsrc_probe(struct platform_device *pdev)
> +{
> +	struct intel_soc_pmic *pmic = dev_get_drvdata(pdev->dev.parent);
> +	struct crc_pwrsrc_data *data;
> +	int ret;
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->regmap = pmic->regmap;
> +
> +	/*
> +	 * Read + clear resetsrc0/1 and wakesrc now, so that they get
> +	 * cleared even if the debugfs interface is never used.
> +	 *
> +	 * Properly clearing the wakesrc is important, leaving bit 0 of it
> +	 * set turns reboot into poweroff on some tablets.
> +	 */
> +	ret = crc_pwrsrc_read_and_clear(data, CRYSTALCOVE_RESETSRC0_REG, &data->resetsrc0);
> +	if (ret)
> +		return ret;
> +
> +	ret = crc_pwrsrc_read_and_clear(data, CRYSTALCOVE_RESETSRC1_REG, &data->resetsrc1);
> +	if (ret)
> +		return ret;
> +
> +	ret = crc_pwrsrc_read_and_clear(data, CRYSTALCOVE_WAKESRC_REG, &data->wakesrc);
> +	if (ret)
> +		return ret;
> +
> +	data->debug_dentry = debugfs_create_dir(KBUILD_MODNAME, NULL);
> +	debugfs_create_file("pwrsrc", 0444, data->debug_dentry, data, &pwrsrc_fops);
> +	debugfs_create_file("resetsrc", 0444, data->debug_dentry, data, &resetsrc_fops);
> +	debugfs_create_file("wakesrc", 0444, data->debug_dentry, data, &wakesrc_fops);
> +
> +	platform_set_drvdata(pdev, data);
> +	return 0;
> +}
> +
> +static int crc_pwrsrc_remove(struct platform_device *pdev)
> +{
> +	struct crc_pwrsrc_data *data = platform_get_drvdata(pdev);
> +
> +	debugfs_remove_recursive(data->debug_dentry);
> +	return 0;
> +}
> +
> +static struct platform_driver crc_pwrsrc_driver = {
> +	.probe = crc_pwrsrc_probe,
> +	.remove = crc_pwrsrc_remove,
> +	.driver = {
> +		.name = "crystal_cove_pwrsrc",
> +	},
> +};
> +module_platform_driver(crc_pwrsrc_driver);
> +
> +MODULE_ALIAS("platform:crystal_cove_pwrsrc");
> +MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
> +MODULE_DESCRIPTION("Power-source driver for Bay Trail Crystal Cove PMIC");
> +MODULE_LICENSE("GPL");

