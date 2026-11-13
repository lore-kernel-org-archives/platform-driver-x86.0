Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567869;
	b=Xsvlz6RKKfREFVQMVlayIhAIedy1QqeNRlt6xNaeo4H4IKx3u3a0Bq4wcHqE26r6m/V8
	 I4UFnQgaGZO+g/Yj8w7/U/v46W0QOuG125dk9sKbhu1L/H7vgv93idmkhfGvlM/nHPwWR
	 ExCVHi/LyFhJVu5iWC+vccfSp2riGZRVfELh+4fHT5P/Tc5W3GOFx18o3CBo7Gi1Eh69T
	 qTppChX5EmMxSDBZt4m7kbMNRcHXl50GlL6GBId+eb7UX8ruhLwtnIeJAfba/WE+tr8Cx
	 mMDAS7A62qpN2oNIdKUXBlgWu2zWFctEh1oM1fVHh+jqHHW/UNht50yAdlQAzxpA3+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567869;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=1VPo+BgCi3TAlwnk+V8xNnLWXjOIIusGFvS7wrIcLFU=;
	b=m9hQenEYHAwhB8tJnXaeYjQxFOW2um82J+tHE+E72XaXkupqnYWI1bILX/HHtatlyq62
	 aNkaN7+QPpQVNnSAs+MLYusP6fSv+g+dJHX5OWMjlgb1TIgZQECLijyKRCUA4Q1gIo6Ez
	 BoYiaB00/UT3Dp4j9yQ2dqBj9ERjQP7s+An4oEHz31RatuWRdx7wFod9bLfidTkVEkDZd
	 2HP6EMV7ZpgKIuDJarPaQ+cuoz2HdwdS4j8OlcFymR3jGdYYAHbMMT497gmDZjY7Q0WYn
	 URDyj3NHOuH/eWmOc8UIGfk/RWk4t8bi1uubtakAS5A7Jy+Ij6lm7dlxKDahtQneyvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XzOOX4m9;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C8E606A32A;
	Fri, 13 Nov 2026 11:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22C8E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XzOOX4m9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794567870; x=1826103870;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rxQ0C5OwWCt/m22K/5ItiPuqBgJIKReCV+8lv+D4/Z8=;
  b=XzOOX4m9Vv4IAFam1Qp/H0v4nkllUF3HoZ7Db6d4NRjw4Yr3Xel66kHo
   PnxgybZRdHvYHo0vHTQrwcqunFZYELgUH2GoJzF29GwnKJi3PplXeo78d
   BE0IyX5VbqUfQvZihuZ8N+6ZgtQYeJ82ROFOi1V8TdjhP5gMp/ZEghx4t
   M8xAxF3f57qI6VT2IDuynRRSkFRiPjXgf1KXOZYpEzVVwRisW4k7l1c2x
   V8KFsk3zvxISXVOGL8TogRD4mZi8Z26VwhkS5zSr5wYv1M6uMp3MLPSQC
   1Sg250eOd1iduqbZYMrge1fPVRQpkV2Ud9QDnZMSTsQsbI4kCQk0aNVrp
   Q==;
X-CSE-ConnectionGUID: xKwnxiL+TNmnqcgnz4SR+g==
X-CSE-MsgGUID: YeZhjJfZQAOuxxHe4z989A==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3363037"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3363037"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:04:29 -0800
X-CSE-ConnectionGUID: nGCMKohmQkWEjf8AXggOGg==
X-CSE-MsgGUID: acBFkVJLQGa5bCbO6Wz4Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9078187"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:04:26 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 13 Nov 2026 13:04:21 +0200 (EET)
To: Aaron Ma <aaron.ma@canonical.com>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, Rong Zhang <i@rong.moe>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] platform/x86: lenovo-wmi-other: Deconflict battery
 with thinkpad_acpi
In-Reply-To: <20261113055726.952551-1-aaron.ma@canonical.com>
Message-ID: <b4feb4ce-d818-c6b0-a749-4e58b92c2573@linux.intel.com>
References: <20261113055726.952551-1-aaron.ma@canonical.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Nov 2026, Aaron Ma wrote:

> ThinkPads expose battery charge thresholds and charge_behaviour through
> thinkpad_acpi's ACPI battery hook using raw sysfs attribute groups. The
> Lenovo WMI "Other Mode" driver also registers a power_supply_ext for
> charge_behaviour and charge_types on systems advertising those WMI
> capabilities.
> 
> When lenovo-wmi-other registers first, thinkpad_acpi fails to create a
> duplicate charge_behaviour sysfs attribute and unregisters its battery
> extension. Conversely, registering or updating any power_supply_ext on
> the same battery runs sysfs_update_groups(), which removes standard
> power-supply attributes not owned by power_supply_core and wipes out
> thinkpad_acpi's charge_control_start_threshold,
> charge_control_end_threshold, and charge_behaviour files.
> 
> Deconflict both ideapad_laptop (VPC2004 with GBMD and SBMC) and
> thinkpad_acpi (LEN0268, LEN0068, or IBM0068 with BDSG and BICG) via a
> per-driver table guarded by IS_ENABLED() in Kconfig, and update the
> force_load_psy_ext description accordingly.
> 
> Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI battery charge limiting")
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Co-developed-by: Rong Zhang <i@rong.moe>
> Signed-off-by: Rong Zhang <i@rong.moe>
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
> Changes in v3:
> - Wrap deconfliction table entries in #if IS_ENABLED(CONFIG_*) and drop
>   driver_enabled, as suggested by Rong Zhang.
> - Group deconfliction entries per driver (HIDs list + methods list).
> 
> Changes in v2:
> - Consolidate IdeaPad and ThinkPad deconfliction into a table of ACPI
>   device IDs, method pairs, and driver configuration checks, as suggested
>   by Derek J. Clark.
> - Check GBMD and SBMC for IdeaPads, and BDSG and BICG for ThinkPads,
>   instead of relying only on ThinkPad ACPI device presence.
> - Check whether the corresponding driver is enabled before looking up
>   its ACPI device, including for ideapad_laptop.
> - Update the force_load_psy_ext description to cover both drivers.
> 
> v2: https://lore.kernel.org/platform-driver-x86/20261112074823.853819-1-aaron.ma@canonical.com/
> v1: https://lore.kernel.org/platform-driver-x86/20261111083529.727285-1-aaron.ma@canonical.com/
> 
>  drivers/platform/x86/lenovo/wmi-other.c | 66 ++++++++++++++++++++-----
>  1 file changed, 53 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
> index bd64e7b44669d..340159df5f7cc 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -189,10 +189,10 @@ MODULE_PARM_DESC(relax_fan_constraint,
>  static bool force_load_psy_ext;
>  module_param(force_load_psy_ext, bool, 0444);
>  MODULE_PARM_DESC(force_load_psy_ext,
> -	"This option will skip checking if the ideapad_laptop driver will conflict "
> +	"This option will skip checking if the ideapad_laptop or thinkpad_acpi driver will conflict "
>  	"with adding an extension to set the battery charge behavior and battery charge "
>  	"control end threshold. It will also skip checking if the BIOS reports that "
> -	"those features are fully supported. It is recommended to blacklist the ideapad "
> +	"those features are fully supported. It is recommended to blacklist the conflicting "
>  	"driver before using this option.");
>  
>  /* ======== HWMON (component: lenovo-wmi-capdata 00 & fan) ======== */
> @@ -905,17 +905,41 @@ static acpi_status lwmi_acpi_match(acpi_handle handle, u32 lvl,
>  	return AE_CTRL_TERMINATE;
>  }
>  
> +struct lwmi_psy_deconflict {
> +	char * const *hids;

Who is only the pointer const, not the char?

> +	char * const *methods;

If acpi_has_method would input const char * (to me it seems convertable 
as it only calls acpi_get_handle that takes const char *), this too could 
be const char.

> +};
> +
> +#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) || IS_ENABLED(CONFIG_THINKPAD_ACPI)
> +#define LWMI_PSY_DECONFLICT_STRS(...) \
> +	((char * const[]) { __VA_ARGS__, NULL })
> +#endif

What exactly does ifdef'ing this construct achieve? Does something hunt 
unused macros?

> +
> +static const struct lwmi_psy_deconflict lwmi_psy_deconflict_list[] = {
> +#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP)
> +	{
> +		.hids = LWMI_PSY_DECONFLICT_STRS("VPC2004"),
> +		.methods = LWMI_PSY_DECONFLICT_STRS("GBMD", "SBMC"),
> +	},
> +#endif /* IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) */
> +#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
> +	{
> +		.hids = LWMI_PSY_DECONFLICT_STRS("LEN0268", "LEN0068", "IBM0068"),
> +		.methods = LWMI_PSY_DECONFLICT_STRS("BDSG", "BICG"),
> +	},
> +#endif /* IS_ENABLED(CONFIG_THINKPAD_ACPI) */
> +};
> +
>  /**
>   * lwmi_om_psy_ext_init() - Hooks power supply extension to device battery
>   * @priv: Pointer to the lwmi_om_priv drvdata.
>   *
> - * Checks if the ideapad_laptop driver is going to manage charge attributes first,
> - * then if not, hooks the battery to our WMI methods if they are supported.
> + * Checks if the ideapad_laptop or thinkpad_acpi driver is going to manage
> + * charge attributes first, then if not, hooks the battery to our WMI methods
> + * if they are supported.
>   */
>  static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
>  {
> -	static const char * const ideapad_hid = "VPC2004";
> -	acpi_handle handle = NULL;
>  	unsigned int props = 0;
>  	int ret;
>  
> @@ -928,14 +952,30 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
>  	if (force_load_psy_ext)
>  		goto load_psy_ext;
>  
> -	/* Deconflict ideapad_laptop driver */
> -	ret = acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
> -	if (ret)
> -		return;
> +	for (unsigned int i = 0; i < ARRAY_SIZE(lwmi_psy_deconflict_list); i++) {
> +		const struct lwmi_psy_deconflict *entry = &lwmi_psy_deconflict_list[i];
>  
> -	if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC")) {
> -		dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery for device\n");
> -		return;
> +		for (unsigned int j = 0; entry->hids[j]; j++) {
> +			const char *hid = entry->hids[j];
> +			acpi_handle handle = NULL;
> +			bool has_methods = true;
> +
> +			ret = acpi_get_devices(hid, lwmi_acpi_match, &handle, NULL);
> +			if (ret || !handle)
> +				continue;
> +
> +			for (unsigned int k = 0; entry->methods[k]; k++) {
> +				has_methods = acpi_has_method(handle, entry->methods[k]);
> +				if (!has_methods)
> +					break;

So this goes to dev_dbg + return, why complicate the code flow with extra 
break + check that is never true?

If indentation is the worry here, the innermost bodies don't seem to 
require much from the outer ones so they could be moved to a function 
(j body + k loop).

> +			}
> +			if (!has_methods)
> +				continue;
> +
> +			dev_dbg(&priv->wdev->dev, "ACPI device %s manages battery for device\n",
> +				hid);
> +			return;
> +		}
>  	}
>  
>  load_psy_ext:
> 

-- 
 i.

