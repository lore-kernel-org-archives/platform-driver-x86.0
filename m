Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D8C382F2F;
	Wed, 26 Aug 2026 21:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780731; cv=none; b=NLFgtV/Bp14XUi5PGrCPaU5W21OFiY87zIKFTefhqmxOwAFZD0EJpcOs8EgdFz9axio63YBJHeW7MdmT7gDIHyGEdPCkX3gX/b+JJtfZa7S8hkjKJsG6oB0A+BArbRxubbakXFBZa//XxihZbX8N/e97SAn9oZcqJqEeEd9BaNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780731; c=relaxed/simple;
	bh=I1KLZxMfmMmjkjLPVXD+weIhw1HY5FU8MGqXTDQKL4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hOExL2qVdw94oBPSu0lhOpUJjUt5S9yx+vDWT7nHm4wpch80fpEUrkx3K5q5PgVPytmtBh585LnUJQFH94jJMlEr2SVxmkiHM45DQOTh/eHmV4WfmOkxYdof1Z0p2md+Pr/ETHz1cJmsluJ/Wl144DNf8mCv1NpDk0JXpbNo21g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Fsmsb/zx; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Fsmsb/zx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1787780713; x=1788385513; i=w_armin@gmx.de;
	bh=oJ+j3IMslxwlqOIiW1BDpMQk4l1zQX20IepSHH+aT5Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Fsmsb/zxdubF3il7AdvhoF0XDZX2lkUXIRhtE8qyXndh+ejvn5n8sXCEHSXEhQQ9
	 FQ0bjKByRVZOh7YpA0ahjJmv2MHWE7ACBP0/SWvyNsYEZSIQrR3DkT0gcDtYcy0wE
	 HeG7yfecDefrhDqapdsZjaBaYj+L8JVEtGbe8gCOvaW+Ngcjqcy/47qGWmZ4cqR4t
	 raoN5JNqkkvk8WKgLKVbOaEyUO+rxJ8BN7jsw3FPCPq8reJAD9/Aar5wongi/mwiM
	 zQpXYfDfHOvOSXZ6BIWUuvssVpQgjOBlP9+cIXlHwyb352drsxTAYS0T2rZi9HvX+
	 HUIoblW/vgoe6XuO1Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MC34h-1x4akW1R3F-00FKIS; Wed, 26
 Aug 2026 23:45:13 +0200
Message-ID: <2526d874-2ebb-48b3-b5d2-33addcff3fdb@gmx.de>
Date: Wed, 26 Aug 2026 23:45:12 +0200
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
X-Provags-ID: V03:K1:wodtYoN5xWzI1NsnZJCI192Z1ctXd2J+ojGYB75erx4MwbcFyzL
 EshJyh2M1U5taEgviQRwfbqUlqwy0aZ9pXA/FOyXKvHZmntt8zTiJwfGJMQ6abWFqLGlSoQ
 ulDN97SyWIxwT7gyUofBy0wgfq89KmVxHoTn2+4cDiCAmVBal+hTj3aGobkV7FhZo/I446u
 NupRxnGpyIILd5JuwVQWA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vZr+axLpSHY=;XvjfiN71unSLgu33RsnDAq7oO1K
 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
 G1BbvAjschM=

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

Sorry for the late reply.

This looks like a severe ACPI bug to me, can you share the output of "acpi=
dump"?

Thanks,
Armin Wolf

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
