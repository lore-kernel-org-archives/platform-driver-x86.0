Received: from mail-244104.protonmail.ch (mail-244104.protonmail.ch [109.224.244.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A7F2E8B85
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Dec 2025 19:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765222271; cv=none; b=DJN76OjvXPy2seHFWuF3lsAvbngJyq4f0LhltVzWRiJm2MO0kPnJDu+Xt9SPMiKhDsBYSA61eZ7qY3hz1sS+6TFILJ14ESPjdcaSxWNLGpjhYx1A9lySffJISmgRlHjr7aspn/ovzYJLz8kBk/nW/PotaFzSEbnWrb6snCk58bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765222271; c=relaxed/simple;
	bh=tl9OhclGTrjlaRVYuekGUOUx/dvpwUo+YEmNtIliV3c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NNHyR85n1DMS5mFF508mHvzPqsaCGCi7iiuJ0QfXMeNJf4kD+6971R3lm9Pn73PG385uCnjmnTYhAm+H+DbeF43q4B3DFp7jM+j9S8nvW2OzB711KqsdVqqTYwwiP4QuFSYjKpDHsIaBRVejRX2yqvT+mxA2U1aoEiGA1WiOPYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=h1RWMOYW; arc=none smtp.client-ip=109.224.244.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="h1RWMOYW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1765221778; x=1765480978;
	bh=iMZ4+CG1RSn32vQZbK+Xr+OK7e2mAWyVwkGhcW7bBj4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=h1RWMOYWJL7qw7FUozymGoeg4mEGL1rLYgMPmjzkGFbiY/9Gv5GJ2/DWCH9jZ4zCf
	 6COLImHP0Wp7e+hIBco85E8QU9DFjYrN/WbOjll++9TO4FrV4iWzUXJ8bzHglRWKPY
	 qgQnvPmZhDya/fMdvLziJY3iOoi6qsWsYJ6b2EcE+j1dXfoVJrNrq7mOa5yCdx3ywP
	 q1PIvUG72Uj4lVN05SvWxlZhaE5TSVncVhnOVQpPRx0CoMViQ58/IinBzQa+Jer0yv
	 B7RsCv/VdUXcxRGJJ0QJVVoYTGlDwSvICjW5TL5rPMXcRPNWuP9DQybU4y69tFBr9N
	 /BIqUQmcRaYjw==
Date: Mon, 08 Dec 2025 19:22:53 +0000
To: Mario Limonciello <mario.limonciello@amd.com>
From: CX MAIL <mailcx@pm.me>
Cc: "Shyam-sundar.S-k@amd.com" <Shyam-sundar.S-k@amd.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [BUG] AMD PMC causes system hang on suspend (HP EliteBook X G1a, Strix Point)
Message-ID: <_coqLqv0F7WEy-Y31rFUYSagGjuaEVB6-xIARLfhAn0nr4_1ELo_38YthlyZA6Ou1mKAcoDCKIBYZ8foICKeyaEAmUjIYBiTDCfeWCtjpYA=@pm.me>
In-Reply-To: <60b09100-fe58-4330-b5dd-707eabf8f5ff@amd.com>
References: <93e7ZGFEiN1SZoCHCVwqctZPrrUmJUlz9NHui4lh4glOm8PYaanRann4m0T9jeq3LwD8mICbSiCw9-COSfmMcDoGNN83VHkK-3wj-PUmfNo=@pm.me> <60b09100-fe58-4330-b5dd-707eabf8f5ff@amd.com>
Feedback-ID: 163859403:user:proton
X-Pm-Message-ID: b71081cb395077ebe5326d7fd4937a7b7da20c8b
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I have collected more logs with amd-debug-tools and created this issue on d=
rm/freedesktop
https://gitlab.freedesktop.org/drm/amd/-/issues/4767

I was able to run the script with --force despite the warnings below. I get=
 the same symptom that system hangs before suspend entry.

Thanks,
CX

```
Debugging script for s2idle on AMD systems
=F0=9F=92=BB HP HP EliteBook X G1a 14 inch Notebook Next Gen AI PC (103C_53=
36AN HP EliteBook)
=F0=9F=90=A7 Bazzite
=F0=9F=90=A7 Kernel 6.17.7-ba19.fc43.x86_64
=F0=9F=94=8B Battery BAT0 (Hewlett-Packard Primary) is operating at 98.37% =
of design
Checking prerequisites for s2idle
=E2=9C=85 Logs are provided via systemd
=E2=9C=85 AMD Ryzen AI 9 HX PRO 375 w/ Radeon 890M (family 1a model 24)
=E2=9C=85 ASPM policy set to 'default'
=E2=9C=85 SMT enabled
=E2=9C=85 LPS0 _DSM enabled
=E2=9C=85 ACPI FADT supports Low-power S0 idle
=E2=9C=85 PMC driver `amd_pmc` loaded (Program 11 Firmware 93.10.0)
=E2=9C=85 USB3 driver `xhci_hcd` bound to 0000:c3:00.4
=E2=9C=85 USB3 driver `xhci_hcd` bound to 0000:c5:00.0
=E2=9C=85 USB3 driver `xhci_hcd` bound to 0000:c5:00.3
=E2=9C=85 USB3 driver `xhci_hcd` bound to 0000:c5:00.4
=E2=9C=85 USB4 driver `thunderbolt` bound to 0000:c5:00.5
=E2=9C=85 USB4 driver `thunderbolt` bound to 0000:c5:00.6
=E2=9C=85 WLAN driver `mt7925e` bound to 0000:c2:00.0
=E2=9C=85 GPU driver `amdgpu` bound to 0000:c3:00.0
=E2=9C=85 System is configured for s2idle
=E2=9C=85 GPIO driver `pinctrl_amd` available
=E2=9C=85 PC6 and CC6 states are enabled
=E2=9D=8C IOMMU is misconfigured: missing MSFT0201 ACPI device
=E2=9C=85 RTC driver `rtc_cmos` configured to use CMOS alarm
=E2=9D=8C Kernel is tainted: 64
Your system does not meet s2idle prerequisites!
Explanations for your system
=F0=9F=9A=A6 Device MSFT0201 missing from ACPI tables
        The ACPI device {device} is required for suspend to work when the I=
OMMU is enabled.
        Please check your BIOS settings and if configured correctly, report=
 a bug to your system vendor.

For more information on this failure see:
        https://gitlab.freedesktop.org/drm/amd/-/issues/3738#note_2667140
=F0=9F=9A=A6 Kernel is tainted
        A tainted kernel may exhibit unpredictable bugs that are difficult =
for this script to characterize.
        If this is intended behavior run the tool with --force.

For more information on this failure see:
        https://gitlab.freedesktop.org/drm/amd/-/issues/3089
```


Sent with Proton Mail secure email.

On Wednesday, December 3rd, 2025 at 1:56 PM, Mario Limonciello <mario.limon=
ciello@amd.com> wrote:

> On 12/3/25 11:28 AM, CX MAIL wrote:
>=20
> > Hello,
> >=20
> > I'm reporting a critical suspend issue on HP EliteBook X G1a with AMD R=
yzen
> > AI 9 HX 375 (Strix Point). The system completely hangs when entering s2=
idle
> > with the AMD PMC driver loaded.
> >=20
> > Hardware:
> > - Model: HP EliteBook X G1a 14 inch (Model 8D08)
> > - CPU: AMD Ryzen AI 9 HX 375 (Strix Point)
> > - GPU: Radeon 890M (integrated)
> > - BIOS: X88 Ver. 01.03.11 (2025-09-03)
> >=20
> > Kernel: 6.17.7-ba19.fc43.x86_64 (Fedora-based)
> > Current cmdline: bluetooth.disable_ertm=3D1 amdgpu.gpu_recovery=3D1 pci=
e_aspm=3Doff
> >=20
> > Problem:
> > When executing "systemctl suspend", the system enters s2idle but immedi=
ately
> > hangs. The last kernel message is "PM: suspend entry (s2idle)" with no
> > further output. System becomes completely unresponsive - keyboard, touc=
hpad,
> > and power button (short press) have no effect. Only hard power-off work=
s.
> >=20
> > BIOS configuration:
> > - APMF enabled
> > - Modern Standby (s2idle only, S3 not supported by firmware)
> > - /sys/power/mem_sleep: [s2idle]
> >=20
> > AMD PMC device present: /sys/bus/platform/devices/AMDI000A:00/
> >=20
> > Workaround:
> > Adding "initcall_blacklist=3Damd_pmc_driver_init" to kernel cmdline pre=
vents
> > the AMD PMC driver from loading. With this workaround, s2idle works per=
fectly
> > and the system resumes normally from suspend.
> >=20
> > Verification with workaround:
> > - lsmod | grep amd_pmc: (no output - driver not loaded)
> > - Suspend/resume cycle: successful
> >=20
> > Logs attached:
> > 1. system-info.txt - detailed system information
> > 2. suspend-fail.log - Journal from failed suspend attempt (hangs after
> > "PM: suspend entry")
> > 3. suspend-success.log - Journal from successful suspend/resume with
> > workaround applied
> >=20
> > The failure log shows the system stops all output immediately after ent=
ering
> > s2idle, suggesting the AMD PMC driver causes a hard hang during early
> > platform suspend initialization.
> >=20
> > Please let me know if you need any additional debug information or woul=
d like
> > me to test patches.
> >=20
> > Best regards,
> > CX
>=20
>=20
> Hi,
>=20
> Please use amd-s2idle from https://pypi.org/project/amd-debug-tools/ to
> generate a report. It may root cause it for you. If it doesn't, please
> attach it to a bugzilla or drm/freedesktop bug report and CC me.
>=20
> Thanks,
