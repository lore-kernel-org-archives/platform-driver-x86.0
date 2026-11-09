Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794250216;
	b=AjeN/K8JbSZHrDeFe3pgbe9sy0vOy+fJFVJkky19xOYlUK/vmPbThXlDnI6uPTq0LOtP
	 IcFl0hLfw+32QQ1ER4B6cz1BuH2eHs1ArNsp7GrFXr7FvCQH/ij01GL5k2nstCdR7ZreZ
	 5nMrv/wcuKeIQWn/38rMEXe++0lHvrtoHOQxkILfkeqp903FdwQ7MwRQO1D7VtzA3RZPp
	 N2M5fw7QIPIEddJjsj91GuzZVQk0tt14kINS14ve31/hV24x9pwWC/4L2T/syD3Ljyz10
	 67AWq08f3zpvp8Yn3EOz1F6xGUEQrodQf8GiwugY8C8/Lpl1m/7quLuZBcZ+5anfuow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794250216;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=Vn3jlK/7PgT2CwRRPrcdbUwucP43PxuZlvHHyuCpLUM=;
	b=JUwwVbURDmaii4kpkzfJQmS4ljrAqEY/WZJ9qEtQmPxOLgCYvZGm8yeFfzrXpP3ApDfU
	 e3ayt1pW2AwwmMPR6dPf6TqQPKQ9RFqjA2MuSX2hEphIdQ33B7669CcrNzjHmd5iMqAxf
	 UCnm0NVNFrviqV2jz4ZDtaD/XHgeUWpmW7lh4HX7Pj/NhC0d9HIz+PTYOtpaIomLjOmBU
	 ZItRoinZGSDDEWNyS93/IfUZiBS4k9p1Aa8WcdaF2FvXKucJoBe/Gp9eL5tA7pVTzf5N0
	 biVVlkua5cbqRuxlcMUb+BUlNbcwJYLX6rf/YDzySm/6aYmIoOl94BxsBoItfn8s4JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YkhMKsPe;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832B360A260D;
	Mon,  9 Nov 2026 18:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 832B360A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YkhMKsPe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794250216; x=1825786216;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BP3u9Z+++nqyCW5ye/g4jSpc5qlNx81n3H0N1YKS5dQ=;
  b=YkhMKsPe5rVT1kncHp/z2wh8VBcqKr/eSyN/uEYL6B25q1R677nO4R4s
   Pez1Eux5o6U9nmApGnPqymSZMgSqBK2MG04+ybflrK3hx0YtfAqICR+DQ
   iY2DU1k+rdPay7jdKkAK0rkrzURiuznqOBJJSQm3xt50Tk8LsmiL6FRQP
   79FLC1I/A8j3+BbqRED2FKOShpi07l53wl+rTgJ7XowqvdoDwDVhyMsQM
   Kd38i9LCyzxYCsTuaUCiaAUYTYX1XVJ9Av9Mj98zi7gf6w9tc4s5o80fQ
   OQLQzvIsZtD9Kc72LKlvCCOrgFkmpbeU36EnMrgPoIvQl1hyzQLE9UARg
   A==;
X-CSE-ConnectionGUID: K0pvPNbxT0C4s7+ctvtbPQ==
X-CSE-MsgGUID: oLKTrpNNSLuEqtF8pkSgCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2994970"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2994970"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 10:50:03 -0800
X-CSE-ConnectionGUID: 2R8NI+f2QHWxoehJsQPVPw==
X-CSE-MsgGUID: hLkk2NiYT6atHz9oy4O87w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7996908"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.139])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 10:49:59 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 9 Nov 2026 20:49:55 +0200 (EET)
To: Hongyan Xu <getshell@seu.edu.cn>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
    Chanwoo Choi <cw00.choi@samsung.com>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J . Clark" <derekjohn.clark@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    jianhao.xu@seu.edu.cn, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: lenovo: cancel fastcharger work on
 detach
In-Reply-To: <20260806060526.1189-1-getshell@seu.edu.cn>
Message-ID: <2ef4ad43-497f-c40f-b18a-f5b75799d95d@linux.intel.com>
References: <20260806060526.1189-1-getshell@seu.edu.cn>
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

On Thu, 6 Aug 2026, Hongyan Xu wrote:

> The extcon notifier and probe queue yt2_1380_fc_worker(), which can sleep
> for several seconds while accessing managed pinctrl, GPIO and serdev
> resources. Driver detach does not drain this work before those resources
> are released, allowing the worker to use freed state.
> 
> Use devm_work_autocancel() between opening the managed serdev device and
> registering the managed notifier. Reverse devres release order then
> unregisters the notifier, cancels the work and only afterwards closes and
> releases the resources used by the worker.
> 
> Fixes: b2ed33e8d486 ("platform/x86: Add lenovo-yoga-tab2-pro-1380-fastcharger driver")
> Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
> ---
>  .../platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c    | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
> index 8551ab4d2c7d..cce677b5db48 100644
> --- a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
> +++ b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
> @@ -8,6 +8,7 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <linux/delay.h>
> +#include <linux/devm-helpers.h>
>  #include <linux/err.h>
>  #include <linux/errno.h>
>  #include <linux/extcon.h>
> @@ -160,7 +161,6 @@ static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
>  
>  	fc->dev = dev;
>  	fc->nb.notifier_call = yt2_1380_fc_extcon_evt;
> -	INIT_WORK(&fc->work, yt2_1380_fc_worker);
>  
>  	/*
>  	 * Do this first since it may return -EPROBE_DEFER.
> @@ -209,6 +209,10 @@ static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
>  	serdev_device_set_baudrate(serdev, 600);
>  	serdev_device_set_flow_control(serdev, false);
>  
> +	ret = devm_work_autocancel(dev, &fc->work, yt2_1380_fc_worker);
> +	if (ret)
> +		return ret;
> +
>  	ret = devm_extcon_register_notifier_all(dev, fc->extcon, &fc->nb);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "registering extcon notifier\n");

While this looks an improvement from driver's perspective, sashiko is 
still worried extcon doesn't properly synchronize because it's using raw 
notifiers.

-- 
 i.

