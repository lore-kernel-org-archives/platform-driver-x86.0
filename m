Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDAE1C5F39
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jan 2025 19:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736797722; cv=none; b=LkDDDIGOPSTG8UyYFrcRgm0eVVji50fHmDUqpbfIw9D/sjLB17L2Ya3kKn2gFjxGCbR5++XhiF8m+F+whfWgj0SgnwI5DTGbcxuKqhPYK5gM9md9O+rFpezC+sAQRTUR/RTuJt4oBoxoJpEnSoq6mZFM6DwknPR3XyR6CwmXuTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736797722; c=relaxed/simple;
	bh=lhhbtfT2yKcFjCphd2MxuIRNFaCWayZ90Vt8suEGGKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gaAs5DEsI4jnsV9rb1Rkb4xKxP4bgCmyrAcQGAwfTnzwi4rPlGmRz1kl48B2M8JEZKxEtKfQFf+dKf51lMm3y6gk84CctLff8vLyg1S+nr0v7K4DWJ33/oVap9PRbLp+WU4oxNDmRPVge8PTrdOkU7lAoKqd4/HVjxmFrMmk6/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=JzgbJUNn; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="JzgbJUNn"
Received: from [IPV6:2a02:842a:8223:5500::978] (unknown [IPv6:2a02:842a:8223:5500::978])
	(Authenticated sender: julien.robin28@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id CD028780509;
	Mon, 13 Jan 2025 20:48:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1736797717;
	bh=lhhbtfT2yKcFjCphd2MxuIRNFaCWayZ90Vt8suEGGKU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JzgbJUNnO14YXdtdcTpbtlcM9DBg3+pKTOddeKaUznvXPZL0WP2X+uDv1psApoJLN
	 0k/fnudandfPvHQMxNmJRoD0BNDWr/xNjPieIaPcr1I1gDdfzMIfXq6qyNr2fHiS9S
	 BOAo+g3IduUrK7ZLLxTkq14LIAlbndFWMRRYRc6A0cnzL0M6vE9S2SQX9O79CGaRlt
	 +i1zlshvns6CS3oh9vssW/ciB3x05dWCe0pprnxp3w6+Tl7jeRY5yVH/jjddYR7hGk
	 ZNk4EoLaw6NAKxrQhLPrXUWMXGEITHPkE6Z/eJcWo1+ZiYkhcJ4mm87lTnTV6Zk5sN
	 O7iiX/Xpw9ZMA==
Message-ID: <ec8d7fa6-a386-4392-b6e0-a632981f91e3@free.fr>
Date: Mon, 13 Jan 2025 20:48:35 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: hp-wmi: Add fan and thermal profile support
 for Victus 16-s1000
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
References: <69a3a3bf-fe56-4843-91a5-b765e53e337d@free.fr>
 <d59c584b-1b25-213f-a481-97cb75c8d021@linux.intel.com>
Content-Language: en-US
From: Julien ROBIN <julien.robin28@free.fr>
In-Reply-To: <d59c584b-1b25-213f-a481-97cb75c8d021@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello and thank you very much for the feedback.

I reworked my changes accordingly, sorry I took some time on it.
I'm going to send a corrected [Patch v2] soon, so that the changes may be reviewed (as it's my first patch submission, your feedback is welcome).

I'm going to list the changes into the [Patch v2] description, but as remainder, you can find my answers to your feedback and suggestions below.

On 08/01/2025 11:08 AM, Ilpo Järvinen wrote:

>>  enum hp_wmi_radio {
>>  	HPWMI_WIFI	= 0x0,
>>  	HPWMI_BLUETOOTH	= 0x1,
>> @@ -153,6 +158,11 @@ enum hp_wmi_gm_commandtype {
>>  	HPWMI_FAN_SPEED_MAX_GET_QUERY = 0x26,
>>  	HPWMI_FAN_SPEED_MAX_SET_QUERY = 0x27,
>>  	HPWMI_GET_SYSTEM_DESIGN_DATA = 0x28,
>> +	HPWMI_FAN_COUNT_GET_QUERY = 0x10,
>> +	HPWMI_SET_GPU_THERMAL_MODES_QUERY = 0x22,
>> +	HPWMI_SET_POWER_LIMITS_QUERY = 0x29,
>> +	HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY = 0x2D,
>> +	HPWMI_FAN_SPEED_SET_QUERY = 0x2E,
> 
> Thank you for the patch.
> 
> Please align the values. I leave it up to you if you want to only align 
> the values you're adding now or all of them.

Ok, I did all of them, so that it looks nicer and more consistent.

>> +	/* Disabling Max fan speed on Victus s1xxx laptops needs a 2nd step:
> 
> Why is Max capitalized?

Sorry, was just a mistake. I changed it to "max" not capitalized.

>> +static int victus_s_set_cpu_pl1_pl2(char pl1, char pl2)
> 
> Is char correct type here or should you use like u8? Given you use 0xff 
> below I highly thing it's not a real character at all but generic 8-bit 
> data that should be u8.
> 
>> +{
>> +	/* Placing 0xFF in the 2 last bytes tells we're setting PL1 and PL2 */
>> +	char buffer[4] = { pl1, pl2, 0xFF, 0xFF };
> 
> correct type?
> 
> I see lots of other char use elsewhere too in this patch, please check 
> those too that it's correct.

You're right, usage of char variable types was just copy of what I saw into existing functions; but used as unsigned numeric 8-bit values, u8 variable type is indeed more relevant.
So I changed my "char" additions to "u8" as you suggested.

>> +static int hp_wmi_fan_speed_reset(void)
>> +{
>> +	int ret;
>> +	char fan_speed[2] = { 0 }; /* Restores automatic speed */
> 
> Instead of a comment, add a named define for the value?

>> +
>> +	if (pl1 == 0xFF || pl2 == 0xFF)
>> +		return -EINVAL; /* the 0xFF value has a special meaning */
> 
> Could that "special meaning" be labeled with a named define?
> (I understand you might not know anything beyond it being "special" but 
> if you know a more precise meaning, a define would be much better than a 
> literal.)

I dug a little more about the observed special behavior of 0 and 0xFF values for these HP WMI queries.

It turns out 0xFF is more exactly used as "ignore / don't change" parameter for HPWMI_SET_POWER_LIMITS_QUERY (0x29).
Also, 3rd and 4th parameters for HPWMI_SET_POWER_LIMITS_QUERY turned out to be PL4, and CPU + GPU concurrent TDP, so for these 4 bytes, I've changed the buffer[4] to a struct with more clearly expressed names. In order to be consistent, I did the same work for GPU power modes.

For the named define for those values, I was about to propose the following ones:

#define HP_VICTUS_ARG_VALUE_RESTORE_DEFAULT 0x00
#define HP_VICTUS_ARG_VALUE_KEEP_UNCHANGED 0xFF

However these 2 statements wouldn't always be true and could be deceptive for other settings, as it turns out using 0 or 0x00 as arguments for others WMI queries (others than fan speed and CPU power limits settings) tends to set 0 as actual value instead of restoring default one, and same goes for 0xFF. 

So for now I just moved the comment as function level comment, as you suggested below, but in case you had something else in mind, I'm of course open to another approach.

>> +	if (pl2 < pl1)
>> +		return -EINVAL; /* PL2 is not supposed to be lower than PL1 */
> 
> Please move those two comments before the if () line.
> 
>> +
>> +	/* Note: providing 0x00 as PL1 and PL2 is restoring default values */
>> +
> 
> That comments sounds like something that could be a function level comment 
> instead.

That's right, I moved those comments as you suggested.
 
>> +static int platform_profile_victus_s_get(struct platform_profile_handler
>> *pprof,
>> +					 enum platform_profile_option
>> *profile)
>> +{
>> +	/* Same behaviour as platform_profile_omen_get */
>> +	return platform_profile_omen_get(pprof, profile);
>> +}
> 
> Just use platform_profile_omen_get() directly then instead?
> 
Yes, I was copying again another approach I saw; but I indeed asked myself the same question.
So I removed this one and made platform_profile_omen_get() called instead.


Finally, while investigating about 0x00 and 0xFF special effects, I also dug a little more about a 0x57 fixed magic 4th byte used when applying GPU power modes (0x57 is 87 in decimal). It turned out to be a GPU slowdown temperature threshold, sometimes called GPS, that didn't need to be hard coded: despite being unable to use 0x00 and 0xFF to deal with it (was applying 0°C and 255°C), I successfully added HPWMI_GET_GPU_THERMAL_MODES_QUERY and associated function, and now the current setting for this value can be retrieved prior to overwrite.
So into the [Patch v2] this is used to retrieve and reuse the current value (which is confirmed to be 87 in my case after a power cycle) instead of using an hard coded value, before overwriting GPU power modes. I believe it's better that way, in case others machines are using another value in the future.

Best regards,
Julien ROBIN
