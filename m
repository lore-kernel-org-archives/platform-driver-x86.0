Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1E046EF84;
	Tue, 18 Aug 2026 13:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787059531; cv=none; b=tBlh5ZvK/OXBUCvLO7JGaUDI7y8OSnI6vbjD6Z2bw2a0DDO3CpEevYRmlTS1QkJZYZ/DRrE0/DinBafSqtuCogVyy53L9e/S1HR3WorIxli+qJJ5G6+ZIxFKuKeVUaB0HRaHaIIjLnoisS9od+YFD31uEDCJOFRh4yvcCaEnrgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787059531; c=relaxed/simple;
	bh=cFHjGKrgIeqsQ4waYUKMgpaCZuGAd9fe2c8w515Oy+c=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=R5NcK3zv+1L9JjwJaSD80udMiRaU+2c9QOy1+2xQ1E61odFDNy41hYxpOCLg8C6IETFYYkTkTICLvF0LSK068CDcWuNt0zy1lZ2TCPUeHfuRm2RSJ8Oh/SbailGzPF8wSr/WXMx1T5YkQc+xEQ0iDpWs+gK20bIVJiDPiieCqEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l8bhmKW6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l8bhmKW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787059529; x=1818595529;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=cFHjGKrgIeqsQ4waYUKMgpaCZuGAd9fe2c8w515Oy+c=;
  b=l8bhmKW6HbSKk7fYkFY8rw/t2H6Pd1Q5cN0QRErjPPmBSHau0w1QDDnG
   0a78akTu9AEBY5QXB1HuLfS2StGfwkDlx94qqdfT9Kp7uLgTli7/v4ENv
   EbfKxiOVqq5UfsaZOMaauQDrLYdPzccSLtnxXsvqujdD2mUGAN6nvd+dr
   VKqUXaTOQ4BjYgibbzsSq0L6UpOg1dG4LXawyqMmMNVio118q5Feru+If
   vciW6KklioN6zUfccBgkM+7Jwj2inCL2TVJpCqde86s6wwBBDmyqnA5yJ
   +PIvKQf4ma8LhAP4vHZ18JmTz6RR5emAhQH/D3LS++JiMxBOwwMb7NujN
   Q==;
X-CSE-ConnectionGUID: A1VOx9H/R0ai31q035hV+A==
X-CSE-MsgGUID: FPF8HELJRFKEyVEnIx895A==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87571844"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87571844"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 06:25:28 -0700
X-CSE-ConnectionGUID: 50UQkHv4Qf+/OqndhNnq5Q==
X-CSE-MsgGUID: H+cVQVNWT7K5k5nw0mA+6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="270439157"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 06:25:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Aug 2026 16:25:21 +0300 (EEST)
To: Thorsten Blum <thorsten.blum@linux.dev>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, 
    Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
    Hans de Goede <hansg@kernel.org>, 
    =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Use bool for str_supported()
 parameter
In-Reply-To: <20260806131549.235170-2-thorsten.blum@linux.dev>
Message-ID: <58e1e888-b13b-a77f-363a-8e8a9a1f9c4a@linux.intel.com>
References: <20260806131549.235170-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Aug 2026, Thorsten Blum wrote:

> Make str_supported() take a bool, define it inline, and return string
> literals directly. Use a single inline definition for both debug and
> non-debug builds.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 445e1403308e..022353f95cab 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -448,11 +448,14 @@ do {									\
>  		       __func__, ##arg);				\
>  } while (0)
>  
> +static inline const char * __init str_supported(bool is_supported)
> +{
> +	return is_supported ? "supported" : "not supported";
> +}

This certainly looks something that should be in linux/string_choices.h. 
I'm pretty surprised it isn't already there actually.

Not sure about how to name it though, str_supported_not_supported() a bit 
repetitive. Andy?

-- 
 i.

> +
>  #ifdef CONFIG_THINKPAD_ACPI_DEBUG
>  #define vdbg_printk dbg_printk
> -static const char *str_supported(int is_supported);
>  #else
> -static inline const char *str_supported(int is_supported) { return ""; }
>  #define vdbg_printk(a_dbg_level, format, arg...)	\
>  	do { if (0) no_printk(format, ##arg); } while (0)
>  #endif
> @@ -5798,7 +5801,7 @@ static int __init led_init(struct ibm_init_struct *iibm)
>  	}
>  
>  	vdbg_printk(TPACPI_DBG_INIT, "LED commands are %s, mode %d\n",
> -		str_supported(led_supported), led_supported);
> +		str_supported(led_supported != TPACPI_LED_NONE), led_supported);
>  
>  	if (led_supported == TPACPI_LED_NONE)
>  		return -ENODEV;
> @@ -11515,15 +11518,6 @@ static struct proc_dir_entry *proc_dir;
>  
>  static bool force_load;
>  
> -#ifdef CONFIG_THINKPAD_ACPI_DEBUG
> -static const char * __init str_supported(int is_supported)
> -{
> -	static char text_unsupported[] __initdata = "not supported";
> -
> -	return (is_supported) ? &text_unsupported[4] : &text_unsupported[0];
> -}
> -#endif /* CONFIG_THINKPAD_ACPI_DEBUG */
> -
>  static struct dentry *tpacpi_dbg;
>  static void tpacpi_debugfs_init(void)
>  {
> 
