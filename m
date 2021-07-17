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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A7E1C636CA
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Jul 2021 16:00:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00BBE610CD
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Jul 2021 16:00:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232146AbhGQQDo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 17 Jul 2021 12:03:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42861 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230348AbhGQQDo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 17 Jul 2021 12:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626537647;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zQN///39LYTf5bs3PAw2N5VQye+x4FsEFMtGYeBQPAM=;
        b=eSDDX8RxnEHWqM1ljkPkqKTtrCCvIC1/+4qVRzM7kyAMygIyE3czyExQm8ZDMbexDgB3H3
        NeK052whjlc+Mg+1oO19riJuDJPXcjU+/kOL8GezVZJ80g0fhmsPiH8N1sdzIwKMLffIv0
        WWDwhLIm1i/PY0HLJHZohxOwr54qx2A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-S0e-tVIfO867P6mbmnwrew-1; Sat, 17 Jul 2021 12:00:46 -0400
X-MC-Unique: S0e-tVIfO867P6mbmnwrew-1
Received: by mail-ed1-f72.google.com with SMTP id p13-20020a05640210cdb029039560ff6f46so6490310edu.17
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Jul 2021 09:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zQN///39LYTf5bs3PAw2N5VQye+x4FsEFMtGYeBQPAM=;
        b=MRNWWzpRfhyh4st2v1FeuGVSdeFCLY6ocWWLQN+Fb1XuBzTO6vZbJ2F2KMZthkpINW
         y8FVLJDd+srNIzTPKXkOdU8SM3zuWwOCAu3K5kAg6mG5pHjonAkt4QAx1lLxyP/GFKk0
         IGBUsR1lAaTIXrnkGNdciw3+wB5I+3dicl10fhf2qWp1s0LJBdPwicajonwmAlsOutVz
         XzXn9Z3ql1bMXDNby1zH/3KiYGubLrqJlW6q8R1JIwa8lD9sji6p+g1Qa+dUxKFxDkVi
         i/dGXkgLG9JczY/jnknnfLwCIESztcvoIPCu6PPgayo+o6KyBzgM+quUbJerl6Ykx9xF
         Weag==
X-Gm-Message-State: AOAM533CIJ3DvPNuM6UglC0xJ4+cdntWwKA9rYacdOSo7Io6ve9iTbgg
        tw4o/hik2crkUROkpO27MwsuSIa1MgVKByzIjumJ9FZo7VD9B2s703Pfm27DhdgH4KpN9zpOmXP
        AOWdm9FKJ4/iVzodtatm/0BkmnPEUoAkdow==
X-Received: by 2002:a05:6402:51:: with SMTP id f17mr22595221edu.359.1626537645020;
        Sat, 17 Jul 2021 09:00:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXd8pufIgnk6zakX532QqMqLp5oShzTfmfwvdDqKrgNQJxemHmnl2nYrBvPjzVHwGuOqffew==
X-Received: by 2002:a05:6402:51:: with SMTP id f17mr22595185edu.359.1626537644712;
        Sat, 17 Jul 2021 09:00:44 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ot18sm3981595ejb.109.2021.07.17.09.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jul 2021 09:00:44 -0700 (PDT)
Subject: Re: [PATCH 1/4] asus-wmi: Add panel overdrive functionality
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     pobrn@protonmail.com, mgross@linux.intel.com,
        corentin.chary@gmail.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, acpi4asus-user@lists.sourceforge.net
References: <20210717081323.7925-1-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ce38b30b-5305-f22f-1d14-e8ea00e05a21@redhat.com>
Date:   Sat, 17 Jul 2021 18:00:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717081323.7925-1-luke@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/17/21 10:13 AM, Luke D. Jones wrote:
> Some ASUS ROG laptops have the ability to drive the display panel
> a higher rate to eliminate or reduce ghosting.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Looks good, almost there some small remarks inline.


> ---
>  drivers/platform/x86/asus-wmi.c            | 91 ++++++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h |  1 +
>  2 files changed, 92 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index ebaeb7bb80f5..cd881443bc2f 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -216,6 +216,9 @@ struct asus_wmi {
>  	// The RSOC controls the maximum charging percentage.
>  	bool battery_rsoc_available;
>  
> +	bool panel_overdrive_available;
> +	bool panel_overdrive;
> +
>  	struct hotplug_slot hotplug_slot;
>  	struct mutex hotplug_lock;
>  	struct mutex wmi_lock;
> @@ -1221,6 +1224,86 @@ static int asus_wmi_rfkill_init(struct asus_wmi *asus)
>  	return result;
>  }
>  
> +/* Panel Overdrive ************************************************************/
> +static int panel_od_check_present(struct asus_wmi *asus)
> +{
> +	u32 result;
> +	int err;
> +
> +	asus->panel_overdrive_available = false;
> +
> +	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_PANEL_OD, &result);
> +	if (err) {
> +		if (err == -ENODEV)
> +			return 0;
> +		return err;
> +	}
> +
> +	if (result & ASUS_WMI_DSTS_PRESENCE_BIT) {
> +		asus->panel_overdrive_available = true;
> +		asus->panel_overdrive = result & ASUS_WMI_DSTS_STATUS_BIT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int panel_od_write(struct asus_wmi *asus)
> +{
> +	int err;
> +	u8 value;
> +	u32 retval;

nitpick: Please use upside-down-christmastree style for variable-declarations,
what that means is put the longest line first, so in this case:

	u32 retval;
	u8 value;
	int err;

> +
> +	value = asus->panel_overdrive;
> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_PANEL_OD, value, &retval);
> +
> +	if (err) {
> +		pr_warn("Failed to set panel overdrive: %d\n", err);
> +		return err;
> +	}
> +
> +	if (retval > 1 || retval < 0) {
> +		pr_warn("Failed to set panel overdrive (retval): 0x%x\n", retval);
> +		return -EIO;
> +	}
> +
> +	sysfs_notify(&asus->platform_device->dev.kobj, NULL, "panel_od");
> +
> +	return 0;
> +}
> +
> +static ssize_t panel_od_show(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +	bool mode = asus->panel_overdrive;
> +
> +	return sysfs_emit(buf, "%d\n", mode);
> +}
> +
> +static ssize_t panel_od_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	int result;
> +	bool overdrive;
> +	struct asus_wmi *asus = dev_get_drvdata(dev);

Nitpick again, please make this:

	struct asus_wmi *asus = dev_get_drvdata(dev);
	bool overdrive;
	int result;

> +
> +	result = kstrtobool(buf, &overdrive);
> +	if (result == -EINVAL)

Any return from kstrtobool() other then 0 is an error,
for v3 please just make this:

	if (result)
		return result;


> +		return result;
> +
> +	asus->panel_overdrive = overdrive;
> +	result = panel_od_write(asus);
> +
> +	if (result != 0)
> +		return result;
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(panel_od);
> +
>  /* Quirks *********************************************************************/
>  
>  static void asus_wmi_set_xusb2pr(struct asus_wmi *asus)
> @@ -2332,6 +2415,7 @@ static struct attribute *platform_attributes[] = {
>  	&dev_attr_als_enable.attr,
>  	&dev_attr_fan_boost_mode.attr,
>  	&dev_attr_throttle_thermal_policy.attr,
> +	&dev_attr_panel_od.attr,
>  	NULL
>  };
>  
> @@ -2357,6 +2441,8 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
>  		ok = asus->fan_boost_mode_available;
>  	else if (attr == &dev_attr_throttle_thermal_policy.attr)
>  		ok = asus->throttle_thermal_policy_available;
> +	else if (attr == &dev_attr_panel_od.attr)
> +		ok = asus->panel_overdrive_available;
>  
>  	if (devid != -1)
>  		ok = !(asus_wmi_get_devstate_simple(asus, devid) < 0);
> @@ -2622,6 +2708,10 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	else
>  		throttle_thermal_policy_set_default(asus);
>  
> +	err = panel_od_check_present(asus);
> +	if (err)
> +		goto fail_panel_od;
> +
>  	err = asus_wmi_sysfs_init(asus->platform_device);
>  	if (err)
>  		goto fail_sysfs;
> @@ -2709,6 +2799,7 @@ static int asus_wmi_add(struct platform_device *pdev)
>  fail_throttle_thermal_policy:
>  fail_fan_boost_mode:
>  fail_platform:
> +fail_panel_od:
>  	kfree(asus);
>  	return err;
>  }
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 2f274cf52805..428aea701c7b 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -61,6 +61,7 @@
>  #define ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY 0x00120075
>  
>  /* Misc */
> +#define ASUS_WMI_DEVID_PANEL_OD		0x00050019
>  #define ASUS_WMI_DEVID_CAMERA		0x00060013
>  #define ASUS_WMI_DEVID_LID_FLIP		0x00060062
>  
> 

Regards,

Hans

