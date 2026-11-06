Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976793;
	b=HiF789ISz53z1qfH2jV1Q1pJR9RCEobVWpMvjnKcmYL3OUqbQxeEOTH95OuWvlWBfSqU
	 07OzNAua2iFg3Lj5a37L75XD9xji6a8FJTdUBxvvIhnCTmxt1zGovfcy4A2aTjBnF6sYF
	 edC0eJT8RNjGYiB/7N5YmH+y/zMR6DARfBWCqn2891IeVmlqJOlBgByU7DNH0jzU2x98T
	 V/Bfqe//J4kP1T8yu99IqyibDlXyv5ig3xknnaXExpTQcuJ+aS/UlvTQApLRRbmlyF/ke
	 uxKuvv1XDpQkiyTcPY9q5Nx6H9tqtd9CJWOpuzmW3R1tuMIPf+64d2OAFWHPxMzxEkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=mLqvI3dn6N8lQXTvWjkdTFlUcu1cTBREUoz3ikSQ55E=;
	b=pAKQ5gU8HarqcVsvSl9/2SDWbwwYyCyPHGizPy9uoHmNkl0i3zikXSAUwT/krR7xXXKA
	 nmVcFdIq3Yhkoucf9udy6EueVhBmksglzpTOyxlTDwICbXYpgHF9poKyI/6os9egLKY18
	 SQq7vEyTUhyqDSqrzNM/pkXojaA9Y/gfj82KANcyQsmlOltdC5htb3QvHWkGy63P1Fg60
	 3sCCA490TqWfaZ4DAy7PjVHddlfKDG0xxFt2l7rchVKYA1FvwFkIeYFeYcu3RuCKgh37e
	 a3F5FIiHZ1OWLNrz1G7f9vFNopdt3R4iFghL6c35XJ1QvN37rwavupDvZQxC0KNMNXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZYuwwQtK;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74B7606A326
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 14:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E74B7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZYuwwQtK
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so602588a91.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Nov 2026 06:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793976792; x=1794581592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLqvI3dn6N8lQXTvWjkdTFlUcu1cTBREUoz3ikSQ55E=;
        b=ZYuwwQtKeAwKiv/7pKIBwJPKYou5k0RS/bHke3DDCwwXrLUYiIvHNDqmMTUs2kBhcd
         qBrzPktgFM0ICgHYahucC+2ocGpBVuZUAWVyEfuGrDNKOjEjX9po3YfHOGnOzBe8noqm
         2CH8RcstjMm6DZ2qVT8gC+aYETRXVNEksNg4mWbjlOQD1yOyIz20mETEIQ8Gqiy9n04/
         olqpl0kjYLr4ef5XjpyWOTzDchtrpMPzqxhl43NcV4agrf+UHXcThj+exi7UUIGHG5F7
         JgDb3edRzu0U710DFVOs1AMyaG3qcpe9VQVexEMZM2r4yD2epCjvJVOFrj7qFzIrJumc
         3TRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793976792; x=1794581592;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLqvI3dn6N8lQXTvWjkdTFlUcu1cTBREUoz3ikSQ55E=;
        b=v19d5vW6m+8ODGtnaUGuP1vCiG9UWYWDJ6nm/N9KRMIJN5tn9baksnRtFy6FQ/e04m
         4Nlpx6sQBbP0hZyhj1jCtJJ5GIRTAMMAMRG7LTCHHXlqQUKNGbhscqhy5aVQ9E9ktBHk
         6kE8pe0juKeMsbsOD4t+3nxZ1TYHTyqG+TlMTCEqS/J3B/mzjV5g5HgTGd6jgF463l/+
         aGy7w6ZZreqMX+klbHqEbQJ0OirXFavYA1rpSwtasB3RqM3WZGkMHckln+cFR7NETv6D
         Mw8aOWkrWUBDSn2NX7GGwi7Ns6ghruil9esSxI4C4lFt4FSMbkLEVpRtpNRvgATjJxwe
         mpng==
X-Gm-Message-State: APuU4Z8FAIqzsBYQ7i8bQHsDq2OnUGufqqSLHagKSbXNV4vyHl8qU1Wy
	k3NwAoceqgaxwbROg0+BU04Dvq1Qe/sEFfbj4uS5swRCNFAucKK3P5es
X-Gm-Gg: AYBFou0AkgejePYJ1t7wMyfLg4E/WgjZcX0fN5GylXL967IHFMjaCxJhNSpcr9+yjb0
	Uut17KNdCq7T2Fpc4WQnZDh1aggKkJQ2tsc8FcbUM1Hk1cjAyppSaJ2QLFPRZLXqHIMqxjxuEqr
	2r6bHOq5PnrM1Wrd0u7v150ZxM3HPMYDLjcYUKpwGSYsR1g0RTBPb8zez4KW3F59V0/u5/LlQrd
	10PZ2ee0u8B4mZD/BBvG/mIV8tnsTpsHgzDLakHF785/aDl4P3hCXsct2+BEqWFcPIrRO1xy3Ch
	9b4ghjWu6n0BEQ/cfznNgF+evnpfSRAmYmsucOOfxsbyGcokSzo55wcE195zboiNozCKjojqTY7
	qLCpVA9rgCoEoVOKAPictSiM5Wczt3ZLUZWhQX2ps8QFBhQyrpseQWOqsE7rP19uqrZlwNbbgsF
	0i6hdLfDAw4PmyS9JzIUYCHLu3kPdYrtPlQop2DBYzrLGbmOzOVF/b4lKEoQ/vaWCl7vWkLiEUR
	7Ggxid6w6MpBp+kWnkJ98qGcp/rhT2K+tB6Xjq7r4Y4Z5gGK43O8hoPSfPHa+h+OtXNDuR3ZSvZ
	cd3wTiYo6WGnxXDrWjSjJ1vQJ93O/TXxKw7xPM1RXTNOdDkyneIBz1nbtktlv7ubaG4=
X-Received: by 2002:a17:90b:4c4f:b0:3a4:f75d:d1a3 with SMTP id 98e67ed59e1d1-3b0db6cf7bdmr2813526a91.32.1793976791875;
        Fri, 06 Nov 2026 06:53:11 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:bfa8:849c:2010:a1c1? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32812a6sm8081043a91.11.2026.11.06.06.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 06:53:11 -0800 (PST)
Message-ID: <ecdecef6-b2da-4d3e-bb82-a22a15febaf6@gmail.com>
Date: Fri, 6 Nov 2026 22:53:08 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] platform/x86: bitland-mifs-wmi: performance profile fails
 on TIMI A30 (USB-C only)
To: okluar <okluar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CAFbNUuJGjo5OW1JZhO=uXqk07fmzE8yo2Qibe5PoOtHCmoQXpQ@mail.gmail.com>
 <ccc319f4-24aa-496b-8366-fcfdbd5dbce6@gmail.com>
 <CAFbNUuKTvJXoNqf-5K7VykOHtFFVdVHTc50aYswC0if4eGQN8w@mail.gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CAFbNUuKTvJXoNqf-5K7VykOHtFFVdVHTc50aYswC0if4eGQN8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/4/26 06:26, okluar wrote:
> Thanks for the patches and the quirk. I've built the kernel with your
> changes and tested it on my TIMI A30.
>
> Set performance now works. No more "Operation not supported" error. A
> quick check in Valheim shows the hardware reacts:
> - balanced: ~44W GPU, ~1360 MHz
> - performance: ~49W GPU, ~1440 MHz
> The fans also spin up noticeably, so the EC is definitely applying the command.
>
> But reading the profile from sysfs is still broken:
>   $ cat /sys/firmware/acpi/platform_profile
>   cat: /sys/firmware/acpi/platform_profile: No message of desired type
>
> And dmesg shows:
>   platform_profile: Failed to get profile for handler bitland-mifs-wmi
>   bitland-mifs-wmi ...: Failed to unmarshal event data: -61
>
> I suspect the GET response from the firmware for this model uses
> different values than the ones in my quirk table. So the read mapping
> might need to be different for TIMI A30.
>
> Just for context on power limits:
> - CPU-only load: both modes hit the same ~50W CPU hardware cap.
> - Combined CPU+GPU load (Satisfactory): the total budget caps at ~65W
> in both modes (~32W/32W split).
> - GPU-only load (Valheim): performance mode shifts the free budget to
> the GPU, raising its limit.
>
> Happy to test more patches or do ACPI tracing if needed.

Hi,

Don't top post (reply at the bottom please).

I think the .no_set profile entries are currently missing for your quirk 
(I missed them in the example quirk).

Here are some methods to get them:

- Reverse engineering the dsdt table (from your timi_a30_acpi.dat)

- Or just simply print the values in the kernel code (add a dev_dbg 
statement in laptop_profile_get function)

         dev_dbg(dev, "profile wmi_val=%d\n", result.data[0]);


After acknowledging the values, just add the profile entries into 
timi_a30_profile_entries. For example,

static const struct bitland_profile_entry timi_a30_profile_entries[] = {
	/* Change this information if it doesn't match your device. */
	{ PLATFORM_PROFILE_LOW_POWER,   2 },
	{ PLATFORM_PROFILE_LOW_POWER,   <val>, .no_set = true },
	{ PLATFORM_PROFILE_BALANCED,    1 },
	{ PLATFORM_PROFILE_BALANCED,    <val>, .no_set = true },
  	{ PLATFORM_PROFILE_PERFORMANCE, 0 },
	{ PLATFORM_PROFILE_PERFORMANCE, <val>, .no_set = true },
};

Fill <val> placeholder with the values you actual get.

>
> On Tue, Nov 3, 2026 at 5:51 PM Mingyou Chen <qby140326@gmail.com> wrote:
>> On 11/3/26 16:41, okluar wrote:
>>> Hello,
>>>
>>> I am reporting an issue with the platform_profile interface on a
>>> USB-C-only machine.
>>>
>>> Hardware:
>>> - Model: TIMI A30 (Xiaomi Mi Notebook Pro X 15, 2021)
>>> - CPU: 11th Gen Intel(R) Core(TM) i7-11370H
>>> - iGPU: Intel Iris Xe Graphics
>>> - dGPU: NVIDIA GeForce RTX 3050 Ti Mobile
>>> - Charging: USB-C PD only (130W). No barrel-jack DC input.
>>> - Kernel: 7.3.1-1-cachyos (Arch-based)
>>> - Driver: bitland_mifs_wmi
>>>
>>> Problem:
>>> platform_profile_choices correctly lists:
>>> low-power balanced balanced-performance performance
>>>
>>> However, switching to performance fails, regardless of whether the
>>> USB-C charger is connected:
>>>     $ powerprofilesctl set performance
>>>     Failed to communicate with power-profiles-daemon: ... Failed to
>>> write to acpi_platform_profile:
>>>     Error writing '/sys/firmware/acpi/platform_profile': Operation not
>>> supported (15)
>>>
>>> Direct write also fails:
>>>     $ echo performance | sudo tee /sys/firmware/acpi/platform_profile
>>>     tee: /sys/firmware/acpi/platform_profile: Operation not supported
>>>
>>> Analysis:
>>> This appears to be the same root cause as other USB-C only models: the
>>> function bitland_check_performance_capability() requires
>>> WMI_SYSTEM_AC_CIRCULARHOLE (barrel-jack DC), which is physically
>>> impossible on this USB-C-only machine. The driver advertises the
>>> profile in choices but rejects writes in profile_set().
>>>
>>> I am happy to test any patches on this model. Please let me know if
>>> further ACPI tracing is needed.
>>>
>>> Thank you.
>> Hi, this problem is being fixed with the following patch series.
>>
>> Please add your model to the quirks table before you test the patches.
>>
>> Link to the patches:
>> https://lore.kernel.org/all/20261028112742.674847-1-qby140326@gmail.com/
>>
>>
>> I take a look at your timi_a30_acpi.dat attachment, here's the quirk for
>> your machine:
>>
>> static const struct bitland_profile_entry timi_a30_profile_entries[] = {
>>       /* Change this information if it doesn't match your device. */
>>       { PLATFORM_PROFILE_LOW_POWER,   2 },
>>       { PLATFORM_PROFILE_BALANCED,    1 },
>>       { PLATFORM_PROFILE_PERFORMANCE, 0 },
>> };
>>
>> static const struct bitland_mifs_quirks timi_a30_quirks = {
>>       .profile_entries = timi_a30_profile_entries,
>>       .num_profile_entries = ARRAY_SIZE(timi_a30_profile_entries),
>>       .return_code_at_end = false,
>>       .skip_ac_type_check = true,
>> };
>>
>> static const struct dmi_system_id bitland_mifs_dmi_table[] = {
>>       {
>>           .matches = {
>>               /* Change this information if it doesn't match your device. */
>>               DMI_MATCH(DMI_SYS_VENDOR, "TIMI"),
>>               DMI_MATCH(DMI_PRODUCT_NAME, "A30"),
>>           },
>>           .driver_data = (void*)&timi_a30_quirks,
>>       },
>>       {}
>> };
>>
