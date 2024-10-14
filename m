Received: from juniper.fatooh.org (juniper.fatooh.org [173.255.221.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74281CC179
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Oct 2024 22:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.221.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728945181; cv=none; b=s8o89a63KwnExtPE3JoAB0WSAyncKn39hwHaFqTSASxfOPnyGYIZAAyxPcRCMjNeR9rskqGK3aQk4RShkb+8X1+Rbv55NHmohBXiztyB/mZ8tKKT0AD17/7290MrwnvgzpaUwnKCuhTnjO1ttf5tcuo8YyjByoDc2gk/GkDx+Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728945181; c=relaxed/simple;
	bh=bMAY4x455b5OwgE0FrvGgoVQpARUcpH72u2XYpnxcSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=m/ARR7Jz1zTc5pQaJOxtL231ZyNdZGYU1dik563opuk10e0vEROGk+CIxdvkk0OhVBNhEfOrN77Nn6EGkkBS5EI5+nTqaOCWkWhF6kBSbKNQZoPA6ynKGj7Aq3682eCOZL8HlBAenTDEh1nAF2kyp8FtoORPxwyU+y0R02h39gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org; spf=pass smtp.mailfrom=fatooh.org; dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b=TRBSk4SZ; arc=none smtp.client-ip=173.255.221.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fatooh.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b="TRBSk4SZ"
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPS id 995A240255;
	Mon, 14 Oct 2024 15:32:53 -0700 (PDT)
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	by juniper.fatooh.org (Postfix) with ESMTP id 7B26F4027D;
	Mon, 14 Oct 2024 15:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding; s=dkim; bh=PtTOmJE3/YnC
	e/+nvg49jM2evBA=; b=TRBSk4SZ/2833D5VboNSMkbmy7F4tJgcGXrh2VpG2VoZ
	6Gqq7U18FLx3+GE0ecn9seV+hu8/viBMYxR3Tih9q1li3wjUKtyhUFCkxuOuC+eS
	MEcs3fqDdYnZR/PBNKc3X1qtgCVlQR3hZ9PSde3CGJzRBcS/p9fyHXxRGizkRIs=
DomainKey-Signature: a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=dkim; b=YXOOiY
	ukD0KHZ07pdAYy8qyh47bOaduEtuMOOr8mKiHqoAv/qC/B+TlYTBjxDWP7H7SAMj
	Qtlr0MhoLetgHgmhw7ofO1F2A2UoLCXuldlvdj6UwLLhy6LcCxojoPcGpeBap7xw
	RTbCj4EeO5FUHbaQrrzpPG1NA+FQcjTHmuGDw=
Received: from [198.18.0.3] (unknown [104.184.153.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPSA id 6B8B940255;
	Mon, 14 Oct 2024 15:32:53 -0700 (PDT)
Message-ID: <4d0d49eb-c407-4d63-847b-69f155449850@fatooh.org>
Date: Mon, 14 Oct 2024 15:32:52 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: please help with intermittent s2idle problem on AMD laptop
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 "Goswami, Sanket" <Sanket.Goswami@amd.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <48c7aa22-7c0d-40af-80d4-538fd16327d1@fatooh.org>
 <MN0PR12MB61028BD76B3F88121289BAAB9C442@MN0PR12MB6102.namprd12.prod.outlook.com>
 <a6f7dc24-b56f-4f69-8065-d99dc43e7b06@amd.com>
From: Corey Hickey <bugfood-ml@fatooh.org>
Content-Language: en-US
In-Reply-To: <a6f7dc24-b56f-4f69-8065-d99dc43e7b06@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-10-13 23:58, Shyam Sundar S K wrote:
>> As far as I can tell from the code, I need to load the amd_pmc module with enable_stb=1.
>>
>> lizard:~# rmmod amd_pmc
>> lizard:~# modprobe amd_pmc enable_stb=1
>>
>> If I do that, though:
>> 1. There is an error: 'amd_pmc AMDI0009:00: SMU cmd failed. err: 0xff'
> 
> this is expected as the command is not supported on PMFW loaded on
> your system.
> 
> and..
> 
> ret=-5 is expected on your system, because it does not support EFR
> (Enhanced Firmware Reporting).
> 
>> 2. There is a kernel WARNING (which I will paste in full below):
>>      ioremap on RAM at 0x0000000000000000 - 0x0000000000ffffff 3. The expected files in debugfs do not appear.
>>
> 
> This is happening because, the ioremap() is happening for addr 0x0.
> Ideally you should have got the physical address from the mailbox
> command. But that does not seem to happen.
> 
> I suspect that on your system, the STB is not enabled. Can you check
> the following path to see if that helps?
> 
> AMD CBS -> SMU Debug Options -> SMU Feature Config Limits -> STB To
> DRAM Log <Enabled>
> 
> If DRAM log is disabled, then that should be enabled to attempt to
> take a stb log.

Unfortunately, the AMD CBS menu does not seem to be available in this
laptop BIOS config. I can try checking with Framework support for that,
but I don't know if I will have any success.

> No need to look at mp2_stb.c as it is meant for chromebook use-cases.
> So, it will not take this path on your framework system.

Ah ok, thanks for clarifying.

> Note that I have looked at your debug patch, but it may not be in the
> right direction.
> 
> I would suggest:
> - reload the amd_pmc driver with dyndbg
> - Put the system to sleep "echo mem > /sys/power/state" and take the
> dmesg logs
> - get the dump of /sys/kernel/debug/amd_pmc/s0ix_stats and
> /sys/kernel/debug/amd_pmc/smu_fw_info

I had not used dyndbg before. I found the documentation and ran this:


lizard:~# rmmod amd_pmc
lizard:~# modprobe amd_pmc dyndbg='file drivers/platform/x86/amd/pmc/* +p'

The result of this is:

lizard:~# grep amd_pmc /proc/dynamic_debug/control
drivers/platform/x86/amd/pmc/mp2_stb.c:126 [amd_pmc]amd_mp2_process_cmd =p "Invalid STB data\n"
drivers/platform/x86/amd/pmc/mp2_stb.c:132 [amd_pmc]amd_mp2_process_cmd =p "Unsupported length\n"
drivers/platform/x86/amd/pmc/pmc.c:276 [amd_pmc]amd_pmc_stb_debugfs_open_v2 =p "S2D force flush not supported: %d\n"
drivers/platform/x86/amd/pmc/pmc.c:448 [amd_pmc]amd_pmc_get_smu_version =p "SMU program %u version is %u.%u.%u\n"
drivers/platform/x86/amd/pmc/pmc.c:609 [amd_pmc]amd_pmc_idlemask_read =p "SMU idlemask s0i3: 0x%x\n"
drivers/platform/x86/amd/pmc/pmc.c:678 [amd_pmc]amd_pmc_dump_registers =p "AMD_%s_REGISTER_RESPONSE:%x\n"
drivers/platform/x86/amd/pmc/pmc.c:681 [amd_pmc]amd_pmc_dump_registers =p "AMD_%s_REGISTER_ARGUMENT:%x\n"
drivers/platform/x86/amd/pmc/pmc.c:684 [amd_pmc]amd_pmc_dump_registers =p "AMD_%s_REGISTER_MESSAGE:%x\n"
drivers/platform/x86/amd/pmc/pmc.c:832 [amd_pmc]amd_pmc_verify_czn_rtc =p "alarm not enabled\n"
drivers/platform/x86/amd/pmc/pmc.c:854 [amd_pmc]amd_pmc_verify_czn_rtc =p "wakeup timer programmed for %lld seconds\n"

...so I think I got that right, but let me know if you meant something
different.

I wasn't sure if you meant for me to run this with enable_stb=1 or not,
so first I did this with the default of enable_stb omitted.


lizard:~# echo 0 > /sys/devices/pnp0/00:01/rtc/rtc0/wakealarm && echo +5 > /sys/devices/pnp0/00:01/rtc/rtc0/wakealarm && echo mem > /sys/power/state
lizard:~# dmesg -r > 2024-10-14/dmesg.default
lizard:~# cp -p /sys/kernel/debug/amd_pmc/s0ix_stats 2024-10-14/s0ix_stats.default
lizard:~# cp -p /sys/kernel/debug/amd_pmc/smu_fw_info 2024-10-14/smu_fw_info.default

In the dmesg, I don't see any further debug messages; I don't think any
calls to dev_dbg() are being run (I could be wrong).

Here are the files captured from debugfs:


lizard:~# tail -n +1 2024-10-14/s*
==> 2024-10-14/s0ix_stats.default <==
=== S0ix statistics ===
S0ix Entry Time: 38004185743
S0ix Exit Time: 38177312687
Residency Time: 3606811

==> 2024-10-14/smu_fw_info.default <==

=== SMU Statistics ===
Table Version: 3
Hint Count: 1
Last S0i3 Status: Success
Time (in us) to S0i3: 385104
Time (in us) in S0i3: 3606811
Time (in us) to resume from S0i3: 115504

=== Active time (in us) ===
DISPLAY  : 0
VDD      : 0
ACP      : 0
VCN      : 0
ISP      : 0
DF       : 0
USB3_0   : 0
USB3_1   : 0
USB3_3   : 0
USB3_4   : 0
USB4_0   : -4647714815446351872
USB4_1   : 0
MPM      : 8366
JPEG     : 0
IPU      : 0
UMSCH    : 0


The USB4_0 value stands out as anomalous; I don't know how significant that
is.


I then retried with enable_stb=1

lizard:~# rmmod amd_pmc
lizard:~# modprobe amd_pmc enable_stb=1 dyndbg='file drivers/platform/x86/amd/pmc/* +p'
lizard:~# echo 0 > /sys/devices/pnp0/00:01/rtc/rtc0/wakealarm && echo +5 > /sys/devices/pnp0/00:01/rtc/rtc0/wakealarm && echo mem > /sys/power/state
lizard:~# dmesg -r > 2024-10-14/dmesg.enable_stb


This time, I get some debug lines from amd_pmc_dump_registers(). I am
including my debug patch here--I think it gives a bit of context that
I can understand better.


<6>[ 1143.655752] amd_pmc_probe: 1
<6>[ 1143.655763] amd_pmc_probe: 2
<6>[ 1143.655764] amd_pmc_probe: 3
<6>[ 1143.655773] amd_pmc_probe: 4
<6>[ 1143.655796] amd_pmc_probe: 5
<6>[ 1143.655797] amd_pmc_probe: 6
<6>[ 1143.655798] amd_pmc_is_stb_supported cpu_id: 5352
<7>[ 1143.684758] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_RESPONSE:1
<7>[ 1143.684768] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_ARGUMENT:100000
<7>[ 1143.684770] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_MESSAGE:85
<6>[ 1143.684772] amd_pmc_s2d_init size: 1048576
<3>[ 1143.684873] amd_pmc AMDI0009:00: SMU cmd failed. err: 0xff
<7>[ 1143.684886] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_RESPONSE:ff
<7>[ 1143.684894] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_ARGUMENT:5
<7>[ 1143.684901] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_MESSAGE:85
<6>[ 1143.684903] amd_pmc_s2d_init s2d_dram_size ret: -5
<7>[ 1143.715734] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_RESPONSE:1
<7>[ 1143.715741] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_ARGUMENT:0
<7>[ 1143.715744] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_MESSAGE:85
<7>[ 1143.746780] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_RESPONSE:1
<7>[ 1143.746790] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_ARGUMENT:0
<7>[ 1143.746793] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_MESSAGE:85
<6>[ 1143.746795] amd_pmc_s2d_init p_a_l: 0 p_a_hi: 0 s_p_a: 0 sz: 16777216


AMD_S2D_REGISTER_MESSAGE always seems to be 0x85.

The files in /sys/kernel/debug/amd_pmc/ are not available in this case--
amd_pmc_probe() aborts before creating them.

> if the dmesg and debugfs logs are not helpful, then you can enable the
> BIOS settings as described above to take the STB log.
> 
> The stb log can be obtained by cat /sys/kernel/debug/amd_pmc/stb_read
>> stb_data.bin and please put that info on bugzilla.

As mentioned, I don't seem to have the ability to enable the STB log,
but I posted the dmesg output here, in case it's any use:

https://fatooh.org/tmp/dmesg.enable_stb

I can put that in bugzilla if you need.

Thanks,
Corey
