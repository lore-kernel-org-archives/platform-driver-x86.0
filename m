Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795040456;
	b=UQf5HNCh1o8TBaHTOXukbCv9v4IFqtkef74dynrPKD5g+naOTm3xdX+iNgKcveHIu3/P
	 AP1AHj1ct/EqO+sBIDRN2roKFtVJzKUpOm/dY433vWPptbcffW4m0G30l+M//anxtpN+F
	 l22Ea0uKAS+h+v5x6Tpfw7+DhAJND7bcU6iuqeL53dNxvCiAy/o9vMeD5VfquMcNh1Vul
	 esvS6FWtvofW630WSyIff/0xb9WYOOH1XBXifzW0K3fiQha0OpC928HwLKDbKeuO3ocRQ
	 1kBdfL68geX8Ez3Tm7nUaE1IXVl0ryczrfrlosXDUHz/nyB2Jr8jKhz4kd0pDoaDt7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795040456;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:User-Agent;
	bh=PpEBjt3nx9EDFZJC9fu5TteA3qTk/4eupUrN6qGYc1Y=;
	b=lsw6lY3+EnGpYw6JG33oQ+SAOBtsuclidoCXGzPbAKnJgGnsrQkvDXeVIEZd1dWIeG/6
	 Ro1fJeeW2vzqR7KbzUAVmkoXl0ceNiEWd3uXlpYU9lrWGesQYs0VWkb5PdbBGej26OFPC
	 IoqDrBDmO6QD8eZRMDSWHTXJamiAs1sDIb9F0shMZT0S87njTBwiqA3WJnYmrivNBqnct
	 ZmZOYYXq6Kv0SjROQarIZtx/zbGtswTfja+1VVTyPWBpEzf5NBeap1bA5v4SQbuQGt6Z+
	 YKNglnoLEde39/2mb9Rq8MWddC7c9ZibicuEPeEu37RCi4LKmK+MC7ESEhJ1QFJHs3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=POhfdvdt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075F5606A320;
	Wed, 18 Nov 2026 22:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=POhfdvdt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4BE91F000C5;
	Wed, 18 Nov 2026 22:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795040455;
	bh=PpEBjt3nx9EDFZJC9fu5TteA3qTk/4eupUrN6qGYc1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=POhfdvdtZFFJkPfCCb/O4wFNLW2akZnSBnU+fEYAwkj/e4fY0pYXSJdux788ARkBL
	 KtbF5JM/YVb0HCY5d62JSHdOV3TiY9COz8kttJxYLHqfDWqdwcnkbPwjKpJWdMy20K
	 9ggRAlWGefVMTuesI68qwQMYAXnTJ+UJnSJ5nl/EwmZ9uAs3qE7BFoAkvA0PYzx36Q
	 MZt6a/rkO+ELezPDh7XcX2qcPnfq3KgXRpV9LN9wRnETaaxnXzZDP1SYWNXHWf7iHY
	 CbSshzvQF1eVqpR99S+jy28yE1PonvMojhuKFkOJssd/TVCywwIM0llxwN6itmvK/W
	 xe74IIVY7x4iQ==
Received: by pali.im (Postfix)
	id B58E2846; Wed, 18 Nov 2026 23:20:52 +0100 (CET)
Date: Wed, 18 Nov 2026 23:20:52 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Yury Norov <ynorov@nvidia.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	open list <linux-kernel@vger.kernel.org>,
	Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 1/2] platform/x86: dell-laptop: Use fns() in
 kbd_led_level_set()
Message-ID: <20261118222052.vshpmsfffyhl5hrl@pali>
References: <20260925193239.248779-1-ynorov@nvidia.com>
 <20260925193239.248779-2-ynorov@nvidia.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925193239.248779-2-ynorov@nvidia.com>
User-Agent: NeoMutt/20180716

On Friday 25 September 2026 15:32:38 Yury Norov wrote:
> Replace the loop clearing lower set bits with fns() to select the
> supported token corresponding to the requested brightness. Preserve the
> zero return when the requested index is out of range.
> 
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
> ---
>  drivers/platform/x86/dell/dell-laptop.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
> index 89e85c7f7132..03d3bb70b0d1 100644
> --- a/drivers/platform/x86/dell/dell-laptop.c
> +++ b/drivers/platform/x86/dell/dell-laptop.c
> @@ -17,6 +17,7 @@
>  #include <linux/init.h>
>  #include <linux/platform_device.h>
>  #include <linux/backlight.h>
> +#include <linux/bitops.h>
>  #include <linux/err.h>
>  #include <linux/dmi.h>
>  #include <linux/io.h>
> @@ -2036,7 +2037,7 @@ static int kbd_led_level_set(struct led_classdev *led_cdev,
>  	enum led_brightness new_value = value;
>  	struct kbd_state state;
>  	struct kbd_state new_state;
> -	u16 num;
> +	unsigned int bit;
>  	int ret;
>  
>  	mutex_lock(&kbd_led_mutex);
> @@ -2051,12 +2052,8 @@ static int kbd_led_level_set(struct led_classdev *led_cdev,
>  			goto out;
>  		ret = kbd_set_state_safe(&new_state, &state);
>  	} else if (kbd_get_valid_token_counts()) {
> -		for (num = kbd_token_bits; num != 0 && value > 0; --value)
> -			num &= num - 1; /* clear the first bit set */
> -		if (num == 0)
> -			ret = 0;
> -		else
> -			ret = kbd_set_token_bit(ffs(num) - 1);
> +		bit = fns(kbd_token_bits, value);
> +		ret = bit == BITS_PER_LONG ? 0 : kbd_set_token_bit(bit);

Maybe slightly better readable diff:

-		for (num = kbd_token_bits; num != 0 && value > 0; --value)
-			num &= num - 1; /* clear the first bit set */
+		bit = fns(kbd_token_bits, value);
-		if (num == 0)
+		if (bit == BITS_PER_LONG)
 			ret = 0;
 		else
-			ret = kbd_set_token_bit(ffs(num) - 1);
+			ret = kbd_set_token_bit(bit);

Otherwise looks good.

Reviewed-by: Pali Rohár <pali@kernel.org>

>  	} else {
>  		pr_warn("Keyboard brightness level control not supported\n");
>  		ret = -ENXIO;
> -- 
> 2.53.0
> 
