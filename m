Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4990C167DA5
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 20:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716843546; cv=none; b=uxs09fgjIPQgjwYHKR1HaHa2/X1FTMp6+8OL62SqAZvac4P1W2uleIU/PiL2/i+AnfKXCix4Q/Pjk4IInBbUzmXTn8qVWC1qXHxIn7SPZH62QmlodFtcMupoJGvFnTUb+3P0bktTRzbssqQW3w6USWnRUGgKPM9DDR7gbZCwa1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716843546; c=relaxed/simple;
	bh=52T1Iw06CZk+T2kG/O8kWxf4NqfIA9Cr1KgjOLVYqc4=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:From:To:Cc:
	 References:In-Reply-To; b=hzFITNs3F9N6exnBAtIiA2rFtgOfX1hns9CJ1Y6EM3rxx/t2r5YktEY8D5ACSLw+uqwVxnBk/OPMlinEtTImUPa/qmBreUO6C+XRbKoc8s0+msCH42yrKe2z8cLcTwKzDMRO+hyfhecLDiPlvKG0Z+mLucBP/tB6ncu71ZfKjWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.3] (ip5f5af7a4.dynamic.kabel-deutschland.de [95.90.247.164])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 6138661E5FE01;
	Mon, 27 May 2024 22:58:12 +0200 (CEST)
Content-Type: multipart/mixed; boundary="------------lObZuw1KZy2IfqGm8qpbyXEj"
Message-ID: <d5b6125a-a130-4c99-860f-ea5d030684d5@molgen.mpg.de>
Date: Mon, 27 May 2024 22:58:08 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Dell XPS 13 9360: `slp_s0_residency_usec` stays 0
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Mario Limonciello <mario.limonciello@amd.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, Mike Jones <mike@mjones.io>
References: <38fc334a-7c8c-4e43-bf63-6ac9aa882a2f@molgen.mpg.de>
 <c73a9072-27eb-4d42-b74a-52619a81837e@molgen.mpg.de>
 <81e937f0-df95-4e07-8d0f-3e20fce8481f@amd.com>
 <36a91aa1-84e3-4ad5-8384-1bd999c15675@molgen.mpg.de>
Content-Language: en-US
In-Reply-To: <36a91aa1-84e3-4ad5-8384-1bd999c15675@molgen.mpg.de>

This is a multi-part message in MIME format.
--------------lObZuw1KZy2IfqGm8qpbyXEj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Linux folks,


Am 24.05.24 um 06:53 schrieb Paul Menzel:

> Am 22.05.24 um 18:37 schrieb Mario Limonciello:
>> On 5/22/2024 10:52, Paul Menzel wrote:
> 
>>> On the Intel Kaby Lake laptop Dell XPS 13 9360, 
>>> `/sys/kernel/debug/pmc_core/slp_s0_residency_usec` does stay 0 even 
>>> after a s2idle suspend/resume cycle.
>>
>> It won't change your numbers but FWIW you can also read from
>>
>> $ cat /sys/power/suspend_stats/last_hw_sleep
>>
>> which is also accessible under kernel lockdown.

Sorry, I overlooked this part. I just tried it, and this also stays 0 
with s2idle and deep.

     $ cat /sys/power/suspend_stats/last_hw_sleep
     0

>>>      $ sudo dmesg
>>>      […]
>>>      [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022
>>>      […]
>>>      [10176.745124] PM: suspend entry (s2idle)
>>>      [10176.757275] Filesystems sync: 0.012 seconds
>>>      [10176.769118] Freezing user space processes
>>>      [10176.771693] Freezing user space processes completed (elapsed 0.002 seconds)
>>>      [10176.771710] OOM killer disabled.
>>>      [10176.771714] Freezing remaining freezable tasks
>>>      [10176.773487] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
>>>      [10176.773504] printk: Suspending console(s) (use no_console_suspend to debug)
>>>      [10176.948337] ACPI: EC: interrupt blocked
>>>      [10176.951016] intel_pch_thermal 0000:00:14.2: CPU-PCH is cool [48C]
>>>      [10181.281827] ACPI: EC: interrupt unblocked
>>>      $ sudo more /sys/kernel/debug/pmc_core/slp_s0_residency_usec
>>>      0
>>>
>>> Is that expected?
>>
>> Is it a regression?  If so; probably it's worth bisecting.
> 
> Sorry, I do not know. It’s the first time [1] I heard about this file, 
> and that fwts [2] checks it. Do you remember, if Dell has any public 
> logs from testing, containing `slp_s0_residency_usec`?
> 
>> If it's not a regression IIUC you should probably run 
>> https://github.com/intel/S0ixSelftestTool for assistance in next steps 
>> on debugging why this is happening.
> 
> Thank you for the pointer. Please find the log file from `sudo 
> ./s0ix-selftest-tool.sh -s` attached. Some PCIe ports are flagged.

Just as a data point, non-zero values in 
`/sys/kernel/debug/pmc_core/slp_s0_residency_usec` and reaching PC10 
states works on a Dell XPS 13 93*7*0 with Kaby Lake R CPU (i5-8350U). 
Details attached.


Kind regards,

Paul


> [1]: https://review.coreboot.org/c/coreboot/+/81595/10/src/mainboard/cwwk/adl/Kconfig#9
> [2]: https://wiki.ubuntu.com/FirmwareTestSuite/
> 
> 
>>> PS: Some system details:
>>>
>>> ```
>>> $ LANG= lspci -nn
>>> 00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v6/7th Gen Core Processor Host Bridge/DRAM Registers [8086:5904] (rev 02)
>>> 00:02.0 VGA compatible controller [0300]: Intel Corporation HD Graphics 620 [8086:5916] (rev 02)
>>> 00:04.0 Signal processing controller [1180]: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem [8086:1903] (rev 02)
>>> 00:14.0 USB controller [0c03]: Intel Corporation Sunrise Point-LP USB 3.0 xHCI Controller [8086:9d2f] (rev 21)
> 
> […]
--------------lObZuw1KZy2IfqGm8qpbyXEj
Content-Type: text/plain; charset=UTF-8;
 name="20240527--dell-xps-13-9370--s0ixselftest.txt"
Content-Disposition: attachment;
 filename="20240527--dell-xps-13-9370--s0ixselftest.txt"
Content-Transfer-Encoding: base64

JCBzdWRvIC4vczBpeC1zZWxmdGVzdC10b29sLnNoIC1zCgotLS1DaGVjayBTMmlkbGUgcGF0
aCBTMGl4IFJlc2lkZW5jeS0tLToKClRoZSBzeXN0ZW0gT1MgS2VybmVsIHZlcnNpb24gaXM6
CkxpbnV4IHB1cmNlbGwgNi44LjExLWFtZDY0ICMxIFNNUCBQUkVFTVBUX0RZTkFNSUMgRGVi
aWFuIDYuOC4xMS0xICgyMDI0LTA1LTI2KSB4ODZfNjQgR05VL0xpbnV4CgotLS1DaGVjayB3
aGV0aGVyIHlvdXIgc3lzdGVtIHN1cHBvcnRzIFMwaXggb3Igbm90LS0tOgoKTG93IFBvd2Vy
IFMwIElkbGUgaXM6MQpZb3VyIHN5c3RlbSBzdXBwb3J0cyBsb3cgcG93ZXIgUzAgaWRsZSBj
YXBhYmlsaXR5LgoKCgotLS1DaGVjayB3aGV0aGVyIGludGVsX3BtY19jb3JlIHN5c2ZzIGZp
bGVzIGV4aXQtLS06CgpUaGUgcG1jX2NvcmUgZGVidWcgc3lzZnMgZmlsZXMgYXJlIE9LIG9u
IHlvdXIgc3lzdGVtLgoKCgotLS1KdWRnZSBQQzEwLCBTMGl4IHJlc2lkZW5jeSBhdmFpbGFi
bGUgc3RhdHVzLS0tOgpjYXQ6IC9zeXMva2VybmVsL2RlYnVnL3BtY19jb3JlL3N1YnN0YXRl
X3Jlc2lkZW5jaWVzOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CmdyZXA6IC9zeXMva2Vy
bmVsL2RlYnVnL3BtY19jb3JlL3N1YnN0YXRlX3Jlc2lkZW5jaWVzOiBObyBzdWNoIGZpbGUg
b3IgZGlyZWN0b3J5ClRlc3Qgc3lzdGVtIGRvZXMgbm90IHN1cHBvcnQgUzBpeC55IHN1YnN0
YXRlCgpUdXJib3N0YXQgb3V0cHV0OiAKMTUuMDI5MTY1IHNlYwpDUFUlYzEJQ1BVJWM2CUNQ
VSVjNwlHRlglcmM2CVBrZyVwYzIJUGtnJXBjMwlQa2clcGM2CVBrZyVwYzcJUGtnJXBjOAlQ
a2clcGM5UGslcGMxMAlTWVMlTFBJCjEuMDgJMC40MAk5Ni43MgkxMTIxLjQzCTIuMDEJMC42
OAkwLjE2CTAuMDAJMC40NAkwLjAwCTkxLjk2CTkyLjEyCjAuNjkJMC4yMQk5Ny40NQkxMTIx
LjY4CTIuMDEJMC42OAkwLjE2CTAuMDAJMC40NAkwLjAwCTkxLjk3CTkyLjE0CjAuODAKMS40
OQkwLjEwCTk1Ljk1CjEuOTMKMC42NAkwLjQzCTk3LjI0CjAuODkKMS4yNgkwLjg3CTk2LjIz
CjAuOTQKCkNQVSBDb3JlIEM3IHJlc2lkZW5jeSBhZnRlciBTMmlkbGUgaXM6IDk2LjcyCkdG
WCBSQzYgcmVzaWRlbmN5IGFmdGVyIFMyaWRsZSBpczogMTEyMS40MwpDUFUgUGFja2FnZSBD
LXN0YXRlIDIgcmVzaWRlbmN5IGFmdGVyIFMyaWRsZSBpczogMi4wMQpDUFUgUGFja2FnZSBD
LXN0YXRlIDMgcmVzaWRlbmN5IGFmdGVyIFMyaWRsZSBpczogMC42OApDUFUgUGFja2FnZSBD
LXN0YXRlIDggcmVzaWRlbmN5IGFmdGVyIFMyaWRsZSBpczogMC40NApDUFUgUGFja2FnZSBD
LXN0YXRlIDkgcmVzaWRlbmN5IGFmdGVyIFMyaWRsZSBpczogMC4wMApDUFUgUGFja2FnZSBD
LXN0YXRlIDEwIHJlc2lkZW5jeSBhZnRlciBTMmlkbGUgaXM6IDkxLjk2ClMwaXggcmVzaWRl
bmN5IGFmdGVyIFMyaWRsZSBpczogOTIuMTIKY2F0OiAvc3lzL2tlcm5lbC9kZWJ1Zy9wbWNf
Y29yZS9zdWJzdGF0ZV9yZXNpZGVuY2llczogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQoK
Q29uZ3JhdHVsYXRpb25zISBZb3VyIHN5c3RlbSBhY2hpZXZlZCBTMmlkbGUgUzBpeCByZXNp
ZGVuY3k6IDkyLjEyCgpwbWVuemVsQHB1cmNlbGw6fi9zcmMvUzBpeFNlbGZ0ZXN0VG9vbCQg
c3VkbyBtb3JlIC9zeXMva2VybmVsL2RlYnVnL3BtY19jb3JlL3NscF9zMF9yZXNpZGVuY3lf
dXNlYwozNTg0OTQyNApwbWVuemVsQHB1cmNlbGw6fi9zcmMvUzBpeFNlbGZ0ZXN0VG9vbCQg
c3VkbyAuL3MwaXgtc2VsZnRlc3QtdG9vbC5zaCAtciBvbgoKLS0tQ2hlY2sgUnVudGltZSBQ
QzEwIFJlc2lkZW5jeSBkdXJpbmcgU2NyZWVuIE9OLS0tOgoKVGhlIHN5c3RlbSBPUyBLZXJu
ZWwgdmVyc2lvbiBpczoKTGludXggcHVyY2VsbCA2LjguMTEtYW1kNjQgIzEgU01QIFBSRUVN
UFRfRFlOQU1JQyBEZWJpYW4gNi44LjExLTEgKDIwMjQtMDUtMjYpIHg4Nl82NCBHTlUvTGlu
dXgKCm1vZHByb2JlIGNwdWZyZXFfc3RhdHMgZmFpbGVkCkNhbm5vdCBsb2FkIGZyb20gZmls
ZSAvdmFyL2NhY2hlL3Bvd2VydG9wL3NhdmVkX3Jlc3VsdHMucG93ZXJ0b3AKQ2Fubm90IGxv
YWQgZnJvbSBmaWxlIC92YXIvY2FjaGUvcG93ZXJ0b3Avc2F2ZWRfcGFyYW1ldGVycy5wb3dl
cnRvcApGaWxlIHdpbGwgYmUgbG9hZGVkIGFmdGVyIHRha2luZyBtaW5pbXVtIG51bWJlciBv
ZiBtZWFzdXJlbWVudChzKSB3aXRoIGJhdHRlcnkgb25seSAKUkFQTCBkZXZpY2UgZm9yIGNw
dSAwClJBUEwgVXNpbmcgUG93ZXJDYXAgU3lzZnMgOiBEb21haW4gTWFzayBmClJBUEwgZGV2
aWNlIGZvciBjcHUgMApSQVBMIFVzaW5nIFBvd2VyQ2FwIFN5c2ZzIDogRG9tYWluIE1hc2sg
ZgpEZXZmcmVxIG5vdCBlbmFibGVkCmdsb2IgcmV0dXJuZWQgR0xPQl9BQk9SVEVECkNhbm5v
dCBsb2FkIGZyb20gZmlsZSAvdmFyL2NhY2hlL3Bvd2VydG9wL3NhdmVkX3BhcmFtZXRlcnMu
cG93ZXJ0b3AKRmlsZSB3aWxsIGJlIGxvYWRlZCBhZnRlciB0YWtpbmcgbWluaW11bSBudW1i
ZXIgb2YgbWVhc3VyZW1lbnQocykgd2l0aCBiYXR0ZXJ5IG9ubHkgCkxlYXZpbmcgUG93ZXJU
T1AKClRoZSBzeXN0ZW0gd2lsbCBrZWVwIGlkbGUgZm9yIDQwIHNlY29uZHMgdGhlbiBjaGVj
ayBydW50aW1lIFBDMTAgc3RhdGU6CgoKVGhlIENQVSBydW50aW1lIFBDMTAgcmVzaWRlbmN5
IHdoZW4gc2NyZWVuIE9OOiA5My41NCUKVGhlIENQVSBydW50aW1lIFBDOCByZXNpZGVuY3kg
d2hlbiBzY3JlZW4gT046IDIuNjglCgoKVHVyYm9zdGF0IGxvZzogCjMwLjAwNDY5OCBzZWMK
Q1BVJWMxCUNQVSVjNglDUFUlYzcJR0ZYJXJjNglQa2clcGMyCVBrZyVwYzMJUGtnJXBjNglQ
a2clcGM3CVBrZyVwYzgJUGtnJXBjOQlQayVwYzEwCjAuMzMJMC4wMwk5OS40OQk5OS45OQky
LjAyCTAuMDEJMC4wOAkwLjAwCTIuNjgJMC4wMAk5My41NAowLjYwCTAuMDMJOTkuMzIJOTku
OTkJMi4wMgkwLjAxCTAuMDgJMC4wMAkyLjY4CTAuMDAJOTMuNTQKMC4yOAowLjM0CTAuMDEJ
OTkuMzEKMC41MQowLjEyCTAuMDEJOTkuNzkKMC4xMwowLjI5CTAuMDcJOTkuNTQKMC4zNAoK
CllvdXIgc3lzdGVtIGFjaGlldmVkIGhpZ2ggcnVudGltZSBQQzEwIHJlc2lkZW5jeSBkdXJp
bmcgc2NyZWVuIE9OOiA5My41NCUKCgoKcG1lbnplbEBwdXJjZWxsOn4vc3JjL1MwaXhTZWxm
dGVzdFRvb2wkIGxzY3VwCmJhc2g6IGxzY3VwOiBjb21tYW5kIG5vdCBmb3VuZApwbWVuemVs
QHB1cmNlbGw6fi9zcmMvUzBpeFNlbGZ0ZXN0VG9vbCQgbHNjcHUKQXJjaGl0ZWN0dXJlOiAg
ICAgICAgICAgICB4ODZfNjQKICBDUFUgb3AtbW9kZShzKTogICAgICAgICAzMi1iaXQsIDY0
LWJpdAogIEFkZHJlc3Mgc2l6ZXM6ICAgICAgICAgIDM5IGJpdHMgcGh5c2ljYWwsIDQ4IGJp
dHMgdmlydHVhbAogIEJ5dGUgT3JkZXI6ICAgICAgICAgICAgIExpdHRsZSBFbmRpYW4KQ1BV
KHMpOiAgICAgICAgICAgICAgICAgICA4CiAgT24tbGluZSBDUFUocykgbGlzdDogICAgMC03
ClZlbmRvciBJRDogICAgICAgICAgICAgICAgR2VudWluZUludGVsCiAgTW9kZWwgbmFtZTog
ICAgICAgICAgICAgSW50ZWwoUikgQ29yZShUTSkgaTUtODM1MFUgQ1BVIEAgMS43MEdIegog
ICAgQ1BVIGZhbWlseTogICAgICAgICAgIDYKICAgIE1vZGVsOiAgICAgICAgICAgICAgICAx
NDIKICAgIFRocmVhZChzKSBwZXIgY29yZTogICAyCiAgICBDb3JlKHMpIHBlciBzb2NrZXQ6
ICAgNAogICAgU29ja2V0KHMpOiAgICAgICAgICAgIDEKICAgIFN0ZXBwaW5nOiAgICAgICAg
ICAgICAxMAogICAgQ1BVKHMpIHNjYWxpbmcgTUh6OiAgIDE5JQogICAgQ1BVIG1heCBNSHo6
ICAgICAgICAgIDM2MDAuMDAwMAogICAgQ1BVIG1pbiBNSHo6ICAgICAgICAgIDQwMC4wMDAw
CiAgICBCb2dvTUlQUzogICAgICAgICAgICAgMzc5OS45MAogICAgRmxhZ3M6ICAgICAgICAg
ICAgICAgIGZwdSB2bWUgZGUgcHNlIHRzYyBtc3IgcGFlIG1jZSBjeDggYXBpYyBzZXAgbXRy
ciBwZ2UgbWNhIGNtb3YgcGF0IHBzZTM2IGNsZmx1c2ggZHRzIGFjcGkgbW14IGZ4c3Igc3Nl
IHNzZTIgc3MgaHQgdG0gcGJlIHN5c2NhbGwgbnggcGRwZTFnYiByZHRzY3AgbG0gY29uc3Rh
bnRfdHNjIGFydCBhcmNoX3BlcmZtb24gcGVicyBiCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgdHMgcmVwX2dvb2Qgbm9wbCB4dG9wb2xvZ3kgbm9uc3RvcF90c2MgY3B1aWQgYXBlcmZt
cGVyZiBwbmkgcGNsbXVscWRxIGR0ZXM2NCBtb25pdG9yIGRzX2NwbCB2bXggc214IGVzdCB0
bTIgc3NzZTMgc2RiZyBmbWEgY3gxNiB4dHByIHBkY20gcGNpZCBzc2U0XzEgc3NlNF8yIHgy
YXBpYyBtb3ZiZSBwb3BjbnQgdHNjX2RlYWQKICAgICAgICAgICAgICAgICAgICAgICAgICBs
aW5lX3RpbWVyIGFlcyB4c2F2ZSBhdnggZjE2YyByZHJhbmQgbGFoZl9sbSBhYm0gM2Rub3dw
cmVmZXRjaCBjcHVpZF9mYXVsdCBlcGIgcHRpIHNzYmQgaWJycyBpYnBiIHN0aWJwIHRwcl9z
aGFkb3cgZmxleHByaW9yaXR5IGVwdCB2cGlkIGVwdF9hZCBmc2dzYmFzZSB0c2NfYWRqdXN0
IHNneCBibWkxIGF2eDIgc21lcCBibQogICAgICAgICAgICAgICAgICAgICAgICAgIGkyIGVy
bXMgaW52cGNpZCBtcHggcmRzZWVkIGFkeCBzbWFwIGNsZmx1c2hvcHQgaW50ZWxfcHQgeHNh
dmVvcHQgeHNhdmVjIHhnZXRidjEgeHNhdmVzIGR0aGVybSBpZGEgYXJhdCBwbG4gcHRzIGh3
cCBod3Bfbm90aWZ5IGh3cF9hY3Rfd2luZG93IGh3cF9lcHAgdm5taSBtZF9jbGVhciBmbHVz
aF9sMWQgYXJjaF9jYXBhYmlsCiAgICAgICAgICAgICAgICAgICAgICAgICAgaXRpZXMKVmly
dHVhbGl6YXRpb24gZmVhdHVyZXM6ICAKICBWaXJ0dWFsaXphdGlvbjogICAgICAgICBWVC14
CkNhY2hlcyAoc3VtIG9mIGFsbCk6ICAgICAgCiAgTDFkOiAgICAgICAgICAgICAgICAgICAg
MTI4IEtpQiAoNCBpbnN0YW5jZXMpCiAgTDFpOiAgICAgICAgICAgICAgICAgICAgMTI4IEtp
QiAoNCBpbnN0YW5jZXMpCiAgTDI6ICAgICAgICAgICAgICAgICAgICAgMSBNaUIgKDQgaW5z
dGFuY2VzKQogIEwzOiAgICAgICAgICAgICAgICAgICAgIDYgTWlCICgxIGluc3RhbmNlKQpO
VU1BOiAgICAgICAgICAgICAgICAgICAgIAogIE5VTUEgbm9kZShzKTogICAgICAgICAgIDEK
ICBOVU1BIG5vZGUwIENQVShzKTogICAgICAwLTcKVnVsbmVyYWJpbGl0aWVzOiAgICAgICAg
ICAKICBHYXRoZXIgZGF0YSBzYW1wbGluZzogICBNaXRpZ2F0aW9uOyBNaWNyb2NvZGUKICBJ
dGxiIG11bHRpaGl0OiAgICAgICAgICBLVk06IE1pdGlnYXRpb246IFZNWCBkaXNhYmxlZAog
IEwxdGY6ICAgICAgICAgICAgICAgICAgIE1pdGlnYXRpb247IFBURSBJbnZlcnNpb247IFZN
WCBjb25kaXRpb25hbCBjYWNoZSBmbHVzaGVzLCBTTVQgdnVsbmVyYWJsZQogIE1kczogICAg
ICAgICAgICAgICAgICAgIE1pdGlnYXRpb247IENsZWFyIENQVSBidWZmZXJzOyBTTVQgdnVs
bmVyYWJsZQogIE1lbHRkb3duOiAgICAgICAgICAgICAgIE1pdGlnYXRpb247IFBUSQogIE1t
aW8gc3RhbGUgZGF0YTogICAgICAgIE1pdGlnYXRpb247IENsZWFyIENQVSBidWZmZXJzOyBT
TVQgdnVsbmVyYWJsZQogIFJlZyBmaWxlIGRhdGEgc2FtcGxpbmc6IE5vdCBhZmZlY3RlZAog
IFJldGJsZWVkOiAgICAgICAgICAgICAgIE1pdGlnYXRpb247IElCUlMKICBTcGVjIHJzdGFj
ayBvdmVyZmxvdzogICBOb3QgYWZmZWN0ZWQKICBTcGVjIHN0b3JlIGJ5cGFzczogICAgICBN
aXRpZ2F0aW9uOyBTcGVjdWxhdGl2ZSBTdG9yZSBCeXBhc3MgZGlzYWJsZWQgdmlhIHByY3Rs
CiAgU3BlY3RyZSB2MTogICAgICAgICAgICAgTWl0aWdhdGlvbjsgdXNlcmNvcHkvc3dhcGdz
IGJhcnJpZXJzIGFuZCBfX3VzZXIgcG9pbnRlciBzYW5pdGl6YXRpb24KICBTcGVjdHJlIHYy
OiAgICAgICAgICAgICBNaXRpZ2F0aW9uOyBJQlJTOyBJQlBCIGNvbmRpdGlvbmFsOyBTVElC
UCBjb25kaXRpb25hbDsgUlNCIGZpbGxpbmc7IFBCUlNCLWVJQlJTIE5vdCBhZmZlY3RlZDsg
QkhJIE5vdCBhZmZlY3RlZAogIFNyYmRzOiAgICAgICAgICAgICAgICAgIE1pdGlnYXRpb247
IE1pY3JvY29kZQogIFRzeCBhc3luYyBhYm9ydDogICAgICAgIE1pdGlnYXRpb247IFRTWCBk
aXNhYmxlZAokIG1vcmUgL3N5cy9wb3dlci9tZW1fc2xlZXAKW3MyaWRsZV0gZGVlcAokIHN1
ZG8gZG1lc2cgLS1sZXZlbCBhbGVydCxjcml0LGVycix3YXJuClsgICAgMC4wNTM3NzFdIE1E
UyBDUFUgYnVnIHByZXNlbnQgYW5kIFNNVCBvbiwgZGF0YSBsZWFrIHBvc3NpYmxlLiBTZWUg
aHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvYWRtaW4tZ3VpZGUvaHct
dnVsbi9tZHMuaHRtbCBmb3IgbW9yZSBkZXRhaWxzLgpbICAgIDAuMDUzNzcxXSBNTUlPIFN0
YWxlIERhdGEgQ1BVIGJ1ZyBwcmVzZW50IGFuZCBTTVQgb24sIGRhdGEgbGVhayBwb3NzaWJs
ZS4gU2VlIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L2FkbWluLWd1
aWRlL2h3LXZ1bG4vcHJvY2Vzc29yX21taW9fc3RhbGVfZGF0YS5odG1sIGZvciBtb3JlIGRl
dGFpbHMuClsgICAgMC4yNzQ1NTBdIGhwZXRfYWNwaV9hZGQ6IG5vIGFkZHJlc3Mgb3IgaXJx
cyBpbiBfQ1JTClsgICAgMC4zMzEyOTZdIGk4MDQyOiBXYXJuaW5nOiBLZXlsb2NrIGFjdGl2
ZQpbICAgIDAuMzQ2NDYxXSBFTkVSR1lfUEVSRl9CSUFTOiBTZXQgdG8gJ25vcm1hbCcsIHdh
cyAncGVyZm9ybWFuY2UnClsgICAgMC44OTI2ODBdIHdtaV9idXMgd21pX2J1cy1QTlAwQzE0
OjAxOiBXUUJDIGRhdGEgYmxvY2sgcXVlcnkgY29udHJvbCBtZXRob2Qgbm90IGZvdW5kClsg
ICAgMS43MDYyNTJdIGRldmljZS1tYXBwZXI6IGNvcmU6IENPTkZJR19JTUFfRElTQUJMRV9I
VEFCTEUgaXMgZGlzYWJsZWQuIER1cGxpY2F0ZSBJTUEgbWVhc3VyZW1lbnRzIHdpbGwgbm90
IGJlIHJlY29yZGVkIGluIHRoZSBJTUEgbG9nLgpbICAgMjAuMjIzNDc5XSBpMmNfaGlkX2Fj
cGkgaTJjLUVMQU4yNUI0OjAwOiBpMmNfaGlkX2dldF9pbnB1dDogSVJRIHRyaWdnZXJlZCBi
dXQgdGhlcmUncyBubyBkYXRhClsgICAyMC42MjkxMTFdIHRoZXJtYWwgdGhlcm1hbF96b25l
MTA6IGZhaWxlZCB0byByZWFkIG91dCB0aGVybWFsIHpvbmUgKC02MSkKWyAgIDIxLjE4Njk0
MF0gYmxvY2sgbnZtZTBuMTogTm8gVVVJRCBhdmFpbGFibGUgcHJvdmlkaW5nIG9sZCBOR1VJ
RApbICAgMjMuMjA0ODM5XSBCbHVldG9vdGg6IGhjaTA6IFJlYWRpbmcgc3VwcG9ydGVkIGZl
YXR1cmVzIGZhaWxlZCAoLTE2KQpbICAgMjMuMjA0ODQ2XSBCbHVldG9vdGg6IGhjaTA6IEhD
SSBMRSBDb2RlZCBQSFkgZmVhdHVyZSBiaXQgaXMgc2V0LCBidXQgaXRzIHVzYWdlIGlzIG5v
dCBzdXBwb3J0ZWQuClsgICA0OS40NTg5ODJdIHBzbW91c2Ugc2VyaW8xOiBGYWlsZWQgdG8g
ZGlzYWJsZSBtb3VzZSBvbiBpc2EwMDYwL3NlcmlvMQpbICAgNjMuNzkyNzA1XSBkb25lLgpb
ICAgNzIuNTE1NDA2XSBwc21vdXNlIHNlcmlvMTogRmFpbGVkIHRvIGRpc2FibGUgbW91c2Ug
b24gaXNhMDA2MC9zZXJpbzEKWyAgNDMyLjgyNDY5OF0gRE1BUjogRFJIRDogaGFuZGxpbmcg
ZmF1bHQgc3RhdHVzIHJlZyAyClsgIDQzMi44MjQ3MDldIERNQVI6IFtJTlRSLVJFTUFQXSBS
ZXF1ZXN0IGRldmljZSBbZjA6MWYuMF0gZmF1bHQgaW5kZXggMHgwIFtmYXVsdCByZWFzb24g
MHgyNV0gQmxvY2tlZCBhIGNvbXBhdGliaWxpdHkgZm9ybWF0IGludGVycnVwdCByZXF1ZXN0
ClsgIDQzMy4wODgwMDFdIGF0a2JkIHNlcmlvMDogRmFpbGVkIHRvIGRlYWN0aXZhdGUga2V5
Ym9hcmQgb24gaXNhMDA2MC9zZXJpbzAKWyAgNDMzLjUxNTQxMV0gZG9uZS4KWyAgNDM1LjI0
NTY2MV0gQmx1ZXRvb3RoOiBoY2kwOiBSZWFkaW5nIHN1cHBvcnRlZCBmZWF0dXJlcyBmYWls
ZWQgKC0xNikKWyAgNDM1LjI0NTY5MF0gQmx1ZXRvb3RoOiBoY2kwOiBIQ0kgTEUgQ29kZWQg
UEhZIGZlYXR1cmUgYml0IGlzIHNldCwgYnV0IGl0cyB1c2FnZSBpcyBub3Qgc3VwcG9ydGVk
LgoKJCBzdWRvIGh3LXByb2JlIC0tYWxsIC0tdXBsb2FkClByb2JlIGZvciBoYXJkd2FyZSAu
Li4gT2sKUmVhZGluZyBsb2dzIC4uLiBPawpVcGxvYWRlZCB0byBEQiwgVGhhbmsgeW91IQoK
UHJvYmUgVVJMOiBodHRwczovL2xpbnV4LWhhcmR3YXJlLm9yZy8/cHJvYmU9YjYwNDc1NzU2
ZQo=

--------------lObZuw1KZy2IfqGm8qpbyXEj--
