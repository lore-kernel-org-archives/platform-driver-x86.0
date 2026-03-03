Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5813932C7;
	Tue,  3 Mar 2026 21:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772574656; cv=none; b=SFmcOk2fXrzhrfKwzNzvgRly7OFijbHSlIb+mxPL01LMBZll8D7YzPaIYPhS54ND/lwkMG2LJFgH6iWcsRXHZ7A1a9SrxSsIiPZ9y3KfwDU2U/S2071usVuHSOXUD0EMc6KFUqLM3+Okzg2Grci3u0lpOB7Tec69A78cHpIq8ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772574656; c=relaxed/simple;
	bh=A0Rus/J02qDdVsWpNaSS+96xELX1PmIosAwR0v3CoJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mcJFRrDSnb4jgtQ7vm5gKmSmo6jm6OJga5/NNP1AH6I6IIKeuctUFdbWVgeN0TCRYbgBBhBDiBEb4dsrCv5BXX/C2QfiY6cefs6HAxyvNRsVoXzJsMdgO3W7Pqwrwx230eC7ssJPbv9fqoBR30LxIXpSm3dGa6NFUq0a/cRe64A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=CdueOZb5; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="CdueOZb5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772574652; x=1773179452; i=w_armin@gmx.de;
	bh=6GASHwMu9hyw2FYZJTw3uJMH9fnxmkMZmITCbi0szAo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CdueOZb5lJ5sP2jEclV49WD9stxJnyGtRpS/v9Pa7cg4fbsQGopmef8K6ElSZ9a3
	 t36JzPEExVHR2N4dQ/fZvPB0DN/a2QVTZCz6SfjKUweLyW7mR4BaV+rawb4p8MSru
	 e4J3q2Rs9oDlSRNg+VuwS0zyxoSM1xl4nRrYjmsy+vrzq9oGYKY/H1EPaZeMPcApc
	 G3NJ5GFrQfFU+5tTBlT3sBDQ4xnhH/odea+EqlIYobyQK8tdjjrCaaMkOgYrAD34c
	 wGUF3slr5+YV6xpIpxeCOOIN5ve2Adrkto/oWERIMhE0PppmBF2PouvXE21AIsaA1
	 /gXL5gdvXAkEoXsIPw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEV3I-1vuobO0X74-005VlE; Tue, 03
 Mar 2026 22:50:52 +0100
Message-ID: <d6208c58-4d29-4565-ac14-4c1adf295990@gmx.de>
Date: Tue, 3 Mar 2026 22:50:51 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 0/2] platform/x86/amd: Add AMD DPTCi driver for TDP
 control in devices without vendor-specific controls
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Mario Limonciello <superm1@kernel.org>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20260303181707.2920261-1-lkml@antheas.dev>
 <2af36c81-4619-4f90-a04c-c3e5ed7a0cc5@kernel.org>
 <CAGwozwGTPKH5Lc4pEzmrNd7YhHJpZHod=YhViYVVcJTVbLX9ug@mail.gmail.com>
 <00147a2d-6829-4867-9ae9-8a27eb51289a@gmx.de>
 <CAGwozwGnxf+N9QA7H+d1qd+-aKELi7=3Kowq0UjHBT+PGm85Rw@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAGwozwGnxf+N9QA7H+d1qd+-aKELi7=3Kowq0UjHBT+PGm85Rw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:b7EKS1MiyqIgfPf4Lqr+smX5wtZBaz6ifLsV9FTqS1PJzyL9y7H
 NMCPUEpHn/aizN0huWwtc/yBBxvUkpu2Tpb195uFvZfR9SSa1XWXeq4JKFttJICPeDFCZk3
 wZtRlCaS9i/P/DaACFy05z2U2xdwJYddtMZkFQ56Cz0iQzCA6p7zOdjfWgbLJ16VkWNGotl
 NwRcP6NagQhc4yc7xUEDg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8WQZiotdZdc=;kyf0RCvhWvUg4CDQPMK7vz6TFCQ
 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

Am 03.03.26 um 20:34 schrieb Antheas Kapenekakis:

> On Tue, 3 Mar 2026 at 20:27, Armin Wolf <W_Armin@gmx.de> wrote:
>> Am 03.03.26 um 20:16 schrieb Antheas Kapenekakis:
>>
>>> On Tue, 3 Mar 2026 at 19:59, Mario Limonciello <superm1@kernel.org> wrote:
>>>> A high level question - why aren't these vendors implementing PMF?  It's
>>>> 1000% less work to enable PMF.  All the values that match the design get
>>>> stored in BIOS, driver pulls the information and uses it.
>>>   From my understanding they do not implement anything and just use
>>> ryzenadj with their windows vendor software.
>> Do they implement a WMI ACPI device called "AOD"? AFAIK this WMI device
>> is used by the Ryzen Master utility, so it could also allow users to change
>> the TDP limits in a reasonable safe way.
>>
>> If they indeed only use ryzenadj, then shame on them.
>  From my understanding, Ryzen Master has not been updated in a while. I
> was not aware of the AOD device. Moreover, it was my understanding
> that Ryzen Master hardcoded write and lookup addresses.

AFAIK someone on the Phoronix forums has found out that Ryzen Master uses
the AOD WMI device, at least on some platforms.

>  From a quick lookup in my dump repository [2] it seems like not all of
> them feature an AOD device. See below for an AI assisted compilation.
>
> The good thing with this interface is that it handles rerouting to
> different mailbox addresses per generation, which makes implementation
> straightforward.

Yes, but the WMI interface also signals what kinds of settings are supported
on a given device, as well as limits and step sizes. We would however require
some input from AMD to figure out how to properly use it. Otherwise i can run
some test to figure out the underlying interface.

On devices without the AOD device, using the ALIB interface indeed seems to be
the least dangerous way.

Thanks,
Armin Wolf

> Antheas
>
> [2] https://github.com/hhd-dev/hwinfo
>
> The following devices have an AOD device:
> Asus Z13 2025 AMD (AMDT=0x02, AMDI* HIDs)
> Legion_5_15ACH6H AMD Ryzen 5000
> Legion_Slim_5_14APH8 AMD
> Legion_Slim_7_16APH8 AMD
> ally_x AMD Ryzen Z1 Extreme
> aokzoe a1x AMD
> ayaneo_3 AMD
> ayaneo_flip_kb AMD
> legion_go AMD (multiple ACPI versions)
> one xplayer AMD
> onexplayer f1pro AMD (AMDT=0x02, AMDI* HIDs)
> orangepi_neo AMD
> xbox_ally_x AMD Ryzen Z1 Extreme
>
> The following do not:
> ayaneo_airplus
> ayaneo_kun
> ayaneo_slide
> gpd_win4
> gpd_win4_2024
> gpd_win4_8840u
> gpd_winmini
> legion_go_s
> loki_max
> onexpalyer_fly
> onexplayer x1
> onexplayer x1 mini
> onexplayer_mini_pro
> rog_ally
> win_max_2_hx370
> xbox_ally
>
>> Thanks,
>> Armin Wolf
>>
>>>> Same approach for Windows and Linux.
>>>>
>>>> More comments below.
>>>>
>>>> On 3/3/26 12:17 PM, Antheas Kapenekakis wrote:
>>>>> Many AMD-based handheld PCs (GPD, AYANEO, OneXPlayer, AOKZOE, OrangePi)
>>>>> ship with the AGESA ALIB method at \_SB.ALIB, which accepts Function 0x0C
>>>>> (the Dynamic Power and Thermal Configuration Interface, DPTCi). This
>>>>> allows software to adjust APU power and thermal parameters at runtime:
>>>>> STAPM limit, fast/slow PPT limits, skin-temperature TDP limit, slow/STAPM
>>>>> time constants, and the thermal control target.
>>>>>
>>>>> Until now userspace has reached this interface through the acpi_call out-
>>>>> of-tree module or ryzenadj, which carry no ABI guarantees and no per-device
>>>>> safety limits. This driver replaces that with a proper in-kernel
>>>>> implementation that:
>>>>>
>>>>>      * Exposes all seven parameters through the firmware-attributes sysfs ABI,
>>>>>        so that standard tools (fwupd, systemd-bios-vendor, etc.) can enumerate
>>>> What is systemd-bios-vendor?  I guess I'm not familiar with this and a
>>>> quick web search didn't turn anything obvious up.
>>> I used some AI assistance to compile this from my userspace
>>> implementation and the ASEGA pdf from the AMD site. I need to go
>>> through _everything_  before this moves to non-RFC. Same with
>>> copyright year. I focused on the implementation doing the things I
>>> want it to do for now.
>>>
>>>>>        and modify them without device-specific knowledge.
>>>>>
>>>>>      * Enforces tiered per-device and per-SoC limits. The default "device"
>>>>>        mode restricts writes to a curated safe range (smin..smax) derived from
>>>>>        the device's thermal design.
>>>> Can you please elaborate where you got all these numbers from?  I don't
>>>> know if they're accurate or not.  Someone would probably need to cross
>>>> reference them to be sure.
>>> Trial and error, research, references from Windows, etc. All of the
>>> devices in this driver have been tested with a userspace
>>> implementation using the same limits for ppt/sppt/fppt. Nobody has
>>> complained about them. To be honest, I usually do not set tctl slow
>>> and fast time limits, so those are referenced from the Legion Go and
>>> for tctl I go lower than what manufacturers usually set. Users like
>>> tctl because some of them like their device to stay cooler.
>>>
>>> The big idea for this driver is to allow locking /dev/mem and ACPI.
>>> Other than the legion go fan curves, and the Zotac Zone driver which
>>> needs a cleanup, everything else is handled in the kernel now.
>>>
>>> But this approach works fine for the Zotac Zone as they seem to be
>>> using a very simple WMI shim.
>>>
>>>>>        An "expanded" mode exposes the full
>>>>>        hardware-validated range. An optional CONFIG_AMD_DPTC_EXTENDED Kconfig
>>>>>        adds "soc" (raw ALIB_PARAMS envelope) and "unbound" tiers for advanced
>>>>>        use. The active tier is itself a firmware-attribute, switchable at
>>>>>        runtime.
>>>>>
>>>>>      * Stages values and commits them atomically in a single ALIB call,
>>>>>        matching the protocol's intended bulk-update semantics. A save_settings
>>>>>        attribute (per firmware-attributes ABI) controls whether writes commit
>>>>>        immediately ("single" mode) or are held until an explicit "save".
>>>>>
>>>>>      * When in "single" mode, re-applies staged values after system resume,
>>>>>        so suspend/resume cycles do not silently revert to firmware defaults.
>>>> This isn't the only interface for setting power limits.  How do you make
>>>> sure that the EC for example isn't stepping on toes on these designs?
>>> For the DMI matched devices it is not. For the ones that are not
>>> matched, the driver does not autoload and needs a kconfig parameter to
>>> even load.
>>>
>>> OneXPlayer is a bit more complex with their turbo button doing TDP
>>> swaps but turbo takeover in oxpec takes care of that and then you are
>>> supposed use ryzenadj.
>>>
>>>> I /guess/ it always will need to be opt-in a device by device basis.
>>>>
>>>> What happens if the vendor enables PMF in a BIOS update?  How does this
>>>> avoid conflicts?
>>> Some manufacturers enable pmf without implementing the tables. From my
>>> understanding none of them implement pmf with limits. If a
>>> manufacturer wants to move to pmf, we can amend the DMI entry with a
>>> bios match. However, from my understanding, there is no TDP slider
>>> equivalent for PMF.
>>>
>>>>> Device limits are supplied for GPD Win Mini / Win 4 / Win 5 / Win Max 2 /
>>>>> Duo / Pocket 4, OrangePi NEO-01, AOKZOE A1/A2, OneXPlayer F1/2/X1/G1,
>>>>> and numerous AYANEO models. The SoC table covers Ryzen 5000, 6000, 7040,
>>>>> 8000, Z1, AI 9 HX 370, and the Ryzen AI MAX series.
>>>>>
>>>>> Tested on a GPD Win 5 (Ryzen AI MAX+ 395). Confirmed with ryzenadj -i
>>>>> that committed values are applied to hardware, and that fast/slow PPT
>>>>> limits are honoured under a full-CPU stress load.
>>>>>
>>>>> @Mario: can you suggest a CC list for V2? Thanks. Even if not merged, this
>>>>> driver is still good for downstream use.
>>>> You should include Shyam (AMD), Denis and Derek (community).
>>> Sure.
>>>
>>>>> ---
>>>>> Usage
>>>>> -----
>>>>>
>>>>> List all exposed attributes (read-only, no root required):
>>>>>
>>>>>      $ fwupdmgr get-bios-settings
>>>>>
>>>>> This enumerates every attribute under /sys/class/firmware-attributes/,
>>>>> including current_value, default_value, min_value, max_value, and
>>>>> display_name for each DPTCi parameter.
>>>> AFAIK - fwupd doesn't understand "save_settings" today
>>> Yes, I do not expect it to even allow writing, but at least you can
>>> preview the values which is useful. And from what I saw defaults are
>>> not shown either.
>>>
>>> Antheas
>>>
>>>>> Sysfs direct usage
>>>>> ------------------
>>>>>
>>>>> All paths are under:
>>>>>
>>>>>      ATTR=/sys/class/firmware-attributes/amd_dptc/attributes
>>>>>
>>>>> Inspect a parameter (no root needed):
>>>>>
>>>>>      $ cat $ATTR/stapm_limit/{display_name,min_value,max_value,default_value,current_value}
>>>>>      Sustained TDP (mW)
>>>>>      4000
>>>>>      85000
>>>>>      25000
>>>>>                              <- empty: nothing staged yet
>>>>>
>>>>> Stage values (held in memory, not yet sent to firmware):
>>>>>
>>>>>      $ echo 25000 | sudo tee $ATTR/stapm_limit/current_value
>>>>>      $ echo 40000 | sudo tee $ATTR/fast_limit/current_value
>>>>>      $ echo 27000 | sudo tee $ATTR/slow_limit/current_value
>>>>>      $ echo 25000 | sudo tee $ATTR/skin_limit/current_value
>>>>>      $ echo 85    | sudo tee $ATTR/temp_target/current_value
>>>>>
>>>>> Commit all staged values in one ALIB call:
>>>>>
>>>>>      $ echo save | sudo tee $ATTR/save_settings
>>>>>
>>>>> Switch to auto-commit (each write commits immediately):
>>>>>
>>>>>      $ echo single | sudo tee $ATTR/save_settings
>>>>>
>>>>> Return to bulk mode:
>>>>>
>>>>>      $ echo bulk | sudo tee $ATTR/save_settings
>>>>>
>>>>> Clear a staged value without committing:
>>>>>
>>>>>      $ echo | sudo tee $ATTR/stapm_limit/current_value
>>>>>
>>>>> Query or change the active limit tier (device/expanded/soc/unbound):
>>>>>
>>>>>      $ cat $ATTR/limit_mode/possible_values
>>>>>      device;expanded;soc;unbound
>>>>>      $ echo expanded | sudo tee $ATTR/limit_mode/current_value
>>>>>
>>>>> Switching tiers clears all staged values (old values may fall outside the
>>>>> new range). Stages and commits must be redone after a mode switch.
>>>>>
>>>>> Antheas Kapenekakis (2):
>>>>>      Documentation: firmware-attributes: generalize save_settings entry
>>>>>      platform/x86/amd: Add AMD DPTCi driver
>>>>>
>>>>>     .../testing/sysfs-class-firmware-attributes   |   41 +-
>>>>>     MAINTAINERS                                   |    6 +
>>>>>     drivers/platform/x86/amd/Kconfig              |   27 +
>>>>>     drivers/platform/x86/amd/Makefile             |    2 +
>>>>>     drivers/platform/x86/amd/dptc.c               | 1325 +++++++++++++++++
>>>>>     5 files changed, 1386 insertions(+), 15 deletions(-)
>>>>>     create mode 100644 drivers/platform/x86/amd/dptc.c
>>>>>
>>>>>
>>>>> base-commit: c89ce241c1909d2c2bdde88334c33f3000d364fb
