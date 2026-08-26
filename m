Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C097837A4AF;
	Wed, 26 Aug 2026 08:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787732913; cv=none; b=DD5S+07JU4B2fPKw7dKXiEiNYNfxMF1y4Q1c9AY0FprLOb5xxDyynoq6S0tOL/avg8PaHJfAyy+1qZC0jUZC2bicfa+Hcyvnx7jaOg9GG76eT9wFyE8FBYTnFETpyUUZiLBF6+uutf666dlRwG9YVzO3vKWms+x6c9uQbFiVqkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787732913; c=relaxed/simple;
	bh=cODprknMmQuPQ3TS1efd5dMDj0fHWCMFcu1NBPsiMx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=or24GI/hgUzHmcOEZg3IjaP6t7a550/WGB+b3/YJJGUJthtxIgApm2wTTRRbJ3CfeX6povwpHbewRqnh7gRtJKUcv5MgMAR2fhvKUYyzmN5whvYl0AWVSpKEHQdXDiaJf/poF88itJm9fwlA3YSzow5+JgPLjGtsI+IJeZx80eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Xc96ZJwm; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Xc96ZJwm"
Received: from [10.10.12.8] (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 76AA42FC0052;
	Wed, 26 Aug 2026 10:28:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1787732908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n/X5x4sVAbDdA0sVI7VSr1THNWwypSdrzf/IPGg2Zs8=;
	b=Xc96ZJwmKaY/qgX9dtBfd5sxeiviVdl5ZosAiGc1tWJfSsefJCWlmhpA2Cjl1LcgeBn2i4
	tbHTNwMmVz/UniC2IUHbWwFFbVJOvuw6RHq0O+4p34rUMyMncBhpCDu/GUARFR8rh/dr0S
	FmLepqfxVp0QA9/3v8z0ysdXHzRRAUE=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <649abc50-271f-473e-8851-d4abdc27f11d@tuxedocomputers.com>
Date: Wed, 26 Aug 2026 10:28:28 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] platform/x86/tuxedo: Fix keyboard LED map ordering
To: Aaron Erhardt <aer@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260826081149.235487-1-aer@tuxedocomputers.com>
 <20260826081149.235487-5-aer@tuxedocomputers.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260826081149.235487-5-aer@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 26.08.26 um 10:11 schrieb Aaron Erhardt:
> The LED mappings in sirius_16_[iso|ansii]_kbl_map did contain a
> flipped line that caused LEDs to turn on in the wrong order when
> counting up the Lamp ID.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/tuxedo/nb04/wmi_ab.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> index 8f1ffca0430d..2b985b030197 100644
> --- a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> +++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> @@ -232,8 +232,8 @@ static const struct tux_kbl_map_entry_t sirius_16_ansii_kbl_map[] = {
>   	{ 0x2e, { 246000,  67500, 5250 } },
>   	{ 0x2a, { 269500,  67500, 5250 } },
>   	{ 0x53, { 294500,  67500, 5250 } },
> -	{ 0x55, { 311200,  67500, 5250 } },
> -	{ 0x54, { 327900,  67500, 5250 } },
> +	{ 0x54, { 311200,  67500, 5250 } },
> +	{ 0x55, { 327900,  67500, 5250 } },
>   	{ 0x56, { 344600,  67500, 5250 } },
>   	{ 0x2b, {  31000,  85500, 5500 } },
>   	{ 0x14, {  51500,  85500, 5500 } },
> @@ -337,8 +337,8 @@ static const struct tux_kbl_map_entry_t sirius_16_iso_kbl_map[] = {
>   	{ 0x2e, { 246000,  67500, 5250 } },
>   	{ 0x2a, { 269500,  67500, 5250 } },
>   	{ 0x53, { 294500,  67500, 5250 } },
> -	{ 0x55, { 311200,  67500, 5250 } },
> -	{ 0x54, { 327900,  67500, 5250 } },
> +	{ 0x54, { 311200,  67500, 5250 } },
> +	{ 0x55, { 327900,  67500, 5250 } },
>   	{ 0x56, { 344600,  67500, 5250 } },
>   	{ 0x2b, {  31000,  85500, 5500 } },
>   	{ 0x14, {  51500,  85500, 5500 } },
