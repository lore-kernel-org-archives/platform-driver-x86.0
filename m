Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7083B3C1992;
	Mon,  5 Oct 2026 16:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791217763; cv=none; b=ZnIs0wCM9glETMH0kQt7je22iHOK4eW71CwQrCdHXtSnxciEXMaubn4Bl/ogwc/5x3D1cYfQnjLzPhCxB5KsLPIWhVQHCTBy3a0zsxp8ecEirb5UfdS4mgozOWwkGzwhYvZ/tUgP/mSsdt8bg+pY8Qev0jQYnt4M5y0B561c0EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791217763; c=relaxed/simple;
	bh=8qBJSYSrNDRSG9NXGQYwicr6+OuWMjL5seuCEQrbffw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CSENeRXGZ+br3M6Q7QIorT39yLwYCti1RhR1uIy5Htcd/7AnCa/3Dqbqqmg4KUy7HdNNU5vf8Gm2Qs3M8unkyCAzYOiry9I5HSyusA3CZdMEH4Pk2cAAqpPJc1xrdWyz/6TElaAUudJhyP0gEROF+UgB2ypEE/G7Q3JqJ4songI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SZ9Mg/Og; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SZ9Mg/Og"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791217761; x=1822753761;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8qBJSYSrNDRSG9NXGQYwicr6+OuWMjL5seuCEQrbffw=;
  b=SZ9Mg/OgHMwcBfifw1hNbhOeUm80XjMy34d1YZ22ssvcNeMNc9Bt13b/
   XWAuWlx3WF0Xz8yKuAdCYeo3UgxvfCKOUnlkuRU+ug3d74emStVMLr9gC
   uABavSyW0Js3zg1AwdFwuOKLLL1hOi4v1CUr8KkhPxoggpAxsuvpK+Goj
   Ti+qi07HwBEd2xHwqTDIdl4QYVIDDfV+zNIO+VkYhD1DhEOjKGQGvZsjp
   0ONyBLuX8EcMeZpXj9lFMv8iQfMlhw+b4PGiuidcqSMY47XHe1b2pQ/ae
   IMFG2AzBIxF66bbU4uqVpHFAawDtMeXEQT1DeMoqIURJ79PMSbGNdkZ/L
   g==;
X-CSE-ConnectionGUID: gh4/ZJs9STC4E2GJnT5+1A==
X-CSE-MsgGUID: kt6oG0cEReeentmdEq7V/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102412439"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="102412439"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 09:28:53 -0700
X-CSE-ConnectionGUID: WlluxT5ySuSmUnVBxaNWdQ==
X-CSE-MsgGUID: PoBKm8DRSOiqtB2J66q41w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="314863823"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 09:28:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 5 Oct 2026 19:28:45 +0300 (EEST)
To: Rong Zhang <i@rong.moe>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, Armin Wolf <W_Armin@gmx.de>, 
    Charles <hanker007@gmail.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/9] platform/x86: lenovo-wmi-{capdata,other}: Only
 allocate capdata list when necessary
In-Reply-To: <20260914-lwmi-wmi-new-api-v1-4-7a400f2f69f8@rong.moe>
Message-ID: <0aba598c-fe01-ba32-5eb3-e900c33a07f3@linux.intel.com>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe> <20260914-lwmi-wmi-new-api-v1-4-7a400f2f69f8@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Sep 2026, Rong Zhang wrote:

> When no capability data is available, there is no need to allocate
> capability data list as it's basically unused except for the
> priv->list->count == 0 placeholder.
> 
> Therefore, only allocate priv->list when necessary, otherwise its
> absence implies the absence of capability data. In this manner,
> lenovo-wmi-other can skip registering unavailable functionalities
> accordingly. Meanwhile, skip creating the debugfs directory as it
> provides nothing when there is no capability data.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  drivers/platform/x86/lenovo/wmi-capdata.c | 43 ++++++++++++++++++++++---------
>  drivers/platform/x86/lenovo/wmi-other.c   | 11 +++++---
>  2 files changed, 38 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
> index 0123ec8f7b53..793b5103d533 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> @@ -313,8 +313,8 @@ static const struct component_ops lwmi_cd_component_ops = {
>   * @dev: The sub-master capdata basic device.
>   *
>   * Call component_bind_all to bind the sub-component device to the sub-master
> - * device. On success, collect the pointer to the sub-component list and try
> - * to call the master callback.
> + * device. On success, collect the pointer (or ERR_PTR(-ENODEV) if it's stubbed)
> + * to the sub-component list and try to call the master callback.
>   *
>   * Return: 0 on success, or an error code.
>   */
> @@ -328,7 +328,7 @@ static int lwmi_cd_sub_master_bind(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> -	priv->sub_master->sub_component_list = sub_component_list;
> +	priv->sub_master->sub_component_list = sub_component_list ?: ERR_PTR(-ENODEV);
>  	lwmi_cd_call_master_cb(priv);
>  
>  	return 0;
> @@ -460,6 +460,9 @@ static const struct component_ops lwmi_cd_sub_component_ops = {
>  	{											\
>  		u8 idx;										\
>  												\
> +		if (WARN_ON(!list))								\
> +			return -EINVAL;								\
> +												\
>  		guard(mutex)(&list->list_mutex);						\
>  		for (idx = 0; idx < list->count; idx++) {					\
>  			if (list->_cdxx[idx].id != attribute_id)				\
> @@ -571,6 +574,9 @@ DEFINE_SHOW_ATTRIBUTE(lwmi_cd_debugfs);
>   */
>  static void lwmi_cd_debugfs_add(struct lwmi_cd_priv *priv)
>  {
> +	if (!priv->list)
> +		return;
> +
>  	priv->debugfs_dir = lwmi_debugfs_create_dir(priv->wdev);
>  
>  	debugfs_create_file("capdata", 0444, priv->debugfs_dir, priv, &lwmi_cd_debugfs_fops);
> @@ -582,6 +588,7 @@ static void lwmi_cd_debugfs_add(struct lwmi_cd_priv *priv)
>   */
>  static void lwmi_cd_debugfs_remove(struct lwmi_cd_priv *priv)
>  {
> +	/* Debugfs can handle NULL dir, no need to check. */
>  	debugfs_remove_recursive(priv->debugfs_dir);
>  	priv->debugfs_dir = NULL;
>  }
> @@ -645,6 +652,9 @@ static int __lwmi_cd_cache(struct lwmi_cd_priv *priv)
>   */
>  static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
>  {
> +	if (!priv->list)
> +		return 0;
> +
>  	if (!priv->initialized)
>  		return __lwmi_cd_cache(priv);
>  
> @@ -707,6 +717,9 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
>  		count = 0;
>  	}
>  
> +	if (!count)
> +		return 0;
> +
>  	list = devm_kzalloc(&priv->wdev->dev, struct_size(list, cd_fan, count), GFP_KERNEL);
>  	if (!list)
>  		return -ENOMEM;
> @@ -742,6 +755,8 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
>  	int count;
>  
>  	count = wmidev_instance_count(priv->wdev);
> +	if (!count)
> +		return 0;
>  
>  	switch (priv->info->type) {
>  	case LENOVO_CAPABILITY_DATA_00:
> @@ -884,7 +899,9 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
>  		enum lwmi_cd_type sub_component_type = LENOVO_FAN_TEST_DATA;
>  		struct capdata00 capdata00;
>  
> -		ret = lwmi_cd00_get_data(priv->list, LWMI_ATTR_ID_FAN_TEST, &capdata00);
> +		ret = priv->list
> +			? lwmi_cd00_get_data(priv->list, LWMI_ATTR_ID_FAN_TEST, &capdata00)
> +			: -ENODATA;

It's only 89 chars if you have it one a single line so this looks pretty 
unnecessary line split that doesn't even buy you that much extra space.

The code can go up to 100 chars as needed.

Alternatively, split the parameters to two lines instead.

>  		if (ret || !(capdata00.supported & LWMI_SUPP_VALID)) {
>  			dev_dbg(&wdev->dev, "capdata00 declares no fan test support\n");
>  			sub_component_type = CD_TYPE_NONE;
> @@ -905,14 +922,16 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
>  	case LENOVO_CAPABILITY_DATA_01:
>  		priv->acpi_nb.notifier_call = lwmi_cd01_notifier_call;
>  
> -		ret = register_acpi_notifier(&priv->acpi_nb);
> -		if (ret)
> -			goto out;
> +		if (priv->list) {
> +			ret = register_acpi_notifier(&priv->acpi_nb);
> +			if (ret)
> +				goto out;
>  
> -		ret = devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregister,
> -					       &priv->acpi_nb);
> -		if (ret)
> -			goto out;
> +			ret = devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregister,
> +						       &priv->acpi_nb);
> +			if (ret)
> +				goto out;
> +		}
>  
>  		ret = component_add(&wdev->dev, &lwmi_cd_component_ops);
>  		goto out;
> @@ -930,7 +949,7 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
>  		lwmi_cd_debugfs_add(priv);
>  
>  		dev_dbg(&wdev->dev, "registered %s with %u items\n",
> -			info->name, priv->list->count);
> +			info->name, priv->list ? priv->list->count : 0);
>  	}
>  	return ret;
>  }
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
> index fbb32bf404f2..e6c8f6bcf050 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -1643,16 +1643,19 @@ static int lwmi_om_master_bind(struct device *dev)
>  
>  	priv->cd00_list = binder.cd00_list;
>  	priv->cd01_list = binder.cd01_list;
> -	if (!priv->cd00_list || !priv->cd01_list) {
> +	if (!priv->cd00_list && !priv->cd01_list) {
>  		component_unbind_all(dev, NULL);
>  
>  		return -ENODEV;
>  	}
>  
> -	lwmi_om_fan_info_collect_cd00(priv);
> -	lwmi_om_psy_ext_init(priv);
> +	if (priv->cd00_list) {
> +		lwmi_om_fan_info_collect_cd00(priv);
> +		lwmi_om_psy_ext_init(priv);
> +	}
>  
> -	lwmi_om_fw_attr_add(priv);
> +	if (priv->cd01_list)
> +		lwmi_om_fw_attr_add(priv);
>  
>  	return 0;
>  }
> 
> 

-- 
 i.

