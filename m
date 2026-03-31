Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB623DE44D;
	Tue, 31 Mar 2026 13:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774962474; cv=none; b=QVcp2R2drq5isUoSqC3QwWwnTyHcw3ckB8VXgJTiy+RfRIzqs8ADZcoJNnRQFKDlcABySBWT36FfTLwmf/Ql0Qfh1dD7XyY+nQjNPd/deqrogkemIDKxNyCUma9N+7kEC2tLKQYKMW7TrRDipTUW0esyIFAWV9C/EYU6ibrQhgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774962474; c=relaxed/simple;
	bh=LrW+ftXjhjL0c3oWXCLKYgZ7OPYUbk7AwUvno8a6aMs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=F8JSYKuJHGrB48iyUngVCWEHsOCUHiAvzyfW/M6W+w18tYAYewxmlJ2AQ4KZPLKykJ1ZkWXWCbnCtz4gv8FWm/1VwBiDrtcbjU1ZG4zxyeyPsg57HiIo33vvYusKUUhsu8pJO8garL7LVmXdw7XorZSV7g34o8VkDa4x9Ir8Qak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ecbkYWz/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ecbkYWz/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774962473; x=1806498473;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=LrW+ftXjhjL0c3oWXCLKYgZ7OPYUbk7AwUvno8a6aMs=;
  b=ecbkYWz/B79OtRfjpNhwU6FrpUoBxgyQAWqlMm679pUx3olfNVaZy5sT
   qMXCxM01j3PJaCS5BKvnpmNchk2gXeLuCdBi0kog6OsamL5UAJL4vej3D
   RWNFTMXOC3OfI9wdaX1t4Ti66GUzxRc6XGaq1fIlmBekh9xmeJcuPFQ8K
   ds391HsuGAy5Vf4RW0PDZjyNQVOaHTi1wiiTSqDH88Ps8hZRfsULxfelT
   iznYGEVOiWProRP380sN1x+TK/mlozWD6NDuibGKMROr9ixptnfGy7LML
   zA5saEiloFyMBM7yp/KvKXOO025Voq1p40d4G8oeDgH7J/QSHR/kmC9Xc
   A==;
X-CSE-ConnectionGUID: cuWB0wUjTTqpRkYQCTL2HQ==
X-CSE-MsgGUID: ambuwNXQSYi8pw1VRbh3sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="98586067"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="98586067"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 06:07:52 -0700
X-CSE-ConnectionGUID: QPzBxws+RxCXprnDMDDXqA==
X-CSE-MsgGUID: R1ItWNixSLK1QkwuPkCOCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226614892"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 06:07:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 31 Mar 2026 16:07:45 +0300 (EEST)
To: Ethan Tidmore <ethantidmore06@gmail.com>
cc: Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] platform/x86: asus-wmi: Remove redundant condition
In-Reply-To: <20260326231154.856729-2-ethantidmore06@gmail.com>
Message-ID: <faafc737-d420-5de8-f6c5-1835094da093@linux.intel.com>
References: <20260326231154.856729-1-ethantidmore06@gmail.com> <20260326231154.856729-2-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Mar 2026, Ethan Tidmore wrote:

> The condition (ctrl_param >= 0) is always true because ctrl_param is an
> unsigned integer.
> 
> Remove the redundant condition.
> 
> Detected by Smatch:
> drivers/platform/x86/asus-wmi.c:4427 update_screenpad_bl_status() warn:
> always true condition '(ctrl_param >= 0) => (0-u32max >= 0)'
> 
> 
> Fixes: 034f5efd362fb ("platform/x86: asus-wmi: adjust screenpad power/brightness handling")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---
>  drivers/platform/x86/asus-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 0b87214ddd1b..80144c412b90 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -4424,7 +4424,7 @@ static int update_screenpad_bl_status(struct backlight_device *bd)
>  	u32 ctrl_param = bd->props.brightness;
>  	int err = 0;
>  
> -	if (ctrl_param >= 0 && bd->props.power) {
> +	if (bd->props.power) {
>  		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);
>  		if (err < 0)
>  			return err;

I've folded this into the original change.

-- 
 i.

