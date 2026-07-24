Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDBC311967;
	Fri, 24 Jul 2026 11:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784894105; cv=none; b=AlEgoJ7+VqJFKOaFDG/jiYRTsROF1JM8e+GhukM4FbY9fUYSMq+Sl34YbLNEprrNncdNw087rtQjGlWJM9jO+Qk9HH/au9LL4qt6krN8E28c95MdgjnPtblIdURJIHvfn0u6U6QIpmGGwm4N775M/MTP+D4KFDusahv7Q4ynOVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784894105; c=relaxed/simple;
	bh=PecyzC3n9GpN8Ss0hM55QXDXyl7kT9b0isy+UKuoBDc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ovllLQtMMgwXbdVBGM4FQoyJKbgTdlWmq/VtuBgb0jGjz9taoGru3w9yaoLgArP8A8XcUVSSFqlaPu6xYHJJPi3sWhke0dQEyLKGDduLOhHPGRh7CwMViejOhirxiywMjGBDiWoybtCsuEtgb8ptdmndDcz11yWfQZ3qV3F2PbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aODbEb+9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aODbEb+9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784894103; x=1816430103;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PecyzC3n9GpN8Ss0hM55QXDXyl7kT9b0isy+UKuoBDc=;
  b=aODbEb+9FYsn4DwNt6mecn/RFlfPW71fyN+bnH14ZCXmbknrGs5zlYTL
   zoNat+hX5rUrH3QKqZrvpm+qastEFSLfOAJ500o4L0Zzyu98r+dVg56Lg
   hmbEkMnFQU0A+OW1aolSTQnySwntX7KaSGgMWGvl4vZBvDvXYiJVHiA25
   Ehaek+VsjzDvzlUUi/pDMIE92786R9/wPPrgjzefufNqGMM14bcgppWPe
   rJFu9E0bt7sE5AzmfVrb1+GeSTUlJbEBJ8wJq5sAN70R2Ww7zlT96gT1F
   2d5VF4kJvTxwRzroU0tKQpOamzw/I0LTKtGhUWb9hyCIfzE30IGx5Wc/D
   A==;
X-CSE-ConnectionGUID: xkjlNhgPRDulpMUqxj98hQ==
X-CSE-MsgGUID: 4AsnstJsS664vmSwKNyOiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96224172"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="96224172"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 04:55:02 -0700
X-CSE-ConnectionGUID: yKsgCo2HSWe/EsZFyFDDEw==
X-CSE-MsgGUID: 0F3TT88pTE6w8hzXDHoj9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="262217690"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.8])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 04:54:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 24 Jul 2026 14:54:54 +0300 (EEST)
To: Rong Zhang <i@rong.moe>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, 
    Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
    Philipp Jungkamp <p.jungkamp@gmx.net>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Fix driver unregistration
 order
In-Reply-To: <20260723-ideapad-rev-exit-v2-1-9c31159022de@rong.moe>
Message-ID: <880d06c9-48d4-92e9-ede9-c34c0f107de2@linux.intel.com>
References: <20260723-ideapad-rev-exit-v2-1-9c31159022de@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Jul 2026, Rong Zhang wrote:

> There are two drivers in the ideapad-laptop module: a wmi_driver and a
> platform_driver. The former is registered before the latter, but the
> unregistration order is the same as the init one instead of the reverse.
> 
> Fix the driver unregistration order by reversing it.
> 
> Fixes: f32e02417614 ("platform/x86: ideapad-laptop: support for more special keys in WMI")
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Changes in v2:
> - Fix a typo in title

Perhaps too used to writing "dead" so fingers kept typing... I can never 
type "roof" succesfully myself, my fingers always do "root" instead. :-)

Anyway, I've applied this but took out the Fixes tag, unless you've some 
real bug in mind related to it?

I also added Suggested-by me to take some blame (if necessary).

Thanks for the patch and Mark for review.

-- 
 i.

> - Link to v1: https://patch.msgid.link/20260723-ideapad-rev-exit-v1-1-bf0d8ac9b5ed@rong.moe
> ---
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
> index 4fbc904f1fc3..8213524504ee 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -2564,8 +2564,8 @@ module_init(ideapad_laptop_init)
>  
>  static void __exit ideapad_laptop_exit(void)
>  {
> -	ideapad_wmi_driver_unregister();
>  	platform_driver_unregister(&ideapad_acpi_driver);
> +	ideapad_wmi_driver_unregister();
>  }
>  module_exit(ideapad_laptop_exit)
>  
> 
> ---
> base-commit: 248951ddc14de84de3910f9b13f51491a8cd91df
> change-id: b0d55ec3-ideapad-rev-exit-381b4a9cb5a4
> 
> Thanks,
> Rong
> 
