Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFA82D5C68;
	Fri,  3 Jul 2026 09:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072793; cv=none; b=RhtvEcZAlz7HqJ0oIMtYeOYCFlxPv+YtHNVWLAs1FiCs83Pb4VkTXgfXlad2lQD1o4jPpU5gOPSpSjRAGPXm9BXF5QixnUPt11oaecIvg+BNUdvfJvMy5gBOlnfHXZop5nNdfWYZUafc7Rb23m5tSFwpQPYZU2rn/Zp+4A/IZbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072793; c=relaxed/simple;
	bh=g+aiixqlm64KTEbOu5tCoR32ec+XU4h+fSJndAE2XDQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Qtp+u5D0dtyjlLtOWTys/KorULWbBvhH6nQEvxbdebhCh3GOvrRs7pflxi+xUsXXzKY2BWdFZRyYoeiiAnIT7fHGiGe7FjbctvLrW3FgfRvsWMagwn1E7aaJza2v1seHLmTZyjiJWe32qotPPctQ4vEK7NeWlQ0LbfR+/W8UpWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eWmpBT6i; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWmpBT6i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783072788; x=1814608788;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=g+aiixqlm64KTEbOu5tCoR32ec+XU4h+fSJndAE2XDQ=;
  b=eWmpBT6iHlrd2+V9gTGIclfYxnWfaBMfKB9kRB9b5BT+oWnO1USvdw4F
   YV+jOe4Cc5B4VNGos4fcyKbrJ1SPZqyIHI9PTG9ke9TTjkuardZ7gL+OY
   c9TVy5EJWYiTRXlkgwJcP/tYnkw/Q7Rc53txEcDqt+6i+S4ZJwAMypDAE
   uGJNDHPUI3+92ZuwzXh8dfu5AEM2mZdZpx9btj+TX+x4fAl9f6HU5n2Wq
   SflTet8PjW4kBtv5A3aUYlmWW2nwrzi9SfQLkowalpCL1v/j5EKNSVgoK
   ZC3IbgleSlZ9HQGzz7ACpeyaShljahbrzrKHsqktsTdiQlsMkyxEGmYhi
   g==;
X-CSE-ConnectionGUID: S4R9c/3NQ5qNQIgmirrVQw==
X-CSE-MsgGUID: DPbPFYVIS4STVlHkevoDOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83692292"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83692292"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 02:59:47 -0700
X-CSE-ConnectionGUID: z30OvedGSJu0ZKDI1aLgIA==
X-CSE-MsgGUID: fwOxbxA9SdSQqGgbjZTCIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="250426132"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 02:59:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 3 Jul 2026 12:59:40 +0300 (EEST)
To: Marco Scardovi <scardracs@disroot.org>
cc: corentin.chary@gmail.com, denis.benato@linux.dev, 
    Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    luke@ljones.dev, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/1] platform/x86: asus-armoury: fix Use-After-Free
 and memory leak in driver init
In-Reply-To: <20260701164333.5219-2-scardracs@disroot.org>
Message-ID: <d0f5dc85-32cf-c5bb-e196-814bc1e7a22f@linux.intel.com>
References: <20260701164333.5219-1-scardracs@disroot.org> <20260701164333.5219-2-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 1 Jul 2026, Marco Scardovi wrote:

> In init_rog_tunables(), if dc_limits are defined and allocating
> dc_rog_tunables fails, the already allocated ac_rog_tunables gets
> freed but the pointer stored in
> asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC] is not cleared. Since
> init_rog_tunables() returns void, the driver initialization continues,
> which can lead to a Use-After-Free (UAF) when asus_fw_attr_add()
> accesses the freed AC tunables pointer.
> 
> Additionally, if init_rog_tunables() succeeds but asus_fw_attr_add()
> fails, the allocated tunables are not freed, resulting in a memory leak.
> 
> Fix these issues by making init_rog_tunables() return an error code and
> propagating it in asus_fw_init(). Defer setting the global pointers in
> asus_armoury.rog_tunables until both tunables have been successfully
> allocated. If asus_fw_attr_add() fails, release the allocated resources
> using a standard goto rollback block in asus_fw_init().
> 
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> ---
> v2:
> - Restructure init_rog_tunables() to use local pointers and defer assignment
>   to the global struct until all allocations succeed, eliminating the need
>   to set global pointers to NULL on error.
> - Use a goto-rollback pattern in asus_fw_init() for cleaner error handling
>   as requested by Ilpo.
> 
>  drivers/platform/x86/asus-armoury.c | 38 ++++++++++++++++++-----------
>  1 file changed, 24 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index 495dc1e31d40..ea53a005bb25 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -989,7 +989,7 @@ static int asus_fw_attr_add(void)
>  /* Init / exit ****************************************************************/
>  
>  /* Set up the min/max and defaults for ROG tunables */
> -static void init_rog_tunables(void)
> +static int init_rog_tunables(void)
>  {
>  	const struct power_limits *ac_limits, *dc_limits;
>  	struct rog_tunables *ac_rog_tunables = NULL, *dc_rog_tunables = NULL;
> @@ -1000,24 +1000,23 @@ static void init_rog_tunables(void)
>  	dmi_id = dmi_first_match(power_limits);
>  	if (!dmi_id) {
>  		pr_warn("No matching power limits found for this system\n");
> -		return;
> +		return 0;
>  	}
>  
>  	/* Get the power data for this system */
>  	power_data = dmi_id->driver_data;
>  	if (!power_data) {
>  		pr_info("No power data available for this system\n");
> -		return;
> +		return 0;
>  	}
>  
>  	/* Initialize AC power tunables */
>  	ac_limits = power_data->ac_data;
>  	if (ac_limits) {
> -		ac_rog_tunables = kzalloc_obj(*asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC]);
> +		ac_rog_tunables = kzalloc_obj(*ac_rog_tunables);
>  		if (!ac_rog_tunables)
> -			goto err_nomem;
> +			return -ENOMEM;
>  
> -		asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC] = ac_rog_tunables;
>  		ac_rog_tunables->power_limits = ac_limits;
>  
>  		/* Set initial AC values */
> @@ -1060,13 +1059,12 @@ static void init_rog_tunables(void)
>  	/* Initialize DC power tunables */
>  	dc_limits = power_data->dc_data;
>  	if (dc_limits) {
> -		dc_rog_tunables = kzalloc_obj(*asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC]);
> +		dc_rog_tunables = kzalloc_obj(*dc_rog_tunables);
>  		if (!dc_rog_tunables) {
>  			kfree(ac_rog_tunables);
> -			goto err_nomem;
> +			return -ENOMEM;
>  		}
>  
> -		asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC] = dc_rog_tunables;
>  		dc_rog_tunables->power_limits = dc_limits;
>  
>  		/* Set initial DC values */
> @@ -1106,15 +1104,16 @@ static void init_rog_tunables(void)
>  		pr_debug("No DC PPT limits defined\n");
>  	}
>  
> -	return;
> +	asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC] = ac_rog_tunables;
> +	asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC] = dc_rog_tunables;
>  
> -err_nomem:
> -	pr_err("Failed to allocate memory for tunables\n");
> +	return 0;

This works as well but now we also want to convert it to use __free() 
+ no_free_ptr() so we can get rid of that manual kfree() to remove 
potential for future mem management errors.

...If you could add a second patch to this series to that effect, it would 
great.

--
 i.

>  }
>  
>  static int __init asus_fw_init(void)
>  {
>  	char *wmi_uid;
> +	int err;
>  
>  	wmi_uid = wmi_get_acpi_device_uid(ASUS_WMI_MGMT_GUID);
>  	if (!wmi_uid)
> @@ -1127,10 +1126,21 @@ static int __init asus_fw_init(void)
>  	if (!strcmp(wmi_uid, ASUS_ACPI_UID_ASUSWMI))
>  		return -ENODEV;
>  
> -	init_rog_tunables();
> +	err = init_rog_tunables();
> +	if (err)
> +		return err;
>  
>  	/* Must always be last step to ensure data is available */
> -	return asus_fw_attr_add();
> +	err = asus_fw_attr_add();
> +	if (err)
> +		goto err_free_tunables;
> +
> +	return 0;
> +
> +err_free_tunables:
> +	kfree(asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC]);
> +	kfree(asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC]);
> +	return err;
>  }
>  
>  static void __exit asus_fw_exit(void)
> 
