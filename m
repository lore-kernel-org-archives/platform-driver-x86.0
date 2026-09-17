Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881ED3939A4;
	Thu, 17 Sep 2026 14:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656678; cv=none; b=hzIrZDxJEqV5M/5P47XN3MtaRcCp9DQiRo0neS9AG2b8y/eG7C7pxBOo5e6/xxyLnpYIToxMmVymx23Fvcfge+GQeM+N4SRXV19N4tjKGeagMFETBHTgzGQ6ytNw1pzBYoHaout/yy1RxSjzF8hr9GHTYkAvolcI8DxIACjY7lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656678; c=relaxed/simple;
	bh=w7OzSmNXC//lxD13rV6BMtWmlMgU8Hxnvdr4Kx8O9zY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kAOwVAF8dBHXwSIqUjFQYsMVJWxxSLDW1aLNTLUJ67DGaQFHnlu3JN9Deg6NDES3LbxtduY0EXP2cB0pcV8cPEa7zLZXdLa0q391uPkRzC3u5n4uQzXgLAVrNEC6cko00No3MOZee//xa+I/WJrvzFfJ8tH/daUzX0xJm/n4Tko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJxZ4Xbu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJxZ4Xbu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789656668; x=1821192668;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=w7OzSmNXC//lxD13rV6BMtWmlMgU8Hxnvdr4Kx8O9zY=;
  b=cJxZ4XbuMaxEZdbXpP+YykYY+NxbqVXB15gcyZeKeq9EGcfuSnRv/Pgs
   O635N6KeUfBVavI+xYHuSL2eyna+sgwRFJiiHWCTdIAeoHl4kHebiI/bN
   S2DM9uVceMBeqQA2Sr6T6mQ7gCVcfTn1Z5g3hl9DTnlBBg0Ym7TNtPNjr
   mWKoQQqh1RIY1Bo9e7Q6opbdiiRwEz2+/eKdhJQQAUtZL1Zs4wht2mrad
   GgWAd0jhylTU6wwrm87ocAOztfQNz6cdHpoj9KXo8p62sf9zaUd0Si+w5
   9ta8FwsurNvanTMXsuTpRAPk0P0jo8OHiJUZLJZ3hJNhyyZ6nxI0WhgZm
   g==;
X-CSE-ConnectionGUID: ViZgoWHtRaqEoHRGRpjmzQ==
X-CSE-MsgGUID: XsAKiouPSz2Ob5AIuMsVhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89220747"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89220747"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:51:03 -0700
X-CSE-ConnectionGUID: kMAdJ0HoQdWUXxuummNPeQ==
X-CSE-MsgGUID: 7c6L0DOHTLK2S0OHTVWJ5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2024630"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:51:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Sep 2026 17:50:59 +0300 (EEST)
To: Arav Verma <svav2021@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] platform/x86: intel: wmi: Use sysfs_emit in
 sbl-fw-update
In-Reply-To: <20260822174038.619473-1-svav2021@gmail.com>
Message-ID: <2e047550-6272-9b5a-60b3-0f2c1742b555@linux.intel.com>
References: <20260822174038.619473-1-svav2021@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 22 Aug 2026, svav2021@gmail.com wrote:

> From: Arav Verma <svav2021@gmail.com>
> 
> Modernize firmware_update_request_show by replacing legacy
> sprintf() call with sysfs_emit. When altering string,
> corrected format specified from %d to %u to match u32 type of
> target variable.

Hi,

Unfortunately, we cannot accept changes that are not signed off. Please 
see Documentation/process/submitting-patches.rst for more information what 
you certify when signing off a patch and how to do that.

-- 
 i.

> ---
> v3: Resending as v3 due to git send-email formatting error, no code changes have been made.
> 
>  drivers/platform/x86/intel/wmi/sbl-fw-update.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/wmi/sbl-fw-update.c b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
> index 62c9c7f1842ba..cfef71f4f3284 100644
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
> 

-- 
 i.

