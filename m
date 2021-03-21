Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BC8C433C1
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 17:25:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 495DE6192D
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 17:25:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbhCURY1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 13:24:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41549 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230056AbhCURX6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 13:23:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616347438;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=21bGkF7H3nKo2eBHg1WCDvaC/H/LPJq6JiF4gaV2ZZE=;
        b=FTugJ4THn8UiJG4OV3pKUJxDxHrgu60HT1SgmjKpyA9Q77hynhx6fRVoAYuQd5CHNELOkW
        k06LeP0IBhhK5FpSoCZT2C4AgDDldJcU4FII5L7Kd39dvvCqDdxhxuYU+HGTOFN2EY35bl
        guxNJIQTSOULN/bbgK4p2YXR3YTWgqM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-MOkq6iPKM3e9Ym4ozBtZFg-1; Sun, 21 Mar 2021 13:23:56 -0400
X-MC-Unique: MOkq6iPKM3e9Ym4ozBtZFg-1
Received: by mail-ed1-f70.google.com with SMTP id n20so26229685edr.8
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Mar 2021 10:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=21bGkF7H3nKo2eBHg1WCDvaC/H/LPJq6JiF4gaV2ZZE=;
        b=rfYiQ/YEL7O++recDQtfQNMm2OdScfST8UIX3WA6aSmIxZcsaQsjr6ZnmKkdGngAt+
         IyAXts6N2Oya9/KXaD7WG+YN/1rWAOGRopr78TrrZQryDA6fVweldrxPdR5E3JZ38dk3
         UPCUthiRuMn+4BWI52bZVbqYB4Y6M607AIwLvwNzQubUrWaWR0ByJORFD8N1G53oMXHI
         pVYmVxDkyqk6g71/jc6p36q4NBRYxNz/9XyhEZNH1OffrdrE2QCwcJOQAo8ALgTiz3WU
         3Y1hYVPgh486fAoX0Vj9fAVFV9hDDnyIfmLy9ePQK1iXGmjJViBcCFWBy2gk8JjlXhFw
         v0bw==
X-Gm-Message-State: AOAM5329xkzJMRQgQbQb1DHPrwjXQ0Rvo0//Pd34FKYbFyNPoFRmdJ38
        OskzjZju5lONeSEC8IhmVrR5gGLp6pOXW2TJ6X2xMdGvxZLvnL5dtcqiro1wMdjCl+kxsZ7WWhb
        Tzuopode7Q+b/oUN8w/1hoLuz3ikVNq6iHw==
X-Received: by 2002:a05:6402:138f:: with SMTP id b15mr21641355edv.121.1616347435390;
        Sun, 21 Mar 2021 10:23:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLBR/jF2JUZKMTYSnfqcy9OgTSzHRykamA7e1kfmVH0jSKb8Xv7AH1UiFtuPFL4JmFvPTHAg==
X-Received: by 2002:a05:6402:138f:: with SMTP id b15mr21641341edv.121.1616347435222;
        Sun, 21 Mar 2021 10:23:55 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n26sm8626511eds.22.2021.03.21.10.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Mar 2021 10:23:54 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: sysfs interface to get wwan
 antenna type
To:     Nitin Joshi <nitjoshi@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Nitin Joshi <njoshi1@lenovo.com>,
        Mark Pearson <markpearson@lenovo.com>
References: <20210317024636.356175-1-njoshi1@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <fb123352-67a6-2aaa-6b5d-69326793e3a7@redhat.com>
Date:   Sun, 21 Mar 2021 18:23:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210317024636.356175-1-njoshi1@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/17/21 3:46 AM, Nitin Joshi wrote:
> On some newer Thinkpads we need to set SAR value based on antenna type.
> This patch provides a sysfs interface that userspace can use to get
> antenna type and set corresponding SAR value, as is required for FCC
> certification.
> 
> Reviewed-by: Mark Pearson <markpearson@lenovo.com>
> Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  .../admin-guide/laptops/thinkpad-acpi.rst     |  20 ++++
>  drivers/platform/x86/thinkpad_acpi.c          | 109 ++++++++++++++++++
>  2 files changed, 129 insertions(+)
> 
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index 91fd6846ce17..6721a80a2d4f 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -52,6 +52,7 @@ detailed description):
>  	- LCD Shadow (PrivacyGuard) enable and disable
>  	- Lap mode sensor
>  	- Setting keyboard language
> +	- WWAN Antenna type
>  
>  A compatibility table by model and feature is maintained on the web
>  site, http://ibm-acpi.sf.net/. I appreciate any success or failure
> @@ -1490,6 +1491,25 @@ fr(French), fr-ch(French(Switzerland)), hu(Hungarian), it(Italy), jp (Japan),
>  nl(Dutch), nn(Norway), pl(Polish), pt(portugese), sl(Slovenian), sv(Sweden),
>  tr(Turkey)
>  
> +WWAN Antenna type
> +-----------------
> +
> +sysfs: wwan_antenna_type
> +
> +On some newer Thinkpads we need to set SAR value based on the antenna
> +type. This interface will be used by userspace to get the antenna type
> +and set the corresponding SAR value, as is required for FCC certification.
> +
> +The available commands are::
> +
> +        cat /sys/devices/platform/thinkpad_acpi/wwan_antenna_type
> +
> +Currently 2 antenna types are supported as mentioned below:
> +- type a
> +- type b
> +
> +The property is read-only. If the platform doesn't have support the sysfs
> +class is not created.
>  
>  Adaptive keyboard
>  -----------------
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index b881044b31b0..7bc9868be578 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10423,6 +10423,111 @@ static struct ibm_struct kbdlang_driver_data = {
>  	.exit = kbdlang_exit,
>  };
>  
> +/*************************************************************************
> + * DPRC(Dynamic Power Reduction Control) subdriver, for the Lenovo WWAN
> + * and WLAN feature.
> + */
> +#define DPRC_GET_WWAN_ANTENNA_TYPE      0x40000
> +#define DPRC_WWAN_ANTENNA_TYPE_A_BIT    BIT(4)
> +#define DPRC_WWAN_ANTENNA_TYPE_B_BIT    BIT(8)
> +static bool has_antennatype;
> +static int wwan_antennatype;
> +
> +static int dprc_command(int command, int *output)
> +{
> +	acpi_handle dprc_handle;
> +
> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DPRC", &dprc_handle))) {
> +		/* Platform doesn't support DPRC */
> +		return -ENODEV;
> +	}
> +
> +	if (!acpi_evalf(dprc_handle, output, NULL, "dd", command))
> +		return -EIO;
> +
> +	/*
> +	 * METHOD_ERR gets returned on devices where few commands are not supported
> +	 * for example command to get WWAN Antenna type command is not supported on
> +	 * some devices.
> +	 */
> +	if (*output & METHOD_ERR)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static int get_wwan_antenna(int *wwan_antennatype)
> +{
> +	int output, err;
> +
> +	/* Get current Antenna type */
> +	err = dprc_command(DPRC_GET_WWAN_ANTENNA_TYPE, &output);
> +	if (err)
> +		return err;
> +
> +	if (output & DPRC_WWAN_ANTENNA_TYPE_A_BIT)
> +		*wwan_antennatype = 1;
> +	else if (output & DPRC_WWAN_ANTENNA_TYPE_B_BIT)
> +		*wwan_antennatype = 2;
> +	else
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +/* sysfs wwan antenna type entry */
> +static ssize_t wwan_antenna_type_show(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buf)
> +{
> +	switch (wwan_antennatype) {
> +	case 1:
> +		return sysfs_emit(buf, "type a\n");
> +	case 2:
> +		return sysfs_emit(buf, "type b\n");
> +	default:
> +		return -ENODATA;
> +	}
> +}
> +static DEVICE_ATTR_RO(wwan_antenna_type);
> +
> +static int tpacpi_dprc_init(struct ibm_init_struct *iibm)
> +{
> +	int wwanantenna_err, err;
> +
> +	wwanantenna_err = get_wwan_antenna(&wwan_antennatype);
> +	/*
> +	 * If support isn't available (ENODEV) then quit, but don't
> +	 * return an error.
> +	 */
> +	if (wwanantenna_err == -ENODEV)
> +		return 0;
> +
> +	/* if there was an error return it */
> +	if (wwanantenna_err && (wwanantenna_err != -ENODEV))
> +		return wwanantenna_err;
> +	else if (!wwanantenna_err)
> +		has_antennatype = true;
> +
> +	if (has_antennatype) {
> +		err = sysfs_create_file(&tpacpi_pdev->dev.kobj, &dev_attr_wwan_antenna_type.attr);
> +		if (err)
> +			return err;
> +	}
> +	return 0;
> +}
> +
> +static void dprc_exit(void)
> +{
> +	if (has_antennatype)
> +		sysfs_remove_file(&tpacpi_pdev->dev.kobj, &dev_attr_wwan_antenna_type.attr);
> +}
> +
> +static struct ibm_struct dprc_driver_data = {
> +	.name = "dprc",
> +	.exit = dprc_exit,
> +};
> +
>  /****************************************************************************
>   ****************************************************************************
>   *
> @@ -10927,6 +11032,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
>  		.init = tpacpi_kbdlang_init,
>  		.data = &kbdlang_driver_data,
>  	},
> +	{
> +		.init = tpacpi_dprc_init,
> +		.data = &dprc_driver_data,
> +	},
>  };
>  
>  static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
> 

