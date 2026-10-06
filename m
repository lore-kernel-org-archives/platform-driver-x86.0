Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0F73D9DB1
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Oct 2026 13:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294124; cv=none; b=FFxZRf0AKqkEnFJT4WLvEkk8pqswYLNoNB7mzqsrlInkvBkotJmlqjXEFtYsFwoT8LifOxpXxchR8Va1b5XRegB7Te5oiQr0tZnlaItDHOsTo/wcjiy6Q4z5Za3EdWapmfZtX3hYndtsFU5m6E+Vwu1LWK0GBtrEd99SRHPSOOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294124; c=relaxed/simple;
	bh=ekt8N2yJIF0aI2voB2sok+y+8F61TkIgWj53GoqwfbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I31remEb+f9G6BqtgmFRz6fezDrKJpbVx3EgjnDIsvN1b7INPZ/slBBxsNNFSCVZdybHwLtcl5r/92HTUj1aqh8SyUeWJ/a11yWXIOJkjerx6zj7Im3MXs0EKAd1HZzW+x+NzcgmLR4U77l2njBed7oFeKSYsehDqwjK1gxZpaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=RK3PNlBq; arc=none smtp.client-ip=212.27.42.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="RK3PNlBq"
Received: from [IPV6:2a02:8429:1b42:4200::30] (unknown [IPv6:2a02:8429:1b42:4200::30])
	(Authenticated sender: julien.robin28@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id 54CC96013D;
	Tue,  6 Oct 2026 15:41:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1791294112;
	bh=ekt8N2yJIF0aI2voB2sok+y+8F61TkIgWj53GoqwfbY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RK3PNlBqFIKFGR826I5WTepgmuU07DjiiNwJjEOBuK2NnTOt/+5maFkvJtlMuD/sb
	 51h3GhCyJBRrYdeK4uem5bGxoDRYicKHuK3yPx9LBSsq6ZancslQuzKxzborwHaVKa
	 7oBoSzjsquIE00XF1aOXv0uyD4tjdi5qHTBZYnCoPidA2ahBN2a2PbXHAuQUw8nvpb
	 auLJv+8SWzbdNHmmvYoyNWS+wrPnMeV5aSYXqPk1ITXMhB2BkRz51/LyLzNQjEtP/L
	 QBx8QKDw8gX7va+6n+/3C5dp/vyYel9/6XeSY6UWfTcJoeuBK07+dDezUNAdSPl+Ap
	 wE9JePqCcrZhA==
Message-ID: <4ce40bdd-87b4-4ba2-bf04-01f854680151@free.fr>
Date: Tue, 6 Oct 2026 15:41:48 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hp_wmi: Unknown EC layout for board 8C9C
To: Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
 Suryansh Singh <technosfan14@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
References: <965dd816-dd66-4318-be8d-330a40209f67@free.fr>
 <asPy5Q5wNYaMzTqJ@archlinux>
Content-Language: fr
From: Julien ROBIN <julien.robin28@free.fr>
In-Reply-To: <asPy5Q5wNYaMzTqJ@archlinux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/5/26 10:00 PM, Krishna Chomal wrote:
> On Sun, Oct 04, 2026 at 12:45:58AM +0200, Julien ROBIN wrote:
>> Hi there, I got the following message into my dmesg log:
>>
>> hp_wmi: Unknown EC layout for board 8C9C. Thermal profile readback will be disabled. Please report this to platform-driver-x86@vger.kernel.org
> 
> Hi,
> 
> Thanks for reporting.
> 
>> I may help a little bit here, as two years ago I did the initial work to get fan speed reading and setting, and thermal profiles for the HP Victus 16s-1034nf (8C9C) which I'm still using. Nice to see new people added new things above this! I hope the "victus_s" naming scheme I introduced to differentiate from previous driver behavior when adding support to the Victus 16s-1034nf didn't turn to be inconsistent with added models names using the same behavior since then.
> 
> First of all, thank you for sending those patches. A lot of the current
> infrastructure (fan controls/gpu power modes/etc) are built on top of
> that.
> 
> As for the victus_s naming scheme, we did stick with it for a while, but
> recently there have been some efforts in removing the inconsistent
> naming [1].
>

Thanks for the information, yes knowing the names of added models to stick the "victus_s" code parts, this naming may of course be updated and improved as soon as a clever and cleaner new behavior naming scheme is found to better differenciate them. In case behavior differences aren't due to being omen or victus laptops, but are based on clearly spotted others details (generation, CPU brand or anything else) this may help getting more inspired and less confusing names for all of these rival behaviors.
>> With nbfc-linux and ec_probe monitor command, I managed to check again EC offsets/registers meaning for this 8C9C laptop (currently running BIOS F.17 11/18/2025).
>>
>> 0xAE offset is related to thermal profile, it shows 3 possible values:
>> - 0x00 when in performance mode (while HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE = 0x01)
>> - 0x01 when placed in balanced or low-power modes,
>> - 0x02 when the laptop CPU power limits are back to default / fallback state: turns out this happens when an HPWMI_FAN_COUNT_GET_QUERY hasn't been played during the last 120 seconds. See hp_wmi_get_fan_count_userdefine_trigger() function.
>>
>> However when the 0xAE register value is at 0x02, playing an HPWMI_FAN_COUNT_GET_QUERY makes the 0xAE register back to its previous mode (and CPU power limits are set accordingly). So when value is 0x02, the previous value is kept (and may be restored from) somewhere else, but it doesn't seem to be from any other EC register. Even worse, when going to performance mode, HPWMI_SET_PERFORMANCE_MODE command is applying HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE = 0x01 which cause the 0xAE register to go to 0x00, so the logic of this EC register is different from what existed for others models (where the EC register value was the same as the one provided by the HPWMI_SET_PERFORMANCE_MODE query).
> 
> Correct, this is an important limitation in our current approach where
> we reverse map EC read values to thermal profile parameters (provided
> by the HPWMI_SET_PERFORMANCE_MODE query), and that doesn't always cover
> it fully on all boards.
> 
>> Because of these sudden changes about EC registers behavior, I wasn't sure insisting on direct reading into EC registers was still going to be a sustainable approach for reading back thermal profile on this new kind of laptop. Facing BIOS updates, or tiny changes between similar models, may even cause such approach to break without warnings. It would also need people adding similar laptops to ensure 0xAE is still the right EC register to read, and double check the values are behaving the same. Which is why at startup, I preferred the mode to be initially set to balanced: to both cleanly ensure and say back which mode is enabled, without relying on risky tricks.
> 
> I am not sure how the current approach would be "risky" because we only
> derive real platform profile state from EC when we have explicitly
> identified the relevant offsets. For unknown boards, it still defaults
> to balanced for a clean start.
> 
> That being said, I fully agree that with BIOS updates, the offsets *may*
> shift leading to potential regressions and we should avoid this method.
> 
>> But despite this personal opinion, for the 8C9C, playing an HPWMI_FAN_COUNT_GET_QUERY, and guessing the current mode is performance mode (0x01) when 0xAE register says 0x00, and differentiating balanced and low-power modes when 0xAE register value is 0x01, may probably be done by looking at victus_s_gpu_thermal_profile_get(), as prepared into platform_profile_victus_s_get_ec(): I see that Krishna Chomal had this idea. As I'm a beginner into kernel development I prefer let you decide whether it's reliable enough, and/or worth the effort.
> 
> So, I was working on a series to fix this very issue, but now that you
> have brought it up, I think its a good time to ask you and Ilpo Järvinen
> if removing **ALL** EC offsets from this driver and relying on only WMI
> queries would be a good idea.

Personnaly I wouldn't dare removing the work from previous contributors from the kernel 😅 but if (and only if) having the laptops automatically set to balanced mode at startup is fine for everyone (so that no ones deplores not being able to recover the previous mode on startup, and calls it a regression), it sure simplifies the driver, and future work on it.

> Currently, the following four EC registers have been identified in this
> driver:
> 1. HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET (0x59) [READ-ONLY]:
>    Used in platform_profile_victus_s_get_ec() from params->ec_tp_offset
>    Used to reverse map the thermal profile parameter and derive the real
>    hardware state.
> 
>    platform_profile_victus_s_get_ec() itself is used in two places:
>    a. thermal_profile_setup() during driver init to re-apply hardware
>       state.
>       We can remove the call here and default to Balanced
>       mode like Julien had done in an earlier commit. [2]
>       I think this is fair because the official Omen Gaming Hub software
>       on Windows does the same when re-installed.
>    b. victus_s_powersource_event() - to derive actual_profile. This
>       Julien needs to confirm - if we can avoid doing an EC read by
>       directly taking active_platform_profile, since in my opinion,
>       it should be same.
> 
> 2. HP_OMEN_EC_THERMAL_PROFILE_OFFSET (0x95) [READ_ONLY]:
>    Used in three places:
>    a. platform_profile_victus_s_get_ec(): Already mentioned above.
>    b. platform_profile_omen_get_ec()
>    c. platform_profile_victus_get_ec()
> 
>    (b) and (c) are both used in omen_powersource_event() for the same
>        reason as victus_s line as mentioned above. I think here also
>        we can fallback on the cached active_platform_profile (please
>        let me know if otherwise).

This is what I thought too, when realizing I wasn't quite able to read it by EC at that time. If platform_profile is applied and kept cached before going to sleep or changing power source, then being able to re-apply it when needed seemed fine to me.
I guess some OS settings and user defined preferences may automatically ask for a platform profile change under user defined circumstances (going on battery, after some fixed idle time, or anything), but I came to the conclusion that it's not causing troubles here, assuming the driver is able keep its own mode as long as not asked to change, and able to apply when a mode change is requested.

> 
> 3. HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET (0x62) [WRITE-ONLY]
> 4. HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET (0x63) [WRITE-ONLY]
> 
> (3) and (4) are both used during set_ec path of the legacy Omen line.
> However, since I do not own this type of device, I can't comment if it
> is entirely needed or not. Interesting though, this is used in only
> three devices: omen_timed_thermal_profile_boards[]. But anyway, I will
> try to contact someone who sent these patches and see if I can get their
> acpidump for more info. I have a feeling that at least *_TIMER_OFFSET
> can be removed since the delayed_workqueue would cover its use-case,
> and obviously because (afaik) the official Omen Gaming Hub does not
> document/use any EC registers and relies on WMI queries only.
> 

When I looked at it at that time, I didn't find any EC register showing such behavior into my device (but of course I assumed people who implemented that on others laptops were right, their laptop were just different from mine). However if it turns out writes to these EC registers can be replaced by new WMI queries approach currently used for newer devices, it would be a win!

I saw these new calls to mod_delayed_work() which have been added when setting manual or max fan speed, so that in the end, hp_wmi_get_fan_count_userdefine_trigger() get called periodically. This approach is pretty cool! And may be generalized to thermal profiles too (as it turns out, when letting fan speed to automatic, and not doing anything with platform_profiles for more than 120 seconds, CPU power limits are back to fallback until something calls hp_wmi_get_fan_count_userdefine_trigger again). Nothing urgent as (in my case) CPU power limits are just reducing a little bit after 120 seconds when not asking for max fan speed: turns out to be safe. Wasn't sure at that time if/how this device specific thing had to be settled from the hp-wmi driver, but delayed_workqueue seems to be the right way to go.

>> In case you need me to do some tests and gather more information feel free to ask me!
> 
> Would it be possible for you to share your acpidump here? Not that we
> need it, but I was just curious why 8C9C needs manual triggering of CPU
> limits during power source change.
> 
> Thanks.
> 
> [1]: https://lore.kernel.org/platform-driver-x86/20260615091034.987029-2-radheykalra901@gmail.com
> [2]: https://lore.kernel.org/all/1c00f906-8500-41d5-be80-f9092b6a49f1@free.fr

Here is the acpidump of my device (hex and bin format)
 - https://pix-server-sorel.luoss.fr/Manual/Linux/HP-WMI/HP-Victus-16-s1034nf-8C9C-BIOS-F18-2026-10-06.hex
 - https://pix-server-sorel.luoss.fr/Manual/Linux/HP-WMI/HP-Victus-16-s1034nf-8C9C-BIOS-F18-2026-10-06.tar

I have an older (F.11) BIOS version acpidump here, format seems to change a little bit, but it's hex 
 - https://pix-server-sorel.luoss.fr/Manual/Linux/HP-WMI/Bug-Report-2024-12-12/fwts-output/acpidump.log

About victus_s_powersource_event() to manually trigger CPU power limits change, I remember the problem only existed when performance mode was active, it was only about CPU power limits (not GPU) and didn't exist with any of the others modes (balanced, low-power or fallback). Maximum/excessive power limits were kept despite going from AC to battery, and I believe they also weren't restored correctly when going back on AC. On Windows with Omen Gaming Hub this seemed to be addressed by rewriting power limits on power source change. As I updated BIOS to F.18 I'll check if anything evolved about this.

I'll do the tests tonight: Unloading hp-wmi driver and looking at RyzenAdj allows testing what happens when nothing is done by hp-wmi driver. But I need physical access to the device to unplug the cord, and also to put it to sleep mode, waking it up.
I'll keep you informed of the results.

> 
>> Adding Cc to Suryansh Singh as I see recent related work to this EC reading offset of thermal profile on another Victus laptop, in case it helps having a better overview on this.
>>
>> Best regards,
>> Julien ROBIN
>>
>> PS:
>> Others identified EC offsets for my 8C9C by the way:
>>
>> - 0x8F register value is 0x00 unless performance mode has been enabled. It may be related to GPU gpu_ctgp_enable being set to true, in which case the register value goes to 0x04.
>> As opposed to 0xAE register, which may fallback to its default value when hp-wmi driver isn't active for more than 120 seconds, 0x8F register keeps its value. This may be tested more deeply if needed.
>>
>> - 0x8A, 0x8B and 0xFF registers are reflecting CPU power limits. 0x8B and 0xFF registers show the same values which are equal to "PPT LIMIT SLOW" from RyzenAdj, while 0x8A register show the value that appears in both "PPT LIMIT FAST" and "STAPM LIMIT" from RyzenAdj.
>>
>> - 0xB0 register is showing CPU temperature in celsius, 0xB4 is showing GPU temperature celsius, 0xB2 and 0xA7 registers also seems to give measured temperatures in celsius but it doesn't seem to be CPU nor GPU.
>>
>> - 0x11 and 0x14 register are linked to target fan speed; values are 0x12 at default fan speed mode (with "fan always on" enabled into the BIOS, otherwise 0x00), and values are 0x3A when maximum fan speed is enabled. It's not showing actual measured values, as during fan speed acceleration or deceleration, values aren't moving at all.

