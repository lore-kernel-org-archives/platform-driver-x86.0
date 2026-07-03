Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D769A3E317B;
	Fri,  3 Jul 2026 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085465; cv=none; b=YLCJCOJvEdpLeJeLgAbgktTriPJkRj7GO15G83Ne65LfvQBBYAJPIRm4VWapvyX6SDZrQ0oEWPD29ezo7DnpfWz79fETgJBF9xsZ0DXzg0RHc9VmytEwSqZG8B8ZW2lruKh/5aqxIiftev0HsNiJSUU09PDuP3PegZiwxIhqWfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085465; c=relaxed/simple;
	bh=Nnw8WnW/rA3rDQ09kxz90fk/3OU+IXWd9Y3v514vsAE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oQYzraUZA4eMYeBrUEmbATGyZR9Y/Kj9RjB1A930JyjNkrTTUAAmW30lD+yUf/fO2Czj1ii3bLG/A46imaWDNPiuaVbN49+iFVIuLwzuU6Mss6CUbz5xZVz1ZG/jbMHRh0yQwlhnGprEpJ0ZqL4ZYZlHawDlcCaa0tLitpQk838=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S2HEZuCO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S2HEZuCO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783085464; x=1814621464;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Nnw8WnW/rA3rDQ09kxz90fk/3OU+IXWd9Y3v514vsAE=;
  b=S2HEZuCONhgOmS8KFTk19y3qFXLg/nfF+HHTjUc5AxakOirPzU+yynlT
   jp3CudMp6yeFhmYEcaJpvUSW3+Vu3USyfNFl4oe+QsNBFWS1N8s0oLOEE
   LjbKyPCHr/TKH4ILZZyEcHpQbas3PaQlGBZfFsdSF5Q2D4+DVdY1BEPfr
   HBnE39+JC5kEGWor1DvLs3UP3duuM9otiOcP4g8WJPKFd9eIAv6v6KQXd
   t/iW+RVTwEry95/rmxMRvsw1/VKYWFnM7dKguYHsMxGJy36eHzR3AzPkd
   2x8AIsrIG20GmGIisyq73KhNfHNMi5vtTXImz5WivDlWeNWImivWrQ7SA
   A==;
X-CSE-ConnectionGUID: ZUytkLkQRBy+rFsMXOUMIA==
X-CSE-MsgGUID: v+BmwnBaTtSKUkaPqwMZkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="86388727"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86388727"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:31:03 -0700
X-CSE-ConnectionGUID: bAmWFqiKQKy0QMlQSnHWMQ==
X-CSE-MsgGUID: ZScWjv5tSYC1CQhwllxXAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="250464790"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:31:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 3 Jul 2026 16:30:56 +0300 (EEST)
To: Denis Benato <denis.benato@linux.dev>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>, 
    Denis Benato <benato.denis96@gmail.com>, 
    Travers Biddle <traversbiddle@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: temporarily revert to setting
 a charge limit
In-Reply-To: <20260630230940.612532-1-denis.benato@linux.dev>
Message-ID: <b04bcf74-52e3-840c-7441-facec0aa064b@linux.intel.com>
References: <20260630230940.612532-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Jun 2026, Denis Benato wrote:

> A userspace regression has been observed leaving the battery charging
> threshold unconfigured, so while the situation is being sorted revert
> the change keeping the infrastructure in place to return to the
> preferred behaviour whenever possible.
> 
> Link: https://gitlab.freedesktop.org/upower/upower/-/work_items/347
> Closes: https://lore.kernel.org/all/CABsFS_g+V_Owum6knLhenhM15EXJRrsF0FcLiw30WZxarsTpUA@mail.gmail.com/
> 

Reported-by ?

No blank lines in tags block please.

How stable people will know which kernel this should go? The easiest way 
is put Fixes tag for that purpose. If don't want to say this "fixes" 
things, also Cc: stable... # [instruction here] is possible (more 
information about formatting in stable-kernel-rules.rst).

-- 
 i.

> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> ---
>  drivers/platform/x86/asus-wmi.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 3c9ef826551d..e835779b6f5f 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1618,6 +1618,8 @@ static DEVICE_ATTR_RW(charge_control_end_threshold);
>  
>  static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_battery_hook *hook)
>  {
> +	int ret, rv;
> +
>  	/* The WMI method does not provide a way to specific a battery, so we
>  	 * just assume it is the first battery.
>  	 * Note: On some newer ASUS laptops (Zenbook UM431DA), the primary/first
> @@ -1635,12 +1637,30 @@ static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_batter
>  
>  	/* The charge threshold is only reset when the system is power cycled,
>  	 * and we can't read the current threshold, however the majority of
> -	 * platforms retains it, therefore signal the threshold as unknown
> -	 * until user explicitly sets it to a new value.
> +	 * platforms retains it.
> +	 *
> +	 * Setting a negative value would signal the threshold as unknown
> +	 * until user explicitly sets it to a new value, however to avoid
> +	 * regressing userspace, we initialize it to a value of 100.
>  	 */
> -	charge_end_threshold = -1;
> +	charge_end_threshold = 100;
> +	ret = asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, charge_end_threshold, &rv);
> +	if (ret) {
> +		pr_err("Failed to reset battery charge threshold\n");
> +		goto asus_wmi_battery_add_err;
> +	}
> +
> +	if (rv != 1) {
> +		pr_err("Error in battery charge threshold reset\n");
> +		ret = -EIO;
> +		goto asus_wmi_battery_add_err;
> +	}
>  
>  	return 0;
> +asus_wmi_battery_add_err:
> +	device_remove_file(&battery->dev,
> +			   &dev_attr_charge_control_end_threshold);
> +	return ret;
>  }
>  
>  static int asus_wmi_battery_remove(struct power_supply *battery, struct acpi_battery_hook *hook)
> 
