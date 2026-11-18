Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041009;
	b=aKxnondH7SbGqYtcgQAV9e9lv6T5ddRgib1snlQkIycrSQ7tmeS2VmqasG1JUafHJuq+
	 Mm5F4a/2Ma1hTwKMzoyxUFA+JFw4PUa+03uKxF3Yd0O6HiT6wvQTjn4ty3a6iU9fXh4Op
	 UI1/QDftv3tz+Axeh62cGOY4asEYEAdUUaD4LQ0zpWHxSbPNcV6L8t+080ZSQTwdCAK0Z
	 WxCh5HijL75c8xBZFKoGGWp7mLeTmHdXqbbj+Okcesa9xPfKypGZoJ4kRYhKEBKAcYbd+
	 XTwpeGbBazdR2AkpduBEkkFfiNrymGFVqhQzr6n98NpG9w+0MDmYUujPGfFBLtzT0Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041009;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent;
	bh=KhPGCzLsme1XU4+GASPBXpez80KaHqxyFka5T0h/TSw=;
	b=qgdWJ5xzt9dyqhCCwqymE8uDeBX0Lw8ed6tTXPfwnug5Pf47xjQMolEDTKUjCyx509dV
	 D/Cuas4gySS+xU7fvKUfF5e/7ZNbej2tokHuSSwPb436OPdrEucfd9vFmUfdVcyO0NJqz
	 LJ1/GvGrDhmgessEoNrQx1HNFef9PtqthMjovZKjrTiRPsNGT/xKWe+1oENjllPHXsfny
	 I4FRGGwh5s0EiWJc4wY5s9iZ/9sI5KZQl89WEmOJVwoWkERUhu26ftPFLuUeMLZiLmTNq
	 WZzHvPNvlU77MOu9WIgJ8LP2ijWRxb0mPaDoMlkG6ExB0mZSzanKhnhZ3Qy73PB/4OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c6YFRlaI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478C2606A339;
	Wed, 18 Nov 2026 22:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c6YFRlaI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73EE1F000C6;
	Wed, 18 Nov 2026 22:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795041009;
	bh=KhPGCzLsme1XU4+GASPBXpez80KaHqxyFka5T0h/TSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c6YFRlaIFFBoL650qerWEyO55KfuJy9O49O2ORyCVU5l2GWcHJPgWCpO2osiAeqCN
	 aSSx9KNaprK6qkRmPDBDeQLRqXJwLuMnejNrqwyIpaekNsj6XPu9PqQRCVKUAsY5AR
	 gXVyk4lasQusmWjQkdNrenYdnjJY0EYahSwMGlHBhFG/MYKzSptKCYz+mgY5fIEfrG
	 bFMnA0mvqlbzqlqyeTgNacDGiDNsCqAg37VJIjOuy1hR4UXjP3MAbruMdkThYHA4wC
	 VGsOouWAHn0EPXQYvadT5ipwrPA9byro9MyaWizTY1BJCuiTRrXA6lzoFnL00xTMai
	 p5b6xlDF/JRgA==
Received: by pali.im (Postfix)
	id 06481846; Wed, 18 Nov 2026 23:30:05 +0100 (CET)
Date: Wed, 18 Nov 2026 23:30:05 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Yury Norov <ynorov@nvidia.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	open list <linux-kernel@vger.kernel.org>,
	Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: dell-laptop: Fix token-based keyboard
 brightness readback
Message-ID: <20261118223005.2cwzmzp4niqfgckv@pali>
References: <20260925193239.248779-1-ynorov@nvidia.com>
 <20260925193239.248779-3-ynorov@nvidia.com>
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
In-Reply-To: <20260925193239.248779-3-ynorov@nvidia.com>
User-Agent: NeoMutt/20180716

On Friday 25 September 2026 15:32:39 Yury Norov wrote:
> kbd_get_first_active_token_bit() returns an index into kbd_tokens, while
> LED brightness is an ordinal among the supported tokens. These differ
> when supported token bits are not consecutive starting at bit 0.

When these can differ? I think that only in the case when token
KBD_LED_OFF_TOKEN is not supported by the firmware / BIOS.

But when the token KBD_LED_OFF_TOKEN is not supported, it means that the
brightness level 0 is not supported, keyboard backlight cannot be turned
off and so returned value cannot be 0, it has to start at some higher level.

> Count the supported token bits below the active token with hweight16()
> to recover its zero-based brightness ordinal.

So I think that this change will start reporting incorrect brightness
level and the original code was correct.

> Return zero directly when ret == 0: token bit 0 has no supported tokens
> below it, so its brightness ordinal is zero.
> 
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
> ---
>  drivers/platform/x86/dell/dell-laptop.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
> index 03d3bb70b0d1..55fd48222e5e 100644
> --- a/drivers/platform/x86/dell/dell-laptop.c
> +++ b/drivers/platform/x86/dell/dell-laptop.c
> @@ -2003,7 +2003,6 @@ static const struct attribute_group *kbd_led_groups[] = {
>  static enum led_brightness kbd_led_level_get(struct led_classdev *led_cdev)
>  {
>  	int ret;
> -	u16 num;
>  	struct kbd_state state;
>  
>  	if (kbd_get_max_level()) {
> @@ -2018,13 +2017,10 @@ static enum led_brightness kbd_led_level_get(struct led_classdev *led_cdev)
>  
>  	if (kbd_get_valid_token_counts()) {
>  		ret = kbd_get_first_active_token_bit();
> -		if (ret < 0)
> -			return 0;
> -		for (num = kbd_token_bits; num != 0 && ret > 0; --ret)
> -			num &= num - 1; /* clear the first bit set */
> -		if (num == 0)
> +		if (ret <= 0)
>  			return 0;
> -		return ffs(num) - 1;
> +		/* Brightness is the active token's rank among supported tokens. */
> +		return hweight16(kbd_token_bits & GENMASK(ret - 1, 0));
>  	}
>  
>  	pr_warn("Keyboard brightness level control not supported\n");
> -- 
> 2.53.0
