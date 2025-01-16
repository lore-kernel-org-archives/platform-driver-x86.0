Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DB222A803
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 13:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737035571; cv=none; b=Xv8ET9XBd/XkDw3Dd6Iv9aqvKG0/VjhCiEHMZoLuN+r4I2X3PAuOF5tqgJMvyzE/f9IfrZUW5+0paTIBqIUU0usUBAJ8cZxUEni9lSverRARZwgqHIMmhOTtLmIKlH7Y5uCrw9Wr1So93spdm66/V6Vj47Rj1Ii4XceseaN1OXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737035571; c=relaxed/simple;
	bh=G3RxJNa0pEqaJu7/w8oQD9KcCtOTLUKcbCNUvoQh5Gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UY/tmx5WhpYj6ZHyVGuoGUwIY/Kjf28LQvMKgV1RJHcUZ6RTQzYr2Ud1617nfVjQtNYFw5cWdiNP1LUu6LP8nBeXwfKXKOcmRBze1S4TETKeTbfe64bCmyG227tiMSViHMV9gpTVdmuHmPYGLSTTYdmvghUEuX6A2z3mOI0es9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=Lmfq+Uim; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="Lmfq+Uim"
Received: from [IPV6:2a02:842a:8223:5500::978] (unknown [IPv6:2a02:842a:8223:5500::978])
	(Authenticated sender: julien.robin28@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id D8CDC780510;
	Thu, 16 Jan 2025 14:52:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1737035567;
	bh=G3RxJNa0pEqaJu7/w8oQD9KcCtOTLUKcbCNUvoQh5Gk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lmfq+UimVrkN4SGODCbmritOBarnntwETARkjIRhcGEtpam4a75zjBiP8Z4KK4Ret
	 RRNYDd4h2uvdQiYJWPp6kZj/gkUjHtMofsppP5LCaxuMXBFAHUcCB2IpE+VN1G+FoM
	 n0/+sG9COu0xOM/S0wV4THM2oed8PXrAYEHODiWkaLXJXfpRV5canDKo4d1VpNQLdF
	 g9XFkhca2Qla6vBrS7rZmOoLNUPyB3etaHtWMYi5NHwtvUHSrbaTP8JnEdxt4cX2MJ
	 se7iDkr0506uvREjdfdPTmLV7XOBOfuCSx9KrxCdOwm/Phr8nR3v68QpClLwivf3KW
	 d1dL8n5jyng0A==
Message-ID: <398552cd-4f0e-4c45-8a6b-dde6658917aa@free.fr>
Date: Thu, 16 Jan 2025 14:52:44 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: hp-wmi: Add fan and thermal profile
 support for Victus 16-s1000
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
References: <c20354ec-abab-4c5a-94c1-ce1bbef5ce6f@free.fr>
 <6b4da799-6d05-a71e-702e-6eedf999c596@linux.intel.com>
Content-Language: en-US
From: Julien ROBIN <julien.robin28@free.fr>
In-Reply-To: <6b4da799-6d05-a71e-702e-6eedf999c596@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/01/2025 1:50 PM, Ilpo Järvinen wrote:

>>  enum hp_thermal_profile {
>>  	HP_THERMAL_PROFILE_PERFORMANCE	= 0x00,
>>  	HP_THERMAL_PROFILE_DEFAULT		= 0x01,
>> @@ -389,7 +423,6 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>>  
>>  	bios_return = (struct bios_return *)obj->buffer.pointer;
>>  	ret = bios_return->return_code;
>> -
>>  	if (ret) {
> 
> I understand why you made this change (because I told you it okay to 
> improve the patch outside of my comments). But it doesn't mean we should 
> try to do everything in the same patch.
> 
> I'm sorry for the extra confusion.
> 
> This change is good, but went you start to make changes entirely unrelated 
> to the logical change you're making in this patch, you need to put them 
> into a separate patch (and send a patch series). In general, we try to put 
> only a single logical change into a single patch. Don't worry if it feels 
> making patch series "larger", that is rarely a real problem but 
> instead helps review by splitting things into more logical and focused 
> chunks, it's easier to see an individual change is "correct".
> 
> There's some leeway and fuzziness in the minimal & logical rule. When you 
> touch a line, in general, we expect the end result to conform to the 
> latest coding style, up-to-date api use, etc. so it might not be required 
> to split every single "unrelated" change out of a feature patch but some 
> things are allowed to be made "while at it".
> 
> I'm personally not against in maintaining full logical splitting in a 
> patch series but due to conflicts from touching the same lines over and 
> over again, it's a bit pain to manage it. I try to largely do full loglcal 
> split myself so I know the constants conflicts that need to be resolved 
> even at the tiniests edits may make people prefer do things more "while at 
> it". As long as it's not about some lines entirely unrelated to your main 
> logical change, it's usually acceptable.
> 
> You also don't necessarily have to get every cleanup done in this series 
> but can send more patches later if you feel like there's more things you 
> want to do, so we can get the feature merged in sooner. But it's up to you 
> which way you prefer :-).

Oops, sorry, my mistake, a little misunderstanding about the scope of the expected coding style fixup.
For my 1st patch submission, then, I'll keep the focus on the new feature ;-)

While I'd be happy to submit future helpful contributions when needed, I wouldn't want to become too invasive by touching too many lines outside of ideal occasions of doing so.

>> @@ -429,13 +482,29 @@ static int hp_wmi_get_fan_speed(int fan)
>>  	return (fsh << 8) | fsl;
>>  }
>>  
>> +static int hp_wmi_get_fan_speed_victus_s(int fan)
>> +{
>> +	u8 fan_data[128] = {};
>> +	int ret;
>> +
>> +	ret = hp_wmi_perform_query(HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY,
>> +				   HPWMI_GM, &fan_data, sizeof(u8),
>> +				   sizeof(fan_data));
>> +	if (ret != 0)
>> +		return -EINVAL;
>> +
>> +	if (fan >= 0 && fan < sizeof(fan_data))
>> +		return fan_data[fan] * 100;
>> +	else
>> +		return -EINVAL;
> 
> I think the out-of-bound check should be done before even making the wmi 
> query (and -EINVAL returned right away).
> 

Yes, let's change that.

>> +/* Note: providing 0x00 as PL1 and PL2 is restoring default values */
> 
> This should now refer to the new define, not 0x00.
> 

That's right, changing that too.


Thanks again and sorry about the little v3 fixup overshoot.
Preparing the v4 for the next round, I'll send it as soon as it is ready and well checked.

Best regards,
Julien ROBIN
