Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B6D8821;
	Mon, 29 Dec 2025 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767002798; cv=none; b=d/mWzBP7mXqNUDYEww1Fhb4OBaYnoR0WLZLSPfoyU/399l+/rgbG2P92zw1dGDNcAppEZUYHD+wPfvwjU/D9H+j9Tn76Jkcl7d6N6pq1GWWzf0eUBdjtf2NV/swrHToqJjw7by6jdm4dVn3GSRn6jH90i2x0l2mLEYZiJAMNzZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767002798; c=relaxed/simple;
	bh=1XFVMOt8oahbjs4a5UaZi6d3YrJEM0ZsgsWbP05ZkS0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=q4t08K2yU8Vhlwd8Q8nyTKKITTeUG4K1DmkGCtTbbUKMfE8UE42U4CB6Noy5XmcMqobfN1NpAjHIa6J+iQvBdtLSzCUCQO0jXPNkFU2FqHiiIxJ3l1Q51pONMFEJncZuCucYpPfp8AYuylE/gNVK7U/vuSAKDry0VVrvZBhmcho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bk0RXu1h; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bk0RXu1h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767002796; x=1798538796;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1XFVMOt8oahbjs4a5UaZi6d3YrJEM0ZsgsWbP05ZkS0=;
  b=bk0RXu1hy5LXVU/UacImA1ClPHptFYSWoCRNvxdhcH4CbMwgckOujdch
   FBx2Xj7n2gVD6g83A/DAx3jK/nEA/oCvEPgZ87wH+YmHiU9Br6mCAtOwZ
   DEB251qqrmCvItXx9ZiYvPayqZazp3ZSYt8GEPYD1CJ+eVLKBKXKh0Dav
   lo9hk2Y/JfHZk04XJ2K9xBdvOAHYZW6bz/HnSsjOrq1zHZ7SL4ZXGYgW1
   MG2AXLwEZ2Nxowu/ZJoIfB8kMNCpk9d0CCnK5poMkn+35T3ZcAS21sedZ
   B5jhU5T6HfpRsB91ksqR0dAeKmrzoVuMPUD/LCpQ3/ZbfgVAc7UmqfQbQ
   g==;
X-CSE-ConnectionGUID: OPxj3RzDRoCtv9f8UMS9uQ==
X-CSE-MsgGUID: tH7lVfHEQ4WLudWMcDyiGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="80065850"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="80065850"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 02:06:35 -0800
X-CSE-ConnectionGUID: +AmN0JJWTGiPR8HCHRPYWg==
X-CSE-MsgGUID: HhwqIf0/TRyVKCaLvTFulw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="205795142"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 02:06:32 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Dec 2025 12:06:29 +0200 (EET)
To: Denis Benato <denis.benato@linux.dev>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>, 
    Mateusz Schyboll <dragonn@op.pl>, Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH 1/3] platform/x86: asus-wmi: explicitly mark more code
 with CONFIG_ASUS_WMI_DEPRECATED_ATTRS
In-Reply-To: <20251225143007.2684239-2-denis.benato@linux.dev>
Message-ID: <54cc6828-9191-403c-18d5-76f768d70381@linux.intel.com>
References: <20251225143007.2684239-1-denis.benato@linux.dev> <20251225143007.2684239-2-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Dec 2025, Denis Benato wrote:

> Be more explicit in code that will be excluded when compiling
> with CONFIG_ASUS_WMI_DEPRECATED_ATTRS disabled.

Does this result in build fails or warnings? If that's the case, it should 
be mentioned in the changelog + Fixes tag added.

> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> ---
>  drivers/platform/x86/asus-wmi.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 4aec7ec69250..a49447eff4f4 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -302,7 +302,11 @@ struct asus_wmi {
>  	u32 nv_temp_target;
>  
>  	u32 kbd_rgb_dev;
> +
> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>  	bool kbd_rgb_state_available;
> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
> +
>  	bool oobe_state_available;
>  
>  	u8 throttle_thermal_policy_mode;
> @@ -1060,6 +1064,7 @@ static const struct attribute_group kbd_rgb_mode_group = {
>  };
>  
>  /* TUF Laptop Keyboard RGB State **********************************************/
> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>  static ssize_t kbd_rgb_state_store(struct device *dev,
>  				 struct device_attribute *attr,
>  				 const char *buf, size_t count)
> @@ -1106,6 +1111,8 @@ static const struct attribute_group kbd_rgb_state_group = {
>  	.attrs = kbd_rgb_state_attrs,
>  };
>  
> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
> +
>  static const struct attribute_group *kbd_rgb_mode_groups[] = {
>  	NULL,
>  	NULL,
> @@ -1861,8 +1868,11 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>  
>  	if (asus->kbd_rgb_dev)
>  		kbd_rgb_mode_groups[num_rgb_groups++] = &kbd_rgb_mode_group;
> +
> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>  	if (asus->kbd_rgb_state_available)
>  		kbd_rgb_mode_groups[num_rgb_groups++] = &kbd_rgb_state_group;
> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>  
>  	asus->led_workqueue = create_singlethread_workqueue("led_workqueue");
>  	if (!asus->led_workqueue)
> 

-- 
 i.

