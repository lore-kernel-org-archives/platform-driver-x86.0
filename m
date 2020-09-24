Return-Path: <SRS0=VZIW=DB=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F30C2D0E2
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 08:39:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7681323787
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 08:39:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pt0lVXTT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbgIXIjO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Sep 2020 04:39:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50852 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727211AbgIXIjN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Sep 2020 04:39:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600936751;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KumOR8QeFpvN+I1g8iTewl/hiL0N7ivhlLhAs34U1rU=;
        b=Pt0lVXTTsyDj2dQsB0c/zD1z1/S4jYEQSuYPfiEorRJa2t8K3S0rdbI9u3ZoVrSnYzYGvR
        Od6IuNh5WM2MDP9hTmAug0Lz4/mIHUSD95qYYP7CKg+Ma+f9akBA6O7DKY4h8iG/PDMcCF
        pqF8PFxii9QlDGxfSmXm4ooBo2wUo/o=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-vOUXKJGHN8qTkrZ7ZCKG0A-1; Thu, 24 Sep 2020 04:39:09 -0400
X-MC-Unique: vOUXKJGHN8qTkrZ7ZCKG0A-1
Received: by mail-ej1-f71.google.com with SMTP id ml20so996747ejb.23
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2020 01:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KumOR8QeFpvN+I1g8iTewl/hiL0N7ivhlLhAs34U1rU=;
        b=OM2K2VZr5qJskGsOUUD2Q+wMztDck+3aXKGb7etOhvJ5GBOenDREIMDpKcfMXaZrI0
         hlvnF1MyG/NLjNDPjhYtIaNW+yxnxAvbj07T/4AOj8nPRysgNxuVpPFqHSYD9p5kMHGI
         GeQ0VVch8taZWg6Bejl7AaOUOad6CCgUd5Zey11mAiEYCuQqto+wAFUGEwUsYi9bNYUE
         OxUNvralkxKVJlocpxrGb1VBS0mGc0RHVnk06KgJc+TD15Sw4ZDZIRIaSDqUoCa9mbcH
         AT3BXKqCBVDB/L9a4HcNCSqbiUXzG3UUYvLwEe1Sp/nbnBfyXLzv5jM7/sbplwntpaSx
         51dA==
X-Gm-Message-State: AOAM533YRLPLpQDN4eJ8h9X+n/JcwHqe0zhOB+7XM+kje3WRz4sf3eYD
        B4Grj8oz0ZJXNCZ9h8qlB4tUFuO9EI8VDC0Dse4DUI4TVMtnmOK7f56OJw1Iyl1PjplpalKvX6P
        p6mfR50U6tkqKZLO2OaOYIB5j7Q7rpS6Vag==
X-Received: by 2002:a50:cdd1:: with SMTP id h17mr3559512edj.94.1600936748633;
        Thu, 24 Sep 2020 01:39:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0FG3insf68LUBIWKdkL26oIXhrpUN0qtuf9aUcmwya9Ul6/YFy1yJZ+Mi4BRr8wZg/1BYuQ==
X-Received: by 2002:a50:cdd1:: with SMTP id h17mr3559489edj.94.1600936748397;
        Thu, 24 Sep 2020 01:39:08 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id v22sm1818364ejj.23.2020.09.24.01.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2020 01:39:07 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel_pmc_core: do not create a static
 struct device
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajneesh.bhardwaj@intel.com, vishwanath.somayaji@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Rajat Jain <rajatja@google.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
References: <20200923184803.192265-1-gregkh@linuxfoundation.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1fc9022c-6837-7aa3-489c-218db5434202@redhat.com>
Date:   Thu, 24 Sep 2020 10:39:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200923184803.192265-1-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/23/20 8:48 PM, Greg Kroah-Hartman wrote:
> A struct device is a dynamic structure, with reference counting.
> "Tricking" the kernel to make a dynamic structure static, by working
> around the driver core release detection logic, is not nice.
> 
> Because of this, this code has been used as an example for others on
> "how to do things", which is just about the worst thing possible to have
> happen.
> 
> Fix this all up by making the platform device dynamic and providing a
> real release function.
> 
> Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> Cc: Vishwanath Somayaji <vishwanath.somayaji@intel.com>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Andy Shevchenko <andy@infradead.org>
> Cc: Rajat Jain <rajatja@google.com>
> Cc: platform-driver-x86@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Reported-by: Maximilian Luz <luzmaximilian@gmail.com>
> Fixes: b02f6a2ef0a1 ("platform/x86: intel_pmc_core: Attach using APCI HID "INT33A1"")
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>   drivers/platform/x86/intel_pmc_core_pltdrv.c | 26 +++++++++++++-------
>   1 file changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_core_pltdrv.c b/drivers/platform/x86/intel_pmc_core_pltdrv.c
> index 731281855cc8..73797680b895 100644
> --- a/drivers/platform/x86/intel_pmc_core_pltdrv.c
> +++ b/drivers/platform/x86/intel_pmc_core_pltdrv.c
> @@ -20,15 +20,10 @@
>   
>   static void intel_pmc_core_release(struct device *dev)
>   {
> -	/* Nothing to do. */
> +	kfree(dev);
>   }
>   
> -static struct platform_device pmc_core_device = {
> -	.name = "intel_pmc_core",
> -	.dev  = {
> -		.release = intel_pmc_core_release,
> -	},
> -};
> +static struct platform_device *pmc_core_device;
>   
>   /*
>    * intel_pmc_core_platform_ids is the list of platforms where we want to
> @@ -52,6 +47,8 @@ MODULE_DEVICE_TABLE(x86cpu, intel_pmc_core_platform_ids);
>   
>   static int __init pmc_core_platform_init(void)
>   {
> +	int retval;
> +
>   	/* Skip creating the platform device if ACPI already has a device */
>   	if (acpi_dev_present("INT33A1", NULL, -1))
>   		return -ENODEV;
> @@ -59,12 +56,23 @@ static int __init pmc_core_platform_init(void)
>   	if (!x86_match_cpu(intel_pmc_core_platform_ids))
>   		return -ENODEV;
>   
> -	return platform_device_register(&pmc_core_device);
> +	pmc_core_device = kzalloc(sizeof(*pmc_core_device), GFP_KERNEL);
> +	if (!pmc_core_device)
> +		return -ENOMEM;
> +
> +	pmc_core_device->name = "intel_pmc_core";
> +	pmc_core_device->dev.release = intel_pmc_core_release;
> +
> +	retval = platform_device_register(pmc_core_device);
> +	if (retval)
> +		kfree(pmc_core_device);
> +
> +	return retval;
>   }
>   
>   static void __exit pmc_core_platform_exit(void)
>   {
> -	platform_device_unregister(&pmc_core_device);
> +	platform_device_unregister(pmc_core_device);
>   }
>   
>   module_init(pmc_core_platform_init);
> 

