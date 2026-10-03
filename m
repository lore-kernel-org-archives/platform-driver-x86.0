Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD58233936F
	for <platform-driver-x86@vger.kernel.org>; Sat,  3 Oct 2026 22:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791067583; cv=none; b=hJOFZQwH/c8mxb0KuInZzVVXPGU9J2b7nnV3f4I/laKXWyPqm206QUwaEnPf5+SEvHZWnZVv/QyUX8aS8C/UyRcaz1IwJ6FKqUPUqGmFk2BlmjCm5BvX795N5+6ZPCcUiWPAmU52T1Bm0zBLFeoD2P1IJ8lYPdobpWKY4VfhLZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791067583; c=relaxed/simple;
	bh=gFL4h/Akh1s5XIZgxn9bdFR02pSm0EnKizn7VQqLu/o=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ehgbJqC69Ua47knJx8gGuLo1woHdJkXG6KVa02RkCvs/Ztdeu8BYvQLEyNK675hAbHyQUzfxGCAxDjCGEfAYJ/O8WvCqulQLopKmppb0AUbEvG+5YqEyLok3mHFjJIFC3czRlf5tCtmDLz4zeMn8CoFalmMoqLw26PvltODcd9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=kHt7eAgX; arc=none smtp.client-ip=212.27.42.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="kHt7eAgX"
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 99F684D75D
	for <platform-driver-x86@vger.kernel.org>; Sun,  4 Oct 2026 00:46:10 +0200 (CEST)
Received: from [IPV6:2a02:842a:8223:5500:67a9:282d:5e8b:7454] (unknown [IPv6:2a02:842a:8223:5500:67a9:282d:5e8b:7454])
	(Authenticated sender: julien.robin28@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 18051B00548;
	Sun,  4 Oct 2026 00:45:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1791067563;
	bh=gFL4h/Akh1s5XIZgxn9bdFR02pSm0EnKizn7VQqLu/o=;
	h=Date:To:Cc:From:Subject:From;
	b=kHt7eAgXxePobb9N8MeZqrUpN9iis9EYQ6ZNz9UeUtTwS4UI+IA35zq3dl4nytHz4
	 QwXcyzYE2QMOC9C+Q3j9VRoeGK5h13HiQBDFrZyMaELpmb0ZxwwQ9MRxYpGgjvRmx+
	 b8+kF9lFrc94OXShJ9IqBv2eeIGZokLo4i4sOkx6166DHIcQG4mVnwRIsMOqhL/6n3
	 DNYd/iuSMyLYfPg1LD+cf3jQkllbfZ0brRwiyELzs19rbmw0UX7e4t4sRk6i9Ms1B/
	 Qd7GrCvteF73rc6cZxCaktm6fuEfHCMAFX0Njude4kmTZBsz2Ihvf/6a79u9no03Q7
	 EVsbIIOIp+B1A==
Message-ID: <965dd816-dd66-4318-be8d-330a40209f67@free.fr>
Date: Sun, 4 Oct 2026 00:45:58 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: platform-driver-x86@vger.kernel.org,
 Krishna Chomal <krishna.chomal108@gmail.com>
Cc: Suryansh Singh <technosfan14@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
From: Julien ROBIN <julien.robin28@free.fr>
Subject: hp_wmi: Unknown EC layout for board 8C9C
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi there, I got the following message into my dmesg log:

hp_wmi: Unknown EC layout for board 8C9C. Thermal profile readback will be disabled. Please report this to platform-driver-x86@vger.kernel.org

I may help a little bit here, as two years ago I did the initial work to get fan speed reading and setting, and thermal profiles for the HP Victus 16s-1034nf (8C9C) which I'm still using. Nice to see new people added new things above this! I hope the "victus_s" naming scheme I introduced to differentiate from previous driver behavior when adding support to the Victus 16s-1034nf didn't turn to be inconsistent with added models names using the same behavior since then.

With nbfc-linux and ec_probe monitor command, I managed to check again EC offsets/registers meaning for this 8C9C laptop (currently running BIOS F.17 11/18/2025). 

0xAE offset is related to thermal profile, it shows 3 possible values:
 - 0x00 when in performance mode (while HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE = 0x01)
 - 0x01 when placed in balanced or low-power modes,
 - 0x02 when the laptop CPU power limits are back to default / fallback state: turns out this happens when an HPWMI_FAN_COUNT_GET_QUERY hasn't been played during the last 120 seconds. See hp_wmi_get_fan_count_userdefine_trigger() function.

However when the 0xAE register value is at 0x02, playing an HPWMI_FAN_COUNT_GET_QUERY makes the 0xAE register back to its previous mode (and CPU power limits are set accordingly). So when value is 0x02, the previous value is kept (and may be restored from) somewhere else, but it doesn't seem to be from any other EC register. Even worse, when going to performance mode, HPWMI_SET_PERFORMANCE_MODE command is applying HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE = 0x01 which cause the 0xAE register to go to 0x00, so the logic of this EC register is different from what existed for others models (where the EC register value was the same as the one provided by the HPWMI_SET_PERFORMANCE_MODE query).

Because of these sudden changes about EC registers behavior, I wasn't sure insisting on direct reading into EC registers was still going to be a sustainable approach for reading back thermal profile on this new kind of laptop. Facing BIOS updates, or tiny changes between similar models, may even cause such approach to break without warnings. It would also need people adding similar laptops to ensure 0xAE is still the right EC register to read, and double check the values are behaving the same. Which is why at startup, I preferred the mode to be initially set to balanced: to both cleanly ensure and say back which mode is enabled, without relying on risky tricks.

But despite this personal opinion, for the 8C9C, playing an HPWMI_FAN_COUNT_GET_QUERY, and guessing the current mode is performance mode (0x01) when 0xAE register says 0x00, and differentiating balanced and low-power modes when 0xAE register value is 0x01, may probably be done by looking at victus_s_gpu_thermal_profile_get(), as prepared into platform_profile_victus_s_get_ec(): I see that Krishna Chomal had this idea. As I'm a beginner into kernel development I prefer let you decide whether it's reliable enough, and/or worth the effort.

In case you need me to do some tests and gather more information feel free to ask me!
Adding Cc to Suryansh Singh as I see recent related work to this EC reading offset of thermal profile on another Victus laptop, in case it helps having a better overview on this.

Best regards,
Julien ROBIN

PS:
Others identified EC offsets for my 8C9C by the way:

 - 0x8F register value is 0x00 unless performance mode has been enabled. It may be related to GPU gpu_ctgp_enable being set to true, in which case the register value goes to 0x04.
As opposed to 0xAE register, which may fallback to its default value when hp-wmi driver isn't active for more than 120 seconds, 0x8F register keeps its value. This may be tested more deeply if needed.

 - 0x8A, 0x8B and 0xFF registers are reflecting CPU power limits. 0x8B and 0xFF registers show the same values which are equal to "PPT LIMIT SLOW" from RyzenAdj, while 0x8A register show the value that appears in both "PPT LIMIT FAST" and "STAPM LIMIT" from RyzenAdj.

 - 0xB0 register is showing CPU temperature in celsius, 0xB4 is showing GPU temperature celsius, 0xB2 and 0xA7 registers also seems to give measured temperatures in celsius but it doesn't seem to be CPU nor GPU.

 - 0x11 and 0x14 register are linked to target fan speed; values are 0x12 at default fan speed mode (with "fan always on" enabled into the BIOS, otherwise 0x00), and values are 0x3A when maximum fan speed is enabled. It's not showing actual measured values, as during fan speed acceleration or deceleration, values aren't moving at all.
