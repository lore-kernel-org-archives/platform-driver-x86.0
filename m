Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0624328623;
	Mon,  8 Dec 2025 09:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765186362; cv=none; b=CYberqgGrTDtMHn9tkBtK2FE1vK282VRr5VmdcxOaUKQCXdVYE8w1qnfu466GrixOBv7OqKlXREt2Rfd/nLhXsa0ks99/TRMnbY5FE/yJaT7YmaImi5AFtZSmwoDYqZbtSY9PJKEuvpOeJg+Lmh9Pvd2exOhA2a4dwdjXeB0o/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765186362; c=relaxed/simple;
	bh=hnNBiCIoaXEKtVpiB4W8ADIL0tKCzSaxB9gOqCygrb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nn3MA6A5M1qyILhAd8qJoU2CIiGptn1AS7b11HVxBS8iqqSGyieYKVUFScL9GlR2RBAy51s25iV4HBtggF9KSI8TkepOma9EUN3rRfBSxPT5H5KTRyo7UGzzOE7yByo5CabSxJ5FpiauyWxbggQFMRiIuE/vS2pkt6039AEfR2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKEva37q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKEva37q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F1AC4CEF1;
	Mon,  8 Dec 2025 09:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765186361;
	bh=hnNBiCIoaXEKtVpiB4W8ADIL0tKCzSaxB9gOqCygrb0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JKEva37qThmK0344zK/cH/HsZokVIADV7KRQnUWKt8WkWZT0vF/dcp74ERQc9PSkp
	 aFrsUADIXpAZ7MKibSuTcvZdDA3SyQ5CuPSLgkWWsAxABdljs1+IntLyA8veQ1hpxE
	 r5vYKRktrWKvDKuQ/eo7SOVg84QV9thdcVr7qhEiok9taARJQfCRdABHSbvu3ZJWP3
	 8OHdWj5u6jejP/c7kUWUO3jZdqSmWifL9Y6TW/ls4cA2rrRiDEjAh3iIRrY/s3d7BB
	 TT508cI6qb7MOTsck8d/qBMGb6T5n4aa4+sMjr0s9ZDSEqOSpYpmYNrVt5YsnJGzKa
	 euhjovk7+EtXA==
Message-ID: <9b0c402f-0cc7-43ae-899c-2e98ffa96721@kernel.org>
Date: Mon, 8 Dec 2025 10:32:38 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add support to detect
 hardware damage detection capability.
To: Nitin <nitjoshi@gmail.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org,
 Nitin Joshi1 <njoshi1@lenovo.com>
References: <20251203034032.6018-1-nitjoshi@gmail.com>
 <c8e4a0d2-0641-4e4b-b62a-9c92ec43b3cf@kernel.org>
 <5f295577-ab67-4164-a718-f6fbc8911e67@gmail.com>
 <e259642d-e9f3-4d17-a9a5-68eb2fb34948@app.fastmail.com>
 <3b785a80-73e6-4def-ae4b-39ccb30dd1b7@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <3b785a80-73e6-4def-ae4b-39ccb30dd1b7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8-Dec-25 8:19 AM, Nitin wrote:
> 
> On 12/3/25 22:16, Mark Pearson wrote:
>> On Wed, Dec 3, 2025, at 5:18 AM, Nitin wrote:
>>> Hi Hans,
>>>
>>> Thank you for reviewing this patch.
>>>
>>> On 12/3/25 16:52, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> Interesting new feature. A few small remarks on the proposed
>>>> sysfs API below.
>>>>
>>>> On 3-Dec-25 4:40 AM, Nitin Joshi wrote:
>>>>> Thinkpads are adding the ability to detect and report hardware damage
>>>>> status. Add new sysfs interface to identify the impacted component
>>>>> with status.
>>>>> Initial support is available for the USB-C replaceable connector.
>>>>>
>>>>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>>>> Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
>>>>> ---
>>>>>    .../admin-guide/laptops/thinkpad-acpi.rst     |  26 +++
>>>>>    drivers/platform/x86/lenovo/thinkpad_acpi.c   | 179 ++++++++++++++++++
>>>>>    2 files changed, 205 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>>>> index 4ab0fef7d440..4a3220529489 100644
>>>>> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>>>> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>>>> @@ -54,6 +54,7 @@ detailed description):
>>>>>        - Setting keyboard language
>>>>>        - WWAN Antenna type
>>>>>        - Auxmac
>>>>> +    - Hardware damage detection capability
>>>>>       A compatibility table by model and feature is maintained on the web
>>>>>    site, http://ibm-acpi.sf.net/. I appreciate any success or failure
>>>>> @@ -1576,6 +1577,31 @@ percentage level, above which charging will stop.
>>>>>    The exact semantics of the attributes may be found in
>>>>>    Documentation/ABI/testing/sysfs-class-power.
>>>>>    +Hardware damage detection capability
>>>>> +-----------------
>>>>> +
>>>>> +sysfs attributes: hwdd_status
>>>>> +
>>>>> +Thinkpads are adding the ability to detect and report hardware damage.
>>>>> +Add new sysfs interface to identify the impacted component.
>>>>> +Initial support is available for the USB-C replaceable connector.
>>>>> +
>>>>> +The available commands are::
>>>>> +
>>>>> +        cat /sys/devices/platform/thinkpad_acpi/hwdd_status
>>>>> +
>>>>> +This value displays device type and location of device with damage status.
>>>>> +For example:
>>>>> +if no damage is detected:
>>>>> +  No damage detected
>>>>> +if damage detected:
>>>>> +  Damage detected:
>>>>> +  Device: TYPE-C
>>>>> +  Location: Base, Right side, Center port
>>>>> +
>>>>> +The property is read-only. If feature is not supported then sysfs
>>>>> +class is not created.
>>>> Nitpick: s/class/attribute/ classes are standardized sysfs
>>>> interfaces living under /sys/class/ which this is not.
>>> Ack, I will modify it.
>>>> Besides the nitpick I'm wondering if we do not want to make
>>>> this a little bit more friendly / easy for software to parse ?
>>>>
>>>> ATM this seems focused on a human directly reading
>>>> the output but what if we want some sort of automation,
>>>> like e.g. a Linux version of the Lenovo Vantage sw parsing
>>>> this in the future?
>>>>
>>>> Note I've no specific suggestions for how to make this
>>>> easier to parse, this is just an observation.
>>> Thank you for pointing this out.  I am open for suggestions and will
>>> re-check regarding its use case in lenovo vantage in future.
>>>
>> I'd not considered it from this perspective.
>>
>> One concern is that it could be multiple devices in multiple location - so breaking it up into too many pieces becomes difficult.
>>
>> What if we did:
>>    hwdd_status - 1 or 0 if damage detected
>>    hwdd_detail - list of damaged items with their location (could be multiple). e.g.
>>      TYPE-C: Base, Right side, Center port

So I assume this would then output one line per damaged "item", it would
be good to document this (1 line per damaged item) in the sysfs ABI docs.

>> If hwdd_status is 0 then hwdd_detail would display "No damage detected"
> 
> Thank you, Mark ! I am OK with this suggestion.
> 
> Hans / Ilpo - Any comment on this ? Thanks

Yes this sounds good to me. 

Regards,

Hans


