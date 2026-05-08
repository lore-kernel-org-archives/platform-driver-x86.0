Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5836140E5F
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 May 2026 12:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778243737; cv=none; b=dX/uv2clvmBgKS9AedGzKGA6hctiprt5gP/HVFTS3eiUc3JU2EoXgxzcOQKoYU1aR3JOwGRUSKWXPCsuDVf9DMgNTCb6m4Pn0zTj2LV659DAqhlR5evAWJwYxnqYlQR3rpwv/PjJQADcObNsXfBSaqgbB0IwV7b6A/SvY9RIQfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778243737; c=relaxed/simple;
	bh=/esmceqaAN/03p62x7JbtaUpve0W/d3reBy0lp443BY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cGvdCRRh9hPRX1m1ahEyFR0WI9A8AWH6XPgb/wRph3lxGFz+S+cZeBtFSZ1tlSuqs9NIgFFWxKdKO6ZXFMZbE5bR3LfJCbz06KxF9COhxYwDWhTr5Y7tLaKZvdLlPUiepO273tDMaUmSMAcFjehoNYvACAFuOmHvKFdOyjcj0QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZDdBk9DE; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZDdBk9DE"
Message-ID: <80e67990-4e75-4901-85ee-c4faa3f2a278@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778243732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7mGHaNpQNmZ8FFNheSQF4ZhSi7sRQkALPYZ4kYdULX0=;
	b=ZDdBk9DEKUaNJd4NWmdctoPY++IB1wdVZJIe66ghiGtp3KEfg+yMEfwIwVx9Xe/RcLeOdB
	JrGM3p+K/eHZh6TDqbKRpY0OaVO5swKHLtqexC16SaD7FrPRedxICiGEPLV5nlBJidi1N0
	c5Z4lzxPDJYGBrQLcV6gHBm4otfr/nQ=
Date: Fri, 8 May 2026 14:35:19 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: add DMI quirk for ASUS Zenbook
 Duo UX8407AA
To: Paolo Pisati <p.pisati@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
References: <20260508070956.62201-1-p.pisati@gmail.com>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260508070956.62201-1-p.pisati@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 5/8/26 09:09, Paolo Pisati wrote:
> Use the existing zenbook duo keyboard quirk for the UX8407AA model too.
Reviewed-by: Denis Benato <denis.benato@linux.dev>
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index b4677c5bba5b4..8005c088e9eee 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -544,6 +544,15 @@ static const struct dmi_system_id asus_quirks[] = {
>  		},
>  		.driver_data = &quirk_asus_zenbook_duo_kbd,
>  	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "ASUS Zenbook Duo UX8407AA",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUS"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Zenbook Duo UX8407AA"),
> +		},
> +		.driver_data = &quirk_asus_zenbook_duo_kbd,
> +	},
>  	{
>  		.callback = dmi_matched,
>  		.ident = "ASUS ROG Z13",
