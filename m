Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE63322A1D4;
	Tue,  7 Jul 2026 16:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443293; cv=none; b=LifaE2MBW4/f2dIOamdbzbrm1LsFwG9bfT2I+sl+XPoQ2isCzzKJxOo8XZzEzwH0OLK55rjAq0kUrc4waK4txALcUTbLt18hyavNtkKVw2JtALvDN3zJXWbyu95Otq8FWNW7H5VVeMaQviY+0eOMFR2qvOE40RtqxXtzMwCVDys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443293; c=relaxed/simple;
	bh=K6i/D3ASkezYPs+L4xBoiw+ot2thb60QVd9W8wR27tM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FM8oeTWHBcpPRFFeUz4eTORWpTzm7V+MxWtG2F1aGwIzGGlYIvTYaWo72hyImDNhr0dNbxbLPvL6m3+T7HATuIn5mt4OieTddp7y1b+PEXruNaypxJQGURRso85kNPPuYcjP0RLkAMcHq3Qji3duGHIo0ZRsNXfq6MIhKkCiSs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUmNBXXy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUmNBXXy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783443292; x=1814979292;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=K6i/D3ASkezYPs+L4xBoiw+ot2thb60QVd9W8wR27tM=;
  b=JUmNBXXyfdTpbsnLMRXIRN4jfzlPZGi1IkWuC7pPHnKcmTxac1tqoRZR
   H9DI66PWb117/2IBRQeM75sgqy36KnP/Has/D4GrIkFfe91ORsghxgL6J
   da6fQzd04S4xEuBJAtTBW42+ja5rZqYQliq8/1WudxcMp7YKSUTYLuS4V
   QFzB5Vr4RNlK5iGjNhheaFV6bnYllrWT8BAZpTuEcNgcwSmNmyLaGgLbg
   PA2UM6eabW6FDP5RYPPGl6N5MkY8bEHPwM50135A2rC2IRn53myFAsfNv
   hy9jS3LO4pkaYu0cV6Rk9Y277EsDJ9EaT2aDBJwczlPIK9XOw0q5aS1td
   Q==;
X-CSE-ConnectionGUID: 5cazE35KT1uBXy+/6MfFTg==
X-CSE-MsgGUID: HLXwmVVYQKyg2nzjyHhiaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83969535"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83969535"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 09:54:51 -0700
X-CSE-ConnectionGUID: BKXqUqaDTG20OQud+pHStA==
X-CSE-MsgGUID: HBdMqEc2SXancuosAYIjzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="278412574"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.226])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 09:54:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Jul 2026 19:54:45 +0300 (EEST)
To: Marco Scardovi <scardracs@disroot.org>
cc: corentin.chary@gmail.com, denis.benato@linux.dev, 
    Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    luke@ljones.dev, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 1/2] platform/x86: asus-armoury: fix Use-After-Free
 and memory leak in driver init
In-Reply-To: <20260703103212.7406-2-scardracs@disroot.org>
Message-ID: <f48cf838-7ef9-f3bd-88f6-fe59c3d9c31f@linux.intel.com>
References: <20260703103212.7406-1-scardracs@disroot.org> <20260703103212.7406-2-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 Jul 2026, Marco Scardovi wrote:

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
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>

This patch no longer applies cleanly, please rebase and send v4.

--
 i.

> ---
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
