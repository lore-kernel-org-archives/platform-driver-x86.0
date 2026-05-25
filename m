Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314AF26D4E5
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 21:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779745338; cv=none; b=prV5emigFz+2V+A3mi+7bRm0Tm77asNS7n9plyJfJthReYm4xVt1yV3x5b32SBqeW8/zEvVWJhvgQB5lOmHLCOVRQonxDntELkKvrkkd+8yIWbWB/GP+t4eep8k6CTxhrFXnjwiyeY5NUPxOHlPbilXW/aL7PEYWCs41e4lAio4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779745338; c=relaxed/simple;
	bh=koel1l0um81UqsjzXrP3m20+On99r9595bR05wAJrpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdYsiyOdn79gn/FKx6BGYzPdrLrACerJMo7eT+wRARgzfMhRvU2/FvVljqppD8OwKmYo38A6z4fOY+sbmTe9iVS72EuxGOaCzOGoe4i94Kf95KX2VoIPzaLZv98ttiIBlN5KaMV0T5HabsPzy/agwOZoJlSsIMouVjwN89mYtZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjM7M4fT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjM7M4fT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92F61F000E9;
	Mon, 25 May 2026 21:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779745337;
	bh=wvVMWvYe7/p+ihAnLTJvBAtKfSpSzjh75VFgquhY+aU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DjM7M4fTvaXIU0EZN9IiONos4/2lvJuKfRtLgu7EYIiQwwPBs20pOqR5PROEYGqk2
	 RbbNLK7I1SQEQLvgNk2dXfVhpnMPV3S4o/8iyNELJmLbtBlQGxvQVWJR68HmNMTwjr
	 0IsRYXPxoeail+38vdjp4R9a84JL/5jjZUNUvnhsq3OjJwITCGG96CRHSBC829M7L8
	 qQ/HGfcYq8PmDOKnR8KiDJpZ+SKma9qeRh4trthpRyBlcRRQOdZ7Fmlj+Frbapwi/g
	 9ukw/0u5F9ql82+79hm6dkzSuqagr3j2CmYhnTtbTpt5aDPCLpoj/hIujJgJWCzjbo
	 xh0h/9HyOvevQ==
Received: by pali.im (Postfix)
	id 32E0C71F; Mon, 25 May 2026 23:42:13 +0200 (CEST)
Date: Mon, 25 May 2026 23:42:13 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Gleb Sonichev <sonichev555@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] platform/x86: dell-laptop: add Inspiron N5110 to
 touchpad LED quirk table
Message-ID: <20260525214213.y4cyxbyh2pct3kbd@pali>
References: <20260525100047.20046-1-sonichev555@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260525100047.20046-1-sonichev555@gmail.com>
User-Agent: NeoMutt/20180716

On Monday 25 May 2026 13:00:47 Gleb Sonichev wrote:
> The Inspiron N5110 needs the touchpad LED quirk (Vostro V130 quirk)
> to properly control the touchpad LED. Add its DMI identifier
> to the existing quirk table, next to the similar Inspiron M5110 entry.
> 
> Tested on Dell Inspiron N5110.
> The touchpad LED works correctly with this quirk enabled.
> 
> Signed-off-by: Gleb Sonichev <sonichev555@gmail.com>

Looks good,

Acked-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/platform/x86/dell/dell-laptop.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
> index 57748c3ea24f..7fc3bbb8c4a4 100644
> --- a/drivers/platform/x86/dell/dell-laptop.c
> +++ b/drivers/platform/x86/dell/dell-laptop.c
> @@ -222,6 +222,15 @@ static const struct dmi_system_id dell_quirks[] __initconst = {
>  		},
>  		.driver_data = &quirk_dell_vostro_v130,
>  	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "Dell Inspiron N5110",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron N5110"),
> +		},
> +		.driver_data = &quirk_dell_vostro_v130,
> +	},
>  	{
>  		.callback = dmi_matched,
>  		.ident = "Dell Vostro 3360",
> -- 
> 2.54.0
> 
