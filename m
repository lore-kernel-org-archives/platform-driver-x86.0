Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56DE1A9FAC
	for <platform-driver-x86@vger.kernel.org>; Sat, 15 Nov 2025 13:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763213928; cv=none; b=DVdb5zI7vIqyz7IcneSVofCSDAZDzon9OEYbYxdtM9GsZzZiYYMPaIm+ePuGgqbYmCnNrZ6CX+w5B467uBeMUNgTrgn/kkV/i6mBpMpuggK3pac1yGilgwc6EAAOJJ3ZKO14BNn+PPo1DYBDSHM9e2SLM6yOo/YcT3H3vfkGWVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763213928; c=relaxed/simple;
	bh=ZldMSlgiPm8vtu40dFp32AvnIyf6pz36kVKLXvdJwWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O1eMmzN+YqdlCbZCsXZ9htOpZG6T+nF85cqH+8l1lnuT2wtvEjWMnmtCxoZz24ouMVFcBfHzBZMUEQnPhLVG+6Hx/bNdzc2xLa+luRJ517Hz0RHddbhrWUIYYDYwL9e0pTdbIWBVb1uyDP4OEqfOAdYZNX4VGf6rM+eElLBhGJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CajzUsSr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CajzUsSr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so20635115e9.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Nov 2025 05:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763213925; x=1763818725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZldMSlgiPm8vtu40dFp32AvnIyf6pz36kVKLXvdJwWg=;
        b=CajzUsSr63CLsKgvVaDXIIRKBMxF2HIy3f/klftxHrzW9A8Lb6NTkC2FtF4vNoreRz
         +XJvkbGTDdZzMeiJfJBRoyRjkSP5I/hh0mUcupRe34NFQaGUngvdOVrZuRXdrC2gVmpI
         SdLzGfyMJOsbDRIL5o9EhbehwO8iQvDQXi37Bn1qWgYOyMwvSiWzBw9gHuiIk2ND6fxX
         H+UbwBZ+k9CCtqvm1uKrP98rNRAQUtozuFVdmA2rLy/ZHuspWf5iX2K4epR5OJGQWcgf
         +jdYrxW5ZftnHKU71FC0wCciqFnIe81WE4Sy5apyiwVL50KWHP6ksFHijZMfHnPEWDM3
         SFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763213925; x=1763818725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZldMSlgiPm8vtu40dFp32AvnIyf6pz36kVKLXvdJwWg=;
        b=VKn6V5F33lGAn3S9G7MMItSRAo7fX98z2T+c/IO2uLqYXw2WHUUCVyp71S6mlWLDcG
         0ixu3RPmLYy4VaiYpIvB4Ww61ahTY7G2VsVCcuusc4pdlIisOAPf0t+ZWKtGp7TEb3ss
         Xy7kt6SQoNWazZZWLefcvXJxOnCeiuXKRpqiqXKOAw0K6hExQf0WcGkRhClU7hDn9yUq
         Lg1eSl2KwAtEIHdrNmZJyr/ULKCRMv/eT8IPKyxT+iv+4aeeaPcXqOVRZHd4HZFoeD1m
         +rkua+TOaqc+XLmwriTfZGdeKz3dnG0tHTOUWXBTklRckyHX5Ilnvb7T1T/3SKoS7898
         lheA==
X-Gm-Message-State: AOJu0Yy6zoAuTnlplC9XrzG4cMyeerhL8OecaCqQdxyTYDM9o0wOHEB0
	7tB3imerzQdm4Pw5c8GikjPz6eqlMrAnCz+NDbog1698Q76+m4BAvWpJ
X-Gm-Gg: ASbGncsny11yWZcGVt7btgdkmGkiGCKvGsyP/2QHmWj533m+4/vO+UNjUf5YgAECjSU
	DWjIujeQifclHGv8gQhwbazRaxvECBoCS1Em12yUYlRTc9FwXTtzD+MCwH8B/NOMeZ08I9t2aVG
	6ye8rxXgfh6mszm1NEseHEB33r+qIuRL9cNVY9Fpz7snjvcNt2IYAbsTe2zBU9lvWBFQgdYMMwc
	1/v1l1SzxzGMCvvAXrOMa7szwYZZgG+8ZtWHm03vwkO6uPwPkdegt9w/t+7ZSPtly5ihicRauMv
	6smXaNbLVZDor+rD1ZhLW7F6+RinHoOVY43MakEDlb177xzB5SzNnthsNKZoNhPzCFWn3Q3l3fK
	UqPR8ES4f4Gr46/4BhYTtx+xxOZXgwo6vq0whwjMkCkm0g55c6wQ05l+rTeh4snxcnMggboF2GH
	Mbt/HexX+M2p2pOAlukveNP8U=
X-Google-Smtp-Source: AGHT+IF+YuQ06xcTk34X3KeldUzeOp2N+TBm0lOwncrzvruDLwtPhumfyNmtnxYevsknYrm57BqNvA==
X-Received: by 2002:a05:600c:4585:b0:477:54cd:202e with SMTP id 5b1f17b1804b1-4778fe59a0bmr63175225e9.2.1763213924697;
        Sat, 15 Nov 2025 05:38:44 -0800 (PST)
Received: from [192.168.1.121] ([176.206.83.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f176basm15722677f8f.34.2025.11.15.05.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Nov 2025 05:38:44 -0800 (PST)
Message-ID: <018ce202-420c-40c9-a089-b3509c7ee4bd@gmail.com>
Date: Sat, 15 Nov 2025 14:38:43 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-armoury: do not abort probe on
 unexpected CPU cores count
To: Mario Limonciello <mario.limonciello@amd.com>,
 Denis Benato <denis.benato@linux.dev>, linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Luke D . Jones" <luke@ljones.dev>, Alok Tiwari <alok.a.tiwari@oracle.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com
References: <20251114185337.578959-1-denis.benato@linux.dev>
 <8b999b96-f1bf-4231-b2f8-5c4a55e21d5f@amd.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <8b999b96-f1bf-4231-b2f8-5c4a55e21d5f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/14/25 21:35, Mario Limonciello wrote:
>
>
> On 11/14/2025 12:53 PM, Denis Benato wrote:
>> Until now the CPU cores count was only available for
>> Intel hardware, however a few weeks ago an AMD hardware
>> that provides aforementioned interface appeared on the
>> market and data read from the interface doesn't
>> follow the expected format and the driver fails to probe.
>
> As a general statement; I don't like this feature at all.  You've said yourself that it's bricked systems.  Now it's not working on a bunch of systems due to mismatched expectations.
>
> We already have core parking in Linux at runtime (you can trivially write 'offline' to any core and the kernel will put it in the right power state and stop using it).
>
> So if it was me I would say axe the feature all together, or make it experimental and opt-in via a module parameter.
>
> But nonetheless if you decide to keep it; code review for the patch is below. 
>
These past days I reflected much on this feature and these are the major factors
that contributed to the current position and future steps I think are appropriate:

- I didn't want to drop work already done since I promised to fulfill it

- I tried to satisfy all involved parties

- This interface is very unsafe

- This interface appears to exist to solve a windows problem that
doesn't exist in linux (disabling specific cores already work)

- How the code is written is not liked by a maintainer

- Reworking this interface is difficult for all the wrong reasons

- This interface requires a reboot unlike the linux-specific one

And since a few days, as discovered here:
https://gitlab.com/asus-linux/asusctl/-/issues/695

- This interface has already become problematic and it's just
a few days from its introduction.

Considering the fact that running today's code in future
laptops might very well increase the risk of rendering hardware
unusable (what if on some future CPUs the number of minimum
core becomes 8? What if new CPUs shows up with a third type of
core that must not be disabled and the interface does always
set it to zero?) I want to apply my own judgment here and say:
"let's drop this interface and ensure it's not used in its current state".

Please Luke forgive my decision, but for now I don't feel like
putting more work on it makes anyone happy and my time will be
better spent in other more important areas.

I will soon send a patch to exclude the core control interface:
please Ilpo, unless you can think of a good reason to keep it
(such as Intel CPUs having a different power drawn depending
on how cores are disabled) or you know a better way of removing it,
accept my upcoming patch to remove this interface from the kernel.

Sorry for the trouble,
Denis

>>
>> Avoid failing on invalid cores count and print out debug information.
>
> You seem to be printing it out all at err level not debug level.
>
>>
>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
>> ---
>>   drivers/platform/x86/asus-armoury.c | 34 ++++++++++++++++++++++++-----
>>   1 file changed, 29 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
>> index 9f67218ecd14..6355ec3e253f 100644
>> --- a/drivers/platform/x86/asus-armoury.c
>> +++ b/drivers/platform/x86/asus-armoury.c
>> @@ -818,10 +818,23 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
>>       cores_p->min_power_cores = CPU_POWR_CORE_COUNT_MIN;
>>       cores_p->min_perf_cores = CPU_PERF_CORE_COUNT_MIN;
>>   +    if (cores_p->min_perf_cores > cores_p->max_perf_cores) {
>> +        pr_err("Invalid CPU performance cores count detected: min: %u, max: %u, current: %u\n",
>> +               cores_p->min_perf_cores,
>> +               cores_p->max_perf_cores,
>> +               cores_p->cur_perf_cores
>> +        );
>
> Should this be debug level?
>
>> +        return ERR_PTR(-EINVAL);
>> +    }
>> +
>>       if ((cores_p->min_perf_cores > cores_p->max_perf_cores) ||
>>           (cores_p->min_power_cores > cores_p->max_power_cores)
>>       ) {
>> -        pr_err("Invalid CPU cores count detected: interface is not safe to be used.\n");
>> +        pr_err("Invalid CPU efficiency cores count detected: min: %u, max: %u, current: %u\n",
>> +               cores_p->min_power_cores,
>> +               cores_p->max_power_cores,
>> +               cores_p->cur_power_cores
>> +        );
>
> Should this be debug level?
>
>>           return ERR_PTR(-EINVAL);
>>       }
>>   @@ -841,6 +854,11 @@ static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *att
>>   {
>>       u32 cpu_core_value;
>>   +    if (asus_armoury.cpu_cores == NULL) {
>> +        pr_err("CPU core control interface was not initialized.\n");
>> +        return -ENODEV;
>> +    }
>> +
>
> I think you should control the visibility of the attribute instead. There is no point making an attribute that will always show an error.
>
>>       switch (core_value) {
>>       case CPU_CORE_DEFAULT:
>>       case CPU_CORE_MAX:
>> @@ -875,6 +893,11 @@ static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attri
>>       if (result)
>>           return result;
>>   +    if (asus_armoury.cpu_cores == NULL) {
>> +        pr_err("CPU core control interface was not initialized.\n");
>> +        return -ENODEV;
>> +    }
>> +
>>       scoped_guard(mutex, &asus_armoury.cpu_core_mutex) {
>>           if (!asus_armoury.cpu_cores_changeable) {
>>               pr_warn("CPU core count change not allowed until reboot\n");
>> @@ -1389,16 +1412,17 @@ static int __init asus_fw_init(void)
>>           return -ENODEV;
>>         asus_armoury.cpu_cores_changeable = false;
>> +    asus_armoury.cpu_cores = NULL;
>>       if (armoury_has_devstate(ASUS_WMI_DEVID_CORES_MAX)) {
>>           cpu_cores_ctrl = init_cpu_cores_ctrl();
>>           if (IS_ERR(cpu_cores_ctrl)) {
>>               err = PTR_ERR(cpu_cores_ctrl);
>>               pr_err("Could not initialise CPU core control: %d\n", err);
>
> AFAICT you don't need the err variable anymore for this function.
>
> This can just be:
>
> if (IS_ERR(cpu_cores_ctrl))
>     pr_err("Could not initialise CPU core control: %d\n", err);
> else {
> ...
> }
>
>> -            return err;
>> +        } else {
>> +            pr_debug("CPU cores control available.\n");
>> +            asus_armoury.cpu_cores = cpu_cores_ctrl;
>> +            asus_armoury.cpu_cores_changeable = true;
>>           }
>> -
>> -        asus_armoury.cpu_cores = cpu_cores_ctrl;
>> -        asus_armoury.cpu_cores_changeable = true;
>>       }
>>         init_rog_tunables();
>
