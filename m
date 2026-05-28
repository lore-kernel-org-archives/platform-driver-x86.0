Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F83340A46
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 May 2026 07:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779955033; cv=none; b=cbejQyf32V/u800bSv78ai4QyfML0+6+WmfVBdDgHqxx82jgGdk68CmgCvBwtbcZfjxUvWShQszv081AJOU/5Eb5NureOKDaRkzYrP+Yd3g22ACDgnbhsBrNYbJ1W+osmCKaDo4p7o8kqOuZCjuNNz4tkJ5rAlmev0wz6JHK8Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779955033; c=relaxed/simple;
	bh=ucQyNud5X8TtJGCENqdQxusnXp1FnWi+i+pwkQ8N/7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l0k6E/gW5hv0udeSWQzNK+f12PkP2vNZS0dZNCMUJcWEFlLjSfInNNzPwi272JrypP2CWV3n0SKb6pspvavvdXSTEh0YnlVhl2HK4zqRKR2CYOEiQDtvjxVraS3gBVWmoc69j2ZVuGGx7YGK35Gt+6HPIPgsKonNYKap8xig84o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raymen.nl; spf=pass smtp.mailfrom=raymen.nl; dkim=pass (2048-bit key) header.d=raymen.nl header.i=@raymen.nl header.b=R7pA16rg; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raymen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raymen.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raymen.nl header.i=@raymen.nl header.b="R7pA16rg"
Received: from smtp.soverin.net (unknown [10.10.4.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4gQz941mQXznpG;
	Thu, 28 May 2026 07:47:20 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [10.10.4.100]) by soverin.net (Postfix) with ESMTPSA id 4gQz936FNHzDY;
	Thu, 28 May 2026 07:47:19 +0000 (UTC)
Authentication-Results: smtp.soverin.net;
	dkim=pass (2048-bit key; unprotected) header.d=raymen.nl header.i=@raymen.nl header.a=rsa-sha256 header.s=soverin1 header.b=R7pA16rg;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raymen.nl; s=soverin1;
	t=1779954440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rq5OId6vMhy2a9unt2Zv4GYAD6C9n3tEVtoI7JBhZbU=;
	b=R7pA16rg6enf1bo+77yChh+etIEvLOkhgS4TkVhGTb4HjNnDPfnOmhVpk3aDSIobip9wsH
	VY7LOKlU01zUY5htpaYrT5P5FuWNPSuUbQ2ec1+GwGO0b9d7JSi4A7TiujZDSfUV0Eiw5+
	tcW5x5rl68w046NBEbF3Y5TfsIda5FvIUQrdduKgMUhP3e+LRS5ZYZwIH6tY97VOzwCdDi
	pyGZwu7idNOITC/0Wr6mZP7BZuBn0td20HHVviFsPOQnnUJjg7ZEGB1XYrgRILm63QJ7nh
	qBygiWm8EXX+EyfuzldRFJwKkbjmUw1hLjn4wzv4FjQcFZqbPsD4UDytG3O8Zg==
X-CM-Envelope: MS4xfLFKGwibsRJ8W6K/R5BToWVv6ZtT81T+Vj5lzGZeOj6Cay7a0nAuy/OPl38ie/LD7jof4eI/sw8hU2p3gWoprGHGsCiT9iz3ISOCHDBE10etRC8ca0qn BM5fgJ035VO1m8aC5bH7eSlDC3UJ0z2EE2EjitfTRyAQKSljukv4DlvsAOMTKoelRpEQnF/UZ9EKeW3r+vqSDgeS8JsAwm+V4+X+WKvOOxZsUHdKWhMVsWNH blzeJlZvtHSKvH3cYskrXO6G8FeMbrNJhfTab4KniYTnrTF7gx6Vz2UmZep0BnWwSEz89qER7zp3eAAInWDz7OjvJIYRQt9+QiaUVkXl1ek=
X-Soverin-Id: 019e6d8d-5740-7b25-85ed-512821f5a638
Message-ID: <e766c049-4f15-4817-9c2e-bf8df88fae88@raymen.nl>
Date: Thu, 28 May 2026 09:47:06 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] platform/x86: uniwill: Add XMG PRO 16 M25 matches
To: Armin Wolf <W_Armin@gmx.de>, Raymen Scholten <git@raymen.nl>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
References: <20260510210610.53871-1-git@raymen.nl>
 <be3254e9-aac7-4134-9a7f-dbe99bebabab@gmx.de>
Content-Language: en-US
From: Raymen Scholten <ray@raymen.nl>
In-Reply-To: <be3254e9-aac7-4134-9a7f-dbe99bebabab@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spampanel-Class: ham


On 5/14/26 21:49, Armin Wolf wrote:
> Am 10.05.26 um 23:06 schrieb Raymen Scholten:
>
>> The XMG PRO 16 M25 uses the NB02 Uniwill/Tongfang platform and reports
>> the board name X6AR5xxW_mLED.
>>
>> Testing with uniwill_laptop (force=1) and with this change applied as a
>> custom module on this system shows working keyboard lighting and hwmon
>> fan readouts, with no regressions observed across load/unload.
>>
>> The non-miniLED variant (X6AR5xxW) is assumed to be equivalent to the
>> miniLED variant, similar to the corresponding TUXEDO Stellaris models,
>> and is therefore included as well.
>
> Hi,
>
> please also CC platform-driver-x86@vger.kernel.org so that other 
> people can see
> this patch as well.
>
> That being said:
> Reviewed-by: Armin Wolf <W_Armin@gmx.de> 


Hi,

Thank you for the review, I'll keep the CC in mind for next time as this 
was my first contribution.


>
>> Signed-off-by: Raymen Scholten <git@raymen.nl>
>> ---
>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c 
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index 945df5092..426616a55 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -2041,6 +2041,22 @@ static const struct dmi_system_id 
>> uniwill_dmi_table[] __initconst = {
>>           },
>>           .driver_data = &lapqc71a_lapqc71b_descriptor,
>>       },
>> +    {
>> +        .ident = "XMG PRO 16 (E25/M25)",
>> +        .matches = {
>> +            DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
>> +            DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxW_mLED"),
>> +        },
>> +        .driver_data = &tux_featureset_3_nvidia_descriptor,
>> +    },
>> +    {
>> +        .ident = "XMG PRO 16 (E25/M25)",
>> +        .matches = {
>> +            DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
>> +            DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxW"),
>> +        },
>> +        .driver_data = &tux_featureset_3_nvidia_descriptor,
>> +    },
>>       {
>>           .ident = "Intel NUC x15",
>>           .matches = {
