Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4D319D891
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Aug 2024 14:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723559667; cv=none; b=fDaqXdHhfS4SjFLHKpRWX9zZlfyZ3wvHl6mnexJ5W51oXiVbCithl5rAvTd9iClkBTaUVaitLXOjLqrIytFt2qNB0ae2AI0unZBlA16LvtiUsCDxVzz/taWXsKvXPf9haEAcrKf6G48eZUbzXPmbMX4v3KXs0fOgqC/c2X/X/48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723559667; c=relaxed/simple;
	bh=Iot9F6ZlrUA//bHRcED+J2yEHd6ujKzJ+CnCF2q43/4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PKjRDaRSamEuitAtU2Sa/GinjQxg0Kw1r2pqif80LdmIEkPYorQ02pzdIIQ3z7bo2PwsPKYAgl10F/SeRLmDVdsY7zMX/P1GNOjC5fG7kZmluriSanZvLx5uu+2bdPPdzND0KcUZXnb/O1BlWSW129TbYwtyf+Oraz7OVx9In2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=isF6dCKG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="isF6dCKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723559666; x=1755095666;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Iot9F6ZlrUA//bHRcED+J2yEHd6ujKzJ+CnCF2q43/4=;
  b=isF6dCKGlUrS8ZXfo7W5Y/aFL871c2Eu5/Jtef0Gn9z7dYy+rrxIKzEz
   DJIEh1mYry6F1oSMQVVM2AbV6GJkHRRrPzvxGeou1gtPkQNe3eNqLrPbj
   pdftw7JaoxKyYPzltsgGAojBe4Qm9UlkD/upoEvThBPOGCb3vTDIRrVRR
   knwtTnt3I1DlzGCeFODiqXYgTwuo7WnBtRjGjOmgVmr3qEenIqI1S3l9C
   CAHJ9SCvaR7qi3t+XULuvRQsXDPSXVU1TwEIZFSQX16E3W0vgdLWksAQT
   yHl2N9kWNR7W8HbZVsR41VT/sYMRKymW67Wo+0AFS4rodPx2GUdklBQTj
   Q==;
X-CSE-ConnectionGUID: fb/r+1a9Tg6PYdysbYHa6Q==
X-CSE-MsgGUID: fY17prj7RMarmFcUBzFosQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="25490526"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="25490526"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 07:34:23 -0700
X-CSE-ConnectionGUID: UYk0t7DUQ4SfDmyrjTD2uQ==
X-CSE-MsgGUID: KM1xsqdISc2iOrDV8YK/og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="63533437"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.153])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 07:34:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 13 Aug 2024 17:34:19 +0300 (EEST)
To: Stefan Sichler <stsichler@web.de>
cc: jorgealtxwork@gmail.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v5 2/4] Fix SW_TABLET_MODE detection method
In-Reply-To: <703cfb2e-6973-421a-9602-657e03ba6105@web.de>
Message-ID: <158df220-b282-3da3-0e87-ae7a3c64d056@linux.intel.com>
References: <20220310210853.28367-3-jorge.lopez2@hp.com> <703cfb2e-6973-421a-9602-657e03ba6105@web.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 8 Aug 2024, Stefan Sichler wrote:

> this patch (which is now committed to the kernel as commit
> 520ee4ea1cc60251a6e3c911cf0336278aa52634 since v5.18-rc1) unfortunately
> introduced a regression on my HP EliteBook 2760p Convertible:
> 
> Tablet mode is no longer detected.
> 
> It worked flawlessly before (when enable_tablet_mode_sw module param was
> set to 1).
> 
> Debugging showed that on this device, two problems prevent the table
> mode detection from working:
> 
>   - Chassis Type is reported as 0x10 (= Lunch Box)
> 
>   - the query of HPWMI_SYSTEM_DEVICE_MODE does not report tablet state
> at all
> 
> Note that the chassis type of this device (switch to tablet mode by
> screen *rotation*) actually differs from the newer HP models (switch to
> tablet mode by screen *flipping*).
> 
> 
> I suggest fixing this by re-adding the removed module parameter
> "enable_tablet_mode_sw", but change its behavior to work in the
> following way:
> 
>   - when left at default -1 (auto): no change to current (new)
> implementation
> 
>   - when set to 0: unconditionally disable table mode reporting at all
> 
>   - when set to 1: ignore Chassis type and use old-skool
> hp_wmi_hw_state(HPWMI_TABLET_MASK) query method to determine tablet mode
> in addition to new hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE...) method
> 
> 
> I prepared a patch based on commit
> 520ee4ea1cc60251a6e3c911cf0336278aa52634, and tested it successfully on
> my device.
> See below.
> 
> Regards,
> Stefan
> 
> --- hp-wmi.c.orig	2024-03-10 21:38:09.000000000 +0100
> +++ hp-wmi.c	2024-08-08 09:23:29.509113900 +0200

This submission does not follow the normal patch formatting guidelines,
please see Documentation/process/submitting-patches.rst.

> @@ -35,6 +35,10 @@
>  MODULE_ALIAS("wmi:95F24279-4D7B-4334-9387-ACCDC67EF61C");
>  MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
> 
> +static int enable_tablet_mode_sw = -1;
> +module_param(enable_tablet_mode_sw, int, 0444);
> +MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE
> reporting (-1=auto, 0=no, 1=yes)");
> +
>  #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
>  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
>  #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
> @@ -428,6 +432,9 @@
>  	bool tablet_found;
>  	int ret;
> 
> +	if (!enable_tablet_mode_sw)
> +		return -ENODEV;
> +
>  	chassis_type = dmi_get_system_info(DMI_CHASSIS_TYPE);
>  	if (!chassis_type)
>  		return -ENODEV;
> @@ -435,16 +442,24 @@
>  	tablet_found = match_string(tablet_chassis_types,
>  				    ARRAY_SIZE(tablet_chassis_types),
>  				    chassis_type) >= 0;
> -	if (!tablet_found)
> +	if (!tablet_found && enable_tablet_mode_sw < 0 /*auto*/)

Having to add a comment like that is a very strong indication you'd want 
to have a named define instead, e.g., HPWMI_TABLET_MODE_AUTO.

>  		return -ENODEV;
> 
>  	ret = hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE, HPWMI_READ,
>  				   system_device_mode,
> zero_if_sup(system_device_mode),
>  				   sizeof(system_device_mode));
> -	if (ret < 0)
> -		return ret;
> +	if (ret >= 0)
> +		ret = (system_device_mode[0] == DEVICE_MODE_TABLET);
> +
> +	/* workaround for older convertibles */
> +	if (ret <= 0 && enable_tablet_mode_sw > 0)
> +	{
> +		ret = hp_wmi_read_int(HPWMI_HARDWARE_QUERY);
> +		if (!(ret < 0))
> +			ret = !!(ret & HPWMI_TABLET_MASK);
> +	}
> 
> -	return system_device_mode[0] == DEVICE_MODE_TABLET;
> +	return ret;

The logic is quite hard to follow. It would be better to return 
early.

	if (ret < 0 && enable_tablet_mode_sw == HPWMI_TABLET_MODE_AUTO)
		return ret;

	if (ret >= 0 && system_device_mode[0] == DEVICE_MODE_TABLET)
		return 1;

	ret = hp_wmi_read_int(HPWMI_HARDWARE_QUERY);
	if (ret < 0)
		return ret;

	return !!(ret & HPWMI_TABLET_MASK);


However, automatically detecting this condition over adding the module 
parameter would be the preferred solution.

-- 
 i.

>  }
> 
>  static int omen_thermal_profile_set(int mode)
> 
> 

