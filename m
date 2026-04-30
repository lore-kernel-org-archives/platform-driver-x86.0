Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850A4410D29;
	Thu, 30 Apr 2026 12:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553639; cv=none; b=gd0CJ9Zd/FKbWRj7cUahcY6DmrvqDMqTAK1rWzojKCVKXi86+UPHE/b0zxrkyB3zbBGlctqt4I+pyiy6IB6lrxpxk9H+K6KmEjeHvthlRpgbrW+d2nTCbqg25+GeQmbzWUG0io/GT+oqnD3Y6J7+HB7CMWq+D1z2OCBtDkS9gyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553639; c=relaxed/simple;
	bh=GmUAPBNRBJRQZy1AARegjFOxuJfulfscgahg9OIUuQA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Y4WdzfZtsQjDedkQy8uR+IwDNz1FCxsJdtKBLan04MfBFWIrybXlISAxbZWYU6KeODdKCYrbB9Gc+8O0JjCKbacNcF4PVz7S4ZK11Mo3mzsZawsZZCrF/NJvRe3mTR3MnOpkddqtDx8SwZ6IlfHFkr3s0MBUnjJgbj3cgxp4uZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5Tyv4gR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5Tyv4gR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777553637; x=1809089637;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GmUAPBNRBJRQZy1AARegjFOxuJfulfscgahg9OIUuQA=;
  b=H5Tyv4gRDL7y7sotYdhQhRghlEcpBmExTcbGatuWEPSPPzHVN7llTMv1
   quxQ6jp3OEEmbATjIACCt7GW85Jo8vSDpq3HngVG7HsLBNeBUk7BkgogO
   tiveK4FJJuQoQJ9mjJl3n/CDvwZlouZnA7rXAVhIbiDiOO2s+BBS5wQe0
   FGgtcwKwXJJs555h1LbAa8kaEql/R9l/ICIkGLlILdj71GNG2yCdfoj7m
   35XsPPXhVOm+/0+WLMWP9onEN5fdxb1tZjpjxxd9AEvyDpcOjXVieCqNZ
   4bpmrX9NwmxG5PHAs9fA/tuEdQjfeX5KzL1rjcu1yVCHIx2exyAi2jTUn
   w==;
X-CSE-ConnectionGUID: CiDoG25sQS62AUxCD+9eJg==
X-CSE-MsgGUID: 4Kx08VogSvyfJcHrODjIkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89961530"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="89961530"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:53:56 -0700
X-CSE-ConnectionGUID: 9V1oJsojTvi95iNgj0wOcA==
X-CSE-MsgGUID: bmRp7om2RRKSK1QN6w05eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="264943805"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:53:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 30 Apr 2026 15:53:49 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, wse@tuxedocomputers.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] platform/x86: uniwill-laptop: Properly initialize
 charging threshold
In-Reply-To: <20260417050912.5582-2-W_Armin@gmx.de>
Message-ID: <9cc1d286-f41a-c920-aaad-1c24c4e6f2f7@linux.intel.com>
References: <20260417050912.5582-1-W_Armin@gmx.de> <20260417050912.5582-2-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 Apr 2026, Armin Wolf wrote:

> The EC might initialize the charge threshold with 0 to signal that
> said threshold is uninitialized. Detect this and replace said value
> with 100 to signal the EC that we want to take control of battery
> charging. Also set the threshold to 100 if the EC-provided value
> is invalid.
> 
> Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
> Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/uniwill/uniwill-acpi.c | 28 ++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index faade4cf08be..8f16c94221aa 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -1404,7 +1404,12 @@ static int uniwill_get_property(struct power_supply *psy, const struct power_sup
>  		if (ret < 0)
>  			return ret;
>  
> -		val->intval = clamp_val(FIELD_GET(CHARGE_CTRL_MASK, regval), 0, 100);
> +		regval = FIELD_GET(CHARGE_CTRL_MASK, regval);
> +		if (!regval)
> +			val->intval = 100;
> +		else
> +			val->intval = min(regval, 100);

...

> +	/*
> +	 * The charge control threshold might be initialized with 0 by
> +	 * the EC to signal that said threshold is uninitialized. We thus
> +	 * need to replace this value with 100 to signal that we want to
> +	 * take control of battery charging. For the sake of completeness
> +	 * we also set the charging threshold to 100 if the EC-provided
> +	 * value is invalid.
> +	 */
> +	threshold = FIELD_GET(CHARGE_CTRL_MASK, value);
> +	if (threshold == 0 || threshold > 100) {
> +		FIELD_MODIFY(CHARGE_CTRL_MASK, &value, 100);

AFAICT, this does exactly the same thing as the other code above (but 
looks very different on surface). Wouldn't it make sense to have them 
share code?

-- 
 i.
