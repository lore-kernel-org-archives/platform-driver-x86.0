Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA0322FDEC;
	Mon, 29 Dec 2025 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767002862; cv=none; b=cL2Es023lk8ROU7x1geTfVdxw+EcgabcUZHWx8RN8N8RHEtmKv6zC2VuXyMN2DFr/p7M+gQVdiyDf/oHUr8bugPCVGXF6Qbm1V81z7kol3ohS+fDkQDO/HRoPf1DWiVWekdPwUnXW65aE68/4XHnU640NnNb++GR70qUjkmL4IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767002862; c=relaxed/simple;
	bh=2oYkd4MFh4J+3HbGtD2fhaDrXgzLHwuNIOi/c1BzAs0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=K+Z2vCXoQLWktbaAp94Xga4ff/2+K+jINvM8y723TdDmp5AeFFrK+4ayBlaiI/e80mn2p08z62pgpOcuqus2Jvivjik5OgO6bWppYZengA9yT4cnzWufA0Bs6pbwGHKmQesXYuaEYZo1GgbLSj+//6Q7HVxiHZnRz8UWzUohq0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VhJQIbel; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VhJQIbel"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767002861; x=1798538861;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2oYkd4MFh4J+3HbGtD2fhaDrXgzLHwuNIOi/c1BzAs0=;
  b=VhJQIbelG9qX3U0KGtguyt8BPgYw5vQpDzisa5q5qN8Vk5K44VkeUdcF
   fRVpHzyFV1Bm5wQRUXa4kagWioduU5TXxC8yek8RX6W8olOKlMTtgHFxY
   ewdFnXYzf1WoZ4cZCUnP9mgoNtPdaiifcQqqpCjheG9Rrst9MkPPyTetw
   Kvu3Zaldc2tMmbAX5LGk0trmyeWoup8nNlUMNj0LostEvrjZZK5X8nCQF
   pPbsT7k0fJQvBpfqzUl44RT4nyzxs9f+EfV/OGSyqG35B6/XwNkZ31K75
   RLVcvsKOJ9VJU+a5nF5wkKPZBVt1bX5tOs8BnsZRD5EsLXbFi+kBdwQuO
   Q==;
X-CSE-ConnectionGUID: YtPKOqhEQbKikBiLlL8ZGQ==
X-CSE-MsgGUID: UlotT6mgQl6mgKCO8lysYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="67816191"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="67816191"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 02:07:40 -0800
X-CSE-ConnectionGUID: MK+61dM0R0eSII5lnhbVeQ==
X-CSE-MsgGUID: HQ7TxL/VQjS3YsQ6ryzp6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="201164287"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 02:07:37 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Dec 2025 12:07:34 +0200 (EET)
To: Denis Benato <denis.benato@linux.dev>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>, 
    Mateusz Schyboll <dragonn@op.pl>, Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH 2/3] platform/x86: asus-wmi: fix sending OOBE at probe
In-Reply-To: <20251225143007.2684239-3-denis.benato@linux.dev>
Message-ID: <f7537660-2b7a-e157-ec6a-17057dcdfbd9@linux.intel.com>
References: <20251225143007.2684239-1-denis.benato@linux.dev> <20251225143007.2684239-3-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Dec 2025, Denis Benato wrote:

> Disabling oobe is an important step to be able to fully control
> the hardware in TUF laptops that supports this feature,
> but the command has been incorrectly tied to deprecated
> attributes: restore sending the OOBE exit command.

Please reflow to 72 chars.

Fixes tag seems to be missing.

> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> ---
>  drivers/platform/x86/asus-wmi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index a49447eff4f4..8dfdde7877a8 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -4899,7 +4899,6 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
>  	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
>  	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
> -	asus->oobe_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_OOBE);
>  
>  	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
>  		asus->mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
> @@ -4912,6 +4911,8 @@ static int asus_wmi_add(struct platform_device *pdev)
>  		asus->gpu_mux_dev = ASUS_WMI_DEVID_GPU_MUX_VIVO;
>  #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>  
> +	asus->oobe_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_OOBE);
> +
>  	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY))
>  		asus->throttle_thermal_policy_dev = ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY;
>  	else if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO))
> 

-- 
 i.

