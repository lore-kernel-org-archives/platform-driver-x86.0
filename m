Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACD91703B2
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Mar 2024 14:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711378607; cv=none; b=dkhHWlZxl+TVnMEIqIJOdJbUaEX0IxV3ct2NMHkTZkzSkEj4HXcg8IuowHgxXA2eIzUqEj7+XdIY13aNyKRWVZTp9abuFr1/VDXw9WhBm6ElxDh67ccyiq5G7eU0CJaY2fEsiERqBP3YS1xF2tUYwJ1OpkrEXxCPdEekML9adiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711378607; c=relaxed/simple;
	bh=D0IVRdUxb61cm78RULRVdS2jg7eEG5sG+EM9knh7xic=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VdyjHIScYZoGASVLuMYWlhY6uB3YsMxnP4FvgMAZc4W1sPF3v1vJJz1bdQ004amRfxRa9nEf5+EJLakXWYna5PVoSftbZtn0hAeqtfxRnIE5BAxPab0NLQ4ycjISqbxHQFQ9vzQxKR25+68GJt//NMFxui/3Ptm5wPsIeA4vj4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YY/7VcY3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YY/7VcY3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711378604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gx0yK0w5kM36eezq6+OwYyZsTKrvUFRREBPBGm2cUJQ=;
	b=YY/7VcY3a89S+IM9gjNPGhwmgXyFQ2QIBT4PTA58S6d0guAfwAYWt4GztYkkfN137iakcE
	CRLPJl3KAB5/D3qcrj5JaVk5mPGbs+Rpz6pqaQwcE5lk9t2IsCBDlAPtDdEYyA7f47Sm3U
	uuNOz5iUwbNg/ClRARwy8WpAZvXq4mo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-RgV0fioBNwCtYcdYeX7ygA-1; Mon, 25 Mar 2024 10:56:42 -0400
X-MC-Unique: RgV0fioBNwCtYcdYeX7ygA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a45acc7f191so261104066b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Mar 2024 07:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711378601; x=1711983401;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gx0yK0w5kM36eezq6+OwYyZsTKrvUFRREBPBGm2cUJQ=;
        b=rCkc6uQ8MCUlR+V8iG1eGy58paYzixobBNx/wlU6TApRAqyw5xIiUU2tyV7b70x3rM
         SO261Fai52LzhQCUaUSyfAA6abXCieDfRA/9B/xqHimfXn8vlWxSHJIclna44YHDuFy/
         3AZ5q1I1HzXa5Ptmw9swZbAQizIB56OZP9G86F00FCJdaMmL9wQawQP67xWcm091TWcT
         PL4zZ7fOAmSHRj2GtI8YdYCR4JUhniP4vy+Dn2PiobMi6BUz7R7/Y1Rh4M8NcAZKPudW
         NO31OqJYF6WhJBk/Wx8ldhaJRvUuZEY9Prp/6WQ232EoGpFb1dgSw70nj2gJ+4oERDG+
         Q0wg==
X-Forwarded-Encrypted: i=1; AJvYcCXheojE8XAA3XnUB3LoOizZbGqZXyjwaGYjfCkRBLRUMGw4UC4V1EbHIhkgJDyc7Of5FxAkb78IOGkRWLpMZRgMVdV7XQhwqgGWa+G6Lt4SzVOw6w==
X-Gm-Message-State: AOJu0YzSXgvnaKArpVTeyBVfELJvJ8bA4UY0qDr4cHGsOLjBWloM2Tof
	WYQ7v2VRVlx5mys8H7wnNn4oAJMTOqAKt/qOWVH2RVXtClA9EQX/uUVCa/7seFwFgBrs7rOOnnX
	O0is1ZFRhXj0tjclga33V6HmZOtWNdUgQbBFVrZN00IkyTFFLZF4OuetmG6PopGjto1zyq//big
	qG/jY=
X-Received: by 2002:a17:906:30d0:b0:a47:3632:d30b with SMTP id b16-20020a17090630d000b00a473632d30bmr5089226ejb.37.1711378601363;
        Mon, 25 Mar 2024 07:56:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF55T1GoUanntAW5p1pLSM7rxO+GN2gxok61HVVPRpB3r2cJsrfTCkC0WKeFICO67DzAnAetA==
X-Received: by 2002:a17:906:30d0:b0:a47:3632:d30b with SMTP id b16-20020a17090630d000b00a473632d30bmr5089204ejb.37.1711378600921;
        Mon, 25 Mar 2024 07:56:40 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q9-20020a170906a08900b00a46d001a259sm3140430ejy.52.2024.03.25.07.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 07:56:40 -0700 (PDT)
Message-ID: <aff161d5-cf6e-421b-8250-35e724397dcf@redhat.com>
Date: Mon, 25 Mar 2024 15:56:39 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] platform/surface: platform_profile: add fan
 profile switching
Content-Language: en-US, nl
To: Ivor Wanders <ivor@iwanders.net>, Maximilian Luz
 <luzmaximilian@gmail.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240314223733.6236-1-ivor@iwanders.net>
 <20240314223733.6236-2-ivor@iwanders.net>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240314223733.6236-2-ivor@iwanders.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/14/24 11:37 PM, Ivor Wanders wrote:
> Change naming from tmp to platform profile to clarify the module may
> interact with both the TMP and FAN subystems. Add functionality that
> switches the fan profile when the platform profile is changed when
> a fan is present.
> 
> Signed-off-by: Ivor Wanders <ivor@iwanders.net>
> Link: https://github.com/linux-surface/kernel/pull/145
> Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>

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
> Changes in v2:
>   - Added link entry to commit message.
>   - Use u8 instead of char for the argument of __sam_fan_profile_set.
>   - Made profile and profile_le variable const.
> ---
> ---
>  .../surface/surface_aggregator_registry.c     | 36 +++++---
>  .../surface/surface_platform_profile.c        | 88 ++++++++++++++++---
>  2 files changed, 100 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
> index 035d6b4105cd..79e52eddabd0 100644
> --- a/drivers/platform/surface/surface_aggregator_registry.c
> +++ b/drivers/platform/surface/surface_aggregator_registry.c
> @@ -68,12 +68,26 @@ static const struct software_node ssam_node_bat_sb3base = {
>  	.parent = &ssam_node_hub_base,
>  };
>  
> -/* Platform profile / performance-mode device. */
> -static const struct software_node ssam_node_tmp_pprof = {
> +/* Platform profile / performance-mode device without a fan. */
> +static const struct software_node ssam_node_tmp_perf_profile = {
>  	.name = "ssam:01:03:01:00:01",
>  	.parent = &ssam_node_root,
>  };
>  
> +/* Platform profile / performance-mode device with a fan, such that
> + * the fan controller profile can also be switched.
> + */
> +static const struct property_entry ssam_node_tmp_perf_profile_has_fan[] = {
> +	PROPERTY_ENTRY_BOOL("has_fan"),
> +	{ }
> +};
> +
> +static const struct software_node ssam_node_tmp_perf_profile_with_fan = {
> +	.name = "ssam:01:03:01:00:01",
> +	.parent = &ssam_node_root,
> +	.properties = ssam_node_tmp_perf_profile_has_fan,
> +};
> +
>  /* Fan speed function. */
>  static const struct software_node ssam_node_fan_speed = {
>  	.name = "ssam:01:05:01:01:01",
> @@ -208,7 +222,7 @@ static const struct software_node ssam_node_pos_tablet_switch = {
>   */
>  static const struct software_node *ssam_node_group_gen5[] = {
>  	&ssam_node_root,
> -	&ssam_node_tmp_pprof,
> +	&ssam_node_tmp_perf_profile,
>  	NULL,
>  };
>  
> @@ -219,7 +233,7 @@ static const struct software_node *ssam_node_group_sb3[] = {
>  	&ssam_node_bat_ac,
>  	&ssam_node_bat_main,
>  	&ssam_node_bat_sb3base,
> -	&ssam_node_tmp_pprof,
> +	&ssam_node_tmp_perf_profile,
>  	&ssam_node_bas_dtx,
>  	&ssam_node_hid_base_keyboard,
>  	&ssam_node_hid_base_touchpad,
> @@ -233,7 +247,7 @@ static const struct software_node *ssam_node_group_sl3[] = {
>  	&ssam_node_root,
>  	&ssam_node_bat_ac,
>  	&ssam_node_bat_main,
> -	&ssam_node_tmp_pprof,
> +	&ssam_node_tmp_perf_profile,
>  	&ssam_node_hid_main_keyboard,
>  	&ssam_node_hid_main_touchpad,
>  	&ssam_node_hid_main_iid5,
> @@ -245,7 +259,7 @@ static const struct software_node *ssam_node_group_sl5[] = {
>  	&ssam_node_root,
>  	&ssam_node_bat_ac,
>  	&ssam_node_bat_main,
> -	&ssam_node_tmp_pprof,
> +	&ssam_node_tmp_perf_profile,
>  	&ssam_node_hid_main_keyboard,
>  	&ssam_node_hid_main_touchpad,
>  	&ssam_node_hid_main_iid5,
> @@ -258,7 +272,7 @@ static const struct software_node *ssam_node_group_sls[] = {
>  	&ssam_node_root,
>  	&ssam_node_bat_ac,
>  	&ssam_node_bat_main,
> -	&ssam_node_tmp_pprof,
> +	&ssam_node_tmp_perf_profile,
>  	&ssam_node_pos_tablet_switch,
>  	&ssam_node_hid_sam_keyboard,
>  	&ssam_node_hid_sam_penstash,
> @@ -274,7 +288,7 @@ static const struct software_node *ssam_node_group_slg1[] = {
>  	&ssam_node_root,
>  	&ssam_node_bat_ac,
>  	&ssam_node_bat_main,
> -	&ssam_node_tmp_pprof,
> +	&ssam_node_tmp_perf_profile,
>  	NULL,
>  };
>  
> @@ -283,7 +297,7 @@ static const struct software_node *ssam_node_group_sp7[] = {
>  	&ssam_node_root,
>  	&ssam_node_bat_ac,
>  	&ssam_node_bat_main,
> -	&ssam_node_tmp_pprof,
> +	&ssam_node_tmp_perf_profile,
>  	NULL,
>  };
>  
> @@ -293,7 +307,7 @@ static const struct software_node *ssam_node_group_sp8[] = {
>  	&ssam_node_hub_kip,
>  	&ssam_node_bat_ac,
>  	&ssam_node_bat_main,
> -	&ssam_node_tmp_pprof,
> +	&ssam_node_tmp_perf_profile,
>  	&ssam_node_kip_tablet_switch,
>  	&ssam_node_hid_kip_keyboard,
>  	&ssam_node_hid_kip_penstash,
> @@ -310,7 +324,7 @@ static const struct software_node *ssam_node_group_sp9[] = {
>  	&ssam_node_hub_kip,
>  	&ssam_node_bat_ac,
>  	&ssam_node_bat_main,
> -	&ssam_node_tmp_pprof,
> +	&ssam_node_tmp_perf_profile_with_fan,
>  	&ssam_node_fan_speed,
>  	&ssam_node_pos_tablet_switch,
>  	&ssam_node_hid_kip_keyboard,
> diff --git a/drivers/platform/surface/surface_platform_profile.c b/drivers/platform/surface/surface_platform_profile.c
> index a5a3941b3f43..3de864bc6610 100644
> --- a/drivers/platform/surface/surface_platform_profile.c
> +++ b/drivers/platform/surface/surface_platform_profile.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
>   * Surface Platform Profile / Performance Mode driver for Surface System
> - * Aggregator Module (thermal subsystem).
> + * Aggregator Module (thermal and fan subsystem).
>   *
>   * Copyright (C) 2021-2022 Maximilian Luz <luzmaximilian@gmail.com>
>   */
> @@ -14,6 +14,7 @@
>  
>  #include <linux/surface_aggregator/device.h>
>  
> +// Enum for the platform performance profile sent to the TMP module.
>  enum ssam_tmp_profile {
>  	SSAM_TMP_PROFILE_NORMAL             = 1,
>  	SSAM_TMP_PROFILE_BATTERY_SAVER      = 2,
> @@ -21,15 +22,26 @@ enum ssam_tmp_profile {
>  	SSAM_TMP_PROFILE_BEST_PERFORMANCE   = 4,
>  };
>  
> +// Enum for the fan profile sent to the FAN module. This fan profile is
> +// only sent to the EC if the 'has_fan' property is set. The integers are
> +// not a typo, they differ from the performance profile indices.
> +enum ssam_fan_profile {
> +	SSAM_FAN_PROFILE_NORMAL             = 2,
> +	SSAM_FAN_PROFILE_BATTERY_SAVER      = 1,
> +	SSAM_FAN_PROFILE_BETTER_PERFORMANCE = 3,
> +	SSAM_FAN_PROFILE_BEST_PERFORMANCE   = 4,
> +};
> +
>  struct ssam_tmp_profile_info {
>  	__le32 profile;
>  	__le16 unknown1;
>  	__le16 unknown2;
>  } __packed;
>  
> -struct ssam_tmp_profile_device {
> +struct ssam_platform_profile_device {
>  	struct ssam_device *sdev;
>  	struct platform_profile_handler handler;
> +	bool has_fan;
>  };
>  
>  SSAM_DEFINE_SYNC_REQUEST_CL_R(__ssam_tmp_profile_get, struct ssam_tmp_profile_info, {
> @@ -42,6 +54,13 @@ SSAM_DEFINE_SYNC_REQUEST_CL_W(__ssam_tmp_profile_set, __le32, {
>  	.command_id      = 0x03,
>  });
>  
> +SSAM_DEFINE_SYNC_REQUEST_W(__ssam_fan_profile_set, u8, {
> +	.target_category = SSAM_SSH_TC_FAN,
> +	.target_id = SSAM_SSH_TID_SAM,
> +	.command_id = 0x0e,
> +	.instance_id = 0x01,
> +});
> +
>  static int ssam_tmp_profile_get(struct ssam_device *sdev, enum ssam_tmp_profile *p)
>  {
>  	struct ssam_tmp_profile_info info;
> @@ -57,12 +76,19 @@ static int ssam_tmp_profile_get(struct ssam_device *sdev, enum ssam_tmp_profile
>  
>  static int ssam_tmp_profile_set(struct ssam_device *sdev, enum ssam_tmp_profile p)
>  {
> -	__le32 profile_le = cpu_to_le32(p);
> +	const __le32 profile_le = cpu_to_le32(p);
>  
>  	return ssam_retry(__ssam_tmp_profile_set, sdev, &profile_le);
>  }
>  
> -static int convert_ssam_to_profile(struct ssam_device *sdev, enum ssam_tmp_profile p)
> +static int ssam_fan_profile_set(struct ssam_device *sdev, enum ssam_fan_profile p)
> +{
> +	const u8 profile = p;
> +
> +	return ssam_retry(__ssam_fan_profile_set, sdev->ctrl, &profile);
> +}
> +
> +static int convert_ssam_tmp_to_profile(struct ssam_device *sdev, enum ssam_tmp_profile p)
>  {
>  	switch (p) {
>  	case SSAM_TMP_PROFILE_NORMAL:
> @@ -83,7 +109,8 @@ static int convert_ssam_to_profile(struct ssam_device *sdev, enum ssam_tmp_profi
>  	}
>  }
>  
> -static int convert_profile_to_ssam(struct ssam_device *sdev, enum platform_profile_option p)
> +
> +static int convert_profile_to_ssam_tmp(struct ssam_device *sdev, enum platform_profile_option p)
>  {
>  	switch (p) {
>  	case PLATFORM_PROFILE_LOW_POWER:
> @@ -105,20 +132,42 @@ static int convert_profile_to_ssam(struct ssam_device *sdev, enum platform_profi
>  	}
>  }
>  
> +static int convert_profile_to_ssam_fan(struct ssam_device *sdev, enum platform_profile_option p)
> +{
> +	switch (p) {
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		return SSAM_FAN_PROFILE_BATTERY_SAVER;
> +
> +	case PLATFORM_PROFILE_BALANCED:
> +		return SSAM_FAN_PROFILE_NORMAL;
> +
> +	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> +		return SSAM_FAN_PROFILE_BETTER_PERFORMANCE;
> +
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		return SSAM_FAN_PROFILE_BEST_PERFORMANCE;
> +
> +	default:
> +		/* This should have already been caught by platform_profile_store(). */
> +		WARN(true, "unsupported platform profile");
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>  static int ssam_platform_profile_get(struct platform_profile_handler *pprof,
>  				     enum platform_profile_option *profile)
>  {
> -	struct ssam_tmp_profile_device *tpd;
> +	struct ssam_platform_profile_device *tpd;
>  	enum ssam_tmp_profile tp;
>  	int status;
>  
> -	tpd = container_of(pprof, struct ssam_tmp_profile_device, handler);
> +	tpd = container_of(pprof, struct ssam_platform_profile_device, handler);
>  
>  	status = ssam_tmp_profile_get(tpd->sdev, &tp);
>  	if (status)
>  		return status;
>  
> -	status = convert_ssam_to_profile(tpd->sdev, tp);
> +	status = convert_ssam_tmp_to_profile(tpd->sdev, tp);
>  	if (status < 0)
>  		return status;
>  
> @@ -129,21 +178,32 @@ static int ssam_platform_profile_get(struct platform_profile_handler *pprof,
>  static int ssam_platform_profile_set(struct platform_profile_handler *pprof,
>  				     enum platform_profile_option profile)
>  {
> -	struct ssam_tmp_profile_device *tpd;
> +	struct ssam_platform_profile_device *tpd;
>  	int tp;
>  
> -	tpd = container_of(pprof, struct ssam_tmp_profile_device, handler);
> +	tpd = container_of(pprof, struct ssam_platform_profile_device, handler);
> +
> +	tp = convert_profile_to_ssam_tmp(tpd->sdev, profile);
> +	if (tp < 0)
> +		return tp;
>  
> -	tp = convert_profile_to_ssam(tpd->sdev, profile);
> +	tp = ssam_tmp_profile_set(tpd->sdev, tp);
>  	if (tp < 0)
>  		return tp;
>  
> -	return ssam_tmp_profile_set(tpd->sdev, tp);
> +	if (tpd->has_fan) {
> +		tp = convert_profile_to_ssam_fan(tpd->sdev, profile);
> +		if (tp < 0)
> +			return tp;
> +		tp = ssam_fan_profile_set(tpd->sdev, tp);
> +	}
> +
> +	return tp;
>  }
>  
>  static int surface_platform_profile_probe(struct ssam_device *sdev)
>  {
> -	struct ssam_tmp_profile_device *tpd;
> +	struct ssam_platform_profile_device *tpd;
>  
>  	tpd = devm_kzalloc(&sdev->dev, sizeof(*tpd), GFP_KERNEL);
>  	if (!tpd)
> @@ -154,6 +214,8 @@ static int surface_platform_profile_probe(struct ssam_device *sdev)
>  	tpd->handler.profile_get = ssam_platform_profile_get;
>  	tpd->handler.profile_set = ssam_platform_profile_set;
>  
> +	tpd->has_fan = device_property_read_bool(&sdev->dev, "has_fan");
> +
>  	set_bit(PLATFORM_PROFILE_LOW_POWER, tpd->handler.choices);
>  	set_bit(PLATFORM_PROFILE_BALANCED, tpd->handler.choices);
>  	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, tpd->handler.choices);

