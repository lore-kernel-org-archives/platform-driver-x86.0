Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8CC311592
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Jun 2026 14:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781360489; cv=none; b=QG4iWqirCN4dk8nx5Eu/RWQ9G1ERavdwfldLXbCNxnbIsMf0atStWEntlYIXiAMl+QPPIoO08/6nGpeDqJCu5E0OEXH5UhbkgqMgQhz5YPOOx/isa2X1/OzLzTQtpblW7Cq7wAg+/ejTP4vvVyrgmkbcrwMKS017TqyxdleVNX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781360489; c=relaxed/simple;
	bh=pNWsFF7SA1mU6kTyygY0fQJ0RiWUdK+DsgA4Y+Sn2D0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NZ2JFKLpxiXT8ziCGDyTh+YNHkMp87Eshe7q2dFUmjDcMKy0x1uQSKqaxn2m3KRS00cBznKnUxbDKl8KxSyRibN6OaMb+TB1BAKBjnvuw9Ey/6+/bVn0ZuT5bcF3AoJTKdrvhl5IMTmdNCfYeP1ElzQS/8ZauzlC9srPXdC2x/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JpfyqPYX; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JpfyqPYX"
Message-ID: <e259fe6a-9bcd-4664-b45d-3491629bd291@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781360473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9C63ir8Ui+aiFVcIrsUCZpgfAjBlDyxKNobklykXWlk=;
	b=JpfyqPYXY2chI9ClD0ZXfFH57HZ9eXjhMOZUGEKQt4trWV54mWZz0VfqlSNfl7dsuQokxf
	XryiwQAbVINTGOOqtvrmWVZPvSb9VPci5X3oz0oWsrhPgN16KjEqBi0jhl1kt8u0OXBWvB
	oXO76KWn3Pzy2/rV7s7Ft+TjG6Pv9hY=
Date: Sat, 13 Jun 2026 16:21:03 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/1] platform/x86: asus-armoury: gate PPT writes behind
 active fan curve
To: Ahmed Yaseen <yaseen@ghoul.dev>, Corentin Chary
 <corentin.chary@gmail.com>, "Luke D . Jones" <luke@ljones.dev>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mario Limonciello <superm1@kernel.org>
References: <20260519181155.46044-1-yaseen@ghoul.dev>
 <20260519181155.46044-2-yaseen@ghoul.dev>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260519181155.46044-2-yaseen@ghoul.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 5/19/26 20:12, Ahmed Yaseen wrote:
> On models flagged with requires_fan_curve in the DMI power_data table
> (30 entries), the BIOS ACPI method SPLX only writes PPT values to the
> EC when the fan mode is set to Manual (FANM=4). FANM is set to 4 by
> the DEFC method when a custom fan curve is written. Without an active
> custom fan curve, the WMI DEVS call returns success but the firmware
> silently ignores the PPT value, so userspace observes no effect from
> its write.
>
> Gate writes to ASUS_WMI_DEVID_PPT_{PL1_SPL,PL2_SPPT,PL3_FPPT,APU_SPPT,
> PLAT_SPPT} on a check of asus_wmi_custom_fan_curve_is_enabled(), and
> return -EBUSY with a pr_warn_once() when no fan curve is active on an
> affected model. Export the helper from asus-wmi so asus-armoury can
> call it across module boundaries.
Reviewed-by: Denis Benato <denis.benato@linux.dev>
> Signed-off-by: Ahmed Yaseen <yaseen@ghoul.dev>
> ---
>  drivers/platform/x86/asus-armoury.c        | 20 ++++++++++++++++++
>  drivers/platform/x86/asus-wmi.c            | 24 ++++++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h |  5 +++++
>  3 files changed, 49 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index 5b0987ccc270..f094b70fa1f0 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -93,6 +93,8 @@ struct asus_armoury_priv {
>  
>  	u32 mini_led_dev_id;
>  	u32 gpu_mux_dev_id;
> +
> +	bool requires_fan_curve;
>  };
>  
>  static struct asus_armoury_priv asus_armoury = {
> @@ -216,6 +218,22 @@ static int armoury_set_devstate(struct kobj_attribute *attr,
>  	u32 result;
>  	int err;
>  
> +	/* On some models, PPT changes require an active fan curve */
> +	if (asus_armoury.requires_fan_curve) {
> +		switch (dev_id) {
> +		case ASUS_WMI_DEVID_PPT_PL1_SPL:
> +		case ASUS_WMI_DEVID_PPT_PL2_SPPT:
> +		case ASUS_WMI_DEVID_PPT_PL3_FPPT:
> +		case ASUS_WMI_DEVID_PPT_APU_SPPT:
> +		case ASUS_WMI_DEVID_PPT_PLAT_SPPT:
> +			if (!asus_wmi_custom_fan_curve_is_enabled()) {
> +				pr_warn_once("PPT change requires an active fan curve on this model. Enable a custom fan curve first.\n");
> +				return -EBUSY;
> +			}
> +			break;
> +		}
> +	}
> +
>  	/*
>  	 * Prevent developers from bricking devices or issuing dangerous
>  	 * commands that can be difficult or impossible to recover from.
> @@ -1002,6 +1020,8 @@ static void init_rog_tunables(void)
>  		return;
>  	}
>  
> +	asus_armoury.requires_fan_curve = power_data->requires_fan_curve;
> +
>  	/* Initialize AC power tunables */
>  	ac_limits = power_data->ac_data;
>  	if (ac_limits) {
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 80144c412b90..e4c1716d9b30 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -4001,6 +4001,30 @@ static int asus_wmi_custom_fan_curve_init(struct asus_wmi *asus)
>  	return 0;
>  }
>  
> +/*
> + * Returns true if at least one custom fan curve is active
> + *
> + * Used by asus-armoury to check if PPT writes will be accepted by the BIOS
> + * on models that require an active fan curve for TDP changes.
> + */
> +bool asus_wmi_custom_fan_curve_is_enabled(void)
> +{
> +	struct fan_curve_data *curves;
> +	struct asus_wmi *asus;
> +
> +	guard(spinlock_irqsave)(&asus_ref.lock);
> +	asus = asus_ref.asus;
> +	if (!asus)
> +		return false;
> +
> +	curves = asus->custom_fan_curves;
> +
> +	return (asus->cpu_fan_curve_available && curves[FAN_CURVE_DEV_CPU].enabled) ||
> +	       (asus->gpu_fan_curve_available && curves[FAN_CURVE_DEV_GPU].enabled) ||
> +	       (asus->mid_fan_curve_available && curves[FAN_CURVE_DEV_MID].enabled);
> +}
> +EXPORT_SYMBOL_NS_GPL(asus_wmi_custom_fan_curve_is_enabled, "ASUS_WMI");
> +
>  /* Throttle thermal policy ****************************************************/
>  static int throttle_thermal_policy_write(struct asus_wmi *asus)
>  {
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 554f41b827e1..5d57293ced6c 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -196,6 +196,7 @@ int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
>  int asus_hid_register_listener(struct asus_hid_listener *cdev);
>  void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
>  int asus_hid_event(enum asus_hid_event event);
> +bool asus_wmi_custom_fan_curve_is_enabled(void);
>  #else
>  static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
>  {
> @@ -227,6 +228,10 @@ static inline int asus_hid_event(enum asus_hid_event event)
>  {
>  	return -ENODEV;
>  }
> +static inline bool asus_wmi_custom_fan_curve_is_enabled(void)
> +{
> +	return false;
> +}
>  #endif
>  
>  #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */
