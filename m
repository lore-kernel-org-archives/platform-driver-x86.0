Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646A8363C4B;
	Sat, 16 May 2026 21:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778966150; cv=none; b=ZPn6rqDMnCNauv4xgjcZT2r+BhreUKmS5hChMwXS14RyydO/C8KE1YJwd92Vlz+9DMuM/WgNxiO5hE2iU6R9/u0hUiwrCT9rTIERlBhdqi1+vyaiGPnD5Diafvid5Rx3YBB+cPm9l7b1ftW98T/S2CvCAoFQTiSCQC89OW6pNs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778966150; c=relaxed/simple;
	bh=L7Gad1gfIs9d4CtZuSv35gqWfq2mUyJAL4yx1MC/BTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R0nX8l3nHmD/ISTODslocNBCQ71SObNwXB2i4CdaUD6ieuauCFYNzavLXdXDO3XcBnzZSBF0N7fbDJGqAo86uMq/uyV/1fAe86DlFEtjoIiai0bx8RhC0SpM95sucx0L60/fbFtGetr2y2w4yxIwmER1J9EpksE+OWxnVhOKqyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEeNdeKc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEeNdeKc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3013C19425;
	Sat, 16 May 2026 21:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778966150;
	bh=L7Gad1gfIs9d4CtZuSv35gqWfq2mUyJAL4yx1MC/BTk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UEeNdeKcinRfxHJhE6sMRhfZRWx694GrU3IP0fZetTRaAdb2jPCIRxm+py/y0acOc
	 nO4uqF+gMR+Bp6G50My6MKsWaEVwE+Pq2xPDV95fk1mTEnStmJMqLKmvE9qFMZfwVi
	 Dj0zNbXhjHYKI0VQubyl0Wb4ZxSxETtUCzvAfhUy7XO88cdugBWtOt3BOPXzMd+tdr
	 f+teVumqcVcVSoEKirsb88/SZqhwU3Xevt4USmhbl+wZHnJBuuH9dtfxAC+IzvFZ1S
	 Py70O4NXAOFQDjDtii1zfZAN7hpMmo1YeL9LyIcvNsmPOjR14rWLzRT5WfYSSXkQA7
	 vaScE6l750mvg==
Message-ID: <c621a2ce-74cd-42d3-8390-98ec3f792614@kernel.org>
Date: Sat, 16 May 2026 16:15:46 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86: asus-armoury: gate PPT writes behind
 active fan curve
To: Ahmed Yaseen <yaseen@ghoul.dev>, platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev,
 derekjohn.clark@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 prasanth.ksr@dell.com, mpearson-lenovo@squebb.ca,
 Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org
References: <20260511061901.907540-1-yaseen@ghoul.dev>
 <20260513154714.25160-2-yaseen@ghoul.dev>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260513154714.25160-2-yaseen@ghoul.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/13/26 10:47 AM, Ahmed Yaseen wrote:
> On models flagged with requires_fan_curve in the DMI power_data table
> (28 entries), the BIOS ACPI method SPLX only writes PPT values to the
> EC when the fan mode is set to Manual (FANM=4). FANM is set to 4 by
> the DEFC method when a custom fan curve is written. Without an active
> custom fan curve, the WMI DEVS call returns success but the firmware
> silently ignores the PPT value, so userspace observes no effect from
> its write.
> 
> Gate writes to ASUS_WMI_DEVID_PPT_{PL1_SPL,PL2_SPPT,PL3_FPPT,APU_SPPT,
> PLAT_SPPT} on a check of asus_wmi_custom_fan_curve_is_enabled(), and
> return -EBUSY with a pr_warn() when no fan curve is active on an
> affected model. Export the helper from asus-wmi so asus-armoury can
> call it across module boundaries.
> 
> Signed-off-by: Ahmed Yaseen <yaseen@ghoul.dev>
> ---
>   drivers/platform/x86/asus-armoury.c        | 20 ++++++++++++++++
>   drivers/platform/x86/asus-wmi.c            | 28 ++++++++++++++++++++++
>   include/linux/platform_data/x86/asus-wmi.h |  5 ++++
>   3 files changed, 53 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index 5b0987ccc270..9b1c41a25b38 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -93,6 +93,8 @@ struct asus_armoury_priv {
>   
>   	u32 mini_led_dev_id;
>   	u32 gpu_mux_dev_id;
> +
> +	bool requires_fan_curve;
>   };
>   
>   static struct asus_armoury_priv asus_armoury = {
> @@ -216,6 +218,22 @@ static int armoury_set_devstate(struct kobj_attribute *attr,
>   	u32 result;
>   	int err;
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
> +				pr_warn("PPT change requires an active fan curve on this model. Enable a custom fan curve first.\n");

To avoid userspace causing spam about this - I would say pr_warn_once().

> +				return -EBUSY;
> +			}
> +			break;
> +		}
> +	}
> +
>   	/*
>   	 * Prevent developers from bricking devices or issuing dangerous
>   	 * commands that can be difficult or impossible to recover from.
> @@ -1002,6 +1020,8 @@ static void init_rog_tunables(void)
>   		return;
>   	}
>   
> +	asus_armoury.requires_fan_curve = power_data->requires_fan_curve;
> +
>   	/* Initialize AC power tunables */
>   	ac_limits = power_data->ac_data;
>   	if (ac_limits) {
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 80144c412b90..b05218d31d90 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -341,6 +341,9 @@ struct asus_wmi {
>   /* Global to allow setting externally without requiring driver data */
>   static enum asus_ally_mcu_hack use_ally_mcu_hack = ASUS_WMI_ALLY_MCU_HACK_INIT;
>   
> +/* Global asus_wmi instance for use by exported functions */
> +static struct asus_wmi *asus_wmi_instance;

Why do you need a global?

This couldn't be part of "struct asus_wmi"?

> +
>   #if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>   static void asus_wmi_show_deprecated(void)
>   {
> @@ -4001,6 +4004,28 @@ static int asus_wmi_custom_fan_curve_init(struct asus_wmi *asus)
>   	return 0;
>   }
>   
> +/*
> + * Returns true if at least one custom fan curve is active
> + *
> + * Used by asus-armoury to check if PPT writes will be accepted by the BIOS
> + * on models that require an active fan curve for TDP changes.
> + */
> +bool asus_wmi_custom_fan_curve_is_enabled(void)
> +{
> +	struct asus_wmi *asus = asus_wmi_instance;
> +	struct fan_curve_data *curves;
> +
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
>   /* Throttle thermal policy ****************************************************/
>   static int throttle_thermal_policy_write(struct asus_wmi *asus)
>   {
> @@ -5156,6 +5181,8 @@ static int asus_wmi_add(struct platform_device *pdev)
>   
>   	asus_wmi_debugfs_init(asus);
>   
> +	asus_wmi_instance = asus;
> +
>   	return 0;
>   
>   fail_wmi_handler:
> @@ -5199,6 +5226,7 @@ static void asus_wmi_remove(struct platform_device *device)
>   	throttle_thermal_policy_set_default(asus);
>   	asus_wmi_battery_exit(asus);
>   
> +	asus_wmi_instance = NULL;
>   	kfree(asus);
>   }
>   
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 554f41b827e1..5d57293ced6c 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -196,6 +196,7 @@ int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
>   int asus_hid_register_listener(struct asus_hid_listener *cdev);
>   void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
>   int asus_hid_event(enum asus_hid_event event);
> +bool asus_wmi_custom_fan_curve_is_enabled(void);
>   #else
>   static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
>   {
> @@ -227,6 +228,10 @@ static inline int asus_hid_event(enum asus_hid_event event)
>   {
>   	return -ENODEV;
>   }
> +static inline bool asus_wmi_custom_fan_curve_is_enabled(void)
> +{
> +	return false;
> +}
>   #endif
>   
>   #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */

