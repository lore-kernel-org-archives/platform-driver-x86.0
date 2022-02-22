Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7171C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Feb 2022 18:42:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbiBVSme (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Feb 2022 13:42:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233516AbiBVSmd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Feb 2022 13:42:33 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A379BEB17F
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Feb 2022 10:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645555324;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Je42u+nOsXH+Xm7ZqrphSqKcvDPIcyYV/8QZo5Gua1c=;
        b=cZoeAivkpcUeFRnaNzp9CFVTj7FYZkyTiKdixKCTXxA/BNW1mIpkrXeAqnlhS6njfh3oW4
        E6qG5SIc79Qmr9BG3RZPd+3u1HuNeSDRA7Vb8kXvGIiJwd3fbUPRCD+46hVxZLSYnVTDdD
        ObcpqtwLQ2EbvMZuCA538z3gscuF/6I=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-tfDpU7m9MdywqVAHHO4ilw-1; Tue, 22 Feb 2022 13:42:03 -0500
X-MC-Unique: tfDpU7m9MdywqVAHHO4ilw-1
Received: by mail-ej1-f71.google.com with SMTP id sa7-20020a170906eda700b006d1b130d65bso2207587ejb.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Feb 2022 10:42:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Je42u+nOsXH+Xm7ZqrphSqKcvDPIcyYV/8QZo5Gua1c=;
        b=dcqZySoop1p8HWpgr+sAhUrYwP9RcaIo/reVwxNSAcxTbGMdJjKWjU+m7M6PADz031
         YT1vIlGXZJSzUJAheIsoaJW/M3sG6bXHVTMZxJ6jTFCPpdmj0uprwqaKXxWWGrwdlb7F
         Q6/+5NBkogGKR6rv447lnjPmPgQfnWR0XwtKCSSr3BjXGa3onqyivSGhD/IAhQQDlY7y
         oeohIL645Iq8kuHCy2RUCCvMRVEiaFv2Olf0GpW3RbPukxtPt1jYDLPxohRu03tmaE0a
         G5v6mT3SJ0kNNyO8o5WXGKVr7Bh8Y6FqisugcJnNCqigVHIwYQEdzWcF5WKPvTEIKBSE
         BFDw==
X-Gm-Message-State: AOAM530rwrMJU6ubrvhFq8SmoVPE5cYNeQDO4vaRfjfeDrVkEzpp1EBQ
        JqTzIStwqHB7jcSl8+I/GVQwQb7eiPXEx5er4C/waEJk/lVeyGFffbHF9rTUfN50fcSf3xR+5od
        bd4QEsJRnNvIelqf5T2EJZZSUBiX57loz2w==
X-Received: by 2002:aa7:d343:0:b0:40a:1425:8896 with SMTP id m3-20020aa7d343000000b0040a14258896mr28502515edr.242.1645555321725;
        Tue, 22 Feb 2022 10:42:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwiFquKTlXX4uRM45Y7DqgABN2UG5VsLWGaBGnoIsAOMlsM7cI1eh6hz5rsII5/QI2cLpJeLw==
X-Received: by 2002:aa7:d343:0:b0:40a:1425:8896 with SMTP id m3-20020aa7d343000000b0040a14258896mr28502499edr.242.1645555321444;
        Tue, 22 Feb 2022 10:42:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id 1sm6736788ejm.173.2022.02.22.10.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 10:42:01 -0800 (PST)
Message-ID: <bf8692b8-0e54-ddd0-8684-6dc214f78190@redhat.com>
Date:   Tue, 22 Feb 2022 19:42:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/2] lg-laptop: Move setting of battery charge limit to
 common location
Content-Language: en-US
To:     Matan Ziv-Av <matan@svgalib.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <cover.1645278914.git.matan@svgalib.org>
 <eca2fa354f60b8a6e5a5c9c8e244fea56616970a.1645278914.git.matan@svgalib.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <eca2fa354f60b8a6e5a5c9c8e244fea56616970a.1645278914.git.matan@svgalib.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/19/22 14:54, Matan Ziv-Av wrote:
> For now leave also the driver specific location,
> with deprecated warning in documentation.
> 
> Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
> ---
>  .../ABI/testing/sysfs-platform-lg-laptop      |  2 +-
>  .../admin-guide/laptops/lg-laptop.rst         |  2 +-
>  drivers/platform/x86/lg-laptop.c              | 57 ++++++++++++++++---
>  3 files changed, 51 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-lg-laptop b/Documentation/ABI/testing/sysfs-platform-lg-laptop
> index cf47749b19df..d226058049ce 100644
> --- a/Documentation/ABI/testing/sysfs-platform-lg-laptop
> +++ b/Documentation/ABI/testing/sysfs-platform-lg-laptop
> @@ -16,7 +16,7 @@ What:		/sys/devices/platform/lg-laptop/battery_care_limit
>  Date:		October 2018
>  KernelVersion:	4.20
>  Contact:	"Matan Ziv-Av <matan@svgalib.org>
> -Description:
> +Description: <deprecated> use /sys/class/power_supply/CMB0/charge_control_end_threshold
>          Maximal battery charge level. Accepted values are 80 or 100.
>  
>  What:		/sys/devices/platform/lg-laptop/fan_mode

We have some automatic scripts parsing these files now; and I'm not sure
if those will like this form.

So I've changed this to the following while merging it:

@@ -17,6 +17,7 @@ Date:		October 2018
 KernelVersion:	4.20
 Contact:	"Matan Ziv-Av <matan@svgalib.org>
 Description:
+        Deprecated use /sys/class/power_supply/CMB0/charge_control_end_threshold
         Maximal battery charge level. Accepted values are 80 or 100.
 
 What:		/sys/devices/platform/lg-laptop/fan_mode




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





> diff --git a/Documentation/admin-guide/laptops/lg-laptop.rst b/Documentation/admin-guide/laptops/lg-laptop.rst
> index 6fbe165dcd27..67fd6932cef4 100644
> --- a/Documentation/admin-guide/laptops/lg-laptop.rst
> +++ b/Documentation/admin-guide/laptops/lg-laptop.rst
> @@ -38,7 +38,7 @@ FN lock.
>  Battery care limit
>  ------------------
>  
> -Writing 80/100 to /sys/devices/platform/lg-laptop/battery_care_limit
> +Writing 80/100 to /sys/class/power_supply/CMB0/charge_control_end_threshold
>  sets the maximum capacity to charge the battery. Limiting the charge
>  reduces battery capacity loss over time.
>  


> diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
> index a91847a551a7..332868b140ed 100644
> --- a/drivers/platform/x86/lg-laptop.c
> +++ b/drivers/platform/x86/lg-laptop.c
> @@ -17,6 +17,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/types.h>
>  
> +#include <acpi/battery.h>
> +
>  #define LED_DEVICE(_name, max, flag) struct led_classdev _name = { \
>  	.name           = __stringify(_name),   \
>  	.max_brightness = max,                  \
> @@ -458,14 +460,14 @@ static ssize_t fn_lock_show(struct device *dev,
>  	return sysfs_emit(buffer, "%d\n", status);
>  }
>  
> -static ssize_t battery_care_limit_store(struct device *dev,
> -					struct device_attribute *attr,
> -					const char *buffer, size_t count)
> +static ssize_t charge_control_end_threshold_store(struct device *dev,
> +						  struct device_attribute *attr,
> +						  const char *buf, size_t count)
>  {
>  	unsigned long value;
>  	int ret;
>  
> -	ret = kstrtoul(buffer, 10, &value);
> +	ret = kstrtoul(buf, 10, &value);
>  	if (ret)
>  		return ret;
>  
> @@ -486,9 +488,9 @@ static ssize_t battery_care_limit_store(struct device *dev,
>  	return -EINVAL;
>  }
>  
> -static ssize_t battery_care_limit_show(struct device *dev,
> -				       struct device_attribute *attr,
> -				       char *buffer)
> +static ssize_t charge_control_end_threshold_show(struct device *device,
> +						 struct device_attribute *attr,
> +						 char *buf)
>  {
>  	unsigned int status;
>  	union acpi_object *r;
> @@ -520,15 +522,52 @@ static ssize_t battery_care_limit_show(struct device *dev,
>  	if (status != 80 && status != 100)
>  		status = 0;
>  
> -	return sysfs_emit(buffer, "%d\n", status);
> +	return sysfs_emit(buf, "%d\n", status);
> +}
> +
> +static ssize_t battery_care_limit_show(struct device *dev,
> +				       struct device_attribute *attr,
> +				       char *buffer)
> +{
> +	return charge_control_end_threshold_show(dev, attr, buffer);
> +}
> +
> +static ssize_t battery_care_limit_store(struct device *dev,
> +					struct device_attribute *attr,
> +					const char *buffer, size_t count)
> +{
> +	return charge_control_end_threshold_store(dev, attr, buffer, count);
>  }
>  
>  static DEVICE_ATTR_RW(fan_mode);
>  static DEVICE_ATTR_RW(usb_charge);
>  static DEVICE_ATTR_RW(reader_mode);
>  static DEVICE_ATTR_RW(fn_lock);
> +static DEVICE_ATTR_RW(charge_control_end_threshold);
>  static DEVICE_ATTR_RW(battery_care_limit);
>  
> +static int lg_battery_add(struct power_supply *battery)
> +{
> +	if (device_create_file(&battery->dev,
> +			       &dev_attr_charge_control_end_threshold))
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static int lg_battery_remove(struct power_supply *battery)
> +{
> +	device_remove_file(&battery->dev,
> +			   &dev_attr_charge_control_end_threshold);
> +	return 0;
> +}
> +
> +static struct acpi_battery_hook battery_hook = {
> +	.add_battery = lg_battery_add,
> +	.remove_battery = lg_battery_remove,
> +	.name = "LG Battery Extension",
> +};
> +
>  static struct attribute *dev_attributes[] = {
>  	&dev_attr_fan_mode.attr,
>  	&dev_attr_usb_charge.attr,
> @@ -711,6 +750,7 @@ static int acpi_add(struct acpi_device *device)
>  	led_classdev_register(&pf_device->dev, &tpad_led);
>  
>  	wmi_input_setup();
> +	battery_hook_register(&battery_hook);
>  
>  	return 0;
>  
> @@ -728,6 +768,7 @@ static int acpi_remove(struct acpi_device *device)
>  	led_classdev_unregister(&tpad_led);
>  	led_classdev_unregister(&kbd_backlight);
>  
> +	battery_hook_unregister(&battery_hook);
>  	wmi_input_destroy();
>  	platform_device_unregister(pf_device);
>  	pf_device = NULL;

