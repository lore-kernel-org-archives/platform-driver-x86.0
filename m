Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01CF3043DE;
	Wed,  6 May 2026 11:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778066038; cv=none; b=pAI05YNFGDXocabthl4O9H9MoP74UcwYrdYBahC54+FW9c4l4X+Y1cjIAhHfSexlAo7d6JniiNpqRBitqm5G/R817xmM09H1iEpyfaHXoQmrHvV+drQTZuzxY53MBONFJbYZ5/XvnX79M9cVtsrLtYoi6bXsb4Y0hsBtWeI0/Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778066038; c=relaxed/simple;
	bh=vbtrJ4msXoBhayL1K+vpfTgMrW+JV5MyypWVhTEyD10=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Fb4IGcZw7UGnDAFwhxxJSaTDu0sbDCR1DsUjMxu46TW2crODEcSsg1hVXT8l17ltOlfbV4L2+FNpPhz48mrAFGP108vmub4yH7GujNzCTHtSMiy2UZpy8yyQZiKqf+d+dELULsP3rrwXnGWiAFpzi60iEfNbVUqnT4825CsyqKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/iT2tFk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/iT2tFk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778066037; x=1809602037;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vbtrJ4msXoBhayL1K+vpfTgMrW+JV5MyypWVhTEyD10=;
  b=S/iT2tFk9al5WWIj9Xyl3N2rgDHglxuDJ7GKh9CSlgUEVvmE1GY3A6JS
   7IPYNl21t6SfaBRs9UFzZxr6RW6zZHWpkgl/XLwKE5fMbXaFYOLlLnqF7
   cObW8yI9gyiI6+oxJZcQ6c0X7Yy/n+YhoxQUO3nckKYcIv8uaJ5F2jzlc
   OOoBn5rQBwt2nt5s0bAffZgRMC53RNz7iQo+/Hn41lzmayLlgL4r7pbZI
   eiwvl34UytN7TFi2aZ04BfcpkzUhjo0+oLh5e94SavC9ygywT65EgRb6V
   BM4k8WQZ/wD5IjAUriywNk/yFTVDWGGCDZBnwpT7rL4Y4k1dbJAp/FgRw
   A==;
X-CSE-ConnectionGUID: U1NJVDFTTKSaST9PqZw+2A==
X-CSE-MsgGUID: 93YgU3OeSAur2Rw9Mf31/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="82837486"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="82837486"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 04:13:56 -0700
X-CSE-ConnectionGUID: nkmRczWiTHycQscqLNn/Wg==
X-CSE-MsgGUID: G7kCs6p7SKeR0qAs5F4snw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="229707098"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.231])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 04:13:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 6 May 2026 14:13:50 +0300 (EEST)
To: Armandas Kvietkus <armundunelis@gmail.com>
cc: luke@ljones.dev, denis.benato@linux.dev, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    fxzxaxon@outlook.com, Armandas Kvietkus <armandas.kvietkus@proton.me>
Subject: Re: [PATCH] platform/x86: asus-wmi: suppress -ENODEV warning in
 fan_curve_get_factory_default()
In-Reply-To: <20260503174752.26288-1-armundunelis@gmail.com>
Message-ID: <777a250b-2913-8ec8-cef0-fc1b8f651692@linux.intel.com>
References: <20260503174752.26288-1-armundunelis@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 3 May 2026, Armandas Kvietkus wrote:

> When the firmware does not support the fan curve WMI method,
> asus_wmi_evaluate_method_buf() returns -ENODEV. The caller
> fan_curve_check_present() already handles this gracefully by
> treating it as a non-error, but fan_curve_get_factory_default()
> still emits a pr_warn() before returning, producing spurious
> boot noise on unsupported hardware.
> 
> Suppress the warning for -ENODEV only, consistent with how
> this error is handled elsewhere in asus-wmi.c.
>
> Reported-by: fxzxaxon@outlook.com
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221441
> Signed-off-by: Armandas Kvietkus <armandas.kvietkus@proton.me>
> ---
>  drivers/platform/x86/asus-wmi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 80144c412..9b12a9e1e 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -3538,7 +3538,8 @@ static int fan_curve_get_factory_default(struct asus_wmi *asus, u32 fan_dev)
>  	err = asus_wmi_evaluate_method_buf(asus->dsts_id, fan_dev, mode, buf,
>  					   FAN_CURVE_BUF_LEN);
>  	if (err) {
> -		pr_warn("%s (0x%08x) failed: %d\n", __func__, fan_dev, err);
> +		if (err != -ENODEV)
> +			pr_warn("%s (0x%08x) failed: %d\n", __func__, fan_dev, err);

Hi,

If this print is useful at all, it looks more like it wants to be on debug 
level which would also prevent the warning appearing in the logs unless 
asked to.

Whenever something prints just __func__ and error codes, the line is 
hardly meant for normal user consumption.

If you want to preserve this on warn level, the message has to be changed 
as well to say the warning in plain English (preferrable in another 
another patch).

(I prefer making it debug level.)

-- 
 i.

