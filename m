Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD421199947;
	Tue, 15 Sep 2026 21:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506279; cv=none; b=OqUqastr2mS21YfciTtsOGkIlwiYyA1sQaCeecZ1qvBgbU0D1fyTKPrmf0azeijCHxxziLJLl79GZe5gQPe5hZhi8KM8vXrDFEa4dBIcWrrbAqaCwTSDNXktWJuHmYmJKGuWIs6n0FC5IWAtWjVuxPLpwNRFrMrmA7+IMJ0F8xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506279; c=relaxed/simple;
	bh=PZTfbW/791B/Lp4Gp/fCHdR6Q+Z6dkT2jCmqUw0cwio=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=di4Be1RnIGSmQqZRB590IDt8xc8b389xA7523aQWCRZVBi23XG0TDgerwZUr+/yqDESGAjhfBo81EcWfja4x0+UotPyDQ7wN7JDsQBPcIgiFZnKh1aOopygcKg6E7BpXZeIrJQgvEHvBSN+AhrPjmyrnzvbFhxVKbabHK2XvGqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TPJEHgU6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TPJEHgU6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789506278; x=1821042278;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PZTfbW/791B/Lp4Gp/fCHdR6Q+Z6dkT2jCmqUw0cwio=;
  b=TPJEHgU65Rd3gvyBpOzyvw2OR8p6hBcSEC4hE4DeE2Kpk4vqDLNSoOd9
   OzFxcWjz+KjqxelOEmq2jAkj2sDZDz2/RDsu+O93+inxlImTTYOdoH/D8
   ZdeCKzqtVhTG8qP/rN66Svqy2UY1Zzcc7iRo0wn2Fc6v18uPwnug7+K9I
   Tfxtve+q8DOpbaqaeHgPdR2jMFJpsGsRyxvQFelb83XjP9rXa0p6evPYq
   f3PTzWFX0iEdgSOTVCJMbPrF28PHO4d1m/xOIceNTu39Zmie0W8Rb7h6Y
   XnZT6rNFjmgG4UdLgK5LKoa3UJrDFlzRkT4NAgCf69gtFvhvPImnTyoGA
   g==;
X-CSE-ConnectionGUID: l9bK0hiQR2KRdSfNlCHD5w==
X-CSE-MsgGUID: C6Zn4WdpROm/1LoWJ3zHgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89900220"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89900220"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 14:04:37 -0700
X-CSE-ConnectionGUID: LO0AnMHwTyu4tY0sE8Hggw==
X-CSE-MsgGUID: sxEvR2I5Q4yYaPoGOOdjFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276879112"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 14:04:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 16 Sep 2026 00:04:31 +0300 (EEST)
To: Ilya Mukhamadeev <nicourced@altlinux.org>
cc: Hans de Goede <hansg@kernel.org>, krishna.chomal108@gmail.com, 
    emreleno@gmail.com, edip@medip.dev, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86/hp/hp-wmi: Add periodic tablet mode poll
In-Reply-To: <20260812113303.106965-1-nicourced@altlinux.org>
Message-ID: <bea9a2be-e87f-49ab-ce94-e6ede08b5f37@linux.intel.com>
References: <20260812113303.106965-1-nicourced@altlinux.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Aug 2026, nicourced@altlinux.org wrote:

> From: Ilya Mukhamadeev <nicourced@altlinux.org>
> 
> Some HP convertible laptops (e.g., ProBook x360 series) do not generate
> ACPI events when switching between laptop and tablet mode, causing the
> input subsystem to never receive SW_TABLET_MODE notifications.
> 
> Add a periodic delayed work that polls the tablet mode state every
> second and reports changes via input_report_switch(). Track the last
> known state to avoid sending duplicate events, and clean up the work
> queue on module removal.
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 35 +++++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 8ba286ed8721..5fbfdde3291a 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -460,6 +460,8 @@ static struct notifier_block platform_power_source_nb;
>  static enum platform_profile_option active_platform_profile;
>  static bool platform_profile_support;
>  static bool zero_insize_support;
> +static int last_tablet_state = -1;
> +static struct delayed_work tablet_mode_work;
>  
>  static struct rfkill *wifi_rfkill;
>  static struct rfkill *bluetooth_rfkill;
> @@ -1176,9 +1178,13 @@ static void hp_wmi_notify(union acpi_object *obj, void *context)
>  		if (test_bit(SW_DOCK, hp_wmi_input_dev->swbit))
>  			input_report_switch(hp_wmi_input_dev, SW_DOCK,
>  					    hp_wmi_get_dock_state());
> -		if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit))
> -			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE,
> -					    hp_wmi_get_tablet_mode());
> +		if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit)) {
> +			int tablet = hp_wmi_get_tablet_mode();
> +			if (tablet >= 0) {
> +				last_tablet_state = tablet;

Couldn't this just remove the work when we've positive confirmation the 
events work?

--
 i.

> +				input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, tablet);
> +			}
> +		}
>  		input_sync(hp_wmi_input_dev);
>  		break;
>  	case HPWMI_PARK_HDD:
> @@ -1271,6 +1277,24 @@ static void hp_wmi_notify(union acpi_object *obj, void *context)
>  	}
>  }
>  
> +/*
> + * Periodically poll tablet mode state and send input events if changed.
> + * This works around missing ACPI events on some HP laptops.
> + */
> +static void hp_wmi_tablet_mode_work_handler(struct work_struct *work)
> +{
> +	int cur = hp_wmi_get_tablet_mode();
> +	if (cur >= 0 && cur != last_tablet_state) {
> +		last_tablet_state = cur;
> +		if (hp_wmi_input_dev && test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit)) {
> +			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, cur);
> +			input_sync(hp_wmi_input_dev);
> +			pr_debug("Tablet mode changed to %d\n", cur);
> +		}
> +	}
> +	schedule_delayed_work(&tablet_mode_work, msecs_to_jiffies(1000));
> +}
> +
>  static int __init hp_wmi_input_setup(void)
>  {
>  	acpi_status status;
> @@ -1298,6 +1322,9 @@ static int __init hp_wmi_input_setup(void)
>  	if (!(val < 0)) {
>  		__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
>  		input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
> +		last_tablet_state = val;
> +		INIT_DELAYED_WORK(&tablet_mode_work, hp_wmi_tablet_mode_work_handler);
> +		schedule_delayed_work(&tablet_mode_work, msecs_to_jiffies(1000));
>  	}
>  
>  	err = sparse_keymap_setup(hp_wmi_input_dev, hp_wmi_keymap, NULL);
> @@ -1331,6 +1358,8 @@ static int __init hp_wmi_input_setup(void)
>  
>  static void hp_wmi_input_destroy(void)
>  {
> +	cancel_delayed_work_sync(&tablet_mode_work);
> +	last_tablet_state = -1;
>  	wmi_remove_notify_handler(HPWMI_EVENT_GUID);
>  	input_unregister_device(hp_wmi_input_dev);
>  }
> 

-- 
 i.

