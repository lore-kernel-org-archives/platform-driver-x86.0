Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BC148FF88;
	Mon,  5 Oct 2026 16:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791218225; cv=none; b=h+T93rzc6BvPqEO9w5gQTPzL3c8qo7kvfHR//HR0d0xQPi3JSKzXa+ZWZ4dlbYmqn3eaXOE9ol+vgCvI2jsfO/WnhB/8FNacBwNT/UCy2dx1cfyAFOpvgfgginMLyuPTIIMQTuUjeyzQUp9xC7EqnwbFMxfj61Tkf2C4EvioeqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791218225; c=relaxed/simple;
	bh=3/jdOqeAqRi8CtYJAlkOY8eFXJpoPOhYAlIxJ8UgItE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DzXzFMikq6yDYRMAWHMLsM47Bh813DDZ7qyJE7oBh6DzzWlZMrKlS7nQbxD/Ggf7h2pWzrqkLXhEyncg6VnGlYww1vguf+IPk4q57lJuAXTtfM9WAd+0eR8KyAOqy929Rbk8gGEFJJoVb+cmFovVXKYY6kMP5oTff4/f6eqVqME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqksmIQm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqksmIQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791218222; x=1822754222;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3/jdOqeAqRi8CtYJAlkOY8eFXJpoPOhYAlIxJ8UgItE=;
  b=NqksmIQmQPiHNlkgsxp4djnW3cqsWMiQpAJcN+0uV90xPYdHDIdnxgHm
   nT9lYKm9AfsbXrTprpKYb/Qp9EcNPBwgoCIHS8ocN4xMMoePCXEJuoWMO
   iWzraLBqAPEpRMOLmFOEcheLtvQ0sE9fe2EBxbQgnhrwkAzBBtzqbLGx3
   D17tYCIOKNn8/T9Dcgzqwpxo04LIbzcN8ILKDK61iNKgPTCriwZqr/nKV
   UbVOGHbolLwrMEcxsdZ2wF5FvYTOw2Bc6+8roFoagusfFqwagJXOp5MvU
   Ifhi9r7+M9l0Vlb+md3QzCCZNzFdqKOAqtajxffz222SrNBVuEYq5Gw/q
   w==;
X-CSE-ConnectionGUID: QHQVgYAySgKX9qYq8SKnzA==
X-CSE-MsgGUID: X0YFL2cNQ+OTKTtmFRCGiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94605189"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="94605189"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 09:37:01 -0700
X-CSE-ConnectionGUID: QKocdfYqQbKI3RdF0iT8hg==
X-CSE-MsgGUID: wvdMWhuOQU65rg35bKd2bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="276409975"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 09:36:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 5 Oct 2026 19:36:55 +0300 (EEST)
To: Rong Zhang <i@rong.moe>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, Armin Wolf <W_Armin@gmx.de>, 
    Charles <hanker007@gmail.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/9] platform/x86: lenovo-wmi-capdata: Register component
 even on WMI error
In-Reply-To: <20260914-lwmi-wmi-new-api-v1-6-7a400f2f69f8@rong.moe>
Message-ID: <9fabb10a-85c1-855f-ef89-de69aa5a9cfe@linux.intel.com>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe> <20260914-lwmi-wmi-new-api-v1-6-7a400f2f69f8@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Sep 2026, Rong Zhang wrote:

> Some devices do not support LENOVO_CAPABILITY_DATA_01 and define the
> query method as a stub that returns zero buffer. Unfortunately, some
> devices do not implement the stub properly, causing WMI errors
> (including ACPI errors).
> 
> The current lenovo-wmi-* implementation enforces the binding between
> LENOVO_CAPABILITY_DATA_00+01 and LENOVO_OTHER_MODE because of a
> limitation of the device component framework. When the capdata device
> bailing out due to a WMI error, lenovo-wmi-other becomes unbound and
> unable to provide firmware-attributes or hwmon device for the other
> functional capdata device.
> 
> Therefore, WMI errors must be non-fatal in order not to break the
> assumptions made by the device component famrework.
> 
> Poison the capdata device by releasing the capability data list in this
> case. After that, NULL list will be passed to lenovo-wmi-other on bind.
> The latter will provide whatever is available, or unbind the components
> if nothing is available.
> 
> A poisoned capdata device releases or skips allocating most resources,
> e.g., the capability data list and the debugfs directory. The device
> itself is only used to satisfy the component dependency of lenovo-wmi-
> other and coordinate with the latter about the absence of the capability
> data.

I'm not sure if using "poison" is really a good word here for this, it 
sounds like you want to inactivate something.

Normally poisoning in kernel means we easy to identify pattern values that 
are supposed to crash the kernel if they're ever used.

-- 
 i.

> Reported-by: Charles <hanker007@gmail.com>
> Link: https://msgid.link/CAKtz0s8UYRQYW_0bh=0TMx47Axm-W-muEay-r3rqUBS1NHMPVw@mail.gmail.com/
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  drivers/platform/x86/lenovo/wmi-capdata.c | 71 +++++++++++++++++++++++++++++--
>  1 file changed, 67 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
> index 5e66e6b52720..d4d5e8c97ddb 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> @@ -29,6 +29,7 @@
>  #include <linux/acpi.h>
>  #include <linux/bug.h>
>  #include <linux/cleanup.h>
> +#include <linux/compiler.h>
>  #include <linux/component.h>
>  #include <linux/container_of.h>
>  #include <linux/debugfs.h>
> @@ -38,6 +39,7 @@
>  #include <linux/export.h>
>  #include <linux/gfp_types.h>
>  #include <linux/limits.h>
> +#include <linux/lockdep.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/mutex_types.h>
> @@ -45,6 +47,7 @@
>  #include <linux/overflow.h>
>  #include <linux/seq_file.h>
>  #include <linux/stddef.h>
> +#include <linux/string.h>
>  #include <linux/types.h>
>  #include <linux/wmi.h>
>  
> @@ -447,7 +450,7 @@ static const struct component_ops lwmi_cd_sub_component_ops = {
>  /*
>   * lwmi_cd*_get_data - Get the data of the specified attribute
>   * @list: The lenovo-wmi-capdata pointer to its cd_list struct.
> - * @attribute_id: The capdata attribute ID to be found.
> + * @attribute_id: The capdata attribute ID (non-zero) to be found.
>   * @output: Pointer to a capdata* struct to return the data.
>   *
>   * Retrieves the capability data struct pointer for the given
> @@ -460,7 +463,7 @@ static const struct component_ops lwmi_cd_sub_component_ops = {
>  	{											\
>  		u8 idx;										\
>  												\
> -		if (WARN_ON(!list))								\
> +		if (WARN_ON(!list || !attribute_id))						\
>  			return -EINVAL;								\
>  												\
>  		guard(mutex)(&list->list_mutex);						\
> @@ -595,6 +598,66 @@ static void lwmi_cd_debugfs_remove(struct lwmi_cd_priv *priv)
>  
>  /* ======== WMI interface ======== */
>  
> +/**
> + * lwmi_cd_poison() - Poison the device by not providing any capability data
> + * @priv: lenovo-wmi-capdata driver data.
> + * @err: The occurred error.
> + *
> + * The Other Mode driver binds to both Capability Data 00 and 01. If either 00
> + * or 01 fails to probe, the Other Mode device will fail to provide fw-attr or
> + * hwmon device for the other functional capdata device.
> + *
> + * Therefore, WMI errors must be non-fatal in order not to break the assumptions
> + * made by the device component famrework, so that the Other Mode device can
> + * provide whatever is functional.
> + *
> + * After poisoning the device, NULL list will be passed to the Other Mode device
> + * on bind.
> + *
> + * Return: 0 if the @err is suppressed, otherwise its propagated as is.
> + */
> +static int lwmi_cd_poison(struct lwmi_cd_priv *priv, int err)
> +{
> +	dev_warn(&priv->wdev->dev, "%s %s (%u items) due to error: %d\n",
> +		 priv->initialized ? "clearing" : "poisoning", priv->info->name,
> +		 priv->list ? priv->list->count : 0, err);
> +
> +	/* Simply print the warning message. */
> +	if (!priv->list)
> +		return priv->initialized ? err : 0;
> +
> +	/* Poison the device on initialization errors. */
> +	if (!priv->initialized) {
> +		devm_kfree(&priv->wdev->dev, priv->list);
> +		priv->list = NULL;
> +
> +		return 0;
> +	}
> +
> +	/*
> +	 * Runtime errors are transient. Simply clear all cached data and
> +	 * propagate the error.
> +	 *
> +	 * Since a valid attribute id is never 0 (the firmware also untilize the
> +	 * fact to stub some capabilities according to platform metadata),
> +	 * clearing the cached data effectively makes all attributes temporarily
> +	 * unavailable until the next notifier call.
> +	 */
> +
> +	lockdep_assert_held(&priv->list->list_mutex);
> +
> +	switch (priv->info->type) {
> +	case LENOVO_CAPABILITY_DATA_01:
> +		memset(priv->list->cd01, 0,
> +		       flex_array_size(priv->list, cd01, priv->list->count));
> +		break;
> +	default:
> +		unreachable();
> +	}
> +
> +	return err;
> +}
> +
>  /**
>   * __lwmi_cd_cache() - Cache all WMI data block information locklessly
>   * @priv: lenovo-wmi-capdata driver data.
> @@ -633,7 +696,7 @@ static int __lwmi_cd_cache(struct lwmi_cd_priv *priv)
>  		if (ret == -ENODATA) /* The block is too short, probably stubbed. */
>  			continue;
>  		if (ret)
> -			return ret;
> +			return lwmi_cd_poison(priv, ret);
>  
>  		/* Capdata 01 is an extension to capdata 00. */
>  		struct capdata00 *capdata __free(kfree) = wbuf.data;
> @@ -693,7 +756,7 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
>  	if (ret == -ENODATA) /* The block is too short, probably stubbed. */
>  		return 0;
>  	if (ret)
> -		return ret;
> +		return lwmi_cd_poison(priv, ret); /* Print the warning message. */
>  
>  	struct cd_fan_block *block __free(kfree) = wbuf.data;
>  
> 
> 
