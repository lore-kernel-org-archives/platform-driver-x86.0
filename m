Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08263321AD
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Oct 2025 17:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760981841; cv=none; b=jgaw7ykwmZUQdDdAJFhnCbAVxsMh7UFd5VbcTfEjuhUj677usYMRLpb2NDKl3N/GlF+0c0bXnGzHHt1qvK6S1MlY44APzmUhF1fyQn9P2IJLYF+IFrIzRyIJ5KrGhhD6LT2zsquooDec2nerIz1sHmYmkeRIdG5qq7sURMgmTxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760981841; c=relaxed/simple;
	bh=xiFxZxrjbztbBFVUuyF2niNKPDTNlJAzjvqOfsT4U9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n1z3vUm5nWCXFMcjUQ4ws1P3Ju+FNeD4M9PRN3VefxBpWDymN/7sIc05SM6SVSlKFEQUOH6/l5MtypLGlLaBp5azalZORwbU0RWrui6B+gDXyzDSbMw8FhsxYTC8PFeOjpaawggJV3wR5ESrwwO3h9c8h5WVkbVT9GZNOs0AndI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8EIJQ+0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8EIJQ+0"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so43786515e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Oct 2025 10:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760981836; x=1761586636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dcpcsrCdfSvpWpcpgzrZFhVzw3KtDESeuobKE7i4+xc=;
        b=F8EIJQ+0mssuIrEw9gacIEFCtfoXuigcfgquL/4Aahz37uDxQZCeWuukuZJ4aJeFIN
         VfrIgYn8O471ZcO9xS0gd9LnGZR/OxFD/+m2fw3LwEheWkPBPHMIiiC1LjWMktPeupxy
         9RKnIiq/WyHeNtTR/j13KHpibpiBInsucFJH6Nidy7ewVJ8JXsf7IvnVGwyJJidhCPAS
         PPKAdGHqHE02ckz36sLJwcoX50vPVXyXPfxFFl7R7MjPlZaCEL92Azv+cq7DzfahA5fg
         KAJu8rJA3iDOGWtVkGEhuXYb9t//IsWrdgoj+x8ORA7YyMytdExOW7uLOiKwbtEn+Hp9
         stsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760981836; x=1761586636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dcpcsrCdfSvpWpcpgzrZFhVzw3KtDESeuobKE7i4+xc=;
        b=j1GIcYUNTDY83QPOi4fM+8//3B4NZWCMymK8uITAgMzxoRSwRYz6gwWbnTzcxC+R/i
         YYj6yIFfBgS9IdyjnGX79AMQtep434inOkjkHeNjTuAlrfnwxRgdu8upA09SUUJdYVgs
         CrNJQQV9HBcyOcS4jZWqlPI2czLi4Vn0yGcO+l8s6LtDjT2vhgtvUmfyc4YfdEh5p44Y
         p5bzWgGReqwzBP8RsHejiSziK9bCJmnJ8Mw/wrjcjMd9Kh2iBNW5MjcpRUiAmguYjLE5
         iO2D0D7d0N0xSI4mWD9g573Sc2y/7ORUBr7MxBgFPxQFquWxm8bmSEX+/5jMDOdrMx3O
         dAww==
X-Forwarded-Encrypted: i=1; AJvYcCWXckrLU5TBdiqDaJP/zR+2MXodCnlng1mSh8JTuGc1OtC1kEO7F2hOngPycmuJRPZkRAL7Oo4zqXc9s/koiMpBQbzM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8mqKWH6md7XCDCHkpQHsVSQWhBEZLvK3Fr1+FAK2Fr3Xr3uyQ
	nzMuQQ4NuhTRqwzzASHhVHJGIQRlEAoVJNsgHqrd96/cy9lviX14EACS
X-Gm-Gg: ASbGnctQQubhPk1R8VBM7Ifh6D+9bg9UVvXUCXwwnQXDXaICMYlFCVcJTxGWTz3pHgu
	L2NlnNXfDTeWVpuxerrRK631SJbHYoljBKYFPwRW5ZutNxeHXABSID1+IwunRbR0xPm+FZYwViR
	NzpBSFnVqVo5uztcn+cVjymc3uqeSH7sc4u0Cx5W3TI1nysM4hRAOKJ6S82hAjQmahNjFLJKwr/
	chUSjqtdf+cHaYwj8embYYwSsx16agF87INpettX1Te9E3gtKcFjFNBf7mXEuU40I8lPyqiona7
	FDTU5byngb4YX9FVj2Sv7TJeyUtpJMitCfRpjK/IWlwkI0TeZE6zJj8N81fo3lzdaDVpiMuDVFk
	LsrzMM6DdRbJCjhgDMhpKG0c4Tb/1C8w7Qw0ZmUhLjDYEJLz9zKWm/O8AtFGEjERpSzV0eDKawU
	QgMcJtyuPwIlJ78HCyligFyA==
X-Google-Smtp-Source: AGHT+IEoX3+FbaYVr4Kx68142gS69H3uRBy6NKKbwnZMNanEkEERqsBJuWPWxyN0B9AQvR2H/WeoEg==
X-Received: by 2002:a05:600c:190f:b0:470:feb2:e968 with SMTP id 5b1f17b1804b1-471178b125amr104544915e9.15.1760981835879;
        Mon, 20 Oct 2025 10:37:15 -0700 (PDT)
Received: from [192.168.1.121] ([151.49.75.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715257d8b2sm186908275e9.3.2025.10.20.10.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 10:37:15 -0700 (PDT)
Message-ID: <c5952867-c38d-49cf-922f-0bb03b956348@gmail.com>
Date: Mon, 20 Oct 2025 19:37:14 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 5/9] platform/x86: asus-armoury: add core count
 control
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mario Limonciello <superm1@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>, "Luke D . Jones" <luke@ljones.dev>,
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Alok Tiwari <alok.a.tiwari@oracle.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com
References: <20251015014736.1402045-1-benato.denis96@gmail.com>
 <20251015014736.1402045-6-benato.denis96@gmail.com>
 <25bd0c90-2de0-ef66-c18d-661180b71fd4@linux.intel.com>
 <13b9890e-d1b7-446a-9e93-2034c60a0a88@gmail.com>
 <f3a69b7e-a698-2dd5-731a-f7db0eabd8f3@linux.intel.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <f3a69b7e-a698-2dd5-731a-f7db0eabd8f3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/20/25 19:15, Ilpo Järvinen wrote:
> On Sat, 18 Oct 2025, Denis Benato wrote:
>> On 10/17/25 14:48, Ilpo Järvinen wrote:
>>> On Wed, 15 Oct 2025, Denis Benato wrote:
>>>
>>>> From: "Luke D. Jones" <luke@ljones.dev>
>>>>
>>>> Implement Intel core enablement under the asus-armoury module using the
>>>> fw_attributes class.
>>>>
>>>> This allows users to enable or disable preformance or efficiency cores
>>>> depending on their requirements. After change a reboot is required.
>>>>
>>>> Signed-off-by: Denis Benato <benato.denis96@gmail.com>
>>>> Signed-off-by: Luke D. Jones <luke@ljones.dev>
>>>> ---
>>>>  drivers/platform/x86/asus-armoury.c        | 258 ++++++++++++++++++++-
>>>>  drivers/platform/x86/asus-armoury.h        |  28 +++
>>>>  include/linux/platform_data/x86/asus-wmi.h |   5 +
>>>>  3 files changed, 290 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
>>>> index 3b49a27e397d..3d963025d84e 100644
>>>> --- a/drivers/platform/x86/asus-armoury.c
>>>> +++ b/drivers/platform/x86/asus-armoury.c
>>>> +static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf,
>>>> +				enum cpu_core_type core_type, enum cpu_core_value core_value)
>>>> +{
>>>> +	u32 cores;
>>>> +
>>>> +	switch (core_value) {
>>>> +	case CPU_CORE_DEFAULT:
>>>> +	case CPU_CORE_MAX:
>>>> +		if (core_type == CPU_CORE_PERF)
>>>> +			return sysfs_emit(buf, "%u\n",
>>>> +					  asus_armoury.cpu_cores->max_perf_cores);
>>>> +		else
>>>> +			return sysfs_emit(buf, "%u\n",
>>>> +					  asus_armoury.cpu_cores->max_power_cores);
>>>> +	case CPU_CORE_MIN:
>>>> +		if (core_type == CPU_CORE_PERF)
>>>> +			return sysfs_emit(buf, "%u\n",
>>>> +					  asus_armoury.cpu_cores->min_perf_cores);
>>>> +		else
>>>> +			return sysfs_emit(buf, "%u\n",
>>>> +					  asus_armoury.cpu_cores->min_power_cores);
>>>> +	default:
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	if (core_type == CPU_CORE_PERF)
>>>> +		cores = asus_armoury.cpu_cores->cur_perf_cores;
>>>> +	else
>>>> +		cores = asus_armoury.cpu_cores->cur_power_cores;
>>> Why isn't this inside the switch?? The logic in this function looks very 
>>> mixed up.
>>>
>>> If I'd be you, I'd consider converting the asus_armoury.cpu_cores to a 
>>> multi-dimensional array. It would make this just bounds checks and one 
>>> line to get the data.
>> Please note that this interface has the potential to brick in an irreversible
>> way laptops and it has happened.
> This function only prints values held by kernel in its internal storage? 
> How can that brick something?
>
>> Of all the code CPU core handling it the most delicate code of all since
>> a wrong value here means permanent irreversible damage.
>>
>> I am more than happy making changes that can be easily verified,
>> but others more complex changes will put (at least) my own hardware
>> at risk.
> Understood.
>
>> If you think benefit outweighs risks I will try my best.
>>>> +	return sysfs_emit(buf, "%u\n", cores);
>>>> +}
>>>> +
>>>> +static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
>>>> +					 const char *buf, enum cpu_core_type core_type)
>>>> +{
>>>> +	u32 new_cores, perf_cores, power_cores, out_val, min, max;
>>>> +	int result, err;
>>>> +
>>>> +	result = kstrtou32(buf, 10, &new_cores);
>>>> +	if (result)
>>>> +		return result;
>>>> +
>>>> +	scoped_guard(mutex, &asus_armoury.cpu_core_mutex) {
>>>> +		if (core_type == CPU_CORE_PERF) {
>>>> +			perf_cores = new_cores;
>>>> +			power_cores = asus_armoury.cpu_cores->cur_power_cores;
>>>> +			min = asus_armoury.cpu_cores->min_perf_cores;
>>>> +			max = asus_armoury.cpu_cores->max_perf_cores;
>>>> +		} else {
>>>> +			perf_cores = asus_armoury.cpu_cores->cur_perf_cores;
>>>> +			power_cores = new_cores;
>>>> +			min = asus_armoury.cpu_cores->min_power_cores;
>>>> +			max = asus_armoury.cpu_cores->max_power_cores;
>>>> +		}
>>>> +
>>>> +		if (new_cores < min || new_cores > max)
>>>> +			return -EINVAL;
>>>> +
>>>> +		out_val = FIELD_PREP(ASUS_PERF_CORE_MASK, perf_cores) |
>>>> +			FIELD_PREP(ASUS_POWER_CORE_MASK, power_cores);
>>>> +
>>>> +		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_CORES, out_val, &result);
>>>> +		if (err) {
>>>> +			pr_warn("Failed to set CPU core count: %d\n", err);
>>>> +			return err;
>>>> +		}
>>>> +
>>>> +		if (result > 1) {
>>>> +			pr_warn("Failed to set CPU core count (result): 0x%x\n", result);
>>>> +			return -EIO;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	pr_info("CPU core count changed, reboot required\n");
>>> This interface has a problematic behavior. If user wants to adjust both 
>>> core counts one after another (without reboot in between), the new value 
>>> of the first core count will be overwritten on the second store.
>>>
>>> You might have to store also the value that will be used after the next 
>>> boot to solve it but how the divergence should be presented to user is 
>>> another question to which I don't have a good answer.
>> Given what I have written above I am thinking more along the lines of allowing
>> only one change at the time, giving absolute priority to the ability to demonstrate
>> not all P-cores can be disabled all at once, or after a reboot hardware will be
>> irreversibly lost. It cannot be recovered the same way as I did with APU mem.
>>
>> To summarize I am more inclined in allowing only small changes,
>> or to postpone this patch entirely while we think to a better, safer solution.
> Fair enough, please mention this as in the changelog as a justification 
> and to warn other messing with the code.
>
>>> This seems a more general problem, that is, how to represent values which 
>>> are only enacted after booting (current vs to-be-current) as it doesn't 
>>> fit to the current, min, max, possible_values, type model.
>>>
>> Enabling eGPU on a laptop with a dGPU that is active makes the PCI-e
>> spam PCI AER uncorrectable errors and renders both GPUs unusable.
>>
>> I have gone with storing the value at driver load time and treating it
>> as the boot value for 2/9 (eGPU), but I am very open to suggestions!
> I'm not entirely sure what you're trying to say here. My point is that 
> there's no way for user to know what value something will be changed to 
> (the "to-be-current" value) except through rebooting the system (when the 
> "to-be-current" value becomes the "current").
>
Users do know what the value will be changed to because that is what the
WMI interface will tell: the issue is in reverse (knowing what settings were
applied when booting the laptop): one has to infer those looking at
the current state of things.

For example it is only possible to know if the next boot will have
sound or not, not if a sound was emitted at the current boot.

I haven't seen examples of devstates not returning the future value,
but I do have seen my ally returning dGPU property presence when
there is no dGPU in it and it appears to be a no-op, so I had to remove
(or rather avoid adding) a safeguard against possible PCI bus conflicts
that I had planned.

Thanks,

Denis

