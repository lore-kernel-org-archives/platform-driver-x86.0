Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1687C44D01D;
	Wed, 26 Aug 2026 21:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787779713; cv=none; b=ZdklP9zQphLhKIhm8k6eSn+FxA9LqiQAAuov5OjF1NzGMXL8Qk1YHGGWk3YmMXF03X4FUGcw9LuxFmaTccpJL5YcCJ7uMLfUnXFAG/0MBUnq1aKehp1Mi8e+6C7Xr9DJPCHi2Cpo3R9ToSfZxcWgyCOf4UlcyIj2qj+z0frhpOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787779713; c=relaxed/simple;
	bh=rAE7MNV+PkhAmssImf7xxzKz7KIC7xLYUd+/FVfsRJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sR7VBwEbgx0QmECyBMJLrhh3iDherREAyete81CePClOplkvsbDcadtnk4VAc49BWziQEOxjXujSaWcRFbBVPBmGhcr+I2cxQlHRAP5khRxxJ6IinsX2pot1QG2EwxhtVw7CUo2pVFlxNPEfrWa16xD52POGQombO8e7jnz2+DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=UpAq/ATw; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="UpAq/ATw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1787779705; x=1788384505; i=w_armin@gmx.de;
	bh=sLZBG6EsAaLXuqUbREFIH1gAjaiNboxFELQPkTjfJ+E=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UpAq/ATwbzLrJj93ii60oXWhL+mCyFbLR6YHbTViOxeT4j9Zuk9kzFHKT5MSvNvH
	 yCHR5Mr/tVw202Pe55t0oXb0N/Hm2muXwG4Q8i+yObVBb4jlZ2Al+a5e/Hqo2njNU
	 nNovasp5Wmvtn57ro/4GM0P3emVEKQNKAvSE2xkX+Tkte8pYb0/ivxGjMGcu7aulU
	 0bO01cJ/kH/MKrepHbMarpb9gasI3CIbFlTO0wJ+EdqD46FYzwbmdWNw0ti4+DEcn
	 lLoXrQqpT7EV0N0LzMiHV1rnO0vvHHg+SDTCgkewveFH2OPF9pWlNZmDdnF+Yl56Q
	 1tLyQy/4/8W6gbPywA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6bk4-1wrAdL2Cek-010Lrc; Wed, 26
 Aug 2026 23:28:25 +0200
Message-ID: <42ce163d-b76b-4f72-a107-8cdc71f9221a@gmx.de>
Date: Wed, 26 Aug 2026 23:28:25 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11] platform/x86: bitland-mifs-wmi: Add new Bitland MIFS
 WMI driver
To: =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>,
 qby140326@gmail.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAObHBTxG=SqO0ZVJ6r0zyaQq3acasTUyj1Sh=H9xexgit_GiZg@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAObHBTxG=SqO0ZVJ6r0zyaQq3acasTUyj1Sh=H9xexgit_GiZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5QRZnGvP5PsWlWjzLSWhLFWVaNoY5oI6DRcGsMNmFv+BSnbZpnv
 2Wj5A2Icg8qLi/g5VvQD7rkM1vcMQMHjJfjwMcOHZ+CRRimPNUwqzBzFRYp0sb0HtVhPPdF
 GXJ7ILTei7uc/DnDFd99c0x3XX8b29Nbywt4je8iLXElWzrvIA/u3iiSGrmdW47sKTd0BI+
 xCKjXJz1Il6pRsFqlD0TQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fCptRd/E2Hg=;4BKHLLqZiVMqmiIB7enMlkYCtcU
 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
 e21s+K68ZsI=

Am 15.08.26 um 09:15 schrieb Milo=C5=A1 Vlku:

> Hi,
>
> Thanks for the work on this driver. I'm testing it on a laptop that isn'=
t
> in your reverse-engineering set, and wanted to report that fan control
> seems to be a no-op here even though everything else (sensors, gpu_mode,
> platform-profile read, kb backlight) looks fine.
>
> Hardware:
> - Model: Xiaomi Redmi Book Pro 14 2024, board TM2307
> - BIOS: V24C1, dated 06/10/2025
> - CPU: Intel Core Ultra 5 125H
> - Kernel: 7.1.8-1-cachyos (Arch/CachyOS)
>
> Problem:
> Fans (CPU/GPU/SYS, as reported by the bitland_mifs hwmon block) never sp=
in
> under Linux, even at CPU package temps of 62-63C (coretemp). Confirmed v=
ia
> dual-boot that the fans work correctly under Windows, so this isn't a
> hardware fault.
>
> What I tried:
>
> 1. `fan_boost` sysfs attribute (WMI cmd 0x14, MaxFanSpeedSwitch):
>       echo 1 | sudo tee .../B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B-4/fan_b=
oost
>     - Write succeeds with no error.
>     - fan1/2/3_input under hwmon (bitland_mifs) stay at 0 RPM.
>     - No audible/physical change.
>
> 2. Enabled dynamic debug on the module to trace notify events:
>       echo 'module bitland_mifs_wmi +p' | sudo tee
> /sys/kernel/debug/dynamic_debug/control
>     - Confirmed pr_debug call sites are active (bitland_mifs_wmi_notify,
>       bitland_mifs_wmi_resume).
>     - Retried the fan_boost write with tracing on: no notify/state-chang=
e/
>       WMI event lines appear in dmesg at all in response to the write.
>
> 3. Tried the standard mainline ACPI fan interface instead (bypassing thi=
s
>     driver entirely). 5x PNP0C0B cooling devices are present
>     (cooling_device0-4, type=3DFan, max_state=3D1):
>       for i in 0 1 2 3 4; do echo 1 | sudo tee
> /sys/class/thermal/cooling_device$i/cur_state; done
>     - All 5 confirmed set to cur_state=3D1 on readback.
>     - Still zero RPM change, no audible response.
>
> 4. Noted a mismatch: the acpitz thermal zone that ACPI trip points are
>     bound to reads ~27C (presumably a chassis/skin sensor) while coretem=
p
>     reads 60C+, so even automatic/EC-driven fan curves triggered via tha=
t
>     zone would never fire under Linux regardless of the WMI driver.
>
> Conclusion so far:
> Both the new fan_boost control and the standard ACPI PNP0C0B cur_state
> override are complete no-ops on this specific model/firmware, with zero =
EC
> acknowledgment visible even with driver tracing on. Since Windows drives
> the fans fine, the EC likely requires some additional init/handshake/
> enable step (that the Windows vendor driver performs) which neither Linu=
x
> path is triggering. Given the driver's docs mention it was reverse-
> engineered primarily against Lenovo-rebadged Bitland units, I suspect th=
is
> Xiaomi/Redmi variant has a different EC command mapping or requires an
> additional enable call not yet implemented.
>
> WMI GUIDs present on this machine, for reference:
> - B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B (control methods, hosts
> fan_boost/gpu_mode/platform-profile/kb_mode/hwmon)
> - 46C93E13-EE9B-4262-8488-563BCA757FEF (event notifications)
> - 3F9E3C26-B077-4F86-91F5-37FF64D8C7ED
> - 1DCEAF0A-4D63-44BB-BD0C-0D6281BFDDC5
> - FA78E245-2C0F-4CA1-91CF-15F34E474850
> - 05901221-D566-11D1-B2F0-00A0C9062910 (multiple instances, standard BMO=
F)
> - A6FEA33E-DABF-46F5-BFC8-460D961BEC9F
> - F80A5498-23F3-4053-A244-B39067EC476F
> - 1F13AB7F-6220-4210-8F8E-8BB5E71EE969
> - 2BC49DEF-7B15-4F05-8BB7-EE37B9547C0B
> - 657B6048-310C-4A90-A211-10A17922A0AF
>
> Happy to test patches, dump ACPI tables (DSDT/SSDT), pull the Windows
> driver's WMI call sequence via API Monitor, or gather any other debug
> info that would help. This looks like a useful data point for broadening
> hardware support on this model, so just let me know what's most useful t=
o
> collect next.
>
> Thanks,
> Milos

Sorry for the late reply. Could you please share the output of "acpidump"?

Thanks,
Armin Wolf

