Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A914C07E96
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jul 2021 10:19:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 800C761483
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jul 2021 10:19:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbhGFKVo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Jul 2021 06:21:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29096 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231216AbhGFKVo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Jul 2021 06:21:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625566745;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=78Q0UqonffbOpVBh5TZWlfRZomth9MefDWO2m1Sy+1Q=;
        b=HPd8wZ9I494oGwgj0kt8JEgY7aujpRfLu8TxXrz7vomouhEwm0AYFVmv9C4+qqBIB8ORUA
        G/HE1/Wu1fzm4TelxlKMz+H496MwfBbzB6fMxJ9uze2whZgGuTXTmMmPVfr9o/nvhFj21E
        Bp33dUFX5M83oty9nKhXUQnVOPYQBJo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-nVJCDgJQNvWwuVuahJL5fw-1; Tue, 06 Jul 2021 06:19:04 -0400
X-MC-Unique: nVJCDgJQNvWwuVuahJL5fw-1
Received: by mail-ej1-f69.google.com with SMTP id d21-20020a1709063455b02904c609ed19f1so5640477ejb.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jul 2021 03:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=78Q0UqonffbOpVBh5TZWlfRZomth9MefDWO2m1Sy+1Q=;
        b=po5P8L1OjePkqiAKTvxo7gLCQB53WTqtYMQAtBjiCNxshor7hDM3sJhsI7sxKLfFQn
         0O5gs3t5zAssSjvjtB+4SUVNe0j8XidRdyRRtT+j8yLq33qTJKm0GLWcqfzHW6bdInZL
         ufuV+2U5dHn78r9Dnc1EJBehSxpqPgdS5HCjDGDGFLR0ySVoEfuu6HN1ecCWcqiXrmom
         1kfUYgqETgNOcnxatuu0FrWXSgy38cpoOtfeGOCucFH59AqJVPCpaCNF4+9wccs7VBLJ
         IwK6AGe+60OmIWJv8n3Fg/YP/HKwU//AAvzY2ODxxIpCuFFDclHGBcsIIF6CMmnLg+rk
         OJ/A==
X-Gm-Message-State: AOAM5315jR6o97UsGsxRInP4fMOxOpJU+BmYammDUble6xdego8C1rzE
        jkL1IeiZlUsLNbtDj+oFCVIOFQJIWUN/xLPdFoq1q0SuyTfp09QkoNZ3vjH+FFc7pG2illxwJNf
        kvPOV/MsDSkdFN6KeiMUk/M68QUWHk+raiw==
X-Received: by 2002:a50:afe2:: with SMTP id h89mr22353574edd.308.1625566742964;
        Tue, 06 Jul 2021 03:19:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRDZpUZm7ZlxsDKnBtGusgfGhNCONuwpQxsYyVaqlCZoYOlX5qsIV057xHH5btoj+B5H/ihA==
X-Received: by 2002:a50:afe2:: with SMTP id h89mr22353551edd.308.1625566742816;
        Tue, 06 Jul 2021 03:19:02 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id mm27sm5445229ejb.67.2021.07.06.03.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 03:19:02 -0700 (PDT)
Subject: Re: [PATCH 3/3] asus-wmi: Add egpu enable method
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     corentin.chary@gmail.com, mgross@linux.intel.com,
        jdelvare@suse.com, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210704222148.880848-1-luke@ljones.dev>
 <20210704222148.880848-4-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7b44bce2-9915-5d16-a0af-727759d29394@redhat.com>
Date:   Tue, 6 Jul 2021 12:19:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704222148.880848-4-luke@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/5/21 12:21 AM, Luke D. Jones wrote:
> The X13 Flow laptops can utilise an external GPU. This requires
> toggling an ACPI method which will first disable the internal
> dGPU, and then enable the eGPU.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>  drivers/platform/x86/asus-wmi.c            | 92 ++++++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h |  3 +
>  2 files changed, 95 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 8dc3f7ed021f..c9fe77456b7b 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -210,6 +210,9 @@ struct asus_wmi {
>  	u8 fan_boost_mode_mask;
>  	u8 fan_boost_mode;
>  
> +	bool egpu_enable_available; // 0 = enable
> +	u8 egpu_enable_mode;
> +
>  	bool dgpu_disable_available;
>  	u8 dgpu_disable_mode;
>  
> @@ -430,6 +433,87 @@ static void lid_flip_tablet_mode_get_state(struct asus_wmi *asus)
>  	}
>  }
>  
> +/* eGPU ********************************************************************/
> +static int egpu_enable_check_present(struct asus_wmi *asus)
> +{
> +	u32 result;
> +	int err;
> +
> +	asus->egpu_enable_available = false;
> +
> +	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_EGPU, &result);
> +	if (err) {
> +		if (err == -ENODEV)
> +			return 0;
> +		return err;
> +	}
> +
> +	if (result & ASUS_WMI_DSTS_PRESENCE_BIT) {
> +		asus->egpu_enable_available = true;
> +		asus->egpu_enable_mode = result & ASUS_WMI_DSTS_STATUS_BIT;
> +	}

And now the braces are there (good) :)
> +
> +	return 0;
> +}
> +
> +static int egpu_enable_write(struct asus_wmi *asus)
> +{
> +	int err;
> +	u8 value;
> +	u32 retval;
> +
> +	value = asus->egpu_enable_mode;
> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_EGPU, value, &retval);
> +
> +	sysfs_notify(&asus->platform_device->dev.kobj, NULL, "egpu_enable");
> +
> +	if (err) {
> +		pr_warn("Failed to set egpu disable: %d\n", err);
> +		return err;
> +	}
> +
> +	if (retval > 1 || retval < 0) {
> +		pr_warn("Failed to set egpu disable (retval): 0x%x\n", retval);

And all these now are on one line, good again :)

> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static ssize_t egpu_enable_show(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +	u8 mode = asus->egpu_enable_mode;
> +
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", mode);

sysfs_emit() please.

> +}
> +
> +static ssize_t egpu_enable_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	int result;
> +	u8 disable;
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +
> +	result = kstrtou8(buf, 10, &disable);
> +	if (result < 0)
> +		return result;
> +
> +	if (disable > 1 || disable < 0)
> +		return -EINVAL;

Replace this with kstrtobool() ? or otherwise drop the
disable < 0 check.

> +
> +	asus->egpu_enable_mode = disable;
> +
> +	egpu_enable_write(asus);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(egpu_enable);
> +
>  /* dGPU ********************************************************************/
>  static int dgpu_disable_check_present(struct asus_wmi *asus)
>  {
> @@ -2502,6 +2586,7 @@ static struct attribute *platform_attributes[] = {
>  	&dev_attr_camera.attr,
>  	&dev_attr_cardr.attr,
>  	&dev_attr_touchpad.attr,
> +	&dev_attr_egpu_enable.attr,
>  	&dev_attr_dgpu_disable.attr,
>  	&dev_attr_lid_resume.attr,
>  	&dev_attr_als_enable.attr,
> @@ -2529,6 +2614,8 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
>  		devid = ASUS_WMI_DEVID_LID_RESUME;
>  	else if (attr == &dev_attr_als_enable.attr)
>  		devid = ASUS_WMI_DEVID_ALS_ENABLE;
> +	else if (attr == &dev_attr_egpu_enable.attr)
> +		ok = asus->egpu_enable_available;
>  	else if (attr == &dev_attr_dgpu_disable.attr)
>  		ok = asus->dgpu_disable_available;
>  	else if (attr == &dev_attr_fan_boost_mode.attr)
> @@ -2792,6 +2879,10 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	if (err)
>  		goto fail_platform;
>  
> +	err = egpu_enable_check_present(asus);
> +	if (err)
> +		goto fail_egpu_enable;
> +
>  	err = dgpu_disable_check_present(asus);
>  	if (err)
>  		goto fail_dgpu_disable;
> @@ -2896,6 +2987,7 @@ static int asus_wmi_add(struct platform_device *pdev)
>  fail_sysfs:
>  fail_throttle_thermal_policy:
>  fail_fan_boost_mode:
> +fail_egpu_enable:
>  fail_dgpu_disable:
>  fail_platform:
>  fail_panel_od:
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index a528f9d0e4b7..17dc5cb6f3f2 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -90,6 +90,9 @@
>  /* Keyboard dock */
>  #define ASUS_WMI_DEVID_KBD_DOCK		0x00120063
>  
> +/* dgpu on/off */
> +#define ASUS_WMI_DEVID_EGPU		0x00090019
> +
>  /* dgpu on/off */
>  #define ASUS_WMI_DEVID_DGPU		0x00090020
>  
> 

Otherwise this looks good to me.

Regards,

Hans

