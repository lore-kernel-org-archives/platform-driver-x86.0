Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000DEC636C9
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Jul 2021 16:05:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1D9560FF4
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Jul 2021 16:05:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbhGQQIE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 17 Jul 2021 12:08:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48266 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229379AbhGQQID (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 17 Jul 2021 12:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626537906;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wXP3RY02VHdTggn/ihL9/I09EOA1IcHfzsvlNx9p8JQ=;
        b=eVwAqq6okth1Eezzq7j0GBZ4eRTEP9GF1pDHeGHPFpKLMRS+U6QDP50xT5vy9fMv1Du7Ja
        2XBeulCxLVD/k91ZTKRLrtuy0Yvm9OM+3V9mCdphG66MWnvLuSifeOqi4yFhYdaNTe2DUr
        OZGab8XxORsqKRhQ/mha7Ftq3tBO+og=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-wFcBx3nJPKy4GcaDcz9GRw-1; Sat, 17 Jul 2021 12:05:05 -0400
X-MC-Unique: wFcBx3nJPKy4GcaDcz9GRw-1
Received: by mail-ej1-f72.google.com with SMTP id i13-20020a1709061ccdb02905478dfedcafso439226ejh.21
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Jul 2021 09:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wXP3RY02VHdTggn/ihL9/I09EOA1IcHfzsvlNx9p8JQ=;
        b=aHj/5CF03RdhnxoIWNZzCCi+RoBZurxk2nfpWD+WDfVYj4l7ehUowqaHX8Oq8+DSnQ
         nF+sqhRUtyL9tMrjognxubJvfxzpaMgt8TP9YpRAdoCvjbB0Hz30o06iXWtdPJumm9KG
         5UhXscARj9HZAduin79Z7dA7AR9pmJJMEsg1UOC/mA5hhFZTfLqABVBfcIFn/Oo9XLib
         849pVtweHAZDwKxHwMxjGUH9RXNTOy80QhJ7r17HhPwwm9eAaaSI9QR0HzMyEB1MGebS
         ixAEBVVrS1mKb/xxo2ZgEMI3A4KNw5VcohdOAnkfCqd/J1qpropg9LbGlt1UNx9wUCKr
         Gwhw==
X-Gm-Message-State: AOAM532kRe2mJKHGSwUZuFVWf9DRAMFd0Rqu3/oF7YkS8jLtrUaAzfb7
        h5kDgPhh9HDGvzr+UoTtTyLTtGJtD2BNKeIjsRwDaG0Nzew8SckQ770qeeI+QICQAwc/Hy5tVt2
        2Aqc5oXKofrKCShcuxnKq5JwjYM5GNTDZww==
X-Received: by 2002:a17:906:2dc9:: with SMTP id h9mr18431593eji.345.1626537904346;
        Sat, 17 Jul 2021 09:05:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyx2ulyoT1xas2H/0733y/dAI/IYXCLug5GaUc6/nrplVy2zU+Pt56VMKFkKinJEi9X4AwW9A==
X-Received: by 2002:a17:906:2dc9:: with SMTP id h9mr18431578eji.345.1626537904178;
        Sat, 17 Jul 2021 09:05:04 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ch27sm5272195edb.57.2021.07.17.09.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jul 2021 09:05:03 -0700 (PDT)
Subject: Re: [PATCH 2/4] asus-wmi: Add dgpu disable method
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     pobrn@protonmail.com, mgross@linux.intel.com,
        corentin.chary@gmail.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, acpi4asus-user@lists.sourceforge.net
References: <20210717081323.7925-1-luke@ljones.dev>
 <20210717081323.7925-2-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <eed70640-6252-45f8-848f-bc5890f7807b@redhat.com>
Date:   Sat, 17 Jul 2021 18:05:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717081323.7925-2-luke@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/17/21 10:13 AM, Luke D. Jones wrote:
> In Windows the ASUS Armory Crate program can enable or disable the
> dGPU via a WMI call. This functions much the same as various Linux
> methods in software where the dGPU is removed from the device tree.
> 
> However the WMI call saves the state of dGPU (enabled or not) and
> this then changes the dGPU visibility in Linux with no way for
> Linux users to re-enable it. We expose the WMI method so users can
> see and change the dGPU ACPI state.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>  drivers/platform/x86/asus-wmi.c            | 99 ++++++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h |  3 +
>  2 files changed, 102 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index cd881443bc2f..02762a60d27a 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -210,6 +210,9 @@ struct asus_wmi {
>  	u8 fan_boost_mode_mask;
>  	u8 fan_boost_mode;
>  
> +	bool dgpu_disable_available;
> +	bool dgpu_disable;
> +
>  	bool throttle_thermal_policy_available;
>  	u8 throttle_thermal_policy_mode;
>  
> @@ -427,6 +430,94 @@ static void lid_flip_tablet_mode_get_state(struct asus_wmi *asus)
>  	}
>  }
>  
> +/* dGPU ********************************************************************/
> +static int dgpu_disable_check_present(struct asus_wmi *asus)
> +{
> +	u32 result;
> +	int err;
> +
> +	asus->dgpu_disable_available = false;
> +
> +	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_DGPU, &result);
> +	if (err) {
> +		if (err == -ENODEV)
> +			return 0;
> +		return err;
> +	}
> +
> +	if (result & ASUS_WMI_DSTS_PRESENCE_BIT) {
> +		asus->dgpu_disable_available = true;
> +		asus->dgpu_disable = result & ASUS_WMI_DSTS_STATUS_BIT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dgpu_disable_write(struct asus_wmi *asus)
> +{
> +	int err;
> +	u8 value;
> +	u32 retval;

Upside-down-christmastree declaration order please.

> +
> +	value = asus->dgpu_disable;
> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_DGPU, value, &retval);
> +
> +	if (err) {
> +		pr_warn("Failed to set dgpu disable: %d\n", err);
> +		return err;
> +	}
> +
> +	if (retval > 1 || retval < 0) {
> +		pr_warn("Failed to set dgpu disable (retval): 0x%x\n", retval);
> +		return -EIO;
> +	}
> +
> +	sysfs_notify(&asus->platform_device->dev.kobj, NULL, "dgpu_disable");
> +
> +	return 0;
> +}
> +
> +static ssize_t dgpu_disable_show(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +	bool mode = asus->dgpu_disable;

This bool local variable is not really necessary, instead you can just do:

	return sysfs_emit(buf, "%d\n", asus->dgpu_disable);

The same applies to patch 1/3 btw.

> +
> +	return sysfs_emit(buf, "%d\n", mode);
> +}
> +
> +static ssize_t dgpu_disable_store(struct device *dev,
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
> +	asus->dgpu_disable = disable;
> +	/*
> +	 * The ACPI call used does not save the mode unless the call is run twice.
> +	 * Once to disable, then once to check status and save - this is two code
> +	 * paths in the method in the ACPI dumps.
> +	*/
> +	result = dgpu_disable_write(asus);
> +	if (result != 0)
> +		return result;
> +
> +	result = dgpu_disable_write(asus);
> +	if (result != 0)
> +		return result;
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(dgpu_disable);
> +
>  /* Battery ********************************************************************/
>  
>  /* The battery maximum charging percentage */
> @@ -2411,6 +2502,7 @@ static struct attribute *platform_attributes[] = {
>  	&dev_attr_camera.attr,
>  	&dev_attr_cardr.attr,
>  	&dev_attr_touchpad.attr,
> +	&dev_attr_dgpu_disable.attr,
>  	&dev_attr_lid_resume.attr,
>  	&dev_attr_als_enable.attr,
>  	&dev_attr_fan_boost_mode.attr,
> @@ -2437,6 +2529,8 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
>  		devid = ASUS_WMI_DEVID_LID_RESUME;
>  	else if (attr == &dev_attr_als_enable.attr)
>  		devid = ASUS_WMI_DEVID_ALS_ENABLE;
> +	else if (attr == &dev_attr_dgpu_disable.attr)
> +		ok = asus->dgpu_disable_available;
>  	else if (attr == &dev_attr_fan_boost_mode.attr)
>  		ok = asus->fan_boost_mode_available;
>  	else if (attr == &dev_attr_throttle_thermal_policy.attr)
> @@ -2698,6 +2792,10 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	if (err)
>  		goto fail_platform;
>  
> +	err = dgpu_disable_check_present(asus);
> +	if (err)
> +		goto fail_dgpu_disable;
> +
>  	err = fan_boost_mode_check_present(asus);
>  	if (err)
>  		goto fail_fan_boost_mode;
> @@ -2798,6 +2896,7 @@ static int asus_wmi_add(struct platform_device *pdev)
>  fail_sysfs:
>  fail_throttle_thermal_policy:
>  fail_fan_boost_mode:
> +fail_dgpu_disable:
>  fail_platform:
>  fail_panel_od:
>  	kfree(asus);
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 428aea701c7b..a528f9d0e4b7 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -90,6 +90,9 @@
>  /* Keyboard dock */
>  #define ASUS_WMI_DEVID_KBD_DOCK		0x00120063
>  
> +/* dgpu on/off */
> +#define ASUS_WMI_DEVID_DGPU		0x00090020
> +
>  /* DSTS masks */
>  #define ASUS_WMI_DSTS_STATUS_BIT	0x00000001
>  #define ASUS_WMI_DSTS_UNKNOWN_BIT	0x00000002
> 

Regards,

Hans

