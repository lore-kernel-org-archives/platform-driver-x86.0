Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154262EA480
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Oct 2026 20:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791230452; cv=none; b=rEl+IjiujSxQtubHaDGh+vMkEC8CSCQUbBJzGRjpckeHx7Pc0Gd7Nnwoz+4aHA3NLmOCAre0z7MYCK5vclMLhRD6If7wP/aW/0RuLIYRyWGE+b93o7UVxscMkjruEpXYTxxanBoZcn/ip1Nyz0Sy3Zi/ELV437Y8bi8ybIX7r4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791230452; c=relaxed/simple;
	bh=b920IOGceeWflESrf7GMYBUlyalVvPpJptY85Ye9/1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQdCAIdKEVlnLCDfyKsotPpzJE+6Kvnh5T0Zn2LjzKLnKUaoQMaFwVRT5anp3hROlA0tMdzfzuRB9suEpfEubH8zANSJw1jmoG3ahTlaPbou7d9JQXm5OQ6Anxmiy/n8k5xZ84zBKTJe+y5bN0kP0jeACWIjT/hLiTNkgAwDHGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBWB+rrY; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBWB+rrY"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15354aa70e8so5293521c88.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 05 Oct 2026 13:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791230450; x=1791835250; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wech+go1jt9PtBuE2y8qgkBWEZG0VwPL8l43Jru5pEw=;
        b=FBWB+rrYxiHXky3AJXXlysAsXcz7kv/YezonhkZ24Wq7H5TYgVQNfUOZ3C+v2P53Nd
         DDPsxRa63iB31F36gUf2e+rwnGr7t3No66xDstoSGc81Tadk6waRlhsZRD55A1Mur9R4
         7MKgIIgHyVRxO2MFTrnWS55Ebpnb1QMD9CdgEVYwdRxoUGMxcl90o8S/K0ul7qYnuKyk
         o2opwe3ebL9Z0yp4/oaUYhVz6vaketC9t+KAofSKZFv+pBZinXfbjJM4Z+Xwo5zzI4ON
         XAnj3nXMHO7ZYciJy25z3O+Ki0GlbrKts80l/mwTXE2QDfuIYpOj36zBLTwYcr+Dx2fx
         mKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791230450; x=1791835250;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wech+go1jt9PtBuE2y8qgkBWEZG0VwPL8l43Jru5pEw=;
        b=Yr2XaUqGJ1lBBjYl8dVNXSD2XfTP9SXq26EyLflS6+3eNPniIZMKax/bBhcCMyP8wT
         YnVdjuz6O4V3ojIRv1tkHDLaHGDqpJp7xce4CN8UUCjaspcZV0I9uM6RZrdgcccuu9M/
         dXJYbX4S5z8VYtd7iyK6REQCwifD0RnBXQg4Esjrj2886Iy9JhQW9+a5IN//sZs58hfh
         qsVLTcGg/AMIh/nvC7QWMuqOm9lHRVGeYEUWp54nw9ThBlUt3mdFNUIMiuEebxZ1UDNc
         JlcjHetpkIrBJx90WSG69/ilX3EDGztn0Hgbqji/Wj6k58IjSSw013u4sPsIBvWMVEMK
         kDoA==
X-Gm-Message-State: AFuF++nJlBPt4LvBRr1SKR79GlO2bnJo9CknLFiFMpmTLeF/YTRHBa8S
	ODtImT8VU1mi2RNLEWmpeBJ++9IOcv7NIAIluQ4qkDkOLK3AxwzX/Sy3
X-Gm-Gg: AYBFou0Nce4QCYSCSC4CbZS56StroEJ/SZS76jyXT7TnAOr/4gC2yzka8CdmNcr1GDY
	FT/kB10bMBIqfMEW34FYelVggBWbEIAyNLwVDLkw6BX42wkG8Sy0TYf2v5Enh8E97WdQZJUiU/e
	Kf/ekFecquN9yeQaV71DaflMxJmL22g/DDnjLp5ZbFwDPbvM67HEFakNMrK9GKJcWn67T/m4U4N
	UxKSmJo/bzUCY2/TU6ZjPPTCjkIjXg9F4rwjmnPcXPyrZ4wUlEGrfvN6tGwBUXt5Vl9iMrEqxC4
	aNrhgSS7wcrT0TUR6JYLwoua5nQ/cDFHFtHvlEbCBwNto0+sp5LKrs3464GknnUq1ktJVyuNxzr
	eAp9/0LVC4vg2AL2gFcyAJ97SlLto80gk4pusGHC7v0zTKXbk68rl/61B/pdkbE0pF85F9iHYcm
	coliBq0ctTWOscOA2T7GWHGWjIEiI0flbPOElBc2KVD/FuzqldKIgk5J3TdkX+YQp83ITN5+qXM
	Mdx61mS6/TMu8MMDJHVeTcG2MUbUJM13qRbuvt9GlE1fMVXXnALxAgVBw5u9oH4DWha
X-Received: by 2002:a05:701b:2506:b0:143:2984:6518 with SMTP id a92af1059eb24-151c4923063mr13728104c88.39.1791230449915;
        Mon, 05 Oct 2026 13:00:49 -0700 (PDT)
Received: from archlinux ([2405:201:1b:20ef:de2d:6e5b:74df:ad41])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d816e983asm564799c88.6.2026.10.05.13.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:00:49 -0700 (PDT)
Date: Tue, 6 Oct 2026 01:30:43 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Julien ROBIN <julien.robin28@free.fr>
Cc: platform-driver-x86@vger.kernel.org, 
	Suryansh Singh <technosfan14@gmail.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>
Subject: Re: hp_wmi: Unknown EC layout for board 8C9C
Message-ID: <asPy5Q5wNYaMzTqJ@archlinux>
References: <965dd816-dd66-4318-be8d-330a40209f67@free.fr>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <965dd816-dd66-4318-be8d-330a40209f67@free.fr>

On Sun, Oct 04, 2026 at 12:45:58AM +0200, Julien ROBIN wrote:
>Hi there, I got the following message into my dmesg log:
>
>hp_wmi: Unknown EC layout for board 8C9C. Thermal profile readback will be disabled. Please report this to platform-driver-x86@vger.kernel.org

Hi,

Thanks for reporting.

>I may help a little bit here, as two years ago I did the initial work to get fan speed reading and setting, and thermal profiles for the HP Victus 16s-1034nf (8C9C) which I'm still using. Nice to see new people added new things above this! I hope the "victus_s" naming scheme I introduced to differentiate from previous driver behavior when adding support to the Victus 16s-1034nf didn't turn to be inconsistent with added models names using the same behavior since then.

First of all, thank you for sending those patches. A lot of the current
infrastructure (fan controls/gpu power modes/etc) are built on top of
that.

As for the victus_s naming scheme, we did stick with it for a while, but
recently there have been some efforts in removing the inconsistent
naming [1].

>With nbfc-linux and ec_probe monitor command, I managed to check again EC offsets/registers meaning for this 8C9C laptop (currently running BIOS F.17 11/18/2025).
>
>0xAE offset is related to thermal profile, it shows 3 possible values:
> - 0x00 when in performance mode (while HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE = 0x01)
> - 0x01 when placed in balanced or low-power modes,
> - 0x02 when the laptop CPU power limits are back to default / fallback state: turns out this happens when an HPWMI_FAN_COUNT_GET_QUERY hasn't been played during the last 120 seconds. See hp_wmi_get_fan_count_userdefine_trigger() function.
>
>However when the 0xAE register value is at 0x02, playing an HPWMI_FAN_COUNT_GET_QUERY makes the 0xAE register back to its previous mode (and CPU power limits are set accordingly). So when value is 0x02, the previous value is kept (and may be restored from) somewhere else, but it doesn't seem to be from any other EC register. Even worse, when going to performance mode, HPWMI_SET_PERFORMANCE_MODE command is applying HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE = 0x01 which cause the 0xAE register to go to 0x00, so the logic of this EC register is different from what existed for others models (where the EC register value was the same as the one provided by the HPWMI_SET_PERFORMANCE_MODE query).

Correct, this is an important limitation in our current approach where
we reverse map EC read values to thermal profile parameters (provided
by the HPWMI_SET_PERFORMANCE_MODE query), and that doesn't always cover
it fully on all boards.

>Because of these sudden changes about EC registers behavior, I wasn't sure insisting on direct reading into EC registers was still going to be a sustainable approach for reading back thermal profile on this new kind of laptop. Facing BIOS updates, or tiny changes between similar models, may even cause such approach to break without warnings. It would also need people adding similar laptops to ensure 0xAE is still the right EC register to read, and double check the values are behaving the same. Which is why at startup, I preferred the mode to be initially set to balanced: to both cleanly ensure and say back which mode is enabled, without relying on risky tricks.

I am not sure how the current approach would be "risky" because we only
derive real platform profile state from EC when we have explicitly
identified the relevant offsets. For unknown boards, it still defaults
to balanced for a clean start.

That being said, I fully agree that with BIOS updates, the offsets *may*
shift leading to potential regressions and we should avoid this method.

>But despite this personal opinion, for the 8C9C, playing an HPWMI_FAN_COUNT_GET_QUERY, and guessing the current mode is performance mode (0x01) when 0xAE register says 0x00, and differentiating balanced and low-power modes when 0xAE register value is 0x01, may probably be done by looking at victus_s_gpu_thermal_profile_get(), as prepared into platform_profile_victus_s_get_ec(): I see that Krishna Chomal had this idea. As I'm a beginner into kernel development I prefer let you decide whether it's reliable enough, and/or worth the effort.

So, I was working on a series to fix this very issue, but now that you
have brought it up, I think its a good time to ask you and Ilpo Järvinen
if removing **ALL** EC offsets from this driver and relying on only WMI
queries would be a good idea.

Currently, the following four EC registers have been identified in this
driver:
1. HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET (0x59) [READ-ONLY]:
    Used in platform_profile_victus_s_get_ec() from params->ec_tp_offset
    Used to reverse map the thermal profile parameter and derive the real
    hardware state.

    platform_profile_victus_s_get_ec() itself is used in two places:
    a. thermal_profile_setup() during driver init to re-apply hardware
       state.
       We can remove the call here and default to Balanced
       mode like Julien had done in an earlier commit. [2]
       I think this is fair because the official Omen Gaming Hub software
       on Windows does the same when re-installed.
    b. victus_s_powersource_event() - to derive actual_profile. This
       Julien needs to confirm - if we can avoid doing an EC read by
       directly taking active_platform_profile, since in my opinion,
       it should be same.

2. HP_OMEN_EC_THERMAL_PROFILE_OFFSET (0x95) [READ_ONLY]:
    Used in three places:
    a. platform_profile_victus_s_get_ec(): Already mentioned above.
    b. platform_profile_omen_get_ec()
    c. platform_profile_victus_get_ec()

    (b) and (c) are both used in omen_powersource_event() for the same
        reason as victus_s line as mentioned above. I think here also
        we can fallback on the cached active_platform_profile (please
        let me know if otherwise).

3. HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET (0x62) [WRITE-ONLY]
4. HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET (0x63) [WRITE-ONLY]

(3) and (4) are both used during set_ec path of the legacy Omen line.
However, since I do not own this type of device, I can't comment if it
is entirely needed or not. Interesting though, this is used in only
three devices: omen_timed_thermal_profile_boards[]. But anyway, I will
try to contact someone who sent these patches and see if I can get their
acpidump for more info. I have a feeling that at least *_TIMER_OFFSET
can be removed since the delayed_workqueue would cover its use-case,
and obviously because (afaik) the official Omen Gaming Hub does not
document/use any EC registers and relies on WMI queries only.

>In case you need me to do some tests and gather more information feel free to ask me!

Would it be possible for you to share your acpidump here? Not that we
need it, but I was just curious why 8C9C needs manual triggering of CPU
limits during power source change.

Thanks.

[1]: https://lore.kernel.org/platform-driver-x86/20260615091034.987029-2-radheykalra901@gmail.com
[2]: https://lore.kernel.org/all/1c00f906-8500-41d5-be80-f9092b6a49f1@free.fr

>Adding Cc to Suryansh Singh as I see recent related work to this EC reading offset of thermal profile on another Victus laptop, in case it helps having a better overview on this.
>
>Best regards,
>Julien ROBIN
>
>PS:
>Others identified EC offsets for my 8C9C by the way:
>
> - 0x8F register value is 0x00 unless performance mode has been enabled. It may be related to GPU gpu_ctgp_enable being set to true, in which case the register value goes to 0x04.
>As opposed to 0xAE register, which may fallback to its default value when hp-wmi driver isn't active for more than 120 seconds, 0x8F register keeps its value. This may be tested more deeply if needed.
>
> - 0x8A, 0x8B and 0xFF registers are reflecting CPU power limits. 0x8B and 0xFF registers show the same values which are equal to "PPT LIMIT SLOW" from RyzenAdj, while 0x8A register show the value that appears in both "PPT LIMIT FAST" and "STAPM LIMIT" from RyzenAdj.
>
> - 0xB0 register is showing CPU temperature in celsius, 0xB4 is showing GPU temperature celsius, 0xB2 and 0xA7 registers also seems to give measured temperatures in celsius but it doesn't seem to be CPU nor GPU.
>
> - 0x11 and 0x14 register are linked to target fan speed; values are 0x12 at default fan speed mode (with "fan always on" enabled into the BIOS, otherwise 0x00), and values are 0x3A when maximum fan speed is enabled. It's not showing actual measured values, as during fan speed acceleration or deceleration, values aren't moving at all.
