Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A31C3E2765
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 07:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991734; cv=none; b=jNCD7uxhN5f8eQmkErXpAS1lPFJlfQxAt4a4M6lsneDZQ7p0wZhkwGUpO+i5CsrhCS7getxyElyV9RIGINeKyNmeefZhIuAiMNA7nfGqNKDwscsgibZrh9pxAvCYlOlgagvs5LPm07H+cj95HZb/sCC2BbRmo8iwM9zi/SJIf1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991734; c=relaxed/simple;
	bh=2Kroqj/jL4WnIBxF1YU7KO4SaEpFtvVGddNk8ILzihA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Cfr9TfhnQLKpsW3AslpjsS5FuwJP1E1PphyFaYFvietnpi0yDWkXYdNc9RnZEowdQrEPkVUf+o51acWR4EmU3qJ4aIpw8TueBBn+y1rIS2nzTMExrjFLLL+rDZFxqo5qHVoRN63lLrMFYMjt6GqvICPZyFPbA3mtNf6xUIkCM+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSVsCBvv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSVsCBvv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780991733; x=1812527733;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2Kroqj/jL4WnIBxF1YU7KO4SaEpFtvVGddNk8ILzihA=;
  b=nSVsCBvvODEaQM4xeylSg+zlcK8A7VdIUL9deHxUGrDeGo4/wawnJy1j
   fUddRdk08bRvZsYK2C2o9IkKJAIrkDD/X3+Ksy6kQenTNNEXQjK9XJo+p
   40FAE5obXq29tnLL0uqnNsQgdYiHJhHer/kMImwaji7Zt/7DjhgC25CCb
   Z5LvNCS+eNRftwjarLlHN6ZvPcQYiVjBDP46yDLSJhEj+5TJuR8WNQHQk
   /53iL9JD8O+Enx7FZRwn67RRBJKpq6hySJ1aqdTIUfhhttpUpT7DgSMTc
   Ix6+PngaY1j9upFTgoeROjuFELvn3D38nB/g7tamRsn0nXxVxmYcfhFS2
   A==;
X-CSE-ConnectionGUID: Uq15cxMLS2WmA4f6OMXGYg==
X-CSE-MsgGUID: TyFCsSObShS/t3vYus8pDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92308594"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="92308594"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 00:55:33 -0700
X-CSE-ConnectionGUID: Mve6NhJmTAyU2H1MEcrZow==
X-CSE-MsgGUID: sA0nFxulRKCuKzRlMJcXtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="283870421"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.81])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 00:55:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 9 Jun 2026 10:55:27 +0300 (EEST)
To: yahia <yahia.a.abdrabou@gmail.com>
cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] hp-wmi: add battery threshold support
In-Reply-To: <20260608180728.27348-1-yahia.a.abdrabou@gmail.com>
Message-ID: <5459a3d7-976a-dbb7-0ca9-540efafe93bd@linux.intel.com>
References: <41309386-12fb-71bf-3ced-8377bf8aaa8b@linux.intel.com> <20260608180728.27348-1-yahia.a.abdrabou@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Jun 2026, yahia wrote:

> From: yahia ahmed <yahia.a.abdrabou@gmail.com>
> 
> Implement battery threshold support using the SBCO and GBCO ACPI methods,
> Add battery_get to retrieve the current battery mode and provide a function
> to set the battery threshold.
> 
> Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
> ---
> v3:
> - Fix coding style errors and warning
> - Refine the changelogs for clarity
> 
> v2:
> - Simplify detection logic via battery_get
> - Add Battery Profiles enum table
> - Add functions to set the battery mode
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 37 ++++++++++++++++++++------------
>  1 file changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index f2180b61b84e..c50fe78099d9 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -11,7 +11,6 @@
>   * Copyright (C) 2005 Dmitry Torokhov <dtor@mail.ru>
>   */
>  
> -#include <asm-generic/errno.h>
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <linux/acpi.h>
> @@ -297,15 +296,16 @@ enum hp_wmi_event_ids {
>   * Profiles for hp battery threshold profile 0x05 and 0x06 map to 4 and 5 respectively
>   */
>  enum hp_battery_modes {
> -	HP_BATTERY_MODE_NORMAL = 0x00,
> +	HP_BATTERY_MODE_NORMAL   = 0x00,
>  	HP_BATTERY_MODE_ADAPTIVE = 0x02,
> -	HP_BATTERY_THRESHOLD_4 = 0x05,
> -	HP_BATTERY_THRESHOLD_5 = 0x06,
> +	HP_BATTERY_THRESHOLD_4   = 0x05,
> +	HP_BATTERY_THRESHOLD_5   = 0x06,
>  };
>  
> -#define HPWMI_BATTERY_THRESHOLD_SBCO 0x2B // SBCO Command id
> -#define HPWMI_AC_REQUIRED 0x35 // obscure edge case where the bios requires the user to be charged while setting a profile
> -/*
> +#define HPWMI_BATTERY_THRESHOLD_SBCO 0x2B /* SBCO Command id */
> +#define HPWMI_AC_REQUIRED	     0x35
> +/* obscure edge case where the bios requires the user to be charging while setting a profile
> + *
>   * struct bios_args buffer is dynamically allocated.  New WMI command types
>   * were introduced that exceeds 128-byte data size.  Changes to handle
>   * the data size allocation scheme were kept in hp_wmi_perform_qurey function.
> @@ -1099,21 +1099,26 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
>  	return count;
>  }
>  
> -static int battery_get(void) {
> +static int battery_get(void)
> +{
>  	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>  	int mode = -1;
> +
>  	if (ACPI_SUCCESS(acpi_evaluate_object(NULL, "\\_SB.WMID.GBCO", NULL, &output))) {
>  		union acpi_object *obj = (union acpi_object *)output.pointer;
> -		if (obj && obj->type == ACPI_TYPE_PACKAGE && obj->package.count >= 3) { // standard package sent by bios
> -			mode = (int)obj->package.elements[2].buffer.pointer[0]; // bios returns the result in the third buffer 
> +
> +		if (obj && obj->type == ACPI_TYPE_PACKAGE  /* standard package sent by bios */
> +				&& obj->package.count >= 3) {
> +			 /* bios returns the result in the third buffer */
> +			mode = (int)obj->package.elements[2].buffer.pointer[0];
>  		}
>  		kfree(output.pointer);
> -	} else 
> +	} else
>  		mode = -EIO;
>  	return mode;
>  }
>  
> -static int battery_set(int profile) 
> +static int battery_set(int profile)
>  {
>  	if (!battery_threshold_support) {
>  		pr_err("Battery threshold is not supported");
> @@ -1122,18 +1127,21 @@ static int battery_set(int profile)
>  	union acpi_object args[4];
>  	acpi_status status;
>  	struct acpi_object_list arg_list = { .count = 4, .pointer = args };
> +
>  	memset(args, 0, sizeof(args));
>  	args[0].type = ACPI_TYPE_INTEGER;
>  	args[0].integer.value = 0;
>  	args[1].type = ACPI_TYPE_INTEGER;
>  	args[1].integer.value = profile;
> -	args[2].type = ACPI_TYPE_INTEGER; // padding required by bios
> +	args[2].type = ACPI_TYPE_INTEGER; /* padding required by bios */
>  	args[2].integer.value = 0;
>  	args[3].type = ACPI_TYPE_INTEGER;
>  	args[3].integer.value = 0;
>  	status = acpi_evaluate_object(NULL, "\\_SB.WMID.SBCO", &arg_list, NULL);
> +
>  	if (unlikely(status == HPWMI_AC_REQUIRED)) {
> -		pr_err("You have to be plugged in while setting a battery profile"); // random edge case in the bios
> +		 /* random edge case in the bios */
> +		pr_err("You have to be plugged in while setting a battery profile");
>  		return -EIO;
>  	}
>  	if (ACPI_FAILURE(status)) {
> @@ -2351,6 +2359,7 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
>  		return err;
>  
>  	int ret = battery_get();
> +
>  	if (ret >= 0)
>  		battery_threshold_support = true;
>  	thermal_profile_setup(device);

This patch wouldn't even apply.

Also, I'm very skeptical you reviewed it yourself before sending it as 
some of the changes are direct opposite of my earlier review comments 
(irrespective of whether the patch would apply or not).

-- 
 i.

