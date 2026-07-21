Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D1F434E2C;
	Tue, 21 Jul 2026 15:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649025; cv=none; b=J28Zuf9ycTxOoEsCvnWkzPVg4nRz9hf3Xyy5cXHZLngJjP271C2Z/CpOoP0TRhLW0e/NfI3dXM42B08wkAb/BygWd0Z2V/ftcq0IR1KmLIt4u6DCh6bVh1vs7aTMkAC/nDhrwuJlqUvLPx40wpPZYNsunDJhPOCBr8lsPAZFrdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649025; c=relaxed/simple;
	bh=Pn5HcyVMhlgavRW4qxRcJUe5x0HInr95fGFpzqrbyg4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=If2Dp9GkA/KVRg5cZ3wla17b9tCyRhp9R++I4lq2tFfFXyzVhZluvHgNsMiwYB49EEUgOAFQrV9AyCfQMS9S5QvqbySB/7HDMHCEfvQmd50s4hsBJ37L3gGRwSb9wwMLRuFNP2ESEzyplUQuWR1FgMbQD4aR4z5gikiSJrfzvjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+Nl4xF6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+Nl4xF6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784649024; x=1816185024;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Pn5HcyVMhlgavRW4qxRcJUe5x0HInr95fGFpzqrbyg4=;
  b=T+Nl4xF6dbmF9pyDfIQLE4olmZmYfq306w6fhcMDgUGuwI3FecvCbywQ
   AQG6SicmPXDEJEtFKDH5kUtvNpysbv+/aHVEcElql0+d95KrbH1302E+d
   jEnb4J+kbXEIYEh/Sl8l13jRDNU9Vg3P1d15CxeMFmXkARokwLUhKY3jN
   lWWEGV8/TBaOwCuGUSQFtFQoZonfDsL+7hWjaWLygTxqj1l7twzEyshqc
   /j2RVWuADBVgjY74PhnWCmOMp3OpkawFNxJhx35se4Ikg+VPH3wvPf8P4
   6oyJhLnVhKvZ40zdZL9R/JkcCwUxH7dhFKCTSBLgtW3wu2ehbBrMBV+R7
   A==;
X-CSE-ConnectionGUID: zMn7EpeBQKCZIVqRh7/BJA==
X-CSE-MsgGUID: JHktdIK4Qgi8tEmmUubLLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85373808"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="85373808"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 08:50:23 -0700
X-CSE-ConnectionGUID: lyM9f78YTiuKHh97Sm7Brg==
X-CSE-MsgGUID: lpShewmwRpiXZ5z/AqMxFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="259778128"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 08:50:17 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Jul 2026 18:50:14 +0300 (EEST)
To: Emre Cecanpunar <emreleno@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, krishna.chomal108@gmail.com, 
    radheykalra901@gmail.com, edip@medip.dev, hello@kursatabayli.dev, 
    mjg59@srcf.ucam.org, akpm@linux-foundation.org, jorge.lopez2@hp.com, 
    jes965@nyu.edu, mario.limonciello@amd.com, julien.robin28@free.fr
Subject: Re: [PATCH 2/5] platform/x86: hp-wmi: handle firmware errors in
 tablet mode query
In-Reply-To: <ce5cd56d2ba561272770d7992e397dfbec108d4e.1784195117.git.emreleno@gmail.com>
Message-ID: <cd06d831-01d6-c8a2-94fc-894877f56c3d@linux.intel.com>
References: <cover.1784195117.git.emreleno@gmail.com> <ce5cd56d2ba561272770d7992e397dfbec108d4e.1784195117.git.emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Jul 2026, Emre Cecanpunar wrote:

> hp_wmi_get_tablet_mode() accepts any nonnegative return value from
> hp_wmi_perform_query() as success. HP firmware errors are positive, so a
> rejected query makes the zeroed response look like laptop mode.

Does this problem actually happen with some hw? Please add the info.

> Treat every nonzero result as an error and preserve negative transport
> errors. The event and resume paths pass the result directly to the input
> subsystem, where a negative errno would look like an asserted switch, so
> skip the switch update when the query fails.
>
> Fixes: 520ee4ea1cc6 ("platform/x86: hp-wmi: Fix SW_TABLET_MODE detection method")
> Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 205a6020e9c5..e226b772ef00 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -798,8 +798,8 @@ static int hp_wmi_get_tablet_mode(void)
>  	ret = hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE, HPWMI_READ,
>  				   system_device_mode, zero_if_sup(system_device_mode),
>  				   sizeof(system_device_mode));
> -	if (ret < 0)
> -		return ret;
> +	if (ret)
> +		return ret < 0 ? ret : -EINVAL;

Please use 2 separate ifs for clarity.

>  	return system_device_mode[0] == DEVICE_MODE_TABLET;
>  }
> @@ -1198,7 +1198,7 @@ static void hp_wmi_notify(union acpi_object *obj, void *context)
>  {
>  	u32 event_id, event_data;
>  	u32 *location;
> -	int key_code;
> +	int key_code, state;
>  
>  	if (!obj)
>  		return;
> @@ -1228,9 +1228,12 @@ static void hp_wmi_notify(union acpi_object *obj, void *context)
>  		if (test_bit(SW_DOCK, hp_wmi_input_dev->swbit))
>  			input_report_switch(hp_wmi_input_dev, SW_DOCK,
>  					    hp_wmi_get_dock_state());
> -		if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit))
> -			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE,
> -					    hp_wmi_get_tablet_mode());
> +		if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit)) {
> +			state = hp_wmi_get_tablet_mode();
> +			if (state >= 0)
> +				input_report_switch(hp_wmi_input_dev,
> +						    SW_TABLET_MODE, state);

Braces are needed for multiline constructs...

...BUT, it looks there's some copy pasting going on so moving these into a 
helper both this and hp_wmi_resume_handler() could use would seem useful 
(in a preparatory patch). It would help with the line length so this may 
no longer require multiple lines with less indent.

> +		}
>  		input_sync(hp_wmi_input_dev);
>  		break;
>  	case HPWMI_PARK_HDD:
> @@ -2431,6 +2434,8 @@ static void __exit hp_wmi_bios_remove(struct platform_device *device)
>  
>  static int hp_wmi_resume_handler(struct device *device)
>  {
> +	int state;
> +
>  	/*
>  	 * Hardware state may have changed while suspended, so trigger
>  	 * input events for the current state. As this is a switch,
> @@ -2441,9 +2446,12 @@ static int hp_wmi_resume_handler(struct device *device)
>  		if (test_bit(SW_DOCK, hp_wmi_input_dev->swbit))
>  			input_report_switch(hp_wmi_input_dev, SW_DOCK,
>  					    hp_wmi_get_dock_state());
> -		if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit))
> -			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE,
> -					    hp_wmi_get_tablet_mode());
> +		if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit)) {
> +			state = hp_wmi_get_tablet_mode();
> +			if (state >= 0)
> +				input_report_switch(hp_wmi_input_dev,
> +						    SW_TABLET_MODE, state);
> +		}
>  		input_sync(hp_wmi_input_dev);
>  	}
>  
> 

-- 
 i.

