Received: from mta1.migadu.com (out-208.mta1.migadu.com [95.215.58.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F21B3DA5B6
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 18:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787076571; cv=none; b=Io8FFdeFLKwnZnmpTfhDbmXSnbiPm5Je2gtdBAKu1DhE1BNeTBn46FqhqPeSJES9xdDSC68i0xXdjhWtp9lTzbtNVqqAAhdleEU72zu9cFKev0pOlLrRkZWX/4XlwPs4EKYnpbV+PPMq+kZrRfbfbL1V4eOnTmXWdXKMQsKwYHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787076571; c=relaxed/simple;
	bh=Tnemrcjd9fh2vvG6rFLUWx574efrfYNiAxaRbjFxloQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9TVhgmONEqMgsBCow2O3G3Gm8oS+mMr3eoDao2wpOHGlYv5FqTvG4cJzWAJ+mCHW8ZdADJFQBGT3xJ7709orRpQJqJn/Lj9/5+1DtL+DhmJho6oYr+HnuC19VE9LMySx3f7HQZtF5Zbbh1KhLdXTKNo4s6nhf/EQXql1ysD8F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OXht5iC8; arc=none smtp.client-ip=95.215.58.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OXht5iC8"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Tnemrcjd9fh2vvG6rFLUWx574efrfYNiAxaRbjFxloQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787076566; v=1; x=1787681366;
 b=OXht5iC8JYgxCgbsa1UljYmvTNqpm+lCoFsAG8OGLDJGlDXXTOqPO+d+DJsFO+y7at7rT+eI
 8zttQBI6nnYPSWwpjUIzmYJZ25kTCyCrMtLHABL+1oAyidhreVKzQ97wikg5jcu3b19YSlEeTqC
 AepmVZWGT645tVfzEYtXy28g=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: from [10.80.0.99] (151.61.14.130)
	by smtp.migadu.com with ESMTPS id 681296a5d9c6ccc9;
	Tue, 18 Aug 2026 18:09:16 +0000
X-Migadu-Flow: FLOW_OUT
Message-ID: <ee73bd1c-05ce-4d1f-bd85-392b2d794544@linux.dev>
Date: Tue, 18 Aug 2026 20:09:11 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-wmi: restore battery charge limit
 support
To: Luis Miguel Arias <luismi@gdcore.dev>, corentin.chary@gmail.com,
 luke@ljones.dev
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260818174850.51457-1-luismi@gdcore.dev>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260818174850.51457-1-luismi@gdcore.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 8/18/26 19:48, Luis Miguel Arias wrote:
> On ASUS systems where the charge threshold is supported through
> ASUS_WMI_DEVID_RSOC, initializing charge_end_threshold to -1 causes
> the sysfs attribute to return -ENODATA. This makes TLP consider
> charge threshold support unavailable.
>
> Initialize the cached threshold to 100 instead, allowing userspace
> to set the desired threshold normally.
>
> Tested on ASUS with TLP 1.8.0:
>
> Before this change:
> * charge_end_threshold = -1
> * TLP reported no charge threshold support
>
> After this change:
> * TLP reports "charge threshold" as supported
> * natacpi (asus_wmi) is active
> * charge_control_end_threshold can be set to 80%
Hi Luis,

I'm confused here... I sent a temporary revert for this while we waited for
Upower to allow changing threshold with -ENODATA. The current version
of upower is fixed and I wasn't even aware TLP could do this: how do
you do it?

This means TLP also need to support -ENODATA properly and stop treating
it as an error... Do you want to contact them or do you want me to do it?

Anyway the main idea is that this is not the expected behavior and is
considered bad practice to change the limit at boot without user asking,
so I think the wise thing to do is for Ilpo to apply my temporary revert to
platform/x86 too while we wait for TLP to behave properly...

P.S. newer version should have v2. v3 etc...

Best regards,
Denis
> Signed-off-by: Luis Miguel Arias <luismi@gdcore.dev>
> ---
>  drivers/platform/x86/asus-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 80144c412..87363b198 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1586,7 +1586,7 @@ static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_batter
>  	 * platforms retains it, therefore signal the threshold as unknown
>  	 * until user explicitly sets it to a new value.
>  	 */
> -	charge_end_threshold = -1;
> +	charge_end_threshold = 100;
>  
>  	return 0;
>  }
