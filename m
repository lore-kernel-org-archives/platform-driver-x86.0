Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011329;
	b=etsZJL36QdzclQ6fy6DEuLFSPGNeoEjnSaIsZZ6VQTSDIWYw4N7vH7lNk2pGVw6xziF6
	 SEc9ZHO/Sv3Sr3lv3UctDCa2xNAmBA2g2L6b6/YSgTMRmsG2lKUXJVAokyB57wZ7CsvZ4
	 FalHHbjo1RdfZrIMkT6RnYppQBU1XDTE7d6MSBIFd1jJflQJloDzX4l/ORoqDyEcAnW8o
	 loDn7kO632lG+EwvN2KBIo71B4XwfowqAE7YeQp6XDcztD5iooVmuNFSIn68op19nEvPY
	 AEOslhBsim4hTQ3Seb9k+UA+BvJd7dpZCkdPLV4EZl+ee8LcGPMCvz83UDoToK+sUPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011329;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=f+DS/lqD8BGjXqhz3m5vE80K7tWoasgYoR/nHTZXhLM=;
	b=FdjxSXk/zBcTZMHhZVHdIqMwnXacwsl9eGw8oplS3As9BLHEyrBD5l13e8FtgbABMgO/
	 C2bN3d6sjKD3Vmg6pTtuZI2h0qQpYRnkMC3QclMdKvkyNIDFSPM90sGUuKxRCfyOdKIDC
	 aLh5WkQB7YdZzeRTrPz/FV6HBIbrfftIssf0sx8mryPE/tb4msc7w5ax7bcMWD90zeMKE
	 GvVLUoPWlT6k1mDUjD2K/VAgfBUatGuk3NHyp1SuwSKQPTfjP6nzX0MaLVx7ucwcNdJKB
	 pauNn1z2cpo2z4KfW+kFini3Y1sr6yTfuNvr8O51kvE/ymHVl77CfO3Pq4Lv46uGpuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QSdr9HZK;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E66606A31A
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 10:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E66606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QSdr9HZK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793011329; x=1824547329;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nW6h3bHAUR52uEYj2GY1TqqIF+Gwx3bZrMdTPOStt2w=;
  b=QSdr9HZKA2ouTNNdH13H2yN6Ai1ENB89vcjj+c5ZyTybwPi+/4jrRlcj
   m/3KHU8qzVYYkKQugcDq8v7hisfoX6JGenzKshTpmTqMJaBpvGd4DF9BC
   nIGIQpNyxqW0DOM8MEZv74fPYXmZpOOqRa6Js2/jshumIT1uNHnY07YIz
   GOJESrc4LmCQFoUURQFSFocOx9oOTzDpiUi4Kc2HQ3b4Ni0y1fgsciNP8
   0idO9Y2MnFmeyZC72FJRJcaCnqf8QHU9Tz1QxtyMua2rTg5oVwxSUCSDQ
   wIrPChz/x2Injtj52lwB7KnKhguyaABySAskRG6StEGsyX000TkDwMp6N
   Q==;
X-CSE-ConnectionGUID: lqiaCi82RSqWs5BFHABcUw==
X-CSE-MsgGUID: NQPLwerES8KRtwbnoaforQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1559161"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1559161"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 03:42:08 -0700
X-CSE-ConnectionGUID: 5gs09gJ5Qful0+p5IVISog==
X-CSE-MsgGUID: MPV/74DgQUSJWC0aFbh9EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4134282"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.109])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 03:42:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 26 Oct 2026 12:42:01 +0200 (EET)
To: Chris Simpson <chris@nilk.net>, Konrad Dybcio <quic_kdybcio@quicinc.com>, 
    Hans de Goede <hansg@kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc: janussss@163.com, luzmaximilian@gmail.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] surface: aggregator: propagate -EPROBE_DEFER from
 ssam_irq_setup()
In-Reply-To: <d0bb21cc-6d3c-4526-8204-2511da51a6ac@nilk.net>
Message-ID: <2faa9857-9d55-a607-bd46-588598b64ca4@linux.intel.com>
References: <7d51f80e-9552-957f-f32c-1d608042b647@linux.intel.com> <d0bb21cc-6d3c-4526-8204-2511da51a6ac@nilk.net>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+ Konrad, Hans, Andy.

On Fri, 23 Oct 2026, Chris Simpson wrote:

> Hi,
> 
> Same failure here on a Surface Pro 9 (Tiger Lake, INTC1055 driven by
> pinctrl_tigerlake as a module): whenever surface_aggregator is loaded from
> the initramfs about 30 ms after /init, before udev has bound the GPIO
> controller, probe ends with
> 
>   surface_serial_hub serial0-0: error -EINVAL: failed to setup IRQ
> 
> and is never retried, so Type Cover, battery and tablet-mode switch are
> gone until a manual rebind. linux-surface has several reports of this
> since v6.12 (linux-surface/linux-surface#2219, #1645, #2064, #2039), and
> it is a regression from b27622f13172 ("platform/surface: Add OF support"),
> which used to propagate the gpiod_get() error.
> 
> Janus, are you planning a v2? If not, below is a variant that follows
> Ilpo's comment by using gpiod_get_optional(): only "no GPIO described"
> falls back to fwnode_irq_get(), every other error including
> -EPROBE_DEFER is passed on. I'm happy to send it properly (Fixes:
> b27622f13172, Cc: stable, your patch credited), or to test your v2 on
> the Pro 9 instead, whichever you prefer.
> 
> I've tested it on the Pro 9 (Fedora 43, 7.2.12 with the linux-surface
> patches), with surface_aggregator forced into the initramfs. Unpatched,
> the probe fails with the -EINVAL above and the Type Cover, battery and
> tablet-mode switch are missing. Patched, the probe defers three times
> and completes about 0.2 s later, with all of them present and the
> device no longer listed in devices_deferred. Suspend/resume behaves as
> on an unpatched kernel. The analysis and the diff were produced with an
> AI coding assistant (Claude Code), and reviewed and tested by me.
> 
> Chris Simpson
> 
> --- a/drivers/platform/surface/aggregator/controller.c
> +++ b/drivers/platform/surface/aggregator/controller.c
> @@ -2753,12 +2753,20 @@
>  	 */
>  	const int irqf = IRQF_ONESHOT | IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN;
>  
> -	gpiod = gpiod_get(dev, "ssam_wakeup-int", GPIOD_ASIS);
> -	if (IS_ERR(gpiod)) {
> -		irq = fwnode_irq_get(dev_fwnode(dev), 0);
> -	} else {
> +	/*
> +	 * Only fall back to the fwnode IRQ if no wakeup GPIO is described
> +	 * at all. Any other error, in particular -EPROBE_DEFER while the
> +	 * GPIO controller has not been registered yet, must reach the probe.
> +	 */
> +	gpiod = gpiod_get_optional(dev, "ssam_wakeup-int", GPIOD_ASIS);
> +	if (IS_ERR(gpiod))
> +		return PTR_ERR(gpiod);
> +
> +	if (gpiod) {
>  		irq = gpiod_to_irq(gpiod);
>  		gpiod_put(gpiod);
> +	} else {
> +		irq = fwnode_irq_get(dev_fwnode(dev), 0);

Hi,

I have to admit this was not exactly what I meant (I only meant to not 
use -Exx literal in the return statement), but now that I see this v2, 
I'm not saying your approach is wrong either (I'm left unsure).

Are there some legimate cases where error other than -EDEFER_PROBE should 
end up into this else like it previously did? The return on error was 
removed by b27622f13172 ("platform/surface: Add OF support") so I assume 
there was some good reason for that but the commit message isn't helpful 
at all... :-(

Konrad, you did that change, can you explain the reason why the return was 
removed from the error path?

-- 
 i.

