Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE1C36681D;
	Tue, 24 Feb 2026 08:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771922885; cv=none; b=imnxfqYctHlxWTgf9d5r4mqGJerVqH6f7CdESAVfPV/euANY/vPvDgXEr4LzgU/BEupMPVdcYTpE88dQkGfn4EfooBb6xik9OsNeUSoqbLt48+vgAMombzzmY4oanKVrb+IRG6E49yQvlW17pDGCngmQQ7TpO9e4haBuHqIHytc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771922885; c=relaxed/simple;
	bh=Bpe3tPZzLRi4iAjU9LejxtIrnjxoj20+dkLI3Sxi1iA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lXTP29ZcDbTpPA6TtDP5PgLEq7PNLN2j/DT0MTDDDiiG0I8X5TraV9uyls+3I3OO5OAY6xL+aHl71Lb2L8Z5U5a/0Ia029jHxB9EY8sXTjeW/E3CmESUF5ZKYDSNxjb7X2J+CZ5w5VzHrxkqbZUGecm/t+D4Mey93/9qKDaHEEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ViVp0rb6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ViVp0rb6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771922884; x=1803458884;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Bpe3tPZzLRi4iAjU9LejxtIrnjxoj20+dkLI3Sxi1iA=;
  b=ViVp0rb6wt/0sxtpKIkg87Jiv+EmFQs8EEtU9HSL7oHH6TDlIhEZRn1D
   Exvn458o+hI8uO7EwfMIdQ2AEeT0wZvwtz0vibWr1fNSQmQv1DyyZm6iw
   6NeE2QbrDKiZchNS0n6F397yqDgDIFXjGs3XmuCIwwMra/hTF6/sRGCxr
   0JERNq9TMQiQRn+roq4CsyKkpv0OydmlHZq07MZRzXYP/fAnWWHwHb+kB
   b8EOwy3unBfD8pPrwnAhMUOMY1FpcykY2oCQNi1w8aavVpnRg+qT2wPU+
   O1h/VAUniQU8FWNmc7ue+wD8tCTuy/w55pQYyVYq/YHxZea1ZlVQQxsx9
   Q==;
X-CSE-ConnectionGUID: jrAaaaxXRGmBl7tNE09XTw==
X-CSE-MsgGUID: 08HyNM+ST6yuIx/d2oWoCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83642735"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="83642735"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 00:48:03 -0800
X-CSE-ConnectionGUID: gFlwl1K/RJyOlQ8/as5D7g==
X-CSE-MsgGUID: Uw7oT+3cT4qzupGIJ0eMWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="215854718"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.133])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 00:48:00 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Feb 2026 10:47:56 +0200 (EET)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
    Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/6] platform/x86: lenovo-wmi-other: Limit adding
 attributes to supported devices
In-Reply-To: <20260224043200.2680384-3-derekjohn.clark@gmail.com>
Message-ID: <d5928a3f-37e8-fdb1-2aa3-ffd9f9250d34@linux.intel.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com> <20260224043200.2680384-3-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Feb 2026, Derek J. Clark wrote:

> Adds lwmi_is_attr_01_supported, and only creates the attribute subfolder
> if the attribute is supported by the hardware. Due to some poorly
> implemented BIOS, this is a multi-step sequence of events. This is
> because:
> - Some BIOS support getting the capability data from custom mode (0xff),
>   while others only support it in no-mode (0x00).
> - Similarly, some BIOS support get/set for the current value from custom
>   mode (0xff), while others only support it in no-mode (0x00).
> - Some BIOS report capability data for a method that is not fully
>   implemented.
> - Some BIOS have methods fully implemented, but no complimentary
>   capability data.
> 
> To ensure we only expose fully implemented methods with corresponding
> capability data, we check each outcome before reporting that an
> attribute can be supported.
> 
> Checking for lwmi_is_attr_01_supported during remove is not done to
> ensure that we don't attempt to call cd01 or send WMI events if one of
> the interfaces being removed was the cause of the driver unloading.
> 

> While adding members to tunable_attr_01, remove unused capdata pointer
> and limit size of all ID's to the appropriate size.

Please don't mix changes like this. Create a seprate patch for it.

> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Reported-by: Kurt Borja <kuurtb@gmail.com>
> Closes: https://lore.kernel.org/platform-driver-x86/DG60P3SHXR8H.3NSEHMZ6J7XRC@gmail.com/
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
>  drivers/platform/x86/lenovo/wmi-other.c | 117 +++++++++++++++++++++---
>  1 file changed, 102 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
> index 95886df39c8d..f3f12303e379 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -545,11 +545,12 @@ static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct cd_list *
>  /* ======== fw_attributes (component: lenovo-wmi-capdata 01) ======== */
>  
>  struct tunable_attr_01 {
> -	struct capdata01 *capdata;
>  	struct device *dev;
> -	u32 feature_id;
> -	u32 device_id;
> -	u32 type_id;
> +	u8 feature_id;
> +	u8 device_id;
> +	u8 type_id;
> +	u8 cd_mode_id; /* mode arg for searching capdata */
> +	u8 cv_mode_id; /* mode arg for set/get current_value */
>  };
>  
>  static struct tunable_attr_01 ppt_pl1_spl = {
> @@ -716,7 +717,7 @@ static ssize_t attr_capdata01_show(struct kobject *kobj,
>  	int value, ret;
>  
>  	attribute_id = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
> -				    LWMI_GZ_THERMAL_MODE_CUSTOM, tunable_attr->type_id);
> +				    tunable_attr->cd_mode_id, tunable_attr->type_id);
>  
>  	ret = lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
>  	if (ret)
> @@ -782,7 +783,7 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
>  		return -EBUSY;
>  
>  	args.arg0 = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
> -				 mode, tunable_attr->type_id);
> +				 tunable_attr->cd_mode_id, tunable_attr->type_id);
>  
>  	ret = lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
>  	if (ret)
> @@ -795,6 +796,8 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
>  	if (value < capdata.min_value || value > capdata.max_value)
>  		return -EINVAL;
>  
> +	args.arg0 = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
> +				 tunable_attr->cv_mode_id, tunable_attr->type_id);
>  	args.arg1 = value;
>  
>  	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
> @@ -828,13 +831,16 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
>  	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
>  	struct wmi_method_args_32 args;
>  	enum thermal_mode mode;
> -	int retval;
> -	int ret;
> +	int retval, ret;
>  
>  	ret = lwmi_om_notifier_call(&mode);
>  	if (ret)
>  		return ret;
>  
> +	/* If "no-mode" is the supported mode, ensure we never send current mode */
> +	if (tunable_attr->cv_mode_id == LWMI_GZ_THERMAL_MODE_NONE)
> +		mode = tunable_attr->cv_mode_id;
> +
>  	args.arg0 = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
>  				 mode, tunable_attr->type_id);
>  
> @@ -847,6 +853,85 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
>  	return sysfs_emit(buf, "%d\n", retval);
>  }
>  
> +/**
> + * lwmi_attr_01_is_supported() - Determine if the given attribute is supported.
> + * @tunable_attr: The attribute to verify.
> + *
> + * First check if the attribute has a corresponding capdata01 table in the cd01
> + * module under the "custom" mode (0xff). If that is not present then check if
> + * there is a corresponding "no-mode" (0x00) entry. If either of those passes,
> + * check capdata->supported for values > 0. If capdata is available, attempt to
> + * determine the set/get mode for the current value property using a similar
> + * pattern. If the value returned by either custom or no-mode is 0, or we get
> + * an error, we assume that mode is not supported. If any of the above checks
> + * fail then the attribute is not fully supported.
> + *
> + * The probed cd_mode_id/cv_mode_id are stored on the tunable_attr for later
> + * reference.
> + *
> + * Return: Support level, or an error code.
> + */
> +static int lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
> +{
> +	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
> +	u8 mode = LWMI_GZ_THERMAL_MODE_CUSTOM;
> +	struct wmi_method_args_32 args;
> +	struct capdata01 capdata;
> +	int retval, ret;
> +
> +	/* Determine tunable_attr->cd_mode_id */
> +no_mode_fallback_1:
> +	args.arg0 = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
> +				 mode, tunable_attr->type_id);
> +
> +	ret = lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
> +	if (ret && mode) {
> +		dev_dbg(tunable_attr->dev, "Attribute id %x not supported\n", args.arg0);

Add include.

> +		mode = LWMI_GZ_THERMAL_MODE_NONE;
> +		goto no_mode_fallback_1;

Is it possible to make a helper so you don't need these back gotos?

> +	}
> +	if (ret)
> +		goto not_supported;
> +	if (!capdata.supported) {
> +		ret = -EOPNOTSUPP;
> +		goto not_supported;
> +	}
> +
> +	tunable_attr->cd_mode_id = mode;
> +
> +	/* Determine tunable_attr->cv_mode_id */
> +	mode = LWMI_GZ_THERMAL_MODE_CUSTOM;
> +no_mode_fallback_2:
> +	args.arg0 = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
> +				 mode, tunable_attr->type_id);
> +
> +	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
> +				    (unsigned char *)&args, sizeof(args),
> +				    &retval);
> +	if ((ret && mode) || (!retval && mode)) {
> +		dev_dbg(tunable_attr->dev, "Attribute id %x not supported\n", args.arg0);
> +		mode = LWMI_GZ_THERMAL_MODE_NONE;
> +		goto no_mode_fallback_2;

Same question here?

> +	}
> +	if (ret)
> +		goto not_supported;
> +	if (retval == 0) {
> +		ret = -EOPNOTSUPP;
> +		goto not_supported;
> +	}
> +
> +	tunable_attr->cv_mode_id = mode;
> +	dev_dbg(tunable_attr->dev, "cd_mode_id: %02x%02x%02x%02x, cv_mode_id: %#08x attribute support level: %x\n",
> +		tunable_attr->device_id, tunable_attr->feature_id, tunable_attr->cd_mode_id,
> +		tunable_attr->type_id, args.arg0, capdata.supported);
> +
> +	return capdata.supported;
> +
> +not_supported:
> +	dev_dbg(tunable_attr->dev, "Attribute id %x not supported\n", args.arg0);
> +	return ret;
> +}
> +
>  /* Lenovo WMI Other Mode Attribute macros */
>  #define __LWMI_ATTR_RO(_func, _name)                                  \
>  	{                                                             \
> @@ -970,19 +1055,21 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
> -		err = sysfs_create_group(&priv->fw_attr_kset->kobj,
> -					 cd01_attr_groups[i].attr_group);
> -		if (err)
> -			goto err_remove_groups;
> -
>  		cd01_attr_groups[i].tunable_attr->dev = &priv->wdev->dev;
> +		if (lwmi_attr_01_is_supported(cd01_attr_groups[i].tunable_attr) > 0) {

Reverse logic and use continue.

> +			err = sysfs_create_group(&priv->fw_attr_kset->kobj,
> +						 cd01_attr_groups[i].attr_group);
> +			if (err)
> +				goto err_remove_groups;
> +		}
>  	}
>  	return 0;
>  
>  err_remove_groups:
>  	while (i--)
> -		sysfs_remove_group(&priv->fw_attr_kset->kobj,
> -				   cd01_attr_groups[i].attr_group);
> +		if (lwmi_attr_01_is_supported(cd01_attr_groups[i].tunable_attr) > 0)

Reverse logic + continue.

> +			sysfs_remove_group(&priv->fw_attr_kset->kobj,
> +					   cd01_attr_groups[i].attr_group);

You need to add braces for multiline constructs.

>  
>  	kset_unregister(priv->fw_attr_kset);
>  
> 

-- 
 i.

