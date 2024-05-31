Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133AED51E
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 May 2024 03:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717127587; cv=none; b=h+shUFDTj09Eu0xIPTMhjcVA8DY5wZdqpKlW4ahsZSMPhjLwhoCg7SfwISudYxOlp62VNM/HN6iZVHwn/NjLle7veTVX/LE9e6j0ep7OZ64GwZndE/nN3aZD3N8im83VT0qxcfx73+mjiEY086chafM+jyE/w57qU5jy0OTXDXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717127587; c=relaxed/simple;
	bh=5EK0M2XD0/FKVWHofQoxZJPpSCQfLsryMgRmg0Y93w8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lfAjOqVuTriKrZDBhVLFnLG0qAGo/Ws32jDKdC1i+E8RPVim2GA2JWl4As5BNvYjNrPI0e4vekEdAB3jQUofX8z/dKAxx747z8X/q+rcxD5ovojdmEpO5ONf5vLXpmgumDH3kvPRq/MEvEB+AnAbUrkTHFfbnhw4akidtCfZRoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.3] (ip5f5af154.dynamic.kabel-deutschland.de [95.90.241.84])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 0DED061E646C2;
	Fri, 31 May 2024 05:52:19 +0200 (CEST)
Message-ID: <0e25d09e-ca8a-407c-8a6e-8955fea765b5@molgen.mpg.de>
Date: Fri, 31 May 2024 05:52:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Dell XPS 13 9360: `slp_s0_residency_usec` stays 0
To: "David E. Box" <david.e.box@linux.intel.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <38fc334a-7c8c-4e43-bf63-6ac9aa882a2f@molgen.mpg.de>
 <c73a9072-27eb-4d42-b74a-52619a81837e@molgen.mpg.de>
 <81e937f0-df95-4e07-8d0f-3e20fce8481f@amd.com>
 <36a91aa1-84e3-4ad5-8384-1bd999c15675@molgen.mpg.de>
 <49bd6fea5a77a2b419e5c808e400f02fe275d9b1.camel@linux.intel.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <49bd6fea5a77a2b419e5c808e400f02fe275d9b1.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear David,


Thank you for your reply.

Am 30.05.24 um 23:24 schrieb David E. Box:

> On Fri, 2024-05-24 at 06:53 +0200, Paul Menzel wrote:

>> Am 22.05.24 um 18:37 schrieb Mario Limonciello:
>>> On 5/22/2024 10:52, Paul Menzel wrote:
>>
>>>> On the Intel Kaby Lake laptop Dell XPS 13 9360,
>>>> `/sys/kernel/debug/pmc_core/slp_s0_residency_usec` does stay 0 even
>>>> after a s2idle suspend/resume cycle.
>>>
>>> It won't change your numbers but FWIW you can also read from
>>>
>>> $ cat /sys/power/suspend_stats/last_hw_sleep
>>>
>>> which is also accessible under kernel lockdown.
>>>
>>>>       $ sudo dmesg
>>>>       […]
>>>>       [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022
>>>>       […]
>>>>       [10176.745124] PM: suspend entry (s2idle)
>>>>       [10176.757275] Filesystems sync: 0.012 seconds
>>>>       [10176.769118] Freezing user space processes
>>>>       [10176.771693] Freezing user space processes completed (elapsed 0.002 seconds)
>>>>       [10176.771710] OOM killer disabled.
>>>>       [10176.771714] Freezing remaining freezable tasks
>>>>       [10176.773487] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
>>>>       [10176.773504] printk: Suspending console(s) (use no_console_suspend to debug)
>>>>       [10176.948337] ACPI: EC: interrupt blocked
>>>>       [10176.951016] intel_pch_thermal 0000:00:14.2: CPU-PCH is cool [48C]
>>>>       [10181.281827] ACPI: EC: interrupt unblocked
>>>>       $ sudo more /sys/kernel/debug/pmc_core/slp_s0_residency_usec
>>>>       0
>>>>
>>>> Is that expected?
>>>
>>> Is it a regression?  If so; probably it's worth bisecting.
>>
>> Sorry, I do not know. It’s the first time [1] I heard about this file,
>> and that fwts [2] checks it. Do you remember, if Dell has any public
>> logs from testing, containing `slp_s0_residency_usec`?
>>
>>> If it's not a regression IIUC you should probably run
>>> https://github.com/intel/S0ixSelftestTool for assistance in next steps
>>> on debugging why this is happening.
>>
>> Thank you for the pointer. Please find the log file from `sudo
>> ./s0ix-selftest-tool.sh -s` attached. Some PCIe ports are flagged.

> The report suggests checking the kernel log for any error loading drm firmware.

Did you conclude that from the lines below?

    GFX DC5 after S2idle: 59
    GFX DC6 after S2idle: 0

    Your system CPU Model ID is: 142, and the graphics DC6 value is not 
expected to enter DC9,
    please check the latest display DMC FW load status:

    Your system Intel graphics DMC FW loaded status is:yes

> If the firmware is loaded properly, you should see a message similar to the
> following:
> 
>      [drm] Finished loading DMC firmware i915/kbl_dmc_ver1_04.bin (v1.4)

The firmware is loaded:

     [  124.536942] i915 0000:00:02.0: [drm] Finished loading DMC 
firmware i915/kbl_dmc_ver1_04.bin (v1.4)


Kind regards,

Paul


>> [1]: https://review.coreboot.org/c/coreboot/+/81595/10/src/mainboard/cwwk/adl/Kconfig#9
>> [2]: https://wiki.ubuntu.com/FirmwareTestSuite/
>>
>>
>>>> PS: Some system details:
>>>>
>>>> ```
>>>> $ LANG= lspci -nn
>>>> 00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v6/7th Gen Core Processor Host Bridge/DRAM Registers [8086:5904] (rev 02)
>>>> 00:02.0 VGA compatible controller [0300]: Intel Corporation HD Graphics 620 [8086:5916] (rev 02)
>>>> 00:04.0 Signal processing controller [1180]: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem [8086:1903] (rev 02)
>>>> 00:14.0 USB controller [0c03]: Intel Corporation Sunrise Point-LP USB 3.0 xHCI Controller [8086:9d2f] (rev 21)
>>
>> […]
