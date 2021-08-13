Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB013C4338F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 13 Aug 2021 06:48:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7817660C3E
	for <platform-driver-x86@archiver.kernel.org>; Fri, 13 Aug 2021 06:48:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238931AbhHMGs2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 13 Aug 2021 02:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31448 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238910AbhHMGs1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Aug 2021 02:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628837280;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yaozj11IFH9gQF2ceIWhpmBO40LaAfeaRv/kLkb+SUc=;
        b=C13/iAtHVPk9C3LOT1zvKK02y+YL00sckmVX5/kmh+pfEcCzn7oi+EwbTw/n5NEXRMNlzI
        XnfdZkWgbdWirk9pzT7LQlIe66uq2MROPsP5lzS3ItF48ztz9EnLHZkufjsbYwyk3M98pu
        3GK/meIdJ+Dcd4GTLYZ02f8tRgYHfeU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-WcNLxY6fNeu2awzMLO7Iqg-1; Fri, 13 Aug 2021 02:47:59 -0400
X-MC-Unique: WcNLxY6fNeu2awzMLO7Iqg-1
Received: by mail-ej1-f72.google.com with SMTP id ne21-20020a1709077b95b029057eb61c6fdfso2600980ejc.22
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Aug 2021 23:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yaozj11IFH9gQF2ceIWhpmBO40LaAfeaRv/kLkb+SUc=;
        b=tsDG5AAqxhDv4yINoG96lrfBs6gV4UGQHn9aH8gMofhJgY3BOuCDUyVwaAfkYyQcfh
         Pg+xwnWGjHN7OJp14iGqWvNXTxx2f3DsdZkAeDSzBTi4hno1+1K4FhpcT52e40zL3d+S
         7TR6gRQvjfzlmUk+sfmZYMsjMfeZAygX3RtJxpH8u2R/50wIySOf7fOPGZo+C2ENTdaB
         Eq1XONxnjmm4BgkCVo9jpdIHbhz0prblvhyPTMrYLwvhksuNgfNIEPkTrKV8FJKEQ9Q6
         pnnbDZTIbFQxBRF8JtYdEBxh4G84CpKvygj42uBpF6Ij3XbUUytl6VC3li/NSG7ndpiq
         0mdw==
X-Gm-Message-State: AOAM533rCOdRLsOIR8yKf+MqFh+kCKDqjD/572x8VL0KZ/t2UxcaMhPF
        cI3ZRq2WZ2ijai6Tsf5kFHFDzjxQtZwv/H3hESgq0hwGOjo5P5gOy2s1jtKbhUxwKe9NoXtj20+
        h50m0QY3HLxOjwSwmdSKFfXQT4kbqQaEiTYMpUWFIS1I9LlOqAtk1fPlNO2Ct17nDu0lN2Oh1gw
        xkQyWzCSbKBw==
X-Received: by 2002:aa7:d6cc:: with SMTP id x12mr1174600edr.171.1628837277505;
        Thu, 12 Aug 2021 23:47:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSbp6s1BFiEd04+TCukSMuuOQYJPp03ICY71H8KXo/xNxwD5BenQKDuJDYMz8O9CYpKjzKlg==
X-Received: by 2002:aa7:d6cc:: with SMTP id x12mr1174569edr.171.1628837277217;
        Thu, 12 Aug 2021 23:47:57 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id a12sm213949ejv.14.2021.08.12.23.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 23:47:56 -0700 (PDT)
Subject: Re: [PATCH] asus-wmi: Add support for platform_profile
To:     "Luke D. Jones" <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc:     hadess@hadess.net, platform-driver-x86@vger.kernel.org
References: <20210813024201.9518-1-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c1cbd0eb-9680-3ede-bae8-977c03c1ebd2@redhat.com>
Date:   Fri, 13 Aug 2021 08:47:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813024201.9518-1-luke@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Luke,

Thank you for this patch, it is great to see more and more laptop
models getting support for the standard platform_profile userspace API.

On 8/13/21 4:42 AM, Luke D. Jones wrote:
> Add initial support for platform_profile where the support is
> based on availability of ASUS_THROTTLE_THERMAL_POLICY.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>  drivers/platform/x86/asus-wmi.c | 112 ++++++++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 90a6a0d00deb..62260043c15c 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -26,6 +26,7 @@
>  #include <linux/rfkill.h>
>  #include <linux/pci.h>
>  #include <linux/pci_hotplug.h>
> +#include <linux/platform_profile.h>
>  #include <linux/power_supply.h>
>  #include <linux/hwmon.h>
>  #include <linux/hwmon-sysfs.h>
> @@ -219,6 +220,9 @@ struct asus_wmi {
>  	bool throttle_thermal_policy_available;
>  	u8 throttle_thermal_policy_mode;
>  
> +	struct platform_profile_handler platform_profile_handler;
> +	bool platform_profile_support;
> +
>  	// The RSOC controls the maximum charging percentage.
>  	bool battery_rsoc_available;
>  
> @@ -2144,6 +2148,106 @@ static ssize_t throttle_thermal_policy_store(struct device *dev,
>  // Throttle thermal policy: 0 - default, 1 - overboost, 2 - silent
>  static DEVICE_ATTR_RW(throttle_thermal_policy);
>  
> +/* Platform profile ***********************************************************/
> +static int platform_profile_get(struct platform_profile_handler *pprof,
> +				enum platform_profile_option *profile)
> +{
> +	struct asus_wmi *asus;
> +	int tp;
> +
> +	asus = container_of(pprof, struct asus_wmi, platform_profile_handler);
> +
> +	/* All possible toggles like throttle_thermal_policy here */
> +	if (asus->throttle_thermal_policy_available) {
> +		tp = asus->throttle_thermal_policy_mode;
> +	} else {
> +		return -1;
> +	}
> +
> +	if (tp < 0)
> +		return tp;
> +
> +	switch (tp) {
> +	case ASUS_THROTTLE_THERMAL_POLICY_DEFAULT:
> +		*profile = PLATFORM_PROFILE_BALANCED;
> +		break;
> +	case ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST:
> +		*profile = PLATFORM_PROFILE_PERFORMANCE;
> +		break;
> +	case ASUS_THROTTLE_THERMAL_POLICY_SILENT:
> +		*profile = PLATFORM_PROFILE_QUIET;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int platform_profile_set(struct platform_profile_handler *pprof,
> +				enum platform_profile_option profile)
> +{
> +	struct asus_wmi *asus;
> +	int tp;
> +
> +	asus = container_of(pprof, struct asus_wmi, platform_profile_handler);
> +
> +	/* All possible toggles like throttle_thermal_policy here */
> +	if (!asus->throttle_thermal_policy_available) {
> +		return -1;
> +	}
> +
> +	switch (profile) {
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		tp = ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		tp = ASUS_THROTTLE_THERMAL_POLICY_DEFAULT;
> +		break;
> +	case PLATFORM_PROFILE_QUIET:
> +		tp = ASUS_THROTTLE_THERMAL_POLICY_SILENT;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (asus->throttle_thermal_policy_available) {

You already check for asus->throttle_thermal_policy_available a couple
of lines higher in this function and you return when it is not
available ...

I guess this was intended to also have a second if () for
fan-boost mode ?

Since you are not adding support for fan-boost mode at this time,
it would be best (IMHO) to drop this second if for now and
just take this path unconditionally.


> +		asus->throttle_thermal_policy_mode = tp;
> +		return throttle_thermal_policy_write(asus);
> +	}
> +	return 0;
> +}
> +
> +static int platform_profile_setup(struct asus_wmi *asus)
> +{
> +	int err;
> +
> +	if (asus->throttle_thermal_policy_available) {
> +		pr_info("Using throttle_thermal_policy for platform_profile support\n");
> +	} else {
> +		/*
> +		 * Not an error if a component platform_profile relies on is unavailable
> +		 * so early return, skipping the setup of platform_profile.
> +		*/
> +		return 0;
> +	}
> +	asus->platform_profile_handler.profile_get = platform_profile_get;
> +	asus->platform_profile_handler.profile_set = platform_profile_set;
> +
> +	set_bit(PLATFORM_PROFILE_QUIET, asus->platform_profile_handler.choices);
> +	set_bit(PLATFORM_PROFILE_BALANCED,
> +		asus->platform_profile_handler.choices);
> +	set_bit(PLATFORM_PROFILE_PERFORMANCE,
> +		asus->platform_profile_handler.choices);
> +
> +	err = platform_profile_register(&asus->platform_profile_handler);
> +	if (err)
> +		return err;
> +
> +	asus->platform_profile_support = true;
> +	return 0;
> +}
> +
>  /* Backlight ******************************************************************/
>  
>  static int read_backlight_power(struct asus_wmi *asus)
> @@ -2904,6 +3008,10 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	else
>  		throttle_thermal_policy_set_default(asus);
>  
> +	err = platform_profile_setup(asus);
> +	if (err)
> +		goto fail_platform_profile_setup;
> +
>  	err = panel_od_check_present(asus);
>  	if (err)
>  		goto fail_panel_od;
> @@ -2993,6 +3101,7 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	asus_wmi_sysfs_exit(asus->platform_device);
>  fail_sysfs:
>  fail_throttle_thermal_policy:
> +fail_platform_profile_setup:
>  fail_fan_boost_mode:

I think you need to add this:

	if (asus->platform_profile_support)
		platform_profile_remove();

here so that if later fail-exit paths are taken the platform_profile
support gets unregistered again.

>  fail_egpu_enable:
>  fail_dgpu_disable:
> @@ -3017,6 +3126,9 @@ static int asus_wmi_remove(struct platform_device *device)
>  	asus_fan_set_auto(asus);
>  	asus_wmi_battery_exit(asus);
>  
> +	if (asus->platform_profile_support)
> +		platform_profile_remove();
> +
>  	kfree(asus);
>  	return 0;
>  }
> 

Regards,

Hans

