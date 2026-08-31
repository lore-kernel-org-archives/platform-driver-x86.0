Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2A15505EB;
	Mon, 31 Aug 2026 15:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191888; cv=none; b=h3OxysCvvB9utkh0QfsTSaWKaLK6ZwTx5661bwbdAbuiQptDATVk1B9pr2lQBA+yhnC/6YThVbTlq1qfqpAHo/ImKaHB9MzP16lxB8EmVt4PwgkkYH4X0wveEMiTV19os8V3PM4cnoYpctDYYrNIIIE00O3M9DZvQzn1ck2CGAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191888; c=relaxed/simple;
	bh=+MLPUR236CK/fUFbonm/fZq+X6/lYia1b02HagtX1+s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hTZgf0Oqu9W/1E0JAJQKn4ASF2V6zKDpbR6wgt+mFsfhZKuJ6r4JDNdQKu5nUQ6tUiDY9UE45+kPUTZbfjrCwjCDUGdJGV0ib/6Tve/YfCf1ZvHehiGswlBKAoQ7DqZ5eS35ZF/wdlLXR/3E6WBytFemPnisMaYRPlulShnsLzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QemGHKPL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QemGHKPL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788191886; x=1819727886;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+MLPUR236CK/fUFbonm/fZq+X6/lYia1b02HagtX1+s=;
  b=QemGHKPL88O9Cjg0wvsZcLBCZ2WYiHua2XSHgaVsbf0/+r+d7KBhm641
   x7S0uugK7sNUpxmvt4561mKOtbkjNjnGw0odTh8XOAx9XOJIWL8My/Ejh
   0XqOEG9A7yXiUKR42Sc4tSNgpy6T+l/utQtXWWi2Ecyn80ez7Tp7vEAC5
   fjVGEffVkYpdN7CGirB4ikNsTAJgN/LpAbi/JozWkSK7e6YJ3Msilieb1
   5+oxk7ia2nZikYOzxm6EhlU3ycRkQKImdSaeby9XZVQYpA4qvsRYeMUEy
   ld4IQXnRFwvE4LFHiLwLUhm37VY0KUJ3ZnHu6iJ2IIuZjqbIjI6syb9b4
   A==;
X-CSE-ConnectionGUID: VYb4I7soQJmVv16hRVNbQA==
X-CSE-MsgGUID: S4JjmJ52R328fM/3oTzr0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88364418"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="88364418"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 08:58:06 -0700
X-CSE-ConnectionGUID: xeyQrpyyTgW9Vto6q4VKtw==
X-CSE-MsgGUID: L1rROXAWR1q25RLOyeTgHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="265123886"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.121])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 08:58:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 31 Aug 2026 18:57:59 +0300 (EEST)
To: Ahmed Yaseen <yaseen@ghoul.dev>
cc: Hans de Goede <hansg@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
    Nir Yehoshua <nir@ciphersecuritylabs.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: asus-wmi: validate custom fan curves on
 enable
In-Reply-To: <20260828160743.31957-1-yaseen@ghoul.dev>
Message-ID: <839e9e42-6793-731c-8785-16c1c95067ae@linux.intel.com>
References: <20260828160743.31957-1-yaseen@ghoul.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 28 Aug 2026, Ahmed Yaseen wrote:

> Custom fan curves reach firmware unchecked, so a curve whose temperature
> or PWM decreases from one point to the next is accepted. The firmware
> does not respect such a curve: a first point of 100% followed by 50%
> leaves every point running at 100%. The kernel keeps reporting the
> points that were written, so sysfs stops describing what the fans are
> actually doing.
> 
> Reject the curve when it is enabled. Validate on enable rather than on
> write because fan curves are written one point at a time and are
> inconsistent mid-write.

You should rephrase this sentence.

-- 
 i.

> Fixes: 0f0ac158d28f ("platform/x86: asus-wmi: Add support for custom fan curves")
> Reported-by: Nir Yehoshua <nir@ciphersecuritylabs.com>
> Signed-off-by: Ahmed Yaseen <yaseen@ghoul.dev>
> ---
>  drivers/platform/x86/asus-wmi.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index a65090429ca7..3b743fec5c64 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -3714,6 +3714,33 @@ static int fan_curve_write(struct asus_wmi *asus,
>  					 arg1, arg2, arg3, arg4, &ret);
>  }
>  
> +/*
> + * A fan curve is a set of points the firmware interpolates between, so it
> + * only makes sense if neither temperature nor PWM ever decreases along it.
> + */
> +static int fan_curve_validate(struct device *dev, struct fan_curve_data *data)
> +{
> +	u8 *percents = data->percents;
> +	u8 *temps = data->temps;
> +	int i;
> +
> +	for (i = 1; i < FAN_CURVE_POINTS; i++) {
> +		if (temps[i] < temps[i - 1]) {
> +			dev_warn(dev, "fan curve: temperature decreases at point %d (%u < %u)\n",
> +				 i, temps[i], temps[i - 1]);
> +			return -EINVAL;
> +		}
> +
> +		if (percents[i] < percents[i - 1]) {
> +			dev_warn(dev, "fan curve: pwm decreases at point %d (%u < %u)\n",
> +				 i, percents[i], percents[i - 1]);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static ssize_t fan_curve_store(struct device *dev,
>  			       struct device_attribute *attr, const char *buf,
>  			       size_t count)
> @@ -3798,6 +3825,11 @@ static ssize_t fan_curve_enable_store(struct device *dev,
>  	}
>  
>  	if (data->enabled) {
> +		err = fan_curve_validate(dev, data);
> +		if (err) {
> +			data->enabled = false;
> +			return err;
> +		}
>  		err = fan_curve_write(asus, data);
>  		if (err)
>  			return err;
> 
> base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
> 
