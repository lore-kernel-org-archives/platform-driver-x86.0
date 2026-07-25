Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FB71E32D6
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Jul 2026 03:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784950975; cv=none; b=lU0p1nXiQSMdWIUAiy33+zazysT1wjjCtxTfxBShJY1vqJ2Ym9NhSpeEt0AnHj32soBRpgvaOkr4qhOUkAv3O/Z9xsFnWOGJfl91mNT1PUnyplqf3CQ2svxC83d9TSyM+iba3g5Olu9JpW21zSjn2SghaYE4HguctdzJFVzqtfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784950975; c=relaxed/simple;
	bh=TNI+xsyFvmDbWSTMVvOLXgsMWw7EYDLJffwNGdpX2Mg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HHD02TRfpywuJFwDYsPFelzgwKnLADJ9xYYihH7AoslzfFV3K/TQ6L7YZ7mUOXBiw6FPTnfcbD9+c2+FzNgQasvOmHcEabS9hesmXJeilfOl0Tn9GrI1AnL2WHrGVCZerXgE+eBfR58XEDHDPYV9J62Z/cnNpXcgdzyJqR2IxD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tKhHXapQ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tKhHXapQ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so848717a91.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jul 2026 20:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784950973; x=1785555773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lfsQHiBwJDEgyxge8TWVldY47RBjQbT7TXneOswFzY4=;
        b=tKhHXapQIrt8SwQG8isflPwg/pfT2UEMczwqWc67GatZibKBiXorN7/FE18BVcFIQZ
         ziLnDYX8C+qKbTh5mBbTTx3plZQ8pDlUDWlNFeNXlP5fJxbA9Oy2XskRmtvHeJUdzYnO
         miYSqQyre1XtOlkQ5KIjYL1pOyA+T5RPlElR22tNle+RSjIaoeE1y60pER3cAw5LR0Cj
         sTrM2Jac+R8xxcufqLfqNVaVj59IfX9J9XvG2oqfJT6HgCY+kTROrfDLhl3ozR7b1nR7
         AejrbPzVFAv5LXet812u+gAW6OOVNvhKhc3otv0xotJ7p3h0GFW/7DX3lm/JZnCKGoqE
         giag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784950973; x=1785555773;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfsQHiBwJDEgyxge8TWVldY47RBjQbT7TXneOswFzY4=;
        b=HLF4mCph1A70hkoxlmQVm8Smh1TbO+8isv8t8G0lGG0GTHhw3312yCLo63gyShpr0X
         /z5aHz8c6QcceUXtrBN2Szq+ZK052oQB2OASXKy6mPO38j0MZ2dZo7S34/J6hvVkc4z1
         py6Oxg8dR4rWO6oYOwvjddeG+LRhfKOZyZdGD7j8/gQttKfGPcoUCvxpJmT6M+QavhG3
         DrXHAYcSJKbGwJRMM1oGsEe+b2SLeyZER4S1Am6FC/qL42iHyJFi6vIgNcfXNJMfnJ/F
         OnBEeF57LOZXmqqpGNgUq8+uxhgVC8qKzHhEtH8h+XnPaKj0sKgh04YMkftT5CGVJ3xw
         1VZw==
X-Gm-Message-State: AOJu0YyvrhhAqlGBbVyPkIEg0BR0KdUWAbLTd9+ddUAz4a7RcE4T1XaC
	d57xqfXckexBwf0+sVa8KyxfFYt+hfpi7wvcO2kiGJ4bcX4iVG6sTwYYQWrJTx/d
X-Gm-Gg: AR+sD13R2kHT13kh5wiUWC7Xlo6sfhg+oWfRpioGODvjFBWinmHCuEp1BaoU2PJSDqR
	lXMXhV0GdspWmN7vrCbk475HJ6GTyKf8Q/cOhYAbTnKyaLBT9L2eg8XlqI7ZbcM80Q1FjPWnf4H
	34HBzMZ6LauJr/XGvPaA9J+W/+Em3XWdUM6v+AyGVllRgHGUl6ZmTXwdroPh7uVwoiCowFwPvfW
	ryzUgp7nTQnwUY+JNOAzhpnN0iyLKBn+ZqsEglL8iR/0jr16Jy1gzf6+ejk1FsHH2RZRiJAYwRn
	gcLAxWIJPkQqyaAehxLJFCvoIfgIhIIo/T82V9gfzr/WtHkyzAmDG1dqvyZ3t7pYgsb5bJKK7Hg
	Jh8Y7vaBnq1gWhD8d/mJULHmf/p5ZuQ7f4kwvK7qsG35OH67hhCQf6dfpmd20Pw7gJst31qGvn1
	22/jDq1SWucb8nf1yjiUOBbv6cr6uNpFe+1a/wXBSqtRCbTICIRkNbz+TVcgdQB7POjhjNACXVj
	qMUvai2Qw==
X-Received: by 2002:a17:90b:2551:b0:38e:4f31:8412 with SMTP id 98e67ed59e1d1-38f1eea7240mr2991592a91.11.1784950972582;
        Fri, 24 Jul 2026 20:42:52 -0700 (PDT)
Received: from [172.17.109.93] ([136.233.9.100])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm51908196c88.2.2026.07.24.20.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 20:42:51 -0700 (PDT)
Message-ID: <2210c2c5-5ef5-43b4-b01a-935ef4ee6582@gmail.com>
Date: Sat, 25 Jul 2026 09:12:45 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] ideapad_laptop: fans do not ramp up properly under CPU load
 on Lenovo IdeaPad 3 15ALC6 Ub (82KU)
From: Sourajyoti Basak <basak.sb2006@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca, Derek John Clark <derekjohn.clark@gmail.com>,
 ikepanhc@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org
References: <CAA7g7-S_nP+jPfi7pJKj0a0g-gKXMJ7+fMH_+v11JbRRm96b9g@mail.gmail.com>
 <49faacb7-3e01-4d01-80b1-4b939a904138@gmail.com>
 <bbfae176-ec4f-4f09-b94e-43e534c3f629@gmail.com>
Content-Language: en-US
In-Reply-To: <bbfae176-ec4f-4f09-b94e-43e534c3f629@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/07/26 10:20 pm, Sourajyoti Basak wrote:
> On 02/06/26 8:43 pm, Sourajyoti Basak wrote:
>> On 09/05/26 9:00 pm, Sourajyoti Basak wrote:
>>> Hello,
>>>
>>> I am using a Lenovo IdeaPad 3 15ALC6 Ub (82KU), and I am encountering an
>>> issue where the laptop fans do not respond appropriately to increasing
>>> CPU temperatures under Linux.
>>>
>>> System information:
>>> Laptop: Lenovo IdeaPad 3 15ALC6 Ub
>>> BIOS version:GLCN46WW
>>> System performance mode in BIOS: Extreme Performance
>>> Kernel: Linux 7.0.5-1-cachyos
>>> Distribution: CachyOS
>>> CPU: AMD Ryzen 5 5500U (12) @ 4.06 GHz
>>>
>>> Issue description:
>>> Under sustained CPU load (for example using stress -c $(nproc)), CPU
>>> temperatures rapidly increase to around 95-100°C. However, the fans do
>>> not ramp to maximum speed as expected. Therefore, the system begins
>>> thermal throttling after some time in this state.
>>>
>>> As a result:
>>>
>>> - The CPU reaches thermal throttling temperatures.
>>> - CPU frequencies drop significantly once throttling begins.
>>> - Fan RPM appears capped or insufficient despite high temperatures.
>>> - The issue appears consistently reproducible on my laptop and another
>>>   person's laptop.
>>>
>>> Additional observations:
>>>
>>> - The issue persists across multiple recent kernel versions.
>>> - No hardware issues appear to be present. (Verified that the fans can
>>> indeed
>>>   ramp up to max speed by 
>>> `echo 1 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/
>>> fan_mode`,
>>> which makes the fan enter "dust cleaning mode," causing it to ramp up to
>>> max speed
>>> and then back down to 0 RPM about 10 times.)
>>>
>>> Attachments:
>>> - DSDT in `DSDT.gz`
>>> - `dmidecode` in `dmidecode.txt`
>>>
>>> Data Collected during `stress -c $(nproc)` until thermal throttling:
>>> - EC information collected in a CSV file named `ec.csv`
>>>   (using `sudo ec_probe monitor -i 0.5 -r ec.csv` from the NBFC project)
>>> - `sensors` information in `sensors.log`
>>> - CPU frequencies in `cpu-freq.log`
>>> - `dmesg` in `dmesg-live.log`
>>>
>>> Thank you for your time.
>>>
>>> Best regards,
>>> Sourajyoti Basak
>>
>>
>> Hello everyone,
>>
>> Just a gentle ping on this bug report. The thermal throttling issue is
>> still present. Please let me know if there is any further ACPI/EC
>> debugging information I can provide.
>>
>> Best Regards,
>> Sourajyoti Basak
> 
> Hello everyone,
> 
> Just wanted to confirm that this issue still exists after updating to
> the latest BIOS version (`GLCN68WW`) and on the latest linux kernel
> version `Linux 7.1.2-3-cachyos`.
> 
> Best Regards,
> Sourajyoti Basak

Hello everyone,


This issue is still present even on the latest BIOS version (GLCN68WW)
and on the latest kernel version `Linux ideapad 7.1.4-1-cachyos`

Best Regards,
Sourajyoti Basak
