Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8768579DA
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 03:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783654007; cv=none; b=QBNk36Fvlkaws4efYx28AqUopX289eK1N+rO7ltC2ox3QKVHjOBcVKp47CkPCUZ/L5ipA961EzQ6bWRgJr5iEGEHAHffxd67mpVegok5xfLI9cYLXuO7CwpqQ2oDgFEPxzmEm0vFacBa7L1z3fd1n284hh3DNM55pv2bdH3BbuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783654007; c=relaxed/simple;
	bh=BDN+fUCj1lFREA8PP0ddjPRptXkyB3o1s0svUIgtxag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZJsN9jXZyhqbl+HcrgentLFw1lchJsMeHxStUPBjbxsSKgpc3CV7iVEeZbKxfq5X/ATZp15n6gnN7RbfKnGEl/6G6o5v0pa9FrulfLVTUuhc74gcX+lcV8GttfIkwGPf4xsBAHJNWknFK+9eNvDA8Mjp6j4s0nWD79/gTwe6Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Imkxej9q; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Imkxej9q"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c7c61b5292so6998645ad.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2026 20:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783654006; x=1784258806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epVsqcbd6CBn8G7LYQQV28q7NORHiMRzbIRpbE4ayQA=;
        b=Imkxej9qd/oHkDYnyBDJgXHFKz+JyahAEmzbrXPQqgLahZElgyWRJTASAcT+Z5I7tR
         Q6eCsXLnYAU4A1Kf8ocqeQDaWk0hsRPv8Gw8hIL9ZP5g4Ub8+qt2aUjutoOLqsWqgluA
         B28nXHqsk8roFLO/4vPP4AnfID6U3JmLe3FlBvuUvDHHSqLZTxUclV6hY66YQAAjVwl+
         l9xJy8ySQ1Fxf2R4fhdORkZelKOH2oQXuFr0MX1CwswC+tQwWEz1Ml6hC1vqsWaXTmOO
         uZ+TfkUfnzGKyzofs00Aa1gI0+Rl0jMzzmcCY5oCqw1xDNnhs0L8qqizNZ1aJprFJiNS
         gvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783654006; x=1784258806;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epVsqcbd6CBn8G7LYQQV28q7NORHiMRzbIRpbE4ayQA=;
        b=CygftVrOi2h9e0jSOHRIC/X86agLRvDn1CfIyrBEELPnu+tS3ybaef8kvV5lT6zLCZ
         kqKFL6Iu2jJr52RKohXgcKERfiTW3x3V0lYXwF85WKSnpp4AgSlQw7o73XdVF2g1l4Q0
         l++5FGg37ba8gswhzzPjEjyCQEw5GkMy827iEnqoujGqddcBqsU3sJ5BITHdbz2toGh9
         VYmiP1jD8Md+C2umd1zqA2GH/WnGyXjr5x+jrGwFOOhTWmAcvYLnZ8D4m7QQfscOAQgx
         NJeJpfuVDevngYaQvPDTHkGM1Bx5xJR1gJhr1xtwZXaxmjg0zzzA7920m5KnwATlBSgq
         7I4w==
X-Forwarded-Encrypted: i=1; AHgh+Rr+o9xSvO5LUZT1oplV57jHZ3QuSu8uZG8H5oV6PURTS6rnp+9bQyepiEQjX2QpI1O6odUbo8P78tKxwoQW6s2FPLEC@vger.kernel.org
X-Gm-Message-State: AOJu0YzEWsOr9ryRSylNYry0bII6hcDaRCLmAk+YfoQYXAds10gmE5kh
	LUzOFr9Egcs+warlPX71KyL+EyNH9GBk7u+Eajo6tPLANWdmMojWXkvo
X-Gm-Gg: AfdE7cl8MajnqeLvK0rl2RgPG0RFYf8coSIWTAlllaZXBjkpvy37qtPM7MscxLLc8/s
	f4FjCmYGaR+NrIpyrxYp1BJO2MlZr5534xd7dv/Ja5h2mJNOg0UmZOeKIqMh7k4KrvRQb1fhnbB
	F6YGGorJb9yOrSS+KnZYp85OcjD9xHUr/XMC/htZdnVgYfr+g/6tNOOWNKg4GPaF/N+xcPNZmZX
	zm32txzUfJCv44uo2eJeWQxnPDYLD74DHXJ96+d156dtYjYvC2kP3pQM+WHD9XT605H1JWsVg3C
	+pQ73dmpc1oN9Rcmg5UkOa5ASmcMsE3hhM4lyRaw1z5WyaWUX5O+0oGrZCrr65kV1pMXpHPdMGF
	z8D2Ml2KycqHDpBoBWNWNPVd1zcdOMtyEcqxjGbsobjV63mXOd4GqXxOGW9Rkp2U=
X-Received: by 2002:a17:903:3890:b0:2cc:7d4a:3f5a with SMTP id d9443c01a7336-2ccea2e3ea4mr110452385ad.20.1783654005887;
        Thu, 09 Jul 2026 20:26:45 -0700 (PDT)
Received: from [28.0.0.1] ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bc1fsm52513975ad.55.2026.07.09.20.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 20:26:44 -0700 (PDT)
Message-ID: <ae9a92b5-5c79-41dd-8735-b2450c544d96@gmail.com>
Date: Fri, 10 Jul 2026 11:26:39 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] platform/x86: bitland-mifs-wmi: Hibernation fails with
 error -22 on Xiaomi Redmi Book Pro 14 2025
To: Nabil Danial <nabildanial.93@gmail.com>
Cc: W_Armin@gmx.de, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAJW3z-g3kn+-EFZ+0nEA49B2DYxc8LK639yzYMgcrR-0mF7G4A@mail.gmail.com>
Content-Language: en-US
From: cubewhy <qby140326@gmail.com>
In-Reply-To: <CAJW3z-g3kn+-EFZ+0nEA49B2DYxc8LK639yzYMgcrR-0mF7G4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/26 9:45 AM, Nabil Danial wrote:
> Hi everyone,
>
> I am experiencing a hibernation (suspend-to-disk) failure on my laptop
> since upgrading to kernel 7.1. Hibernation worked without issues on
> kernel 7.0, but consistently fails now when the newly introduced
> "bitland-mifs-wmi" module is loaded.
>
> I notice that both redmi_wmi and bitland_mifs_wmi are currently loaded
> on my system. I understand there is an active patch series to
> deprecate redmi_wmi in favor of bitland_mifs_wmi for these platforms.
>
> However, on this specific hardware (Redmi Book Pro 14 2025),
> bitland_mifs_wmi fails to establish its platform profile during boot,
> resulting in multiple "Failed to get profile for handler" warnings in
> dmesg. Consequently, during the PM freeze transition, the suspend
> callback fails with -EINVAL (-22), which blocks the system freeze
> phase and aborts hibernation.
>
> Unloading the "bitland-mifs-wmi" module bypasses this issue and allows
> hibernation to successfully complete. It seems the new driver's
> suspend routine might need to be made robust against profile
> initialization failures, or require a fix to successfully register the
> platform profile on this hardware variant.
>
> Below are the details of the hardware, boot logs, failure logs, and
> the successful hibernation sequence after removing the module.
>
> ### System Environment
> - Hardware: XIAOMI REDMI Book Pro 14 2025
> - OS: Chimera Linux (musl-based)
> - Kernel: 7.1.3
>
> ### dmidecode System Information
> Handle 0x0001, DMI type 1, 27 bytes
> System Information
>          Manufacturer: XIAOMI
>          Product Name: REDMI Book Pro 14 2025
>          Version:
>          Serial Number: 63081/25U700201
>          UUID: 07082025-fcb3-aacd-4be6-fcb3aacd4bea
>          Wake-up Type: Power Switch
>          SKU Number: TM2411-63081
>          Family: Mi Laptop
>
> ### dmesg platform_profile warnings on boot
> [   15.103125] platform_profile: Failed to get profile for handler
> bitland-mifs-wmi
> [   15.107027] platform_profile: Failed to get profile for handler
> bitland-mifs-wmi
> [   17.109653] platform_profile: Failed to get profile for handler
> bitland-mifs-wmi
>
> ### dmesg log when hibernation fails (with bitland-mifs-wmi loaded)
> [   68.005811] printk: Suspending console(s) (use no_console_suspend to debug)
> [   68.010452] bitland-mifs-wmi
> B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B-4: PM: dpm_run_callback():
> bitland_mifs_wmi_suspend [bitland_mifs_wmi] returns -22
> [   68.010469] bitland-mifs-wmi
> B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B-4: PM: failed to freeze: error
> -22
> [   68.316796] nvme nvme0: D3 entry latency set to 10 seconds
> [   68.382440] nvme nvme0: 14/0/0 default/read/poll queues
> [   68.501502] PM: hibernation: Basic memory bitmaps freed
> [   68.502346] OOM killer enabled.
> [   68.502348] Restarting tasks: Starting
> [   68.503286] Restarting tasks: Done
> [   68.509265] PM: hibernation: hibernation exit
> [   68.509644] e-hibernate[1885]: Failed to put system to sleep.
> System resumed again: Invalid argument
> [   68.526064] e-hibernate[1885]: e-hibernate: shutdown_or_sleep
> failed: Invalid argument
>
> ### Workaround (Unloading module)
> Running "sudo rmmod bitland_mifs_wmi" allows the system to enter
> hibernation successfully:
>
> [  110.414050] PM: hibernation: Basic memory bitmaps freed
> [  110.415952] OOM killer enabled.
> [  110.415953] Restarting tasks: Starting
> [  110.417919] Restarting tasks: Done
> [  110.420194] PM: hibernation: hibernation exit
> [  110.420288] e-hibernate[2690]: System returned from sleep operation
> 'hibernate'.
>
> ---
>
> Please let me know if there are any other logs, DSDT tables, or test
> patches you would like me to try.
>
> Best regards,
> Nabil Danial

Already fixed in linux-next

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/platform/x86/bitland-mifs-wmi.c?h=next-20260709&id=d3666875c75eb1bc8090343fa0d6fc8fb7924356

--

Mingyou Chen

