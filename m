Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D69D3C109A;
	Thu, 17 Sep 2026 09:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637040; cv=none; b=A4YHrRdNiMIVk8xI/JbmF4KLoFZ0w2AgdHVhbvXx/FIMBgj+igs2zsNXLdHDJ7b68wRIuWDbTWJ03v8M+dPBrbYrpsih/CeFeJUgTxeUA/NaPZJkt5SOvuEMo+PDGrsoJZUVPwKGh7nyv8cyRrB3R9dcFNkUXH37NQnnBxHQh/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637040; c=relaxed/simple;
	bh=ronmL9j8sLeCIHUvKaDO6FQb+AYM0ax9RquGYX5eP7A=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Q8nanec1X34z8EGgYY+dxU0rLMGanDSMJzJ6kzJOHgeLL1Ug4G/oLiLQypC6gMnf9o+SIfKbuNzyJ4uHX/dAwndScl8FxsZgdn03Wr2oO6TZBapNKwTnpyWwLV3d4Vdrn83lTJq+ePJMtIp6jreVJX8DjyDwSpYQ407hj0JzD1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5A2uMbJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5A2uMbJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789637038; x=1821173038;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ronmL9j8sLeCIHUvKaDO6FQb+AYM0ax9RquGYX5eP7A=;
  b=V5A2uMbJmDw3GeDqin0CKQibvgIGgUxpTR8rIn6aH6FqYFbIP7XcrvFK
   elgBHP9l+J57OLFKBDzotOnoeVvQsdyEuGLbG724EfV0QZEfd9HyE51kD
   HXMrT9id5Thi6m2QHARdYmlRJAcAkzkVlLjyRIa7EtnKVBgt/yN8W4kko
   WN8FdkS7rxJZySlbQMoOvlS7/2ciaTD9m7bQtko1acoDU6UaU+FL/QYoI
   xTtSNJjyvFyQN6shyCZ9q6Dk2A6Y7tweyjJ16MKb3mhN//w/pPjpNjx72
   hM6twvtU0xVJ26cgPvEzPSU75u2sLe4UtmmMKuhKGwa32QEF10MG0b0KT
   Q==;
X-CSE-ConnectionGUID: BIGjoqDBQYGB1LJB5Qi9EA==
X-CSE-MsgGUID: uJ/eDwVjThKGHWAUNISqbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93866821"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93866821"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 02:23:57 -0700
X-CSE-ConnectionGUID: KcMJHDf6TjOmS10DY67a4A==
X-CSE-MsgGUID: FLuE6i6USNuKDnHWIoE6IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297162654"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 02:23:54 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Sep 2026 12:23:49 +0300 (EEST)
To: Denis Benato <denis.benato@linux.dev>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Hans de Goede <hansg@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, Luke Jones <luke@ljones.dev>, 
    busybox11 <busybox11th@gmail.com>, Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v1 1/2] platform/x86: asus-armoury: let attribute groups
 decide their own visibility
In-Reply-To: <20260916154210.181441-2-denis.benato@linux.dev>
Message-ID: <328b1420-374a-3c77-19ea-f9f7892070eb@linux.intel.com>
References: <20260916154210.181441-1-denis.benato@linux.dev> <20260916154210.181441-2-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Sep 2026, Denis Benato wrote:

> mini_led_mode, gpu_mux_mode and dgpu_disable are created by ad-hoc
> conditional blocks in asus_fw_attr_add() which must be manually tracked
> by the error and exit paths; those paths also re-probe WMI to know which
> groups were actually created.
> 
> Give attribute groups whose support depends on a resolved device ID
> their own .is_visible() callback: the group is created unconditionally
> and sysfs hides it entirely (SYSFS_GROUP_INVISIBLE) when the backing WMI
> device is not present. The new ASUS_ATTR_GROUP_BOOL_VIS() and
> ASUS_ATTR_GROUP_ENUM_VIS() macros declare such attribute groups.
> Creation and removal become symmetric, groups can be removed
> unconditionally since sysfs_remove_group() is a no-op for groups that
> were never created, and no WMI probe is needed outside of
> initialization.
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
>  drivers/platform/x86/asus-armoury.c | 111 +++++++++++++++++-----------
>  drivers/platform/x86/asus-armoury.h |  55 ++++++++++++++
>  2 files changed, 123 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index 2d5ca75bc727..8639902f084d 100644
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
> @@ -458,7 +459,13 @@ static ssize_t mini_led_mode_possible_values_show(struct kobject *kobj,
>  		return -ENODEV;
>  	}
>  }
> -ASUS_ATTR_GROUP_ENUM(mini_led_mode, "mini_led_mode", "Set the mini-LED backlight mode");
> +
> +static bool mini_led_mode_group_visible(struct kobject *kobj)
> +{
> +	return asus_armoury.mini_led_dev_id;
> +}
> +
> +ASUS_ATTR_GROUP_ENUM_VIS(mini_led_mode, "mini_led_mode", "Set the mini-LED backlight mode");
>  
>  static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
>  						struct kobj_attribute *attr,
> @@ -471,8 +478,8 @@ static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
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
> @@ -502,7 +509,13 @@ static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
>  	return count;
>  }
>  ASUS_WMI_SHOW_INT(gpu_mux_mode_current_value, asus_armoury.gpu_mux_dev_id);
> -ASUS_ATTR_GROUP_BOOL(gpu_mux_mode, "gpu_mux_mode", "Set the GPU display MUX mode");
> +
> +static bool gpu_mux_mode_group_visible(struct kobject *kobj)
> +{
> +	return asus_armoury.gpu_mux_dev_id;
> +}
> +
> +ASUS_ATTR_GROUP_BOOL_VIS(gpu_mux_mode, "gpu_mux_mode", "Set the GPU display MUX mode");
>  
>  static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
>  						struct kobj_attribute *attr, const char *buf,
> @@ -538,7 +551,8 @@ static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
>  	}
>  
>  	scoped_guard(mutex, &asus_armoury.egpu_mutex) {
> -		err = armoury_set_devstate(attr, disable ? 1 : 0, NULL, ASUS_WMI_DEVID_DGPU);
> +		err = armoury_set_devstate(attr, disable ? 1 : 0, NULL,
> +					   asus_armoury.dgpu_disable_dev_id);
>  		if (err)
>  			return err;
>  	}
> @@ -547,8 +561,14 @@ static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
>  
>  	return count;
>  }
> -ASUS_WMI_SHOW_INT(dgpu_disable_current_value, ASUS_WMI_DEVID_DGPU);
> -ASUS_ATTR_GROUP_BOOL(dgpu_disable, "dgpu_disable", "Disable the dGPU");
> +
> +static bool dgpu_disable_group_visible(struct kobject *kobj)
> +{
> +	return asus_armoury.dgpu_disable_dev_id;
> +}
> +
> +ASUS_WMI_SHOW_INT(dgpu_disable_current_value, asus_armoury.dgpu_disable_dev_id);
> +ASUS_ATTR_GROUP_BOOL_VIS(dgpu_disable, "dgpu_disable", "Disable the dGPU");
>  
>  /* Values map for eGPU activation requests. */
>  static u32 egpu_status_map[] = {
> @@ -823,7 +843,6 @@ ASUS_ATTR_GROUP_INT_VALUE_ONLY_RO(nv_base_tgp, ATTR_NV_BASE_TGP, ASUS_WMI_DEVID_
>  static const struct asus_attr_group armoury_attr_groups[] = {
>  	{ &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
>  	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
> -	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },

The point with .is_visible is that you don't need to remove these from 
this array because they'll appear selectively under sysfs even if you list 
all of them here.

>  	{ &dgpu_power_state_attr_group, ASUS_WMI_DEVID_DGPU_POWER_STATE },
>  	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
>  
> @@ -938,34 +957,46 @@ static int asus_fw_attr_add(void)
>  		goto err_destroy_kset;
>  	}
>  
> +	/*
> +	 * Device IDs with model-dependent alternatives are resolved once
> +	 * here: their attribute groups then decide visibility themselves
> +	 * through .is_visible.
> +	 */
>  	asus_armoury.mini_led_dev_id = 0;
>  	if (armoury_has_devstate(ASUS_WMI_DEVID_MINI_LED_MODE))
>  		asus_armoury.mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
>  	else if (armoury_has_devstate(ASUS_WMI_DEVID_MINI_LED_MODE2))
>  		asus_armoury.mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE2;
>  
> -	if (asus_armoury.mini_led_dev_id) {
> -		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
> -					 &mini_led_mode_attr_group);
> -		if (err) {
> -			pr_err("Failed to create sysfs-group for mini_led\n");
> -			goto err_remove_file;
> -		}
> -	}
> -
>  	asus_armoury.gpu_mux_dev_id = 0;
>  	if (armoury_has_devstate(ASUS_WMI_DEVID_GPU_MUX))
>  		asus_armoury.gpu_mux_dev_id = ASUS_WMI_DEVID_GPU_MUX;
>  	else if (armoury_has_devstate(ASUS_WMI_DEVID_GPU_MUX_VIVO))
>  		asus_armoury.gpu_mux_dev_id = ASUS_WMI_DEVID_GPU_MUX_VIVO;
>  
> -	if (asus_armoury.gpu_mux_dev_id) {
> -		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
> -					 &gpu_mux_mode_attr_group);
> -		if (err) {
> -			pr_err("Failed to create sysfs-group for gpu_mux\n");
> -			goto err_remove_mini_led_group;
> -		}
> +	asus_armoury.dgpu_disable_dev_id = 0;
> +	if (armoury_has_devstate(ASUS_WMI_DEVID_DGPU))
> +		asus_armoury.dgpu_disable_dev_id = ASUS_WMI_DEVID_DGPU;
> +
> +	err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
> +				 &mini_led_mode_attr_group);
> +	if (err) {
> +		pr_err("Failed to create sysfs-group for mini_led\n");
> +		goto err_remove_file;
> +	}
> +
> +	err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
> +				 &gpu_mux_mode_attr_group);
> +	if (err) {
> +		pr_err("Failed to create sysfs-group for gpu_mux\n");
> +		goto err_remove_mini_led_group;
> +	}
> +
> +	err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
> +				 &dgpu_disable_attr_group);
> +	if (err) {
> +		pr_err("Failed to create sysfs-group for dgpu_disable\n");
> +		goto err_remove_gpu_mux_group;
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
> @@ -1000,16 +1031,14 @@ static int asus_fw_attr_add(void)
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
> +	while (i--)
> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
> +				   armoury_attr_groups[i].attr_group);
> +	sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &dgpu_disable_attr_group);
> +err_remove_gpu_mux_group:
> +	sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
>  err_remove_mini_led_group:
> -	if (asus_armoury.mini_led_dev_id)
> -		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
> +	sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
>  err_remove_file:
>  	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.attr);
>  err_destroy_kset:
> @@ -1182,17 +1211,13 @@ static void __exit asus_fw_exit(void)
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
> +	for (i = ARRAY_SIZE(armoury_attr_groups) - 1; i >= 0; i--)
> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
> +				   armoury_attr_groups[i].attr_group);
>  
> -	if (asus_armoury.mini_led_dev_id)
> -		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
> +	sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &dgpu_disable_attr_group);
> +	sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
> +	sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
>  
>  	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.attr);
>  	kset_unregister(asus_armoury.fw_attr_kset);
> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
> index 6dfe5ddfe4ac..44d12f20cd3c 100644
> --- a/drivers/platform/x86/asus-armoury.h
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -198,6 +198,61 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, struct kobj_attribute *attr
>  		.name = _fsname, .attrs = _attrname##_attrs			\
>  	}
>  
> +/*
> + * Same as ASUS_ATTR_GROUP_BOOL() but the whole attribute group is
> + * created only when <name>_group_visible() returns true.
> + * Requires <name>_current_value_show(), <name>_current_value_store()
> + * and <name>_group_visible()
> + */
> +#define ASUS_ATTR_GROUP_BOOL_VIS(_attrname, _fsname, _dispname)		\
> +	DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(_attrname)			\
> +	static struct kobj_attribute attr_##_attrname##_current_value =	\
> +		__ASUS_ATTR_RW(_attrname, current_value);		\
> +	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);	\
> +	__ATTR_SHOW_FMT(possible_values, _attrname, "%s\n", "0;1");	\
> +	static struct kobj_attribute attr_##_attrname##_type =		\
> +		__ASUS_ATTR_RO_AS(type, enum_type_show);		\
> +	static struct attribute *_attrname##_attrs[] = {		\
> +		&attr_##_attrname##_current_value.attr,			\
> +		&attr_##_attrname##_display_name.attr,			\
> +		&attr_##_attrname##_possible_values.attr,		\
> +		&attr_##_attrname##_type.attr,				\
> +		NULL							\
> +	};								\
> +	static const struct attribute_group _attrname##_attr_group = {	\
> +		.name = _fsname,					\
> +		.is_visible = SYSFS_GROUP_VISIBLE(_attrname),		\
> +		.attrs = _attrname##_attrs				\
> +	}
> +
> +/*
> + * Same as ASUS_ATTR_GROUP_ENUM() but the whole attribute group is
> + * created only when <name>_group_visible() returns true.
> + * Requires <name>_current_value_show(), <name>_current_value_store(),
> + * <name>_possible_values_show() and <name>_group_visible()
> + */
> +#define ASUS_ATTR_GROUP_ENUM_VIS(_attrname, _fsname, _dispname)		\
> +	DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(_attrname)			\
> +	static struct kobj_attribute attr_##_attrname##_current_value =	\
> +		__ASUS_ATTR_RW(_attrname, current_value);		\
> +	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);	\
> +	static struct kobj_attribute attr_##_attrname##_possible_values =\
> +		__ASUS_ATTR_RO(_attrname, possible_values);		\
> +	static struct kobj_attribute attr_##_attrname##_type =		\
> +		__ASUS_ATTR_RO_AS(type, enum_type_show);		\
> +	static struct attribute *_attrname##_attrs[] = {		\
> +		&attr_##_attrname##_current_value.attr,			\
> +		&attr_##_attrname##_display_name.attr,			\
> +		&attr_##_attrname##_possible_values.attr,		\
> +		&attr_##_attrname##_type.attr,				\
> +		NULL							\
> +	};								\
> +	static const struct attribute_group _attrname##_attr_group = {	\
> +		.name = _fsname,					\
> +		.is_visible = SYSFS_GROUP_VISIBLE(_attrname),		\
> +		.attrs = _attrname##_attrs				\
> +	}
> +
>  #define ASUS_ATTR_GROUP_INT_VALUE_ONLY_RO(_attrname, _fsname, _wmi, _dispname)	\
>  	ASUS_WMI_SHOW_INT(_attrname##_current_value, _wmi);		\
>  	static struct kobj_attribute attr_##_attrname##_current_value =		\
> 

-- 
 i.

