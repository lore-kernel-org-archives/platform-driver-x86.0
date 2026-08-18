Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C092E175F;
	Tue, 18 Aug 2026 13:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058582; cv=none; b=AwAxwFBt5SVbanCpkqdzwvu/ty4Hy+jxTpPJBKvzY2xCMWlDt4p19fquFJ+UzzLKwD7JX2jOfOlvgn10KlBfRaRLFMYihlDhpRrLcQld6syI0vzTtTpuGi3QCPfqL3DMiTi39mGzgsh58ypJBOUUW45TnHDEOUP5O3kMmw6oEUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058582; c=relaxed/simple;
	bh=v+mCXUzWg2XHpp3kLiM3T6TnCjkGMKGv3cEHTTi+s/Q=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QPirqFN3puAeyl6bA4V7iu/QPin7QP5sEcAMi9T3Q8fDIQoFekFLr6Yz6sR4pB7g4slHv6NbZUchloz6oR7cZ/5XeJJKWQLD8iEtZhmaRUK9+XNP003ooNVvAUfBu5eh5s/0z6vVszYN5eDFaF6YRVqaATYjhTCOYrRsWkGqcQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jsb3B3uf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jsb3B3uf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787058581; x=1818594581;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=v+mCXUzWg2XHpp3kLiM3T6TnCjkGMKGv3cEHTTi+s/Q=;
  b=Jsb3B3uf55b4NKz2QavqxvpcQgWdJWADiy+RrScTtMhRTSc+6B0/dwCX
   wSwLsULZXYRVCR4S8UrIEW1WX+DXTv3ysWr2w6VFTUEp2F42oqSLzTFq/
   n1BEHlA31koVHPDZnUGOtwdWm/KKj4JkEZrXDQuJCL2b82nb/LUZ4xYgo
   9cZV2QveXYWM7l3c4poGbBFgyEZ/5Y/YWJyahX+Z2PhgGHpLCNBU11nYu
   swe0RnJBpUhaKXXJ6mz2S/DG55l5tfvxXdBSeQ46XUASiUhwcvN6ea+gq
   NjE9mUlI96KzGgFqXwJ6aKfM5bCb1hYWAfgPMv/eqPgdMU5D0Nw89dekY
   Q==;
X-CSE-ConnectionGUID: ulUtmxNpRc2u7wmMFdtMlw==
X-CSE-MsgGUID: Rj/lQjyGRo+If06838u5lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87618104"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87618104"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 06:09:40 -0700
X-CSE-ConnectionGUID: X1mDF0SqSXu9a6DMZjt8uA==
X-CSE-MsgGUID: LdkVkzWqRRaDWmhSs2qWaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="263496825"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 06:09:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Aug 2026 16:09:33 +0300 (EEST)
To: Arav Verma <svav2021@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: intel: wmi: Use sysfs_emit and remove dead
 callbacks
In-Reply-To: <20260810004044.3636731-1-svav2021@gmail.com>
Message-ID: <6e95fc3d-8792-4f87-55d1-d0fcb32c37bb@linux.intel.com>
References: <20260810004044.3636731-1-svav2021@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 9 Aug 2026, svav2021@gmail.com wrote:

> From: Arav Verma <svav2021@gmail.com>
> 
> Modernize firmware_update_request_show by replacing legacy
> sprintf() call with sysfs_emit(). When altering string, also
> corrected format specifier from %d to %u to match u32 type of
> target variable.
> 
> Additionally, remove empty .probe and .remove callbacks from
> wmi_driver struct, as they were print-only and redundant.

Hi,

Please split these two entirely independent changes to two a patch series.

Always stop and reconsider when you have to say "Additionally,"; one 
almost always wants to add another patch into the series instead of 
writing that magic phrase.

> Signed-off-by: Arav Verma <svav2021@gmail.com>
> ---
>  drivers/platform/x86/intel/wmi/sbl-fw-update.c | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/wmi/sbl-fw-update.c b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
> index 62c9c7f18..7e07cfab2 100644
> --- a/drivers/platform/x86/intel/wmi/sbl-fw-update.c
> +++ b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
> @@ -61,7 +61,7 @@ static ssize_t firmware_update_request_show(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> -	return sprintf(buf, "%d\n", val);
> +	return sysfs_emit(buf, "%u\n", val);
>  }
>  
>  static ssize_t firmware_update_request_store(struct device *dev,
> @@ -93,18 +93,6 @@ static struct attribute *firmware_update_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(firmware_update);
>  
> -static int intel_wmi_sbl_fw_update_probe(struct wmi_device *wdev,
> -					 const void *context)
> -{
> -	dev_info(&wdev->dev, "Slim Bootloader signaling driver attached\n");
> -	return 0;
> -}
> -
> -static void intel_wmi_sbl_fw_update_remove(struct wmi_device *wdev)
> -{
> -	dev_info(&wdev->dev, "Slim Bootloader signaling driver removed\n");
> -}
> -
>  static const struct wmi_device_id intel_wmi_sbl_id_table[] = {
>  	{ .guid_string = INTEL_WMI_SBL_GUID },
>  	{}
> @@ -116,8 +104,6 @@ static struct wmi_driver intel_wmi_sbl_fw_update_driver = {
>  		.name = "intel-wmi-sbl-fw-update",
>  		.dev_groups = firmware_update_groups,
>  	},
> -	.probe = intel_wmi_sbl_fw_update_probe,
> -	.remove = intel_wmi_sbl_fw_update_remove,
>  	.id_table = intel_wmi_sbl_id_table,
>  	.no_singleton = true,
>  };
> 

-- 
 i.

