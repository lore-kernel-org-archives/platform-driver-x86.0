Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071D9431A34;
	Wed, 23 Sep 2026 09:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157171; cv=none; b=RiOBFf2J802qSaU5YDGGGTyCb9Kw+G7kIYgjvQ8aQtN7t3kKtp8d+mGbp9zq3KbI8GQqlRgJs5q3u2C1tTfn9HEqxnImKqoBO1hK3/RP3yatNdSoDAVAlupFBNd6EkRmISDyhJ9qD0MvWWYT7cGHTn0nI17TSvULu/IaimprCiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157171; c=relaxed/simple;
	bh=UxCGGn311cc2Jvhrqzk3QSy05GadeZY5xWaQDoN9nc8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=anqgQSAnWI3VV68BZoXPx41BMTZ7CF5r3QeTvVQFGSvy9HZNVSnUMxYJQ0fyqG1zWywOLnLhxz31frage0b089Z1bqJ5gmKYg62JowYpQ9g6bx0OvYZ5SRgq/H7YFRW+QjKghPh/kgD8xB0IKXjVbMxRXS3bkNeLIQRG7+MhdVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZBED21fs; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZBED21fs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790157169; x=1821693169;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=UxCGGn311cc2Jvhrqzk3QSy05GadeZY5xWaQDoN9nc8=;
  b=ZBED21fsstg24E6uytI+Cn0Hb3pvAULyXkjs8sWaIi94yukFafP6Wlui
   hh8ihP9enmoOnuQl0kOd2yNvM+oh6eIUS/Qc8+WxwhWfQwifcaCK8/9Qh
   Bg/ribSkuxtJQ6NAsR7VIOTWV+X1FxbirobpI4RgFCGBvMs2bVeC4Yixo
   000eYkcXVAjFrIOCZH6zhmxfIcQESrs5tyxdmkzji7Yy24I1y8Aw5tMnF
   SMLOq64TnfIy3qRug7MqMlRxcg3pHwbZP6A+Qf1KuzmjPcDaOxllAALjv
   Y3kPrDYHylebD5CYFBB8qJkaa9jXQ1voTtpDjWovwvXs5Ky5CQiv8OXqM
   g==;
X-CSE-ConnectionGUID: uMFZYxYGSoi6m6tvCN2fVg==
X-CSE-MsgGUID: 45uYYh+QRQWViFX5WcLfRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1328812"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1328812"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 02:52:48 -0700
X-CSE-ConnectionGUID: zPE61t1KSd+4FNxCHXyBOg==
X-CSE-MsgGUID: P1GSw+kbSlO0Pbmc9k/9Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4812662"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.13])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 02:52:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 23 Sep 2026 12:52:41 +0300 (EEST)
To: Denis Benato <denis.benato@linux.dev>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Hans de Goede <hansg@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, Luke Jones <luke@ljones.dev>, 
    busybox11 <busybox11th@gmail.com>, Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v2 1/2] platform/x86: asus-armoury: let attribute groups
 decide their own visibility
In-Reply-To: <20260923004706.41256-2-denis.benato@linux.dev>
Message-ID: <89fb00c7-9fbf-c567-f081-5ae831f8915a@linux.intel.com>
References: <20260923004706.41256-1-denis.benato@linux.dev> <20260923004706.41256-2-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Sep 2026, Denis Benato wrote:

> mini_led_mode, gpu_mux_mode and dgpu_disable are created by ad-hoc
> conditional blocks in asus_fw_attr_add() which must be manually tracked
> by the error and exit paths; those paths also re-probe WMI to know which
> groups were actually created.
> 
> Give every attribute group its own .is_visible() callback: all groups
> are created unconditionally through the common loop and sysfs hides the
> unsupported ones entirely. The plain group macros now gate their
> visibility on the WMI presence of their device, the
> ASUS_ATTR_GROUP_BOOL() and ASUS_ATTR_GROUP_ENUM() macros declare groups
> backed by a device ID resolved at probe time, and the power tunable
> macros are additionally gated on the platform limits defining a max
> value, replacing the special-casing in asus_fw_attr_add() and with it
> is_power_tunable_attr().
> 
> The dgpu_disable attribute now goes through the same resolved device ID
> scheme as mini_led_mode and gpu_mux_mode, storing the device ID to use
> in asus_armoury.dgpu_disable_dev_id instead of always operating on
> ASUS_WMI_DEVID_DGPU.
> 
> No functional change is intended.
> 
> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> ---
>  drivers/platform/x86/asus-armoury.c | 280 +++++++++++-----------------
>  drivers/platform/x86/asus-armoury.h | 124 +++++++++---
>  2 files changed, 213 insertions(+), 191 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index 2d5ca75bc727..7812e93734b8 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -94,6 +94,7 @@ struct asus_armoury_priv {
>  
>  	u32 mini_led_dev_id;
>  	u32 gpu_mux_dev_id;
> +	u32 dgpu_disable_dev_id;
>  
>  	bool requires_fan_curve;
>  };
> @@ -110,11 +111,6 @@ static struct fw_attrs_group fw_attrs = {
>  	.pending_reboot = false,
>  };
>  
> -struct asus_attr_group {
> -	const struct attribute_group *attr_group;
> -	u32 wmi_devid;
> -};
> -
>  static void asus_set_reboot_and_signal_event(void)
>  {
>  	fw_attrs.pending_reboot = true;
> @@ -458,6 +454,12 @@ static ssize_t mini_led_mode_possible_values_show(struct kobject *kobj,
>  		return -ENODEV;
>  	}
>  }
> +
> +static bool mini_led_mode_group_visible(struct kobject *kobj)
> +{
> +	return asus_armoury.mini_led_dev_id;
> +}
> +
>  ASUS_ATTR_GROUP_ENUM(mini_led_mode, "mini_led_mode", "Set the mini-LED backlight mode");
>  
>  static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
> @@ -471,8 +473,8 @@ static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
>  	if (err)
>  		return err;
>  
> -	if (armoury_has_devstate(ASUS_WMI_DEVID_DGPU)) {
> -		err = armoury_get_devstate(NULL, &result, ASUS_WMI_DEVID_DGPU);
> +	if (asus_armoury.dgpu_disable_dev_id) {
> +		err = armoury_get_devstate(NULL, &result, asus_armoury.dgpu_disable_dev_id);
>  		if (err)
>  			return err;
>  		if (result && !optimus) {
> @@ -502,6 +504,12 @@ static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
>  	return count;
>  }
>  ASUS_WMI_SHOW_INT(gpu_mux_mode_current_value, asus_armoury.gpu_mux_dev_id);
> +
> +static bool gpu_mux_mode_group_visible(struct kobject *kobj)
> +{
> +	return asus_armoury.gpu_mux_dev_id;
> +}
> +
>  ASUS_ATTR_GROUP_BOOL(gpu_mux_mode, "gpu_mux_mode", "Set the GPU display MUX mode");
>  
>  static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
> @@ -538,7 +546,8 @@ static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
>  	}
>  
>  	scoped_guard(mutex, &asus_armoury.egpu_mutex) {
> -		err = armoury_set_devstate(attr, disable ? 1 : 0, NULL, ASUS_WMI_DEVID_DGPU);
> +		err = armoury_set_devstate(attr, disable ? 1 : 0, NULL,
> +					   asus_armoury.dgpu_disable_dev_id);
>  		if (err)
>  			return err;
>  	}
> @@ -547,7 +556,13 @@ static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
>  
>  	return count;
>  }
> -ASUS_WMI_SHOW_INT(dgpu_disable_current_value, ASUS_WMI_DEVID_DGPU);
> +
> +static bool dgpu_disable_group_visible(struct kobject *kobj)
> +{
> +	return asus_armoury.dgpu_disable_dev_id;
> +}
> +
> +ASUS_WMI_SHOW_INT(dgpu_disable_current_value, asus_armoury.dgpu_disable_dev_id);
>  ASUS_ATTR_GROUP_BOOL(dgpu_disable, "dgpu_disable", "Disable the dGPU");
>  
>  /* Values map for eGPU activation requests. */
> @@ -695,6 +710,12 @@ static ssize_t egpu_enable_possible_values_show(struct kobject *kobj, struct kob
>  {
>  	return armoury_attr_enum_list(buf, ARRAY_SIZE(egpu_status_map));
>  }
> +
> +static bool egpu_enable_group_visible(struct kobject *kobj)
> +{
> +	return armoury_has_devstate(ASUS_WMI_DEVID_EGPU);
> +}
> +
>  ASUS_ATTR_GROUP_ENUM(egpu_enable, "egpu_enable", "Enable the eGPU (also disables dGPU)");
>  
>  /* Device memory available to APU */
> @@ -771,6 +792,12 @@ static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_at
>  {
>  	return armoury_attr_enum_list(buf, ARRAY_SIZE(apu_mem_map));
>  }
> +
> +static bool apu_mem_group_visible(struct kobject *kobj)
> +{
> +	return armoury_has_devstate(ASUS_WMI_DEVID_APU_MEM);
> +}
> +
>  ASUS_ATTR_GROUP_ENUM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
>  
>  /* Define helper to access the current power mode tunable values */
> @@ -782,6 +809,44 @@ static inline struct rog_tunables *get_current_tunables(void)
>  	return asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC];
>  }
>  
> +/**
> + * has_valid_limit - Checks if a power-related attribute has a valid limit value
> + * @name: The name of the attribute to check
> + * @limits: Pointer to the power_limits structure containing limit values
> + *
> + * This function checks if a power-related attribute has a valid limit value.
> + * It returns false if limits is NULL or if the corresponding limit value is zero.
> + *
> + * Return: true if the attribute has a valid limit value, false otherwise
> + */
> +static bool has_valid_limit(const char *name, const struct power_limits *limits)
> +{
> +	u32 limit_value = 0;
> +
> +	if (!limits)
> +		return false;
> +
> +	if (!strcmp(name, ATTR_PPT_PL1_SPL))
> +		limit_value = limits->ppt_pl1_spl_max;
> +	else if (!strcmp(name, ATTR_PPT_PL2_SPPT))
> +		limit_value = limits->ppt_pl2_sppt_max;
> +	else if (!strcmp(name, ATTR_PPT_PL3_FPPT))
> +		limit_value = limits->ppt_pl3_fppt_max;
> +	else if (!strcmp(name, ATTR_PPT_APU_SPPT))
> +		limit_value = limits->ppt_apu_sppt_max;
> +	else if (!strcmp(name, ATTR_PPT_PLATFORM_SPPT))
> +		limit_value = limits->ppt_platform_sppt_max;
> +	else if (!strcmp(name, ATTR_NV_DYNAMIC_BOOST))
> +		limit_value = limits->nv_dynamic_boost_max;
> +	else if (!strcmp(name, ATTR_NV_TEMP_TARGET))
> +		limit_value = limits->nv_temp_target_max;
> +	else if (!strcmp(name, ATTR_NV_BASE_TGP) ||
> +		 !strcmp(name, ATTR_NV_TGP))
> +		limit_value = limits->nv_tgp_max;
> +
> +	return limit_value > 0;
> +}

This is a plain move, right? Can you move it in a preparatory patch to 
cut the extra churn from what is already a very complicated diff.

> +
>  /* Simple attribute creation */
>  ASUS_ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2\n",
>  			    "Show the current mode of charging");
> @@ -819,103 +884,35 @@ ASUS_ATTR_GROUP_ROG_TUNABLE(nv_tgp, "nv_tgp", ASUS_WMI_DEVID_DGPU_SET_TGP,
>  ASUS_ATTR_GROUP_INT_VALUE_ONLY_RO(nv_base_tgp, ATTR_NV_BASE_TGP, ASUS_WMI_DEVID_DGPU_BASE_TGP,
>  				  "Read the base TGP value");
>  
> -/* If an attribute does not require any special case handling add it here */
> -static const struct asus_attr_group armoury_attr_groups[] = {
> -	{ &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
> -	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
> -	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
> -	{ &dgpu_power_state_attr_group, ASUS_WMI_DEVID_DGPU_POWER_STATE },
> -	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
> -
> -	{ &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
> -	{ &ppt_pl2_sppt_attr_group, ASUS_WMI_DEVID_PPT_PL2_SPPT },
> -	{ &ppt_pl3_fppt_attr_group, ASUS_WMI_DEVID_PPT_PL3_FPPT },
> -	{ &ppt_apu_sppt_attr_group, ASUS_WMI_DEVID_PPT_APU_SPPT },
> -	{ &ppt_platform_sppt_attr_group, ASUS_WMI_DEVID_PPT_PLAT_SPPT },
> -	{ &nv_dynamic_boost_attr_group, ASUS_WMI_DEVID_NV_DYN_BOOST },
> -	{ &nv_temp_target_attr_group, ASUS_WMI_DEVID_NV_THERM_TARGET },
> -	{ &nv_base_tgp_attr_group, ASUS_WMI_DEVID_DGPU_BASE_TGP },
> -	{ &nv_tgp_attr_group, ASUS_WMI_DEVID_DGPU_SET_TGP },
> -
> -	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
> -	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
> -	{ &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
> -	{ &panel_od_attr_group, ASUS_WMI_DEVID_PANEL_OD },
> -	{ &panel_hd_mode_attr_group, ASUS_WMI_DEVID_PANEL_HD },
> -	{ &screen_auto_brightness_attr_group, ASUS_WMI_DEVID_SCREEN_AUTO_BRIGHTNESS },
> +static const struct attribute_group *armoury_attr_groups[] = {
> +	&mini_led_mode_attr_group,
> +	&gpu_mux_mode_attr_group,
> +	&egpu_connected_attr_group,
> +	&egpu_enable_attr_group,
> +	&dgpu_disable_attr_group,
> +	&dgpu_power_state_attr_group,
> +	&apu_mem_attr_group,
> +
> +	&ppt_pl1_spl_attr_group,
> +	&ppt_pl2_sppt_attr_group,
> +	&ppt_pl3_fppt_attr_group,
> +	&ppt_apu_sppt_attr_group,
> +	&ppt_platform_sppt_attr_group,
> +	&nv_dynamic_boost_attr_group,
> +	&nv_temp_target_attr_group,
> +	&nv_base_tgp_attr_group,
> +	&nv_tgp_attr_group,
> +
> +	&charge_mode_attr_group,
> +	&boot_sound_attr_group,
> +	&mcu_powersave_attr_group,
> +	&panel_od_attr_group,
> +	&panel_hd_mode_attr_group,
> +	&screen_auto_brightness_attr_group,
>  };

This looks much better.

Now can you also add the terminating NULL to the array and try to use 
sysfs_create/remove_groups() so you can eliminate the create, rollback, 
and remove loops... I suggest you do it on top of this patch as this 
change is already quite complicated and logically 
sysfs_create/remove_group() -> sysfs_create/remove_groups() is a separate 
transition.

>  	for (i = 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
> -		if (!armoury_has_devstate(armoury_attr_groups[i].wmi_devid))
> -			continue;
> -
> -		/* Always create by default, unless PPT is not present */
> -		should_create = true;
> -		name = armoury_attr_groups[i].attr_group->name;
> -
> -		/* Check if this is a power-related tunable requiring limits */
> -		if (ac_rog_tunables && ac_rog_tunables->power_limits &&
> -		    is_power_tunable_attr(name)) {
> -			limits = ac_rog_tunables->power_limits;
> -			/* Check only AC: if not present then DC won't be either */
> -			should_create = has_valid_limit(name, limits);
> -			if (!should_create)
> -				pr_debug("Missing max value for tunable %s\n", name);
> -		}
> -
> -		if (should_create) {
> -			err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
> -						 armoury_attr_groups[i].attr_group);
> -			if (err) {
> -				pr_err("Failed to create sysfs-group for %s\n",
> -				       armoury_attr_groups[i].attr_group->name);
> -				goto err_remove_groups;
> -			}
> +		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
> +					 armoury_attr_groups[i]);
> +		if (err) {
> +			pr_err("Failed to create sysfs-group for %s\n",
> +			       armoury_attr_groups[i]->name);
> +			goto err_remove_groups;
>  		}
>  	}
>  
>  	return 0;
>  
>  err_remove_groups:
> -	while (i--) {
> -		if (armoury_has_devstate(armoury_attr_groups[i].wmi_devid))
> -			sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
> -					   armoury_attr_groups[i].attr_group);
> -	}
> -	if (asus_armoury.gpu_mux_dev_id)
> -		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
> -err_remove_mini_led_group:
> -	if (asus_armoury.mini_led_dev_id)
> -		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
> -err_remove_file:
> +	while (i--)
> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
> +				   armoury_attr_groups[i]);
>  	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.attr);
>  err_destroy_kset:
>  	kset_unregister(asus_armoury.fw_attr_kset);
> @@ -1182,17 +1138,9 @@ static void __exit asus_fw_exit(void)
>  {
>  	int i;
>  
> -	for (i = ARRAY_SIZE(armoury_attr_groups) - 1; i >= 0; i--) {
> -		if (armoury_has_devstate(armoury_attr_groups[i].wmi_devid))
> -			sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
> -					   armoury_attr_groups[i].attr_group);
> -	}
> -
> -	if (asus_armoury.gpu_mux_dev_id)
> -		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
> -
> -	if (asus_armoury.mini_led_dev_id)
> -		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
> +	for (i = ARRAY_SIZE(armoury_attr_groups) - 1; i >= 0; i--)
> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
> +				   armoury_attr_groups[i]);

-- 
 i.

