Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25D1377EBA;
	Fri, 17 Apr 2026 12:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776427329; cv=none; b=lEMASSABnik8ePCVghg4SsMlsXgWfJBQvOD05ZO4oqvOP5QOw3wGJZOXgLo0o03xX9zaI3DPnf4KUzlH8+LS7d7XAGi07ZrODFxMPK0+RZ+JQOpUDNEE7VjDr5hcF+mD5TmVJIyeXUkIuMkiFhGoDheSbpE+vEUXNI6rj6vT9Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776427329; c=relaxed/simple;
	bh=tQZNtdcdKD02H+cCuPXZkW71IUVsBbdLLMiNLdwL/nk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0MoPfEor4C/fjkfUF0OcT0IV+eEY7FteHvLJtn0PUJBsfkpOoXpnYylO1Crhc16R0BLkC+2NkAJ2k8bS9lzmmqvaV17d42dVtZ5WDWE2SyV+A8XYfHb2pi46OYUuWtCkI8x8aZ+ZoN2bWQYV7FTaUCYDzMapGc0hNOFSYjYihE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=lqAi929a; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="lqAi929a"
Received: from [192.168.178.25] (i5C75F434.versanet.de [92.117.244.52])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 502372FC0050;
	Fri, 17 Apr 2026 14:01:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1776427323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+KcIRrtMx7OA50VcbDaWkbkP9IBX1GKdQGmVfcWBUUE=;
	b=lqAi929amZj6VFF+G/W+uLBNZUkqknVhKLqNVLfii949SCiN6Zc7gqcNy1Wt0mmTn5pQWu
	QoqA8S4Np6h8LkMFxSciXiaui07JxjvNUJKJFBNVwijSgeb0bZArFdO0JKQlIaZefKmZ+W
	LWFqQdL0uQBT/pnOFoNbukKtBOpAj2A=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <cd30e665-55db-4313-853f-ce5eb5745407@tuxedocomputers.com>
Date: Fri, 17 Apr 2026 14:01:58 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] platform/x86: uniwill-laptop: Do not enable the
 charging limit even when forced
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260417050912.5582-1-W_Armin@gmx.de>
 <20260417050912.5582-5-W_Armin@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260417050912.5582-5-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Am 17.04.26 um 07:09 schrieb Armin Wolf:
> It seems that on some older models (~2020) the battery charging limit
> can permanently damage the battery. Prevent users from enabling this
> feature thru the "force" module parameter to avoid causing permanent
> hardware damage on such devices.
>
> Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
> Link: https://www.reddit.com/r/XMG_gg/comments/ld9yyf/battery_limit_hidden_function_discovered_on/
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   Documentation/admin-guide/laptops/uniwill-laptop.rst | 10 ++++++++++
>   drivers/platform/x86/uniwill/uniwill-acpi.c          |  4 ++--
>   2 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Documentation/admin-guide/laptops/uniwill-laptop.rst
> index 561334865feb..1f3ca84c7d88 100644
> --- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
> +++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
> @@ -43,6 +43,11 @@ Support for changing the platform performance mode is currently not implemented.
>   Battery Charging Control
>   ------------------------
>   
> +.. warning:: Some devices do not properly implement the charging threshold interface. Forcing
> +             the driver to enable access to said interface on such devices might damage the
> +             battery [1]_. Because of this the driver will not enable said feature even when
> +             using the ``force`` module parameter.
> +
>   The ``uniwill-laptop`` driver supports controlling the battery charge limit. This happens over
>   the standard ``charge_control_end_threshold`` power supply sysfs attribute. All values
>   between 1 and 100 percent are supported.
> @@ -70,3 +75,8 @@ The ``uniwill-laptop`` driver allows to set the configurable TGP for devices wit
>   allow it.
>   
>   See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
> +
> +References
> +==========
> +
> +.. [1] https://www.reddit.com/r/XMG_gg/comments/ld9yyf/battery_limit_hidden_function_discovered_on/
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index 7c7ea0e76966..dac80c78ca0b 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -2499,8 +2499,8 @@ static int __init uniwill_init(void)
>   	}
>   
>   	if (force) {
> -		/* Assume that the device supports all features */
> -		device_descriptor.features = UINT_MAX;
> +		/* Assume that the device supports all features except the charge limit */
> +		device_descriptor.features = UINT_MAX & ~UNIWILL_FEATURE_BATTERY;
>   		pr_warn("Enabling potentially unsupported features\n");
>   	}
>   

also looks good

Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>

