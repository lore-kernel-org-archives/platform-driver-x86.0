Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180687;
	b=bueLJPoFGaInZoSPjLTwnUGxjrvIxjFnDY7BJrC+qy/223mZCTqcH0E0rCCboVra6U3d
	 /s1jwDTqj6+BtFehrUbjae4wbL1ZtK8z8PJDxs5kr24ueONB8Gp9bHLepWns4nP5TuLKl
	 dIe/RQ81yy0lFDLqrt5+usYq03VdaabLotWju5OvC1NuO4z+G51Ez9HsAmC225CVf2hQr
	 Cm4pO/sMCRVzZLnlM8+2FKLGioT6TLDP0pPxL+tgdQxpv4ssx2mT7X6V5RWqG/2rGwt24
	 MGm+LY8ptayOIDEvNfWZ//XQtofO/eH9EqoqzQDQntNfsLAdV+z8W7g5EZestfOgbyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180687;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent;
	bh=RJMdmAoTUYUMgooSN2/iHY4Pm4mSitqFt4ugCfpqnJI=;
	b=nz4j2u5sd1Vr5wjgg0IXX/9EbWScjCDLvEN9grEu0Fj9QWBOlzvvndQUzKTR6OzofymM
	 a4UviW1yW+kVujbDYLZlV8riNj1CBCmxex9G95nJgVijH83l0S7GwZEKJpMB+dbQQAA9j
	 VYeraSqwqEqts/j7vxuxDByBm/e0dC18TS9OdshJEMa7SfhTYXk1CMIp8NoeOZFibH8ZA
	 dnzqN76GO3sRhr/Esv7rjLLghcge51aL7MxLUWc+iVugUWHWG3nIc68ftFNex4DXr5W+Y
	 ZVNGi5N+5UEX9W+MMJChEi5VlBRcqKUFvHwIIuibXmNRDJqCrgpgJ7UlePVa4yxR4rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="i4w4/749";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E8E606A320;
	Fri, 20 Nov 2026 13:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i4w4/749
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C970C1F000CF;
	Fri, 20 Nov 2026 13:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795180687;
	bh=RJMdmAoTUYUMgooSN2/iHY4Pm4mSitqFt4ugCfpqnJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i4w4/749keQEybvYAK+r+eh7WhhFNZ5BSW/AkqFLosBCA0S3rdEPK6QRQwYeYFVfD
	 7Pgnbcqy+7uqsQPY/UNG3y05nMxNOBsua6cKqjybgZgNdfHYeKBdsFpzWLogRiAu8M
	 VAAAwPkK6/Z7c7x+vG7HpVn3b0tC/Qi4RlX95TeV1N07RmCKpcD3Q0UknibLjfWS6i
	 AjXVOE/vDs7fRQntEam3FfHWK+pMOBU4TDf+d1Rds0gYez0u1VKKr7n0rhcLT+ehxa
	 C/WlGuMhuLyVHhddH9KJ2ONIGG0QNhCRD/KF+w4PDad7yNVvEeeWghED4NH9jGanFr
	 EH25JEnmnsodw==
Received: by pali.im (Postfix)
	id BD65236C; Fri, 20 Nov 2026 14:18:03 +0100 (CET)
Date: Fri, 20 Nov 2026 14:18:03 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] platform/x86: dell-laptop: Reject keyboard backlight
 timeouts that overflow
Message-ID: <20261120131803.dejsr2ip3djtoj2p@pali>
References: <cover.1794633179.git.rosenp@gmail.com>
 <1e1cc5a497ca95a0b34e45738f81a4be681675fd.1794633179.git.rosenp@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e1cc5a497ca95a0b34e45738f81a4be681675fd.1794633179.git.rosenp@gmail.com>
User-Agent: NeoMutt/20180716

On Friday 13 November 2026 22:29:25 Rosen Penev wrote:
> kbd_led_timeout_store() converts a timeout that is too large for its
> unit to seconds with plain int multiplication. A large enough value
> wraps, and if the wrapped number happens to be a valid timeout it is
> accepted. On a Precision M4800, writing "4424214d" (over 12000 years)
> to stop_timeout sets the timeout to 4 minutes, and "18989323d" sets it
> to 2 minutes.
> 
> Convert with check_mul_overflow() and return -EINVAL on overflow.
> 
> Fixes: 02b2aaaa57ab ("platform: x86: dell-laptop: Add support for keyboard backlight")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/platform/x86/dell/dell-laptop.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
> index 89e85c7f7132..bee347e1d60c 100644
> --- a/drivers/platform/x86/dell/dell-laptop.c
> +++ b/drivers/platform/x86/dell/dell-laptop.c
> @@ -25,6 +25,7 @@
>  #include <linux/sysfs.h>
>  #include <linux/acpi.h>
>  #include <linux/mm.h>
> +#include <linux/overflow.h>
>  #include <linux/i8042.h>
>  #include <linux/debugfs.h>
>  #include <linux/seq_file.h>
> @@ -1554,6 +1555,7 @@ static ssize_t kbd_led_timeout_store(struct device *dev,
>  	struct kbd_state state;
>  	bool convert;
>  	int value;
> +	int mult;
>  	int ret;
>  	char ch;
>  	u8 unit;
> @@ -1602,16 +1604,23 @@ static ssize_t kbd_led_timeout_store(struct device *dev,
>  		/* Convert value from current units to seconds */
>  		switch (unit) {
>  		case KBD_TIMEOUT_DAYS:
> -			value *= 24;
> -			fallthrough;
> +			mult = 24 * 60 * 60;
> +			break;
>  		case KBD_TIMEOUT_HOURS:
> -			value *= 60;
> -			fallthrough;
> +			mult = 60 * 60;
> +			break;
>  		case KBD_TIMEOUT_MINUTES:
> -			value *= 60;
> -			unit = KBD_TIMEOUT_SECONDS;
> +			mult = 60;
> +			break;
> +		default:
> +			mult = 1;
> +			break;
>  		}
>  
> +		if (check_mul_overflow(value, mult, &value))
> +			return -EINVAL;
> +		unit = KBD_TIMEOUT_SECONDS;
> +
>  		if (quirks && quirks->needs_kbd_timeouts) {
>  			for (i = 0; quirks->kbd_timeouts[i] != -1; i++) {
>  				if (value <= quirks->kbd_timeouts[i]) {
> -- 
> 2.56.0
> 

This change does not work correctly. The code below the quoted change is
then dividing the value by (60 * 60 * 24) again (after being multiplied
above). So the newly adding check_mul_overflow() will reject valid
inputs, just because they do not fit into the "value" variable.
