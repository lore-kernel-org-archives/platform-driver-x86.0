Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870C724A7C9
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 02:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736993953; cv=none; b=Ygzy4hvqfIRbVCCV9Kleidjf/qNSAiAfcY1D74hjFhATmlEGIU+DXsXICvIV0TYM9ttfZhmblPtg10vxTxOjCPYcND54MHW/tHWJEURm1jMKe9M1arSiR70spYFPzjrZqsAt5RKuZVqdhUq/TTkSBXtD/3znVvT34JjHe5p50Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736993953; c=relaxed/simple;
	bh=bN636Srgn5gZ6feEVv+pO/Wy6th5X4sfRQ64Sp3Q240=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CZFdAbiNiKwxVpSEKSBv96/Bi6s9rKogn9xKDR9vqVeUXAtEoGR2c8QHNWjcBkeOQQ1eqVEu0k94gI/V/sEmnHEJ6sZWBdqvPjrEkoXc4bJy4QLaudQJOyzkHEDQ2MCR+PTiEQaxlfFmndr2htQ6sHCcNwEUu8jswDPTdHgEJYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=Y1RL9LGm; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="Y1RL9LGm"
Received: from [IPV6:2a02:842a:8223:5500::978] (unknown [IPv6:2a02:842a:8223:5500::978])
	(Authenticated sender: julien.robin28@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6E42578034E;
	Thu, 16 Jan 2025 03:19:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1736993943;
	bh=bN636Srgn5gZ6feEVv+pO/Wy6th5X4sfRQ64Sp3Q240=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y1RL9LGm8ESzRXEhY56Oe8nq6iO3yXIfZX7I2mASjdq7+Ipw44WJZ2NelF+ylYNjY
	 kg5g7NVTrDCSZ/GyuJ8RlZSE3oU14QKNk1hwX/Na8CuUBtHWEg80jVDSRQCn2JmiTn
	 OFDnGOwcjGA2upQEKfuo93dHW6c3cGIqc6LIj7tsaCQPXBncrhYTbL4OVl9OP0oatQ
	 NAdi9pNSPS9J0WMi2rQMcC56CkmsDKkHsbxCjaiyKUw5r3V3XG89QcUYqXBEGf5MGL
	 5dgeyL495D0n6QIisFn6XzGZ1vtAy3PpgGMtVi+nD8HDQI+29UMZ5ZiYK4SBy1XeO+
	 R0Sp0Bx90uwEw==
Message-ID: <be2f66bd-6d77-4904-b154-b7cc7ab9f387@free.fr>
Date: Thu, 16 Jan 2025 03:19:00 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: hp-wmi: Add fan and thermal profile
 support for Victus 16-s1000
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
References: <24b54c4c-6c4d-47a6-bc6f-1be8922bbf69@free.fr>
 <5dd4d3f4-a643-49fb-cf03-c68fb1bdd8e9@linux.intel.com>
 <56832678-58a6-45f2-a462-a6275b5d8dc1@free.fr>
 <19549b0b-0a73-6948-bde3-00c36d83270f@linux.intel.com>
Content-Language: en-US
From: Julien ROBIN <julien.robin28@free.fr>
In-Reply-To: <19549b0b-0a73-6948-bde3-00c36d83270f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/01/2025 2:07 PM, Ilpo Järvinen wrote:

>> In this particular case, while technically the {} would work, I suppose it would still be preferable to change from:
>> u8 fan_speed[2] = { 0 }; /* Restores automatic speed */
>> to:
>> u8 fan_speed[2] = { HP_FAN_SPEED_AUTOMATIC }
> 
> Do you actually want this?
> 
> u8 fan_speed[2]  = { HP_FAN_SPEED_AUTOMATIC, HP_FAN_SPEED_AUTOMATIC };
> 
> That is, are those both bytes fans?

Yes, I did another double check to be sure, with different non zero values, here each byte is clearly setting its own fan speed, they're independent from each other.
So the writing you suggest is more appropriate, resetting both fans to automatic speed, needs the zero value (HP_FAN_SPEED_AUTOMATIC) to be set into both bytes.

>>>> +static int hp_wmi_fan_speed_max_reset(void)
>>>> +{
>>>> +	int ret = hp_wmi_fan_speed_max_set(0);
>>>> +
>>>> +	if (ret)
>>>
>>> To keep the call and its error handling together, please use this form:
>>>
>>> 	int ret;
>>>
>>> 	ret = hp_wmi_fan_speed_max_set(0);
>>> 	if (ret)
>>
>> Understood, and applied.
>>
>> Before sending the resulting v3, would you like me to apply this form 
>> change, alongside with { 0 } becoming {}, to some others already 
>> existing functions around? I prefer asking before doing so, because by 
>> default I'm not sure changing unrelated already existing lines is 
>> expected when sending a patch. 
> 
> Yes, please change all similar cases. I always assume/hope people look 
> through their own patches for similar things to address. If I'd try to 
> mark all of cases, I'd anyway miss a few because my review is not going to 
> be perfect (often I only realize these mid-patch, having passed n similar 
> cases already; I try to focus on finding logic problems but I catch many 
> many style things too while at it).

Fine :-) Thanks for the explanations, no problem I completely understand.
So I looked around for occurrences of the same things to fix into others already existing functions, and I carefully applied the change where appropriate.

>> If not, I suppose this may be the matter of another future and unrelated 
>> patch submission. 
>>
>> Thanks again for the review work.
> 
> You can always improve the patches beyond what is mentioned by the review 
> comments! :-)

Good to know!
Prepared the v3 for the next round (tested it and checked with scripts/checkpatch.pl as always), and described the changes; I'm sending it now.
