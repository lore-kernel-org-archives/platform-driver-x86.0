Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9C8315D49
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 10:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974716; cv=none; b=K5EV6Q+xRpz9k2ynulwljBkP85vX5XjDnjzBncGIwhoZWhw1bMGEhCSwDL04xzv3iTOJB5IhscvShSByOA0zG/DXz2ro2SuajQ1f6kISgaD1QBx6+3iurcvjytDDcPcbpnuJKqob2txypcqedsofNigazzFAG4TEmDlzzHffL4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974716; c=relaxed/simple;
	bh=i0SbTTSWcXuntCadzmhkhWHz9suonIQJ0iR/9SfU6uo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lhXN/wR5HwQTotFLedWvaPxz8iaxixn3ZPRNbWC12QjumSP51BcPNbDgJgXi+l8TsR0hhGyLVr6m9nuEK4df0cg8fPzwzyBPR5OjNLPwYMp4ehsYk3gI3rxGt1CyrNpVQn6yqgusWL3Gah1s3HssMm/yjG8Yfw9K4gpn6Z8UvTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MbI6s500; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbI6s500"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791974715; x=1823510715;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=i0SbTTSWcXuntCadzmhkhWHz9suonIQJ0iR/9SfU6uo=;
  b=MbI6s500QNbzW9SR+rI2IiZJYGBAMwpgSHOtMg9ZsCDztS1pi7PrW0vz
   Nr9F0cPHyBgjE2qTse/k4nvDSE9gV54P3n66zjlnjz2npUVqh4OnZigDt
   rirh53F5ATGzVyAvmhuc7TD4/qRe1KZEaaKyk+J36Wk3xomgp5xo2MpS8
   doOrxB7b1HYgx3N0ovFZQE5riSCjXLISfYhuk2S4aBSEDUVIBl9amYKC8
   x3XXdRcDyls7Yk3yUntCLRfMfrHfkp05IBQ/hKfFQdaZpZKOJ3ct6Mor0
   fwaUEIxuZW2aZPN67JjIRa11ut1ARU1iXviVt4sClqzoWTSXB6Z8kT/8g
   g==;
X-CSE-ConnectionGUID: a3DsehRmRbS6fkeRxmby4A==
X-CSE-MsgGUID: oFPDKGisQKS8JDhtCVV6vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="604329"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="604329"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 03:45:14 -0700
X-CSE-ConnectionGUID: COVYyEHbTQOC9eMwqa1+Xw==
X-CSE-MsgGUID: DcU78SF1T3mE1E1zyIgraQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1721818"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 03:45:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 14 Oct 2026 13:45:09 +0300 (EEST)
To: Janus <janussss@163.com>
cc: luzmaximilian@gmail.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] surface: aggregator: propagate -EPROBE_DEFER from
 ssam_irq_setup()
In-Reply-To: <20261003044844.63157-1-janussss@163.com>
Message-ID: <7d51f80e-9552-957f-f32c-1d608042b647@linux.intel.com>
References: <20261003044844.63157-1-janussss@163.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 3 Oct 2026, Janus wrote:

> From: janus <janussss@163.com>
> 
> gpiod_get() can fail with -EPROBE_DEFER when the GPIO controller
> providing the "ssam_wakeup-int" GPIO has not been probed yet. The
> current error path falls back to fwnode_irq_get(), which returns
> -EINVAL because this device only declares GPIO resources. The probe
> then fails hard and is never retried.
> 
> This leaves the SSAM controller down on devices like the Surface Pro 6
> when probe ordering is unfavorable: dependent ACPI devices, e.g. the
> battery with its _DEP on the SAN node, are never enumerated and battery
> status is missing.
> 
> Return -EPROBE_DEFER directly so that the probe is deferred until the
> GPIO controller becomes available

Missing .

> 
> Signed-off-by: janus <janussss@163.com>

Using e.g. just a first name in Signed-off is not enough. Use a name which 
you would use for signing off a paper document.

For more information about Signed-off-by tag, please see:
  Documentation/process/submitting-patches.rst

> ---
>  drivers/platform/surface/aggregator/controller.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/surface/aggregator/controller.c b/drivers/platform/surface/aggregator/controller.c
> index 6a8430cb9..4f9f4595d 100644
> --- a/drivers/platform/surface/aggregator/controller.c
> +++ b/drivers/platform/surface/aggregator/controller.c
> @@ -2755,6 +2755,8 @@ int ssam_irq_setup(struct ssam_controller *ctrl)
>  
>  	gpiod = gpiod_get(dev, "ssam_wakeup-int", GPIOD_ASIS);
>  	if (IS_ERR(gpiod)) {
> +		if (PTR_ERR(gpiod) == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;

This should just pass the same error on with return PTR_ERR(gpiod).

>  		irq = fwnode_irq_get(dev_fwnode(dev), 0);
>  	} else {
>  		irq = gpiod_to_irq(gpiod);
> 

-- 
 i.

