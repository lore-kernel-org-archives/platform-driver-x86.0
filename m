Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10388368D74;
	Tue, 12 May 2026 09:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778578834; cv=none; b=T4/2Zd1sT+eJxzfFFfwcHQGWIQTFj92yg5y2oNw5aPg4LlCIPQV7W2DXZH1dO5vxDr3tQLgv69+e3XDgEIrwCrpeHYcQ3s1oWe9W1NNe+BM1Mo0vfEHs33ALbg8OgLMl1I/+wHbTqsZwBDc0CMTur2rvVg4EpaKdLDobimtWJXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778578834; c=relaxed/simple;
	bh=/lkoO8SHD9ixWSSMz97oDhpWnxZD/GCNy8hTmchYu6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hq56FlDkFsHrjK52o/lS/ywaHox0jMrNBDUjpTdHAUzmHu4fv+ItWf9CvgP46z/sLtYwhOrhwmVK3EY7nvjhgDmwubGFvh/xjFM7Z2Q+gmjAiVdDdzOObrLAzrnbDl7iOBXKIOl7NtFPmlHyWnyyLM65JxZhFo1JdeA56Ax/dkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aFSXe3/W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aFSXe3/W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC274C2BCB0;
	Tue, 12 May 2026 09:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778578833;
	bh=/lkoO8SHD9ixWSSMz97oDhpWnxZD/GCNy8hTmchYu6Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aFSXe3/WivoUuTcbIQ0baMw2k+xc7sqR09PTirpIZaRZfNdAaeie+BYLdsFPJ2AH3
	 H9f65cbQgImvQ7W+aI96EgTklSJhgheiMrGlA7T2Bnb+Yc/cv9c/0TerKyipBP6eNQ
	 FpiSpxEMmr/niDWVkXyM76MM2jcQt37Mrx33KwkkYlKX0VeYA4HLhNEuCHNF6d9R5p
	 V50S7sjo4BuDDt70buPz+iQiBgfXgLHOqqMTPa8n2RBhRleUA51WBL8vor6s0bZev7
	 hZJAwq+AYtn8o8LXf51+4L6R3qm/JSN3LNdeoZfPmmaC73Z2Sp+JgOzBa2mfj5dfX7
	 hrZS74IHPs+Ug==
Message-ID: <347eb06b-d6c6-4c68-b905-6d6b6dda8c37@kernel.org>
Date: Tue, 12 May 2026 11:40:30 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/16] platform/x86: lenovo-wmi-other: Add WMI battery
 charge limiting
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Rong Zhang <i@rong.moe>,
 Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260411162334.25682-1-derekjohn.clark@gmail.com>
 <20260411162334.25682-15-derekjohn.clark@gmail.com>
 <09d21c9cee8af49fa1d5b568358db0c347668ee9.camel@collabora.com>
 <5389eb37-61db-4c9a-b8cc-7d605ac7a4f4@kernel.org>
 <41D66996-DE34-4162-B91D-66CE326EF927@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <41D66996-DE34-4162-B91D-66CE326EF927@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Derek,

On 11-May-26 21:48, Derek J. Clark wrote:
> On May 11, 2026 11:48:44 AM PDT, Hans de Goede <hansg@kernel.org> wrote:
>> Hi Nicolas,
>>
>> On 24-Apr-26 14:50, Nícolas F. R. A. Prado wrote:
>>> On Sat, 2026-04-11 at 16:23 +0000, Derek J. Clark wrote:
>>>> Add charge-type power supply extension for devices that support WMI
>>>> based
>>>> charge enable/disable.
>>>>
>>>> Lenovo Legion devices that implement WMI function and capdata ID
>>>> 0x03010001 in their BIOS are able to enable or disable charging at
>>>> 80%
>>>> through the lenovo-wmi-other interface. Add a charge_type power
>>>> supply
>>>> extension to expose this capability to the sysfs.
>>>
>>> Hi,
>>>
>>> this is not the right uAPI to expose this capability.
>>>
>>> If you check the ABI description for
>>> /sys/class/power_supply/<supply_name>/charge_type [1], it mentions
>>> "rate" and if you check the corresponding enum definition [2] it
>>> mentions "speed", so the charge_type uAPI is very clearly meant to
>>> expose the the charge rate/speed/current currently configured, with
>>> Long Life specifically meaning a reduced charge rate, rather than
>>> reduced charge capacity.
>>
>> As discussed here:
>>
>> https://lore.kernel.org/linux-pm/49993a42-aa91-46bf-acef-4a089db4c2db@redhat.com/
>> https://lore.kernel.org/platform-driver-x86/20241209204051.8786-1-hdegoede@redhat.com/
>>
>> and also here:
>>
>> https://vdwaa.nl/charge-types-api-upower.html
>>
>> The use of charge_type[s] for this is intentional and is exactly
>> the right uAPI to use in this case (especially see the first link).
>>
>>> The uAPI you're looking for here is
>>> /sys/class/power_supply/<supply_name>/charge_control_end_threshold [3],
>>> which very explicitly exposes the charge threshold in percentage. You
>>> can then accept only 100 or 80 as valid values and configure your
>>> hardware accordingly. Unfortunately there's currently no way for
>>> userspace to know that these are the only valid values (which is
>>> something that I want to look into implementing soon), it can only read
>>> back to see if what it wrote was accepted, but it's still the best uAPI
>>> for this.
>>
>> charge_control_end_threshold only makes sense when the firmware API
>> actually allows controlling the % of charge at which point the charger
>> will stop charging the battery.
>>
>> In many cases there only is an option to prolong battery longevity
>> aka "long life" by not charging to 100% but the exact % of charge
>> at which to stop charging is not configurable. This is exactly
>> the case for which we've decided to use a charge_type of "long life"
>> and upower has also implemented support for this.
>>
> 
> Hi Hans,
> 
> This is good information. Since there was understandable confusion from the way the documentation reads, I think taking another look at it to clarify this would help avoid churn back and forth in the future. Specifically, for charge_types:
> 
>> Long Life: The charger reduces its charging rate in order to prolong the battery health.
> 
> Should probably read something more like:
> 
>> Long Life: The charger firmware reduces its charging rate and/or maximum charging percentage to a hardware specified fixed limit in order to prolong the battery health.

Sounds good to me, please submit a patch updating the doc to this,
if you Cc me I'll review the patch.

> And for charge_control_end_threshold:
> 
>> Represents a battery percentage level, above which charging will stop. Not all hardware is capable of setting this to an arbitrary percentage. Drivers will round written values to the nearest supported value. Reading back the value will show the actual threshold set by the driver.
> 
> Should probably read more like:
> 
>> Represents a battery percentage level, above which charging will stop. Not all hardware is capable of setting this to any arbitrary value, instead providing different minimum, maximum, or step values. Drivers will round written values to the nearest supported value. Reading back the value will show the actual threshold set by the driver. For hardware that only supports a single fixed value, use charge_types instead.

Maybe change the last sentence to:

'For hardware that only supports a single fixed value, use charge_types
with a value of "Long Life" (vs "Standard") instead'

?

Please submit a patch updating the doc to this, if you Cc me I'll
review the patch.

Regards,

Hans


