Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7022A1D6DDA
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Dec 2024 16:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733933516; cv=none; b=eVI8cTo9QStV0dgyTymSH2uTTyF5Zo7/XpL0Di8xLwYxLROy21/xv6QFGAURPrzCMRdPM0djBqGvoGJdgfDzYzGUmbXmYuAoXA0f2pOpzLrKQutvPHENUPJrgDQVz1yHuVlRa5JAQE3AKNj48v+WG9YzamRU0QgjFV4ya2i5BN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733933516; c=relaxed/simple;
	bh=WhBijUHpTxJZ1H7HPQ7nhAgAH3Z9mL6B2lVx4lMN9jU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ifrW26GFSvV0CrwLFqMmTWyeDtikOJaom2BWrq46CJwNoyG44GBr34pKdI7VvW5G701eUocwUYmDfHt80UWiMvD650hPZN3B6CJvImotsNgFsdjenbJup9CJki6sAHhK07W9T3ZDPd8sq83baA0fhN3vL0JzF+jFs5gNfDRDLY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XD4dFt2p; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XD4dFt2p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733933513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZN8vHGiR2okTDuCeNuzLSyM2kRbk+d8ifjg0Um0z2+k=;
	b=XD4dFt2pCBqocvPr3t1BrRu/Bbsx7kyV+5uFpzol1f0wo4HJRQ89gSOaTlehH9uyC1KbLQ
	KaSRYaHNB7gUctJ5SYeThTVR3XqkqWWHSabqGXU39Mv+fTmZ4k9c+96vshSyJnALPN9hOy
	i5yNzD8AACbfE4Hsuk686Vtat64gT5o=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-6VXe97ngNV64afh8vcukkg-1; Wed, 11 Dec 2024 11:11:51 -0500
X-MC-Unique: 6VXe97ngNV64afh8vcukkg-1
X-Mimecast-MFC-AGG-ID: 6VXe97ngNV64afh8vcukkg
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa691c09772so313586666b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Dec 2024 08:11:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733933510; x=1734538310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZN8vHGiR2okTDuCeNuzLSyM2kRbk+d8ifjg0Um0z2+k=;
        b=KyhcNyVy8yN5QXf+gTodxu/NQDRd9+8Ds+0T1OofjUlmB/v5MxxQXfbr3NY21Lmtab
         FtoVa8uc9V2+hqg/zEc1hxz3T/vFyjA4CYsFkiw+YjwKAItSYat9lNv0l32cCbhegLjK
         cZAZksqwXhJ97ySTmm0mUcMySwgGlvaCQcpMz7aj7oa6wP+TeQwvGs9S54U3GxYdQBGS
         FutQVoLwzgPTfzrwaRmbbXmeV0PIKDXjuERrMLgZf3uMrLN7rugBBDXBjDbnzLam1o9k
         4Fw/aa8UZiu8ZujzYm9wlguYjnpq4jywy0zEkM+fUXnnKAWK1d5taM45mZ2961Tr/FUq
         g50Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHHvA4Ru7c/ZuwijssGqRpiWSC7kCHR9fdfAZbH1v5iICFyUB2bAoUJclksjk93oIaIfABL9dK9jR7eb2R68p67xzZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyT5/O/Yo6JLCUKgUMsL8mPCmLKuDc547lDeAQ4ujbLAmzgbYF9
	buoRaNsuAcCyL+rRF62NrTFWbiYgvEcFLkTy3AI+55AibCe27K8DKMnabAvDctzhwonZX+rvClY
	CnsWNDmCNSt4h0JAmsNDUt9XGXEcdeQ+tUaPHq7AwN46A49u5FBQ3ZOAUkLhM0kvdPg68em8=
X-Gm-Gg: ASbGncsZrtvjRpmXaU1kDdG9K7ZoO6eInrE280QZb2tC1RPe1yHPcDvZzkTwh7o9+eK
	Hgjd1/2FUV0Hj1Kv412GL38leaEo6A+V7bSyLVfT92NSkP8wWlON689Prf4hx+1BqmisBuByX1K
	+eHz1UBDGb74C7PFb2QMN/+U5fOHYRtRTgzt65FK/itgx2FMqj6pOCPri4T21017sVCk2cLmUxN
	fpdjkGSy7lutTbkkBoBErGIlKk47A9U7zvmU1z/UTKAAhIhFVETEc/UxVsggakmvEo6w6e+Z7wZ
	8wtXCAeoS1DIGGLSTAq3MiEvXZB6vnjzCBMkkyR3Fz5Muzgv/6ekL9K7N6e0GWYzTrSg7JaTFOj
	kySSBqLQvxFpXNHucADlgcdGDxEFU
X-Received: by 2002:a17:906:3190:b0:aa6:851d:af4d with SMTP id a640c23a62f3a-aa6b115b2bcmr234591766b.21.1733933510442;
        Wed, 11 Dec 2024 08:11:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeMcdeaCwcEe+AaaUi17mMfcF2euU0L/cWYEDHTSrxjvY27bas3CgrcmdOM9vh4LwYgJl9xw==
X-Received: by 2002:a17:906:3190:b0:aa6:851d:af4d with SMTP id a640c23a62f3a-aa6b115b2bcmr234589666b.21.1733933509980;
        Wed, 11 Dec 2024 08:11:49 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa673474d96sm601893666b.96.2024.12.11.08.11.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 08:11:49 -0800 (PST)
Message-ID: <e30dec47-724d-48fb-8ffa-1e73a7f53f64@redhat.com>
Date: Wed, 11 Dec 2024 17:11:49 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] power: supply: core: Add new "charge_types"
 property
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 platform-driver-x86@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>,
 linux-pm@vger.kernel.org
References: <20241209204051.8786-1-hdegoede@redhat.com>
 <20241209204051.8786-3-hdegoede@redhat.com>
 <9aa6ad55-d0c3-4cdc-82a9-0c3906f77f30@t-8ch.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <9aa6ad55-d0c3-4cdc-82a9-0c3906f77f30@t-8ch.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Thomas,

Thank you for the reviews!

On 10-Dec-24 5:50 PM, Thomas Weißschuh wrote:
> On 2024-12-09 21:40:49+0100, Hans de Goede wrote:
>> Add a new "charge_types" property, this is identical to "charge_type" but
>> reading returns a list of supported charge-types with the currently active
>> type surrounded by square brackets, e.g.:
>>
>> Fast [Standard] "Long_Life"
>>
>> This has the advantage over the existing "charge_type" property that this
>> allows userspace to find out which charge-types are supported for writable
>> charge_type properties.
>>
>> Drivers which already support "charge_type" can easily add support for
>> this by setting power_supply_desc.charge_types to a bitmask representing
>> valid charge_type values. The existing "charge_type" get_property() and
>> set_property() code paths can be re-used for "charge_types".
> 
> IMO it would be nice to have the psy core implement "charge_type" in
> terms of "charge_types" if that is available.
> (And reject a custom "charge_type" in that case)

I'm afraid that adding support to the core for that is going to be
tricky / ugly. While as supporting both in the same driver is trivial.

Also this raises the question if we even want new drivers to have
charge_type at all ? For old drivers we want to keep it to not break
userspace ABI. But for new drivers arguably only having
the new charge_types attribute is better ?


>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v2:
>> - Add "Check charge_types to get the values supported by the battery."
>>   to Documentation/ABI/testing/sysfs-class-power
>> - Add a note about labels with spaces having these replaced by '_'
>>   to Documentation/ABI/testing/sysfs-class-power
>> - Use power_supply_match_string() in power_supply_charge_types_parse()
>> ---
>>  Documentation/ABI/testing/sysfs-class-power | 20 ++++++++++++
>>  drivers/power/supply/power_supply_sysfs.c   | 34 +++++++++++++++++++++
>>  include/linux/power_supply.h                | 23 +++++++++++++-
>>  3 files changed, 76 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-power b/Documentation/ABI/testing/sysfs-class-power
>> index 45180b62d426..4421815cfb40 100644
>> --- a/Documentation/ABI/testing/sysfs-class-power
>> +++ b/Documentation/ABI/testing/sysfs-class-power
>> @@ -407,10 +407,30 @@ Description:
>>  
>>  		Access: Read, Write
>>  
>> +		Reading this returns the current active value, e.g. 'Standard'.
>> +		Check charge_types to get the values supported by the battery.
>> +
>>  		Valid values:
>>  			      "Unknown", "N/A", "Trickle", "Fast", "Standard",
>>  			      "Adaptive", "Custom", "Long Life", "Bypass"
>>  
>> +What:		/sys/class/power_supply/<supply_name>/charge_types
>> +Date:		November 2024
>> +Contact:	linux-pm@vger.kernel.org
>> +Description:
>> +		Identical to charge_type but reading returns a list of supported
>> +		charge-types with the currently active type surrounded by square
>> +		brackets, e.g.: "Fast [Standard] Long_Life".
>> +
>> +		power_supply class devices may support both charge_type and
>> +		charge_types for backward compatibility. In this case both will
>> +		always have the same active value and the active value can be
>> +		changed by writing either property.
>> +
>> +		Note charge-types which contain a space such as "Long Life" will
>> +		have the space replaced by a '_' resulting in e.g. "Long_Life".
>> +		When writing charge-types both variants are accepted.
>> +
>>  What:		/sys/class/power_supply/<supply_name>/charge_term_current
>>  Date:		July 2014
>>  Contact:	linux-pm@vger.kernel.org
>> diff --git a/drivers/power/supply/power_supply_sysfs.c b/drivers/power/supply/power_supply_sysfs.c
>> index 034e1848f1ca..48a9bf791a38 100644
>> --- a/drivers/power/supply/power_supply_sysfs.c
>> +++ b/drivers/power/supply/power_supply_sysfs.c
>> @@ -182,6 +182,8 @@ static struct power_supply_attr power_supply_attrs[] __ro_after_init = {
>>  	POWER_SUPPLY_ATTR(CHARGE_CONTROL_START_THRESHOLD),
>>  	POWER_SUPPLY_ATTR(CHARGE_CONTROL_END_THRESHOLD),
>>  	POWER_SUPPLY_ENUM_ATTR(CHARGE_BEHAVIOUR),
>> +	/* Same enum value texts as "charge_type" without the 's' at the end */
>> +	_POWER_SUPPLY_ENUM_ATTR(CHARGE_TYPES, POWER_SUPPLY_CHARGE_TYPE_TEXT),
>>  	POWER_SUPPLY_ATTR(INPUT_CURRENT_LIMIT),
>>  	POWER_SUPPLY_ATTR(INPUT_VOLTAGE_LIMIT),
>>  	POWER_SUPPLY_ATTR(INPUT_POWER_LIMIT),
>> @@ -335,6 +337,10 @@ static ssize_t power_supply_show_property(struct device *dev,
>>  		ret = power_supply_charge_behaviour_show(dev, psy->desc->charge_behaviours,
>>  							 value.intval, buf);
>>  		break;
>> +	case POWER_SUPPLY_PROP_CHARGE_TYPES:
> 
> This should only show a single value for uevent. The same as
> charge_behaviours above (done in a recent change).

Ack, I'll look at what you have done for charge_behaviors and replicate
that for v4 of the series.

<snip>

>> diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
>> index b98106e1a90f..60c7f669ec3e 100644
>> --- a/include/linux/power_supply.h
>> +++ b/include/linux/power_supply.h
>> @@ -40,7 +40,7 @@ enum {
>>  };
>>  
>>  /* What algorithm is the charger using? */
>> -enum {
>> +enum power_supply_charge_type {
>>  	POWER_SUPPLY_CHARGE_TYPE_UNKNOWN = 0,
>>  	POWER_SUPPLY_CHARGE_TYPE_NONE,
>>  	POWER_SUPPLY_CHARGE_TYPE_TRICKLE,	/* slow speed */
>> @@ -135,6 +135,7 @@ enum power_supply_property {
>>  	POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD, /* in percents! */
>>  	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD, /* in percents! */
>>  	POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
>> +	POWER_SUPPLY_PROP_CHARGE_TYPES,
> 
> Could the related enum values be kept together?

I but this after POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR since it
is somewhat related to it, also see your uevent remark.

But since the enum values are kernel internal only this
can easily be changed. I assume you want this to be
directly after POWER_SUPPLY_PROP_CHARGE_TYPE instead ?

Regards,

Hans

