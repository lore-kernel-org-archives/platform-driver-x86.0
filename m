Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CB7286D5D;
	Wed,  4 Mar 2026 13:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772631129; cv=none; b=RUfpDfCIpEIhmrnsHreAkHVsKM6fJuOE5mVko3Gs+A8kP79Mtm65Y5HQLrZ6JDlWTkMFYjh6RAw7cQVc3jbl+yJdNHQ+Nt/Ib3UGcBllXBzawj2LzuXlMQDJ0zHYjSpongwU6gkPmKRmw3S5d+tUSl3Bt/WDqp5ArLjONhPO7qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772631129; c=relaxed/simple;
	bh=pheDkkEOSdAxAWeMsVbdAcvikJgt2dROAJ2HThuaWt4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fYzP6tG2htpmS0gGmfNhu0qHucc3V3GgpzPe75G0Bpl1V8nzrGt3USFPpyKOPZCIbwN5GQarPzVAXoG6Tm0CBc4xIQvOKWf+6QMORorv53NdPVimesTpj+52Aw4jVhvpoQ8Ubkoi2x2dD5WxxYWPkCxEr14E6CTl5xj4PfJZqgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLiJc7G1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLiJc7G1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772631128; x=1804167128;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pheDkkEOSdAxAWeMsVbdAcvikJgt2dROAJ2HThuaWt4=;
  b=nLiJc7G1iy2yKOtFn6jI0J9bpDXxb86tyUzgwAX1U8uenx8Md91CovB2
   0WL8mcFgUzKpuLklaHIgvYQoMnk4dQE3GgiCH7OQp7C2UZMVT2RIQK2kz
   xDR3RAUIEjRilJ66V7Z3D43+e/Cd9tzH89ZoVAwBdpW6rajbAnEcz5N3n
   KNdhE3flNdMvA3Zg8LvDqME6tvmwQKzZ0aPM/H2FPF7CUyOqtNOB+lArx
   RVjjhXOTjczUUdfsuTieI037hOzaD2mqnGL8j8mnuv7vzeG6K5vBLjMVl
   BD/j7nwaPliEhQfzLGGBRC1NsHcwdawryi5gKWQf274Jcwouzi3r/RqqA
   A==;
X-CSE-ConnectionGUID: TYoDE0t1TcK5RHKKs06IhA==
X-CSE-MsgGUID: evBBYFpDSwqCxyyuApxUhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73602374"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73602374"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:32:07 -0800
X-CSE-ConnectionGUID: aaFhcWqYSUySntuYIvYfkg==
X-CSE-MsgGUID: WbhVQY4ATPWQHXKHfx12ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="248818452"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:32:05 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 4 Mar 2026 15:32:00 +0200 (EET)
To: Denis Benato <denis.benato@linux.dev>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>, 
    Derek John Clark <derekjohn.clark@gmail.com>, 
    Denis Benato <benato.denis96@gmail.com>, 
    Antheas Kapenekakis <lkml@antheas.dev>
Subject: Re: [PATCH] platform/x86: asus-wmi: do not enforce a battery charge
 threshold
In-Reply-To: <20260304132608.33815-1-denis.benato@linux.dev>
Message-ID: <48c26a48-5c27-3a4a-b009-e24489efb583@linux.intel.com>
References: <20260304132608.33815-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Mar 2026, Denis Benato wrote:

> Users are complaining for the battery limit being reset at 100% during
> the boot process while the general consensus appears to not apply
> unsolecited hardware changes, therefore stop resetting the battery

unsolicited

I'll deal with this while merging. If nothing else comes up, no need to 
send v2 just because of it (I'm just sending this to remind myself).

--
 i.

> charge limit at boot and return -ENODATA on charge_end_threshold to
> signal for an unknown limit.
> 
> Suggested-by: Antheas Kapenekakis <lkml@antheas.dev>
> Suggested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> ---
>  drivers/platform/x86/asus-wmi.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 6ba49bd375df..dc330a8ee2f2 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1557,7 +1557,10 @@ static ssize_t charge_control_end_threshold_show(struct device *device,
>  						 struct device_attribute *attr,
>  						 char *buf)
>  {
> -	return sysfs_emit(buf, "%d\n", charge_end_threshold);
> +	if ((charge_end_threshold >= 0) && (charge_end_threshold <= 100))
> +		return sysfs_emit(buf, "%d\n", charge_end_threshold);
> +
> +	return -ENODATA;
>  }
>  
>  static DEVICE_ATTR_RW(charge_control_end_threshold);
> @@ -1580,11 +1583,11 @@ static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_batter
>  		return -ENODEV;
>  
>  	/* The charge threshold is only reset when the system is power cycled,
> -	 * and we can't get the current threshold so let set it to 100% when
> -	 * a battery is added.
> +	 * and we can't read the current threshold, however the majority of
> +	 * platforms retains it, therefore signal the threshold as unknown
> +	 * until user explicitly sets it to a new value.
>  	 */
> -	asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, 100, NULL);
> -	charge_end_threshold = 100;
> +	charge_end_threshold = -1;
>  
>  	return 0;
>  }
> 
