Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D703FFFB9;
	Mon, 29 Jun 2026 12:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736436; cv=none; b=mu9pfwruhVYrcih1PERK9FQFTyGHdPzXQY99C7Bv/JIrH8RQK5SrMEPtcYDmDJJL4sol+P2mwwFAksUEKPhT2ThpYuM0AJS2Ab+J/TDYJk9y77fncHmzv2EohLthZfGPxO7UtWe/23hJqYpoeGIxrEQIgALEcOBOkGN+wgcLEXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736436; c=relaxed/simple;
	bh=i4qSbMrsSNt0jFOm8KhkgMXxoK3BYPfw5wF1cksuyGM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AnPifPG5d85c86frKhg/AXN2c0qqOWw6KMpsnqNUFKQpXwXNoU5VWVfyqcG9s5b7i5uXJK632Rlh2cOsZaxZjJZ4TrQp2jq68FJCKSGWdUCTfFeKvgyLRRVtc+VL1pIaVW9lYHp6NfOASoNK3CA1wuKZwk61AKmMRGBJTX9BbS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4EGd7ZY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4EGd7ZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782736435; x=1814272435;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=i4qSbMrsSNt0jFOm8KhkgMXxoK3BYPfw5wF1cksuyGM=;
  b=A4EGd7ZYH4QhhHfOtttobJjygfWbJmDbvjEH56+oV3mPQOH/icaiaJ81
   IvdA3x2bdzPAM1vsjrOmE3tb5h4QIKuSutakc6Fda115U226hEzUocdMa
   Xja4ekF1vcDevz0042U0PvgdG2JJlJJgrS/mDvcLZc4BGFYjD3jrYMJAB
   nuX+XZV/BKFIY9UFbrLrwiWf4TS0lq1po8wzP8ymQZqY8d/rTIY62+N+v
   IkNEl0USuk2MHiDUgvhZuqgvjcgyBNCd90ONb3CnqEcqoWLlW7hn3RkF4
   7aBrvM5z3R/D8rZG6sVkqLzKcYF4+fhMuQGhSt5t/F8Kpb6NdRdq23gHm
   w==;
X-CSE-ConnectionGUID: Kk8yktMTQ6WyWxp8Lf2cOw==
X-CSE-MsgGUID: Q9urOhxTTE+FVoXvtsb3lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="70944199"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="70944199"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 05:33:54 -0700
X-CSE-ConnectionGUID: ldOygMZyQ5SJea9WHXp+OA==
X-CSE-MsgGUID: 0MBRyvEFRbGc3sBi93Y+0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="247495129"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.42])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 05:33:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Jun 2026 15:33:47 +0300 (EEST)
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
    Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
    Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
    Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform: arm64: qcom-hamoa-ec: Register cooling devices
 with their name
In-Reply-To: <20260629-fix_cooling_device_register-v1-1-c6e518b0bbd4@oss.qualcomm.com>
Message-ID: <48334852-b131-d6a0-469f-09e15d6765d5@linux.intel.com>
References: <20260629-fix_cooling_device_register-v1-1-c6e518b0bbd4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Jun 2026, Anvesh Jain P wrote:

> Each fan is registered as a thermal cooling device using
> devm_thermal_of_cooling_device_register(). When the thermal core gained
> cooling device ID support, the helper's prototype changed: its second
> argument became a 'u32 cdev_id' and its third a 'const char *type',
> replacing the previous 'struct device_node *np'.
> 
> The resulting semantic conflict between the EC driver and the reworked
> thermal helper was resolved while merging the drivers-x86 tree into
> linux-next by passing NULL as the 'type' argument, dropping the per-fan
> 'name' string. As a result every fan is registered as a cooling device
> with an empty name.
> 
> Pass 'name' as the 'type' argument so the cooling devices are registered
> with their intended "qcom_ec_fan_<n>" names.
> 
> Fixes: 5c44f48e91de ("platform: arm64: Add driver for EC found on Qualcomm reference devices")
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  drivers/platform/arm64/qcom-hamoa-ec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
> index 45829f2786b7..12196d56b60e 100644
> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> @@ -391,7 +391,7 @@ static int qcom_ec_probe(struct i2c_client *client)
>  		ec_cdev->fan_id = i + 1;
>  		ec_cdev->parent_dev = dev;
>  
> -		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, 0, NULL, ec_cdev,
> +		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, 0, name, ec_cdev,
>  									&qcom_ec_thermal_ops);
>  		if (IS_ERR(ec_cdev->cdev)) {
>  			return dev_err_probe(dev, PTR_ERR(ec_cdev->cdev),
> 
> ---
> base-commit: 948efecf22e49aa4bf55bb73ec79a0ddcfd38571

$ git log 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
fatal: bad object 948efecf22e49aa4bf55bb73ec79a0ddcfd38571

Please don't base your submissions on some random commits. There has never 
been code with (dev, 0, NULL, ...) in platforms drivers tree (and neither 
in Linus' tree).

-- 
 i.

