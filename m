Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81479372680;
	Tue,  3 Mar 2026 18:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772564370; cv=none; b=pesJm0Z+QgLPfMf9RVl6Brq7r2VO7muigvLynIgC4+2v9VPLAqk13nlB05Oe0bpWrJOTrbqKCMi9hFoSF3e0Jhc9QEzfsMtGcfEy4fG7R1uKKNzDbkcJFdcJen2jqrAoKAH+ehnZ/VSqZjGo9vSo34zWj/y8mS+UvlADtPDkWz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772564370; c=relaxed/simple;
	bh=Jpb4WshuK5IJlQlOqRiefOlvKN+2B/6YZEZHktxlWeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SwctBIz9zHtrDfq97cYIwNpLsH6/EZuV3kenr9+jqBuS/hmaZRtepUjTKWk3ag4qP2dRhESSa0559RBVDaB+WUXzZEDXAAc/Xr1xFd1xhivyH21iZHOYZrYWUWvDUttTGWMpiPCUae3haOt8Z15CnRegq+KqT8ZzkitOc6f836Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKsh2r6J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKsh2r6J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4899C116C6;
	Tue,  3 Mar 2026 18:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772564370;
	bh=Jpb4WshuK5IJlQlOqRiefOlvKN+2B/6YZEZHktxlWeI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eKsh2r6JwLlxRi6CMpfZ3R3cU9gHB4ZSnRrmV7KnEqbeLecbbMnpxnHCq/hGUKMac
	 6Kgq589b9RUqvYm+R+cCPBe2ZP2v/r9PKZlL0Q3LIFaLqmbZ/fDUHEgbS45980qsn3
	 SKSFZuYS7+Y4FAejSJQcaUeM/SP81Cg8AxTvhbyLtZZ6qQl32ABBnsjI7BqjDLomNu
	 CGhn8vdneRBDibd2EMxUA7K0v8dp2axjKnRU4/2sAXl0TfVxWT7wPjJNYqE+xHBQrs
	 Xan1kKCaFlL7CxcIjZhRLEVXQC05ZGIsU4QwqDXItHckWIN68gQrxDwTx5FEdUT6Tj
	 46WBPYPx6aT8Q==
Message-ID: <2af36c81-4619-4f90-a04c-c3e5ed7a0cc5@kernel.org>
Date: Tue, 3 Mar 2026 12:59:27 -0600
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
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260303181707.2920261-1-lkml@antheas.dev>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260303181707.2920261-1-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

A high level question - why aren't these vendors implementing PMF?  It's 
1000% less work to enable PMF.  All the values that match the design get 
stored in BIOS, driver pulls the information and uses it.

Same approach for Windows and Linux.

More comments below.

On 3/3/26 12:17 PM, Antheas Kapenekakis wrote:
> Many AMD-based handheld PCs (GPD, AYANEO, OneXPlayer, AOKZOE, OrangePi)
> ship with the AGESA ALIB method at \_SB.ALIB, which accepts Function 0x0C
> (the Dynamic Power and Thermal Configuration Interface, DPTCi). This
> allows software to adjust APU power and thermal parameters at runtime:
> STAPM limit, fast/slow PPT limits, skin-temperature TDP limit, slow/STAPM
> time constants, and the thermal control target.
> 
> Until now userspace has reached this interface through the acpi_call out-
> of-tree module or ryzenadj, which carry no ABI guarantees and no per-device
> safety limits. This driver replaces that with a proper in-kernel
> implementation that:
> 
>    * Exposes all seven parameters through the firmware-attributes sysfs ABI,
>      so that standard tools (fwupd, systemd-bios-vendor, etc.) can enumerate

What is systemd-bios-vendor?  I guess I'm not familiar with this and a 
quick web search didn't turn anything obvious up.

>      and modify them without device-specific knowledge.
> 
>    * Enforces tiered per-device and per-SoC limits. The default "device"
>      mode restricts writes to a curated safe range (smin..smax) derived from
>      the device's thermal design. 

Can you please elaborate where you got all these numbers from?  I don't 
know if they're accurate or not.  Someone would probably need to cross 
reference them to be sure.

>      An "expanded" mode exposes the full
>      hardware-validated range. An optional CONFIG_AMD_DPTC_EXTENDED Kconfig
>      adds "soc" (raw ALIB_PARAMS envelope) and "unbound" tiers for advanced
>      use. The active tier is itself a firmware-attribute, switchable at
>      runtime.
> 
>    * Stages values and commits them atomically in a single ALIB call,
>      matching the protocol's intended bulk-update semantics. A save_settings
>      attribute (per firmware-attributes ABI) controls whether writes commit
>      immediately ("single" mode) or are held until an explicit "save".
> 
>    * When in "single" mode, re-applies staged values after system resume,
>      so suspend/resume cycles do not silently revert to firmware defaults.

This isn't the only interface for setting power limits.  How do you make 
sure that the EC for example isn't stepping on toes on these designs?

I /guess/ it always will need to be opt-in a device by device basis.

What happens if the vendor enables PMF in a BIOS update?  How does this 
avoid conflicts?

> 
> Device limits are supplied for GPD Win Mini / Win 4 / Win 5 / Win Max 2 /
> Duo / Pocket 4, OrangePi NEO-01, AOKZOE A1/A2, OneXPlayer F1/2/X1/G1,
> and numerous AYANEO models. The SoC table covers Ryzen 5000, 6000, 7040,
> 8000, Z1, AI 9 HX 370, and the Ryzen AI MAX series.
> 
> Tested on a GPD Win 5 (Ryzen AI MAX+ 395). Confirmed with ryzenadj -i
> that committed values are applied to hardware, and that fast/slow PPT
> limits are honoured under a full-CPU stress load.
> 
> @Mario: can you suggest a CC list for V2? Thanks. Even if not merged, this
> driver is still good for downstream use.

You should include Shyam (AMD), Denis and Derek (community).

> 
> ---
> Usage
> -----
> 
> List all exposed attributes (read-only, no root required):
> 
>    $ fwupdmgr get-bios-settings
> 
> This enumerates every attribute under /sys/class/firmware-attributes/,
> including current_value, default_value, min_value, max_value, and
> display_name for each DPTCi parameter.

AFAIK - fwupd doesn't understand "save_settings" today

> 
> Sysfs direct usage
> ------------------
> 
> All paths are under:
> 
>    ATTR=/sys/class/firmware-attributes/amd_dptc/attributes
> 
> Inspect a parameter (no root needed):
> 
>    $ cat $ATTR/stapm_limit/{display_name,min_value,max_value,default_value,current_value}
>    Sustained TDP (mW)
>    4000
>    85000
>    25000
>                            <- empty: nothing staged yet
> 
> Stage values (held in memory, not yet sent to firmware):
> 
>    $ echo 25000 | sudo tee $ATTR/stapm_limit/current_value
>    $ echo 40000 | sudo tee $ATTR/fast_limit/current_value
>    $ echo 27000 | sudo tee $ATTR/slow_limit/current_value
>    $ echo 25000 | sudo tee $ATTR/skin_limit/current_value
>    $ echo 85    | sudo tee $ATTR/temp_target/current_value
> 
> Commit all staged values in one ALIB call:
> 
>    $ echo save | sudo tee $ATTR/save_settings
> 
> Switch to auto-commit (each write commits immediately):
> 
>    $ echo single | sudo tee $ATTR/save_settings
> 
> Return to bulk mode:
> 
>    $ echo bulk | sudo tee $ATTR/save_settings
> 
> Clear a staged value without committing:
> 
>    $ echo | sudo tee $ATTR/stapm_limit/current_value
> 
> Query or change the active limit tier (device/expanded/soc/unbound):
> 
>    $ cat $ATTR/limit_mode/possible_values
>    device;expanded;soc;unbound
>    $ echo expanded | sudo tee $ATTR/limit_mode/current_value
> 
> Switching tiers clears all staged values (old values may fall outside the
> new range). Stages and commits must be redone after a mode switch.
> 
> Antheas Kapenekakis (2):
>    Documentation: firmware-attributes: generalize save_settings entry
>    platform/x86/amd: Add AMD DPTCi driver
> 
>   .../testing/sysfs-class-firmware-attributes   |   41 +-
>   MAINTAINERS                                   |    6 +
>   drivers/platform/x86/amd/Kconfig              |   27 +
>   drivers/platform/x86/amd/Makefile             |    2 +
>   drivers/platform/x86/amd/dptc.c               | 1325 +++++++++++++++++
>   5 files changed, 1386 insertions(+), 15 deletions(-)
>   create mode 100644 drivers/platform/x86/amd/dptc.c
> 
> 
> base-commit: c89ce241c1909d2c2bdde88334c33f3000d364fb

