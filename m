Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37593D9026;
	Thu, 30 Jul 2026 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403471; cv=none; b=ui7/0L0wBxWSLyLBMDqbChTKAGCEX5SnfuzhhqELUjINHmOzN3gJjeOJRo6MyDhjUHR8F1IpicFTaV7PZJHLkpIuNLU9W0uh/THIIedXY6DD5/PPe84tsJwdiGWbYNEC8KUPooCaB/i+EjnwU/HYyYHgCyyyhHlBgqNDtqiwkRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403471; c=relaxed/simple;
	bh=MuvX+StWm+55aEqROQMh6mk4i2keyNOfaG7ySw7cTtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qZrd1xdz2sFZIYvpkOinZAOtkMzF/TA1w4R4P+uVCPfeiUIkomw2o/GdWG/d+4Jdmfe+kjcNn0E+s2V5YvAS5wFmBkZEIH3RCHqS5aecb5UYHZm2GUSxXJVsP3PHb0OHmLhGj7Q/SMzPJbcVe240+cNvxHBTat3BRPkNmajL+PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=cl9kgHZF; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="cl9kgHZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1785403455; x=1786008255; i=w_armin@gmx.de;
	bh=4QxiO52yW3VxfdevsPHi7J8BjB/L//MA9f7kwfGPXjY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=cl9kgHZF51r7md3rqISFqUrju5+iahrKwPAxy9Mvlr/tS2dlH3bCzbtQd/mL6OMy
	 WIzHDg0fb3WLi37rbH7pxXzHwOHUX4WvFB8ohKPhEQPol0VlBSsX3ImcDaofLqhmK
	 x5UfURx1FJeQeyFWruQlw8POUEVpkwS1h7SMXZyh7iE9XaLoyMpCYm8k7Yj+gCVPT
	 jIa9gZfgYUxtfMX/25FKwZwEtO1Kwg70mUs45BH4iozu6JPn2Un7z3oyQwaqz7JV+
	 cUqfx+JuBf0guotk8QTyFJd7QdPM1E5kZBQDB83FDJmggl1xPN81P60QFR/vum115
	 jUuFiI0gLU23ftaisg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N49hB-1wy8XW2UpV-012qmZ; Thu, 30
 Jul 2026 11:24:15 +0200
Message-ID: <e469fe6b-3293-473c-83db-529ac4502612@gmx.de>
Date: Thu, 30 Jul 2026 11:24:14 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 0/5] platform/x86: bitland-mifs-wmi: MIFS v2
 firmware support (Xiaomi Book Pro 14 2026)
To: =?UTF-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mingyou Chen <qby140326@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Nabil Danial <nabildanial.93@gmail.com>
References: <20260728180944.51356-1-wolf109909@outlook.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260728180944.51356-1-wolf109909@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0dKN7RkmYpkdAvlXwXJsON6cwIuADH9nLKOeLPOBKsMdcen6PuQ
 I5mBWMep3idAmQGbtxDkMbomOWaHsFXF8qIoxIE8cnFbI0hdfQYrqCpihUo5Ql6B/5epQJI
 zOMEPqDGIK3k80ijAkaarRfu4pEgQbzTmIykz8qwTXK7yxysGPgK8sGKwm4OSVgqbxNtdw2
 KoOf+GHoyO04hHUGqqmtA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1Th8coOBRIQ=;qlWyRkj3gL4coFl/cn4OjRWDkY6
 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

Am 28.07.26 um 20:09 schrieb =E5=AD=99 =E8=AA=89=E9=93=AD:

> Resending: the foxmail envelope rewrite (tencent...@qq.com) appears to
> have gotten the first attempt filtered. No content changes.
>
> This series makes the Bitland MIFS WMI driver work on the Xiaomi Book
> Pro 14 2026 (Intel Panther Lake, Ultra 5 358H) and very likely on the
> REDMI Book Pro 14 2025, whose suspend failure was reported earlier [1].
>
> These machines ship a reduced MIFS firmware ("v2"): the WMAA method
> implements only function groups 0x0800/0x0a00/0x0c00/0x1000, reports
> the performance mode as raw QFAN EC codes {2,3,4,9,10} instead of the
> v1 0..3 enumeration, and exposes no WMI fan function. Additionally the
> firmware never defines ECON, so \_SB.PC00.LPCB.Q_EC._STA fails and the
> ACPI EC driver never binds, which kills all EC query handlers
> (including the lid switch notifications _Q0C/_Q0D).
>
> Symptoms fixed by this series, all reproduced and verified on the
> affected machine:
>
> * Suspend/hibernate aborted with -EINVAL from the driver's suspend
>    hook (same failure as [1]: "dpm_run_callback():
>    bitland_mifs_wmi_suspend returns -22"; 242 failures counted in
>    suspend_stats). Patch 1 makes the WMI call validate the firmware
>    status word and the suspend/resume hooks fault-tolerant.
>
> * power-profiles-daemon could not read or set the platform profile
>    ("Failed to get profile for handler bitland-mifs-wmi"; selecting
>    "performance" failed outright and wedged the daemon). Patch 2
>    detects the v2 firmware variant at probe and maps the QFAN codes
>    (2=3Dquiet, 3=3Dbalanced, 4=3Dspeed, 9/10=3Dextreme).
>
> * The hwmon device reported zero RPM on all channels because the v2
>    firmware has no WMI fan function. Patch 3 reads the two fan
>    tachometers (u16 RPM, 0 =3D stopped) from the EC shared-memory window
>    at 0xFE0B0300 (DSDT region "ERAM", offsets 0x69/0x6B).
>
> * Closing the lid produced no SW_LID event (screen stayed on, keys
>    pressed by the closed lid typed into the visible lock screen,
>    locking the account). Patch 4 polls the LSTE lid bit in the EC
>    window and, on a change, evaluates the very AML methods the EC
>    query would have run (_Q0C/_Q0D), restoring proper lid events.
>    DMI-gated to the affected model.

Hi,

can you share the output of "acpidump" on your machine? Missing Lid events
usually indicate a deeper problem with the ACPI handling on a given machin=
e.

Thanks,
Armin Wolf

>
> All values were reverse-engineered from the machine's DSDT/SSDT
> (WMID device, _UID "MIFS") and verified live: mode switching changes
> the EC QFAN register as expected, fan tachs ramp 0 -> ~2700 RPM under
> load, lid close/open emit proper switch events consumed by
> systemd-logind, and suspend/resume cycles complete cleanly with the
> driver loaded (suspend_stats: fail 0).
>
> Notes for reviewers:
>
> * The v2 variant is detected at runtime (perf-mode query result
>    outside the v1 enumeration) so other Bitland machines sharing this
>    firmware generation get support without DMI entries; the lid quirk
>    additionally requires a DMI match.
> * On this platform the firmware perf-mode switch reaches Intel DTT
>    (\_SB.IETM, INTC10D4) via ODV variables; mainline has no driver for
>    that device, so the TDP change the firmware intends is currently
>    not applied on Linux. Programming RAPL directly from this driver
>    seemed inappropriate; I left it out. Happy to hear preferences.
> * Interactions with the in-flight "Merge redmi-wmi into
>    bitland-mifs-wmi" series [2] are limited to file context; the
>    control-device paths touched here are disjoint from the event-device
>    merge.
>
> [1] https://lists.openwall.net/linux-kernel/2026/07/10/72
>      "[BUG] platform/x86: bitland-mifs-wmi: Hibernation fails with
>      error -22 on Xiaomi Redmi Book Pro 14 2025"
> [2] https://www.spinics.net/lists/kernel/msg6309086.html
>      "[PATCH v1 0/4] Merge redmi-wmi into bitland-mifs-wmi"
>
>
> Yuming Sun (5):
>    platform/x86: bitland-mifs-wmi: validate WMAA status, never abort
>      suspend
>    platform/x86: bitland-mifs-wmi: support MIFS v2 perf-mode mapping
>    platform/x86: bitland-mifs-wmi: read fan tach from EC window on MIFS
>      v2
>    platform/x86: bitland-mifs-wmi: drive lid switch via EC poll on Xiaom=
i
>      Book Pro 14
>    Documentation: wmi: bitland-mifs-wmi: document MIFS v2 firmware
>      variant
>
>   .../wmi/devices/bitland-mifs-wmi.rst          |  26 ++
>   drivers/platform/x86/bitland-mifs-wmi.c       | 272 +++++++++++++++++-
>   2 files changed, 290 insertions(+), 8 deletions(-)
>
