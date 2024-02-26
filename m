Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3C2136652
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 17:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708967164; cv=none; b=VhaMQK0r1JY0QyOAiSMrw78uFxYPwhFqYPCXjk1wWERuyDyXSna3uQCczRAAEpHN++p/ePlvwUjNPOGCgQemL15ooQdgCtwxD14PCgXOGV8ZMXabUkKGvsX04yYB9F2r57/Uv2B5GGg4lxQHY33wIDM2FWJdNto1OVInjLupo44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708967164; c=relaxed/simple;
	bh=6Vyoo0Bzehw8lcWs30lDQlzHhfwrhCkNK53hcGYdx4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fH6I93dqK+cnIflHFhMIScKhV++69Od9OxTzzMq1vvhTYN2Kv0cSEQhfGKta3Jk/FzknTFTo998IAdWxgd9thyxjRYkTmUwj8zRhkVYTBjdzEK5eUVy2bNx8+z4LIhSRStwibxB7ZehRTs6xH5ZoT9bdP9RTDWD8FAHAEqcx0MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IWepV8y8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IWepV8y8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708967161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dBgwoqBSOIGBvVMXZVHsZZp0o2jjdWKhIehyduutD1E=;
	b=IWepV8y8sqx0au+qHj8JUyUjgH61Mjp9YN1ClMqFEzdRjHjFO4Y5AkW6Ka7sB2rtdEqN6u
	BP9fAQgp3hlxoiqCEDZ1UAio+40YwSejyrhhSC7SznbM4I4mohq12gPM3yFXcYXefgBHUN
	lKWdmRU47gbDo4jFjpbyJJS+3ImJm7c=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-U3mOZOA8MQ-Ehm08KOx3kw-1; Mon, 26 Feb 2024 12:06:00 -0500
X-MC-Unique: U3mOZOA8MQ-Ehm08KOx3kw-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-42e81aa14a7so16066391cf.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 09:06:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708967159; x=1709571959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dBgwoqBSOIGBvVMXZVHsZZp0o2jjdWKhIehyduutD1E=;
        b=DtD7qBdyZ8aGkUzMyR4GZYvCieCLEWOY6syZVuoAnEri1bG8EBB3Hhn7vaw1nezJhW
         2O7jbdEscCDK1DTgGyT/UhDpQqM/WS1o8iTfDslR+Y8J0CYXhShvDmTd51fVts7drHwW
         n2reVqCG9+e97tduOzJbxj10PF83tiD4HG8vC8n4t/2Fii8RqsofyctuI+lpG0hOrit4
         /scA5vkPh1Ak29A6igrLVPrpzCuiuIZEXY5r6sbUmRrh02k+DmfkuDX038FkE6yCHO35
         mR4c+YFMqMPlnukQOSlLnWkN+342h4+bmW8XdWAtf0ldjXqS9EIBYaBM7y+zERhlNcXR
         +17g==
X-Forwarded-Encrypted: i=1; AJvYcCWO/IkS08QVYG7bmjM9ypNoIR/zZ8hE9NL6KBmVIm6Y1OqVZXMeQQBETin9yu/JVCJ9800YeqkWFUW/EGsERjm3Z8JRg6SSP5h0LZqmZFzZCvQbIw==
X-Gm-Message-State: AOJu0YyNO4/Yd9TZvuJITQVvL2l1YLAX21n7UvTjpSKAYLEnskcGgW9j
	Zf4sdlVwZkppPOsik7to0CKhkkiygFvEpX5Lt3jqldnI+C5D/7SaFoQItHG2+b6xa/edTaFStJ3
	oLPcQFEIYFvQgxB4Da7mY+3a9r1Cgdy2Lup5Qb9gr2ERpYeg8vPs/dqzA7D9R4CZUzgrxt3w=
X-Received: by 2002:ac8:5c81:0:b0:42e:6334:cc9a with SMTP id r1-20020ac85c81000000b0042e6334cc9amr10584296qta.20.1708967159455;
        Mon, 26 Feb 2024 09:05:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGouxFyrcIqSJ7v+0s8MpATsxAaXlMAoO3A9/eq2kbm9DVSpqPv+iAYJQQEc/dA3L8o1DGUvA==
X-Received: by 2002:ac8:5c81:0:b0:42e:6334:cc9a with SMTP id r1-20020ac85c81000000b0042e6334cc9amr10584252qta.20.1708967158965;
        Mon, 26 Feb 2024 09:05:58 -0800 (PST)
Received: from [10.0.0.33] (modemcable096.103-83-70.mc.videotron.ca. [70.83.103.96])
        by smtp.gmail.com with ESMTPSA id p1-20020ac84601000000b0042e625a110dsm2635894qtn.78.2024.02.26.09.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 09:05:58 -0800 (PST)
Message-ID: <6c25bbf6-db97-4d55-b7d6-b7b6dbb60a82@redhat.com>
Date: Mon, 26 Feb 2024 12:05:57 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/mellanox: mlxbf-pmc: Fix module loading
Content-Language: en-US, en-CA
To: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: shravankr@nvidia.com, davthompson@nvidia.com, ndalvi@redhat.com,
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
References: <cover.1708635408.git.luizcap@redhat.com>
 <170895404513.2243.14840310263795846559.b4-ty@linux.intel.com>
 <def1a153-3cfb-431d-a7d2-a13bb7d65f4f@redhat.com>
 <29863354-4efe-d199-a9d4-7daf83f6cde9@linux.intel.com>
 <1608d86a-24e8-403b-b199-ce23f8411cfd@redhat.com>
 <eea32e56-2ea3-4a11-b1b9-8dd46dac7d72@redhat.com>
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <eea32e56-2ea3-4a11-b1b9-8dd46dac7d72@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-02-26 11:57, Hans de Goede wrote:
> Hi Luiz,
> 
> On 2/26/24 17:10, Luiz Capitulino wrote:
>> On 2024-02-26 11:04, Ilpo Järvinen wrote:
>>> On Mon, 26 Feb 2024, Luiz Capitulino wrote:
>>>
>>>> On 2024-02-26 08:27, Ilpo Järvinen wrote:
>>>>> On Thu, 22 Feb 2024 15:57:28 -0500, Luiz Capitulino wrote:
>>>>>
>>>>>> The mlxbf-pmc driver fails to load when the firmware reports a new but not
>>>>>> yet implemented performance block. I can reproduce this today with a
>>>>>> Bluefield-3 card and UEFI version 4.6.0-18-g7d063bb-BId13035, since this
>>>>>> reports the new clock_measure performance block.
>>>>>>
>>>>>> This[1] patch from Shravan implements the clock_measure support and will
>>>>>> solve the issue. But this series avoids the situation by ignoring and
>>>>>> logging unsupported performance blocks.
>>>>>>
>>>>>> [...]
>>>>>
>>>>>
>>>>> Thank you for your contribution, it has been applied to my local
>>>>> review-ilpo branch. Note it will show up in the public
>>>>> platform-drivers-x86/review-ilpo branch only once I've pushed my
>>>>> local branch there, which might take a while.
>>>>
>>>> Thank you Ilpo and thanks Hans for the review.
>>>>
>>>> The only detail is that we probably want this merged for 6.8 since
>>>> the driver doesn't currently load with the configuration mentioned above.
>>>
>>> Oh, sorry, I missed the mention in the coverletter.
>>>
>>> So you'd want I drop these from review-ilpo branch as there they end
>>> up into for-next branch, and they should go through Hans instead who
>>> handles fixes branch for this cycle?
>>
>> If that's the path to get this series merged for this cycle then yes,
>> but let's see if Hans agrees (sorry that I didn't know this before
>> posting).
> 
> Hmm, new hw enablement typically goes through -next and not to
> the current fixes branch. And AFAICT this is new hw enablement,
> not a regression / bug-fix.
> 
> Is there any special reason why this needs to be in 6.8 ?

Since the new firmware feature is causing the driver not to load,
I'm seeing this more as a bug than new enablement. But it's fine
with me if you decide on not having them on 6.8.

> For RHEL kernels you can cherry-pick patches from -next
> as necessary.

I know :)

>> One additional detail is that this series is on top of linux-next, which
>> has two additional mlxbf-pmc changes:
>>
>> * https://lore.kernel.org/lkml/39be055af3506ce6f843d11e45d71620f2a96e26.1707808180.git.shravankr@nvidia.com/
>> * https://lore.kernel.org/lkml/d8548c70339a29258a906b2b518e5c48f669795c.1707808180.git.shravankr@nvidia.com/
> 
> Hmm, those are not small patches, any other reason
> why this really should go to -next IMHO.

OK.

- Luiz

