Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97F51A6813
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Mar 2026 23:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773532561; cv=none; b=p40yKyZ7RO0cWUHzzn9RX7bycJwaU/bTJ8rwXK4BRjUSg/dWDPZZ4y8fUnNWH6z4hex0EBbDlxxmj+i2RuGvbLMwVMDce9mY8VnZyNiSmrJEYE7ldNeM8gEzZMe8jRrK0j2LwPiZVwI31YB3pMpAeJ2h3cREhfrcHYUIvpvCLlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773532561; c=relaxed/simple;
	bh=pV7JR2oF4KUCOkjLOh8hGExJnTJu0VuxFZsPJ5naaHA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=arhylqrJsEcDFMpVJ48YE4YsAKiaGmrppsEVj6IHAikl25KzhIBQ8et/6nAXLNMo3kFoEOvJ3A+tApE60pYT1fwHYr3cmgJ/7dIDeCmbhf43ZjRvto11NRROcpDLD87XRdyC9JY40EToDLTgcwl3wV0Xt6RRG9TB/CmZyFjr/X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q563m9Wh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q563m9Wh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D172C19424
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Mar 2026 23:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773532561;
	bh=pV7JR2oF4KUCOkjLOh8hGExJnTJu0VuxFZsPJ5naaHA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Q563m9Whonxgra3I2dwGamURahVat9ccMWXI34w2oPNnRGoQ5LPAEyu/JEPKyVrYN
	 20eu32STjSC9EefpsYhecrq4eFjnfnp+eHs5iTfcBRUMif2WUaJ5ai3q8j/l/m0l/u
	 HdAoPQJ2kwhNfJ5WDb8Q/lPO9EP8awqHRI1xaFVj9Kq3tMF70cJxobMO6WTVJ4KOyD
	 nhmcw9pbLGUhKYFJkQDF82msk4SJJ/z/p2zQ+HYsHg1QkRx6848kxF6cIHUDPW8Qzd
	 w7TnLXtiN6YYLi3BVW13hCdqVt+YDtzQKu2suavfw/qH1DdPfx8K4MTMM0fiNtwhEB
	 5YNBCICrxZ12A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 74535C41612; Sat, 14 Mar 2026 23:56:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Sat, 14 Mar 2026 23:55:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ptscheepers@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-nXXsQ5Mp7t@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #355 from Theunis Scheepers (ptscheepers@gmail.com) ---
(In reply to Theunis Scheepers from comment #353)
> (In reply to Denis Pauk from comment #352)
> > (In reply to Theunis Scheepers from comment #351)
> > > Requesting addition of ROG STRIX X870E-E GAMING WIFI to the
> > > nct6775-platform.c ASUS WMI board allowlist for stable fan PWM control
> > under
> > > Linux.
> > > --------------
> > > A full data tarball (DSDT binary + decompiled, sensors-detect, dmesg,=
 PWM
> > > override test, hwmon drivers list) is attached to:
> > > https://github.com/zeule/asus-ec-sensors/issues/100
> >=20
> > The dmesg log attached to github issue does not have mention about reso=
urce
> > conflict or applying some custom parameters/patches.=20
> >=20
> > Have you applied some patches or custom parameters for the kenel? Could=
 you
> > please provide dmesg messages before and after applying patch or custom
> > parameter?
> >=20
> > Use comment #350 as example of patch.
>=20
> Hi Denis,
> Testing results for ROG STRIX X870E-E GAMING WIFI.
> System Info:
>=20
> Board: ROG STRIX X870E-E GAMING WIFI (DMI vendor: ASUSTeK COMPUTER INC.)
> Kernel: 6.19.8-1-cachyos (CachyOS, Arch-based)
> Chip: NCT6796D-S/NCT6799D-R
>=20
> Key Finding:
> This board needs to go in asus_msi_boards[], NOT asus_wmi_boards[]. The A=
CPI
> WMI device has UID AsusMbSwInterface (not ASUSWMI), so asus_wmi_boards[]
> does not match.
> BEFORE patch (ISA path):
>=20
> dmesg: Found NCT6796D-S/NCT6799D-R or compatible chip at 0x2e:0x290
> No WMI mention in dmesg
> PWM writes via ISA held intermittently but firmware can override
>=20
> AFTER patch (WMI path via asus_msi_boards[]):
>=20
> dmesg: Using Asus WMBD method of AsusMbSwInterface to access 0xc1 chip
> WMI read confirmed: ret=3D0 tmp=3D0xc1
> PWM writes persist for 22+ seconds
> Fan RPM responds correctly: 1468 =E2=86=92 1153 RPM when setting PWM to 2=
00
> Firmware does NOT override manual control
>=20
> The patch (one line added to asus_msi_boards[] in nct6775-platform.c):
>        "ROG STRIX X670E-I GAMING WIFI",
> +      "ROG STRIX X870E-E GAMING WIFI",
>        "ROG STRIX X870E-H GAMING WIFI7",
> Full before/after dmesg logs and PWM test results attached if needed.



Hi Denis, apologies for the incomplete data. Here are the before/after dmesg
and PWM results:


BEFORE (stock kernel, no patch):

=3D=3D=3D BEFORE dmesg filtered =3D=3D=3D
[    6.136438] asus_wmi: ASUS WMI generic driver loaded
[    6.138654] asus-ec-sensors asus-ec-sensors: board has 5 EC sensors that
span 6 registers
[    6.139104] asus_wmi: failed to register LPS0 sleep handler in asus-wmi
[    6.139227] asus_wmi: Initialization: 0x0
[    6.139306] asus_wmi: BIOS WMI version: 0.0
[    6.139382] asus_wmi: SFUN value: 0x0
[    6.139384] eeepc-wmi eeepc-wmi: Detected AsusMbSwInterface, not ASUSWMI,
use DSTS
[    6.145311] input: Eee PC WMI hotkeys as
/devices/platform/eeepc-wmi/input/input18



AFTER (added to asus_msi_boards[]):

=3D=3D=3D AFTER dmesg filtered =3D=3D=3D
[    6.712988] asus_wmi: ASUS WMI generic driver loaded
[    6.729934] asus_wmi: failed to register LPS0 sleep handler in asus-wmi
[    6.730062] asus_wmi: Initialization: 0x0
[    6.730135] asus_wmi: BIOS WMI version: 0.0
[    6.730203] asus_wmi: SFUN value: 0x0
[    6.730204] eeepc-wmi eeepc-wmi: Detected AsusMbSwInterface, not ASUSWMI,
use DSTS
[    6.730845] asus-ec-sensors asus-ec-sensors: board has 5 EC sensors that
span 6 registers
[    6.736109] input: Eee PC WMI hotkeys as
/devices/platform/eeepc-wmi/input/input18
[  595.539067] nct6775_core: module verification failed: signature and/or
required key missing - tainting kernel
[  595.544039] nct6775: Found NCT6796D-S/NCT6799D-R or compatible chip at
0x2e:0x290
[  686.026446] nct6775: Found NCT6796D-S/NCT6799D-R or compatible chip at
0x2e:0x290
[  712.442566] nct6775: Found NCT6796D-S/NCT6799D-R or compatible chip at
0x2e:0x290
[  740.950908] nct6775: Found NCT6796D-S/NCT6799D-R or compatible chip at
0x2e:0x290
[  912.805550] nct6775: nct6775: ACPI device not found for UID ASUSWMI
[  912.805624] nct6775: Found NCT6796D-S/NCT6799D-R or compatible chip at
0x2e:0x290
[  992.855201] nct6775: nct6775: Found ACPI device for UID AsusMbSwInterface
[  992.855417] nct6775: nct6775: WMI read ret=3D0 tmp=3D0xc1
[  992.855418] nct6775: nct6775: Using Asus WMBD method of AsusMbSwInterfac=
e to
access 0xc1 chip.
[  992.855486] nct6775: Found NCT6796D-S/NCT6799D-R or compatible chip at
0x2e:0x290



PWM persistence BEFORE (firmware overrides):

=3D=3D=3D BEFORE PWM state =3D=3D=3D
nct hwmon path: /sys/class/hwmon/hwmon10
fan1: 1792 RPM, pwm1_enable: 5, pwm1: 255
fan2: 1468 RPM, pwm2_enable: 5, pwm2: 255
fan3: 2288 RPM, pwm3_enable: 5, pwm3: 158
fan4: 0 RPM, pwm4_enable: 5, pwm4: 255
fan5: 1829 RPM, pwm5_enable: 5, pwm5: 255
fan6: 2039 RPM, pwm6_enable: 5, pwm6: 255
fan7: 0 RPM, pwm7_enable: 5, pwm7: 205

=3D=3D=3D PWM persistence test (BEFORE patch) =3D=3D=3D
Before: fan2=3D1470 RPM, pwm2_enable=3D5, pwm2=3D255
After 2s: fan2=3D1308 RPM, pwm2_enable=3D1, pwm2=3D200
After 7s: fan2=3D1147 RPM, pwm2_enable=3D1, pwm2=3D200
After 12s: fan2=3D1151 RPM, pwm2_enable=3D1, pwm2=3D200
Restored to BIOS Q-Fan



PWM persistence AFTER (writes hold 22+ seconds):

=3D=3D=3D AFTER PWM state =3D=3D=3D
=3D=3D=3D PWM persistence test (AFTER patch =E2=80=94 asus_msi_boards WMI) =
=3D=3D=3D
Before: fan2=3D1468 RPM, pwm2_enable=3D5, pwm2=3D255
After 2s: fan2=3D1327 RPM, pwm2_enable=3D1, pwm2=3D200
After 7s: fan2=3D1146 RPM, pwm2_enable=3D1, pwm2=3D200
After 12s: fan2=3D1152 RPM, pwm2_enable=3D1, pwm2=3D200
After 22s: fan2=3D1153 RPM, pwm2_enable=3D1, pwm2=3D200
Restored to BIOS Q-Fan

No custom parameters or other patches were applied. The only change was add=
ing
"ROG STRIX X870E-E GAMING WIFI" to asus_msi_boards[] (not asus_wmi_boards[]=
).
The board's WMI device has UID AsusMbSwInterface, not ASUSWMI.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
