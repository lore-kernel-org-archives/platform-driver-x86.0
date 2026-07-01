Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C0F3BA249;
	Wed,  1 Jul 2026 11:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903681; cv=none; b=AEmH/l/Oz6aT6a1rslJDwAVlzCSzovi/inDmG7Xq9ALJQOaOU1ZcKbL3HxPm45tIlm+K3xUavKcpTM4xTFUE9V4hNzj7OQNI6J2MREWCNRTQlKhtntp+MNDbGgvRmG/LwtsYAY4emn1beexw5Y5e1bIFavcqStnOJ88gS24hiuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903681; c=relaxed/simple;
	bh=Is7KXKBGrppXwwD5wp2vMVTX3qJgoIMWanHqSISuqj0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=E/IvIcuPMraOQxqAh6aGukWTfbT71l42GxkiC8alWhB2hoRm0ryypfy3/3Eygis85ZsnpS8X+43C8261TpGCcH3xWNAxeVNrWIBmFsLRZYQvZzUAX5LxaubuVF8mEkgy6XaZrpVuRaemxci1akG3T4ywNtEnc/PY1mdmMQ+rNb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZSWRXSj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZSWRXSj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782903681; x=1814439681;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Is7KXKBGrppXwwD5wp2vMVTX3qJgoIMWanHqSISuqj0=;
  b=fZSWRXSjZRx57U5EyQFoQ9GrzNVtxmXS1rZAnt/nQASWstd3y8lwn5bI
   rwfbvlewmgWWNe0l92OYWO6SOoObgFVfAF7QOb5uewdVUC/iPoZPAbs+i
   bOvZpvtIzORzournEGr1ajXLwY0FL/D/S+93OgcK24bbLKYru9Au4AzyM
   Nf7wQtSjfq0lgdAoEl8McQXVnQTHerHR31878BZDmEuRja4SRWgcPEWKh
   BWFQkQFzuTFHNDtLcRkIE5JQ614fXb9b78y37fUBtz9TpFabhc8GVf6iK
   m9Jq7qxmjZuGuR7YBXJzrHFeqtSs2gU1nWAHTGlmYZW8cHIXGbLktiC0o
   g==;
X-CSE-ConnectionGUID: vB0nq/y4QWWF2xZvltItyg==
X-CSE-MsgGUID: QFvL9FHXRCe4uUwvMgvJtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="101059026"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="101059026"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:01:20 -0700
X-CSE-ConnectionGUID: 8Br4x9w3TVC75MCGE1YRRg==
X-CSE-MsgGUID: H6lhmZVuSImWlZECT2y3Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="256121057"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:01:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 1 Jul 2026 14:01:12 +0300 (EEST)
To: Marco Scardovi <scardracs@disroot.org>
cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: asus-armoury: fix Use-After-Free and memory
 leak in driver init
In-Reply-To: <20260614163717.74732-1-scardracs@disroot.org>
Message-ID: <f1c70b62-7e5d-7ed3-afbf-b80e3a0f2daf@linux.intel.com>
References: <20260614163717.74732-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 14 Jun 2026, Marco Scardovi wrote:

> In init_rog_tunables(), if dc_limits are defined and allocating
> dc_rog_tunables fails, the already allocated ac_rog_tunables gets
> freed but the pointer stored in asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC]
> is not cleared. Since init_rog_tunables() returns void, the driver
> initialization continues, which can lead to a Use-After-Free (UAF)
> when asus_fw_attr_add() accesses the freed AC tunables pointer.
> 
> Additionally, if init_rog_tunables() succeeds but asus_fw_attr_add()
> fails, the allocated tunables are not freed, resulting in a memory leak.
> 
> Fix these issues by making init_rog_tunables() return an error code and
> propagating it in asus_fw_init(). On failure, make sure all partially
> allocated tunables are freed and their pointers are cleared to NULL.
> 
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> ---
>  drivers/platform/x86/asus-armoury.c | 32 ++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index 495dc1e31d40..3a63f960eb3f 100644
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
> @@ -1000,14 +1000,14 @@ static void init_rog_tunables(void)
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
> @@ -1015,7 +1015,7 @@ static void init_rog_tunables(void)
>  	if (ac_limits) {
>  		ac_rog_tunables = kzalloc_obj(*asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC]);
>  		if (!ac_rog_tunables)
> -			goto err_nomem;
> +			return -ENOMEM;
>  
>  		asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC] = ac_rog_tunables;
>  		ac_rog_tunables->power_limits = ac_limits;
> @@ -1063,7 +1063,8 @@ static void init_rog_tunables(void)
>  		dc_rog_tunables = kzalloc_obj(*asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC]);
>  		if (!dc_rog_tunables) {
>  			kfree(ac_rog_tunables);
> -			goto err_nomem;
> +			asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC] = NULL;
> +			return -ENOMEM;
>  		}
>  
>  		asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC] = dc_rog_tunables;
> @@ -1106,15 +1107,13 @@ static void init_rog_tunables(void)
>  		pr_debug("No DC PPT limits defined\n");
>  	}
>  
> -	return;
> -
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
> @@ -1127,10 +1126,19 @@ static int __init asus_fw_init(void)
>  	if (!strcmp(wmi_uid, ASUS_ACPI_UID_ASUSWMI))
>  		return -ENODEV;
>  
> -	init_rog_tunables();
> +	err = init_rog_tunables();
> +	if (err)
> +		return err;
>  
> -	/* Must always be last step to ensure data is available */
> -	return asus_fw_attr_add();
> +	err = asus_fw_attr_add();
> +	if (err) {
> +		kfree(asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC]);
> +		asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC] = NULL;
> +		kfree(asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC]);
> +		asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC] = NULL;

Why do you need to set these to NULL?

I'd also prefer to use goto + rollback path pattern even if there's only 
one entry at this point.

-- 
 i.

