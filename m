Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764D4EB64D9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Jul 2023 14:49:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231494AbjGLOtU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Jul 2023 10:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230360AbjGLOtT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Jul 2023 10:49:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7040E1BE3
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jul 2023 07:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689173307;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1KpSssKMIgC0UPbDdqI0j9HY5oH6D5zOHCu9BHTLLuQ=;
        b=d4bAn49+dpZyG8re2P1bS3mpqLqrGpsyteQjXEGwBrFkh+Ulc6OQMatRzXK2KNON/utHHB
        6p7aI5j4yYHmSKfagZmdEt8eUmjuJ9aHIZj8+44TwSyevV+1vbOAHI63JeJkwXRng45HrI
        Ot30Uf4B2wCNOMBXmP1KDTHtxdbc9cU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-_q3em4-yNJC4hxNBL4RsNg-1; Wed, 12 Jul 2023 10:48:26 -0400
X-MC-Unique: _q3em4-yNJC4hxNBL4RsNg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9892495397cso431204666b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jul 2023 07:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689173305; x=1691765305;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1KpSssKMIgC0UPbDdqI0j9HY5oH6D5zOHCu9BHTLLuQ=;
        b=YPOOgi8c9MnII/AdUGMoejGXyXXKHa3z6uVq/uqDh/0mktqXK6W4NpcCQBKuz46Gc4
         iNaB/v+7ORyQwCeV8fvqcVjpn9SflggyNSGvIR2w9+RpL3adssbcqtLU2Wv8Tw4Llwhs
         KCkO3YnIeF6wBu1O+46nmdLaaO+OZjr2bdueDh/ck4BFB5kvqNxwO83oTPoWtedA2e/m
         IfxIrz4jMQTI+OCdr0aZOK/2MBqHwuaHmZ3unp4wDMKk6WBqA83jLzmd2tGSyCoLu2ih
         1woYKlg6DOYwy7xk1FuFnbXMZd3uDlwCeNEHV5IV3O/7ZlI4ds7Ykity5xj7DCXU2F8S
         iWrQ==
X-Gm-Message-State: ABy/qLayzHHxJIZUbJJcsZ/85CX3b8XzWym746UO7g79SdoEtkdx1YKm
        4U1os1EmvTgQxepFeXnedYZ3wrYreLz2F71a/1vLrviVMecILDF5ZANnrZeWGdgWaHyc7ucEUzD
        5GUG16cZ+e2LsyZKE3H9rvT45ajagTs/jiA==
X-Received: by 2002:a17:907:b9d1:b0:98e:26ae:9b08 with SMTP id xa17-20020a170907b9d100b0098e26ae9b08mr20214278ejc.58.1689173305320;
        Wed, 12 Jul 2023 07:48:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHikde8vkqS0SQD/NwiyYtXfkqDJSRqFJkWGc88nbjcS4R56JaZ+oynazWWITKiVwPVhTIO8Q==
X-Received: by 2002:a17:907:b9d1:b0:98e:26ae:9b08 with SMTP id xa17-20020a170907b9d100b0098e26ae9b08mr20214265ejc.58.1689173305031;
        Wed, 12 Jul 2023 07:48:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d20-20020a17090648d400b00993feabdc6asm2655498ejt.157.2023.07.12.07.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 07:48:24 -0700 (PDT)
Message-ID: <43985ad2-401c-3632-c045-90049d600217@redhat.com>
Date:   Wed, 12 Jul 2023 16:48:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 7/8] platform/x86: asus-wmi: support setting mini-LED
 mode
Content-Language: en-US, nl
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        jdelvare@suse.com, linux@roeck-us.net
References: <20230630053552.976579-1-luke@ljones.dev>
 <20230630053552.976579-8-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230630053552.976579-8-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/30/23 07:35, Luke D. Jones wrote:
> Support changing the mini-LED mode on some of the newer ASUS laptops.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  .../ABI/testing/sysfs-platform-asus-wmi       |  9 ++++
>  drivers/platform/x86/asus-wmi.c               | 53 +++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h    |  1 +
>  3 files changed, 63 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
> index 878daf7c2036..5624bdef49cb 100644
> --- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
> +++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
> @@ -117,3 +117,12 @@ Description:
>  		Show if the egpu (XG Mobile) is correctly connected:
>  			* 0 - False,
>  			* 1 - True
> +
> +What:		/sys/devices/platform/<platform>/mini_led_mode
> +Date:		Jun 2023
> +KernelVersion:	6.5
> +Contact:	"Luke Jones" <luke@ljones.dev>
> +Description:
> +		Change the mini-LED mode:
> +			* 0 - Single-zone,
> +			* 1 - Multi-zone
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 602426a7fb41..1fc9e8afc2f3 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -265,6 +265,7 @@ struct asus_wmi {
>  	bool battery_rsoc_available;
>  
>  	bool panel_overdrive_available;
> +	bool mini_led_mode_available;
>  
>  	struct hotplug_slot hotplug_slot;
>  	struct mutex hotplug_lock;
> @@ -1820,6 +1821,54 @@ static ssize_t panel_od_store(struct device *dev,
>  }
>  static DEVICE_ATTR_RW(panel_od);
>  
> +/* Mini-LED mode **************************************************************/
> +static ssize_t mini_led_mode_show(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +	int result;
> +
> +	result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_MINI_LED_MODE);
> +	if (result < 0)
> +		return result;
> +
> +	return sysfs_emit(buf, "%d\n", result);
> +}
> +
> +static ssize_t mini_led_mode_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	int result, err;
> +	u32 mode;
> +
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +
> +	result = kstrtou32(buf, 10, &mode);
> +	if (result)
> +		return result;
> +
> +	if (mode > 1)
> +		return -EINVAL;
> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_MINI_LED_MODE, mode, &result);
> +
> +	if (err) {
> +		pr_warn("Failed to set mini-LED: %d\n", err);
> +		return err;
> +	}
> +
> +	if (result > 1) {
> +		pr_warn("Failed to set mini-LED mode (result): 0x%x\n", result);
> +		return -EIO;
> +	}
> +
> +	sysfs_notify(&asus->platform_device->dev.kobj, NULL, "mini_led_mode");
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(mini_led_mode);
> +
>  /* Quirks *********************************************************************/
>  
>  static void asus_wmi_set_xusb2pr(struct asus_wmi *asus)
> @@ -3727,6 +3776,7 @@ static struct attribute *platform_attributes[] = {
>  	&dev_attr_fan_boost_mode.attr,
>  	&dev_attr_throttle_thermal_policy.attr,
>  	&dev_attr_panel_od.attr,
> +	&dev_attr_mini_led_mode.attr,
>  	NULL
>  };
>  
> @@ -3764,6 +3814,8 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
>  		ok = asus->throttle_thermal_policy_available;
>  	else if (attr == &dev_attr_panel_od.attr)
>  		ok = asus->panel_overdrive_available;
> +	else if (attr == &dev_attr_mini_led_mode.attr)
> +		ok = asus->mini_led_mode_available;
>  
>  	if (devid != -1)
>  		ok = !(asus_wmi_get_devstate_simple(asus, devid) < 0);
> @@ -4026,6 +4078,7 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	asus->kbd_rgb_mode_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_MODE);
>  	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
>  	asus->panel_overdrive_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_PANEL_OD);
> +	asus->mini_led_mode_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE);
>  
>  	err = fan_boost_mode_check_present(asus);
>  	if (err)
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 2034648f8cdf..ea80361ac6c7 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -66,6 +66,7 @@
>  #define ASUS_WMI_DEVID_CAMERA		0x00060013
>  #define ASUS_WMI_DEVID_LID_FLIP		0x00060062
>  #define ASUS_WMI_DEVID_LID_FLIP_ROG	0x00060077
> +#define ASUS_WMI_DEVID_MINI_LED_MODE	0x0005001E
>  
>  /* Storage */
>  #define ASUS_WMI_DEVID_CARDREADER	0x00080013

