Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9A2C636CA
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Jul 2021 16:06:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90454610E5
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Jul 2021 16:06:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbhGQQI5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 17 Jul 2021 12:08:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35820 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230407AbhGQQI5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 17 Jul 2021 12:08:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626537960;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y+Mh9sb/sU+B97uoDQVtjbJsVqYChTGSpJvuXxz4E1s=;
        b=Ghon1VIg1RAsTbpFhuMWItx2b2Zq2ROqP2GHXtYK3eM74FtcX8fLU6m+hJJOACwfkKtur3
        O/5DWdLLCHv/LTtdhFvmZ8HJ10FbgBwfcKhuKbYp1ge1AS+9DaXe2tXttdYeXLonwyw7l/
        blqBxm5E7jki9WgAJljlic4yLpNd9mw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-sZ8XXoZZOea6mCLieycLmg-1; Sat, 17 Jul 2021 12:05:58 -0400
X-MC-Unique: sZ8XXoZZOea6mCLieycLmg-1
Received: by mail-ed1-f69.google.com with SMTP id z13-20020a05640235cdb02903aa750a46efso6556207edc.8
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Jul 2021 09:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y+Mh9sb/sU+B97uoDQVtjbJsVqYChTGSpJvuXxz4E1s=;
        b=E67tc2GB9NtY67RO1edom4mtWPymwQUkVMcOtiF+fjReMvH+jkbUCO1UOFy6zlmr94
         FON+f24GE0puVtZpv4VsVwRo1sD1GgYhlHuMlzDP1X3Io0lTQMHQxelQ95YiFA+4fnkH
         xyuKCSSMpC8yNteiVCURkR5ZXgRZaGDb7gmDTAjf5hiHeiJQhSUdeW2Dh27Oc9Ylisp7
         8kV+rh9pYf+geoV7D1BDk8g1uPPgwwR+DqypeytCEPiYMU5grfBCbT/Y0QPi0sMjU7SW
         UHcqfLunuFd41pjc3gt0fS+xkHubBQkbs0ogTCZ1Nbja7EbQHvq9+HtuGMlhryCd14fx
         lP2A==
X-Gm-Message-State: AOAM53280AyAQJ2a5tDWXa22ZSaY4v4wEL/CBlVVqKJV337nu1hNHtDd
        UX98RfPzRY8wxhDXaKU0wJ5ryqJQ2zd6skP8U1sjunsivuOHwigj1kek9XK387iH4vESgeSdIu+
        WGrXLKBBCE+ECDzakh1pkJFUTzSZeNPsvgw==
X-Received: by 2002:a05:6402:b4e:: with SMTP id bx14mr22692037edb.158.1626537957733;
        Sat, 17 Jul 2021 09:05:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGVzA25NihettwyWx7BVjlttY2kvU97P5xmeMzFdq6Fxu/eW97oeDMotsRtBGXBKR4w5mX8g==
X-Received: by 2002:a05:6402:b4e:: with SMTP id bx14mr22692016edb.158.1626537957604;
        Sat, 17 Jul 2021 09:05:57 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e24sm3992564ejx.100.2021.07.17.09.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jul 2021 09:05:57 -0700 (PDT)
Subject: Re: [PATCH 3/4] asus-wmi: Add egpu enable method
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     pobrn@protonmail.com, mgross@linux.intel.com,
        corentin.chary@gmail.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, acpi4asus-user@lists.sourceforge.net
References: <20210717081323.7925-1-luke@ljones.dev>
 <20210717081323.7925-3-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <442ca029-9e44-0382-1643-d12b4873ecbb@redhat.com>
Date:   Sat, 17 Jul 2021 18:05:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717081323.7925-3-luke@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/17/21 10:13 AM, Luke D. Jones wrote:
> The X13 Flow laptops can utilise an external GPU. This requires
> toggling an ACPI method which will first disable the internal
> dGPU, and then enable the eGPU.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>  drivers/platform/x86/asus-wmi.c            | 91 ++++++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h |  3 +
>  2 files changed, 94 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 02762a60d27a..ee5d8656641e 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -210,6 +210,9 @@ struct asus_wmi {
>  	u8 fan_boost_mode_mask;
>  	u8 fan_boost_mode;
>  
> +	bool egpu_enable_available; // 0 = enable
> +	bool egpu_enable;
> +
>  	bool dgpu_disable_available;
>  	bool dgpu_disable;
>  
> @@ -430,6 +433,86 @@ static void lid_flip_tablet_mode_get_state(struct asus_wmi *asus)
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
> +		asus->egpu_enable = result & ASUS_WMI_DSTS_STATUS_BIT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int egpu_enable_write(struct asus_wmi *asus)
> +{
> +	int err;
> +	u8 value;
> +	u32 retval;

Upside-down-christmastree declaration order please.

> +
> +	value = asus->egpu_enable;
> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_EGPU, value, &retval);
> +
> +	if (err) {
> +		pr_warn("Failed to set egpu disable: %d\n", err);
> +		return err;
> +	}
> +
> +	if (retval > 1 || retval < 0) {
> +		pr_warn("Failed to set egpu disable (retval): 0x%x\n", retval);
> +		return -EIO;
> +	}
> +
> +	sysfs_notify(&asus->platform_device->dev.kobj, NULL, "egpu_enable");
> +
> +	return 0;
> +}
> +
> +static ssize_t egpu_enable_show(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +	bool mode = asus->egpu_enable;

Drop the unnecessary "mode" local variable please.

> +
> +	return sysfs_emit(buf, "%d\n", mode);
> +}
> +
> +static ssize_t egpu_enable_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	int result;
> +	bool disable;
> +	struct asus_wmi *asus = dev_get_drvdata(dev);

Upside-down-christmastree declaration order please.

> +
> +	result = kstrtobool(buf, &disable);
> +	if (result == -EINVAL)
> +		return result;

Just "if (result) ..." please.

> +
> +	asus->egpu_enable = disable;
> +
> +	result = egpu_enable_write(asus);
> +	if (result != 0)
> +		return result;
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(egpu_enable);
> +
>  /* dGPU ********************************************************************/
>  static int dgpu_disable_check_present(struct asus_wmi *asus)
>  {
> @@ -2502,6 +2585,7 @@ static struct attribute *platform_attributes[] = {
>  	&dev_attr_camera.attr,
>  	&dev_attr_cardr.attr,
>  	&dev_attr_touchpad.attr,
> +	&dev_attr_egpu_enable.attr,
>  	&dev_attr_dgpu_disable.attr,
>  	&dev_attr_lid_resume.attr,
>  	&dev_attr_als_enable.attr,
> @@ -2529,6 +2613,8 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
>  		devid = ASUS_WMI_DEVID_LID_RESUME;
>  	else if (attr == &dev_attr_als_enable.attr)
>  		devid = ASUS_WMI_DEVID_ALS_ENABLE;
> +	else if (attr == &dev_attr_egpu_enable.attr)
> +		ok = asus->egpu_enable_available;
>  	else if (attr == &dev_attr_dgpu_disable.attr)
>  		ok = asus->dgpu_disable_available;
>  	else if (attr == &dev_attr_fan_boost_mode.attr)
> @@ -2792,6 +2878,10 @@ static int asus_wmi_add(struct platform_device *pdev)
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
> @@ -2896,6 +2986,7 @@ static int asus_wmi_add(struct platform_device *pdev)
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

Regards,

Hans

