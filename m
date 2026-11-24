Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542970;
	b=mLWdU9dYGV1oV1RTldspX513lWwToKZF/dhrAfmv0PUrPQkQFcPPVGGJSHKgQHVFB1c8
	 EOWewJm1/NaOGsf2vB3voJl2bs+AtfP3IHaFBjgTp6QwGdjQ/8xbC8sVpLC7dX3oWGmqE
	 0NsKv3ExW6uGA1LTVuBWyrwfSyY5r8y2x50X992vz1tNRZzyi0i/UaR/ZFNxsoWvXWla3
	 tCKJepgBb9aK8+05RQ2SoMnINdFOi7rxa1CMlrKl3/Z6k3dKQedybYRrEiU1/Gc765Z0o
	 LPOq58NufRkNJ9uZuDxIYFS+3kX4kFxdyBmGXiAuzWGwi1Rm+I7SEKnPgtD5Zyfmc9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542970;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=kDJJsSL7gkz9rNon2P9KcGagBncDS02r/6Hfbn3ZcgA=;
	b=VetKzTqXZwc3TERNCbIJNdVmARIv1/RqpW2Cl6FpRgwRbE6jnhNQo2D+0H+ES7IbLqDs
	 aDLzKmtBa1kKirpli0JYEAN8awMSVR+UzYw4kU/i4XOR3PatJvvtAE3ubTc2kSg6Z5GMC
	 UtW9MFnZfZ8ANzywy2agPsQPO1WJ3ZNxwejt1TtV2XgSDtRHETYPTHVTgESlwZgsqWm/Y
	 HXQGUAzO8WY3kTpzAB7DQTttaOYpFZWBc0XQxDdofm//iwvrQQE3hevI+6H1Th0xc6BC/
	 5ZvTRFeBUeBojvc/gOUs14bxitoD7hY7YSV5gX2qqQQkluXHEATwOtnNv6q2yYp27Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=KGK7GL0+;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=RnUz6vlo;
	arc=none smtp.remote-ip=103.168.172.150
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0322606A326
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 17:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0322606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=KGK7GL0+;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=RnUz6vlo
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.phl.internal (Postfix) with ESMTP id DE28EEC0BCA
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 12:56:08 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Tue, 24 Nov 2026 12:56:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795542967;
	 x=1795629367; bh=kDJJsSL7gkz9rNon2P9KcGagBncDS02r/6Hfbn3ZcgA=; b=
	KGK7GL0+ht5olDG/8gDlevkUoBQo++geY/9Ja7aPno3wqxVAeKMDula6U69Ft/uP
	8z6T4POQ+cUh8Tj/VO+4FXTaqy7+5Cgt0y6u4zx9Xn7wO8wa9+vLlTn+OtHaKjRa
	kB7bQ/3ipM2M0MRYit7Xd/Uyic1AI+HEC4iOk9C8pIa3R51qtkPBopRQS+ADuwfG
	Dc47PoABG+4ADzPixj+Jg3BP/AOiCxXATjF2vTtVzZdBmaiNfztYtDFdZsmj6dzC
	XOR7TTq+p54p75nhCQqFIZLsiq4kU1Ey9ABpJcSPu7tAcyX6qfNHsHs4Hs9mGVQZ
	hfFztQQNwWwkJysBUEpaTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795542967; x=
	1795629367; bh=kDJJsSL7gkz9rNon2P9KcGagBncDS02r/6Hfbn3ZcgA=; b=R
	nUz6vloShGOwhL9BVKyazWsjhO8xocHXzArXdBMETofFkEtsfo8uJM8YpBGHYq3S
	aFkOVHZnJemPcdtyTH7JICPGVzrr+/ukhgT32ymh7H+lsL88RenWVixr2FFfA5W8
	qMm7Fn76somi2m+ngYk+dodfjcg9TRO/Zo4Pk80YUQs27zIbzs3OmrQNwIgJdSNq
	HZMrXYwSGt271mgApGtfpsCZcPh0KMmjurQrsMRGrWRfdWFkAHYEufoCd2rTkl8R
	YMvlXXVa5ZBzQ+pVoVxNeSxXEa8BOJ5YfCsJc2OnmOcP9D+1wUY5AeI2QWk/D/HD
	MWsZ/MZTWMeYdz1pXWl2A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795542967; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:g4YDhehKjpNrcjahDsGMTutrbWiBa2bkRNmgAIXQLDDEueI
	3xhmwo3PH6w1EVSuYQowiMowgYnQ2rrkI5VlqfSjkDPa1A6nq/9RpZ9dKCfwpw8+
	D1QamlpzQ6wZCUTTR5/9hCPbLcTYFu1TObxrWtSpRBGrwMrtCjhfG33/lsuG+5cD
	JQtiZPDpmuQYihKlBmOrKFz1EjJI7cNilYbGcPnjJIQoziWhcsPom9KFzyCBa348
	M0G1RE9cHI5pg7BqMxmA5WOIMzH4O1bClGofCV1YsJIs685F3BKM/b+eJnlrB8vw
	1y2plXLlUJE48DMETQ9kzV4H90Q14liTq8u7hpw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:8kwq3b9vF4aIYVRc0YExVwh3nc3egALguryDfQKtbYI=:eyc1528g9ioZwSTiB2mrY48PyKmbaO/ufr3W+OG90yM=;
X-ME-Sender: <xms:tc8Fa1wwYpdUQOfqCtPZoxsTuw5fQGJa1rJU_P5rFy_zIDpzOI9vQQ>
    <xme:tc8FawEToORkg6RuPMBAJ22jibQjUVeRB6GJv0EP32iqF5SAPJ6T5MV3BnWSVJuHL
    TNVfUi3ImTZl5zueHf9f_WiDzg5da6pwLVCkEkxQak73Nzc1eeHHNoq>
X-ME-Proxy-Cause: dmFkZTEH2K3mAqOY4x6MnPrBn64VMuhHnNbiLeVUdApU0aCzux8JQGqmUrjbvn0Gf/QtLX
    NTEs2vr1z6VXqSMCf1DDTTiZ1uReVe6sSmmr9zr132BUhfW838nVG5EOenDcjR4Ja6a7qJ
    X1CBG5zCPjEzSVGO39PblWrn/OE/6bzcTCoaIRIkyb718/WgQUvVetbStM3UbLDDyatKIN
    h4WyGZoCgTzvfZCW5c1jXpyB2ZD5dFalB2pbABUd9UE4ygDExJnpB7L6hOfupRqo3bs9w8
    K2UJHGmQS5d4UX44ooap8pljA3a80994T02f0q4F9wgDCs7Ozntq2gWEvdL6m9Dd6LKVKK
    ss8VNtRe8V2v0+vt1gOsAV6i6rLgY72qgJRNgBpOiy2N7K6E8Al2vpzDEqzdwv7WxcCzs6
    U57tVt2+SGqEQbWT/s7Fk2vRUgcXG6ILjDWotCO/qQvKw+S4KjuNnC4JrHBHLeiDFlJs2N
    PhnVMVEhq50r1RZJyo0DtKyOSVqaEkEnU1cja+7DiC+iglA9FgIwukt+FnJeIbyTHTNVa3
    BxNjVhhx3v43sKFDEXUMopjwsEVGSw8VOEzIFsRIPk8323unYTgxHRLd0ONLh53SAHLIXE
    xTRk1zbFQVCaA1slRcNZCkgg6/d1CtLuJRVLnPq9UnddFCnd/kMRE92bALfw
X-ME-Proxy: <xmx:ts8FaxQQ5h9zmgJN8i_a_ejna2jcH_JbfpOVZQxHG8TVqU00YyvGIA>
    <xmx:ts8Fa93RS6LIOLeKbYowpVw7X_jf9qfq0ts-w4CHkVamITEdGFL7Ow>
    <xmx:ts8FaxfBrrJ193iHuH9um5hb01xYbjjTwidnR_Zllu5ey4UBSplhWw>
    <xmx:ts8Fa1NYGeKDn0LHDkYl0JMcYhucPrLAUBGC9DxFiiE-VWaMR0e16Q>
    <xmx:t88Fawd8Mv_pNqAf9-us2LI-b9GZpshL6P6nlbsGa-N-RgQ2D0MTxBj9>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id AAD032C00085; Tue, 24 Nov 2026 12:56:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: Aapn8tW6shyZ
Date: Tue, 24 Nov 2026 12:55:45 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Tom Hu" <huxiaoying@kylinos.cn>, linux-kernel@vger.kernel.org
Cc: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, "Rong Zhang" <i@rong.moe>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 xiaoying_hu@126.com
Message-Id: <d210975b-df3e-4858-96c8-06f868ee8ee8@app.fastmail.com>
In-Reply-To: <20261124103935.897624-1-huxiaoying@kylinos.cn>
References: <20261124103935.897624-1-huxiaoying@kylinos.cn>
Subject: Re: [PATCH 1/2] platform/x86: thinkpad_acpi: Update charge_stop only after it
 was applied
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 24, 2026, at 5:39 AM, Tom Hu wrote:
> From: huxiaoying <huxiaoying@kylinos.cn>
>
> The charge_stop_threshold store writes the new value into the cached
> battery_info before the EC has accepted it.  If the ACPI call fails,
> the cache and the hardware disagree, and subsequent charge_start
> writes are validated against the stale-not-applied value.
>
> Move the cache update after a successful EC write and report -ENODEV
> on failure, matching the charge_start path.
>
> Signed-off-by: huxiaoying <huxiaoying@kylinos.cn>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 4f81855ad721..8fc5569131f6 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -9847,16 +9847,15 @@ static ssize_t tpacpi_battery_store(int what,
>  			return -EINVAL;
>  		if (value < battery_info.batteries[battery].charge_start)
>  			return -EINVAL;
> -		battery_info.batteries[battery].charge_stop = value;
>  		/*
>  		 * When 100 is passed to stop, we need to flip
>  		 * it to 0 as that the EC understands that as
>  		 * "Default", which will charge to 100%
>  		 */
> -		if (value == 100)
> -			value = 0;
> -		if (tpacpi_battery_set(THRESHOLD_STOP, battery, value))
> -			return -EINVAL;
> +		if (tpacpi_battery_set(THRESHOLD_STOP, battery,
> +				       value == 100 ? 0 : value))
> +			return -ENODEV;
> +		battery_info.batteries[battery].charge_stop = value;
>  		return count;
>  	default:
>  		pr_crit("Wrong parameter: %d", what);
> -- 
Looks good to me.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
