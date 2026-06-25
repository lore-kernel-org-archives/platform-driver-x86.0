Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEC43CC7F1
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782382505; cv=none; b=LuelVLWe3RHX6T1996rE+L4RZGCgffrE1dWb65xroDnehZNaID27f9JSdJAKy75WNEeRCfIPCeIwJOr1LDHcEAw6U6hgFqrcEJ5UeoFv4HVTfz0RMKxOAEkGiVNeNmo70/CekACAtpvjt9YhmLdjbaOuv8UbCblCQ9dBsAEeosc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782382505; c=relaxed/simple;
	bh=KW0aAhwybXVTM+leeAWjHVTucoafYycsjRprPSGeljo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WV1l70Zi3odai3ZQK+EYNR/8TxVUdWUQIl263gzuAHcR9e1ckF6ctLcirUNjnkQlnAv/v8cA89V/VuWHC5mxd9o/+pEfuKtRF8YgrE7ZtvryyB3ss3Vv5zfs7qMBYny6OiPUionls6dfKnwcW7WSnGKzbPZy1wbRPI0wHi7Z19I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GV/73cOu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GV/73cOu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04D1CC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 10:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782382505;
	bh=KW0aAhwybXVTM+leeAWjHVTucoafYycsjRprPSGeljo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GV/73cOuvX4z3CNn2L+H9LSzrhI6lPbNDHka2Ikl1cMUUyGRKIalm9GomPbUVxWIA
	 Cyl8gSiRvERMieFshnNuYY0DK1n0rt1CbMhOMZhtU9OPaKqAHNpNKU0LI/xi2hsxNq
	 HgY/9CUCl+WU46VFrPmUm4qfIayNeendt/1B4kedoNxeWNGgregfFXKF4CHrrAleCr
	 IGyYQT5rZf2bf3hr7UFwdjh1u30kZz+tw+vhLHwjb8CeuBYq+qyowINx9r1q7KOS2w
	 K5puf+gN5R7kX9f+xiONC6Z+9bk1eHxBG3keBZ0pU6fm0t+jE5BJ0yiHajZrxSlgLU
	 68bnW2dtck8HQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DA88BC3279F; Thu, 25 Jun 2026 10:15:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Thu, 25 Jun 2026 10:15:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-d4gDhSfNnt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #56 from Milan Oravec (moravec@ukf.sk) ---
acpitz-acpi-0 temp is stuck at 109=C2=B0C and not changing at all. ;(

migo@migo-HP:~$ sudo sensors
hp-isa-0000
Adapter: ISA adapter
fan1:           0 RPM
fan2:           0 RPM
pwm1:             N/A

k10temp-pci-00c3
Adapter: PCI adapter
Tctl:         +39.5=C2=B0C=20=20

mt7925_phy0-pci-6200
Adapter: PCI adapter
temp1:        +72.0=C2=B0C=20=20

nvme-pci-6000
Adapter: PCI adapter
Composite:    +38.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +81.8=C2=B0C)
                       (crit =3D +84.8=C2=B0C)
Sensor 1:     +38.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)
Sensor 2:     +38.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)

acpitz-acpi-0
Adapter: ACPI interface
temp1:       +109.0=C2=B0C=20=20

ucsi_source_psy_USBC000:001-isa-0000
Adapter: ISA adapter
in0:           5.00 V  (min =3D  +5.00 V, max =3D +15.00 V)
curr1:         3.00 A  (max =3D  +5.00 A)

ucsi_source_psy_USBC000:002-isa-0000
Adapter: ISA adapter
in0:           0.00 V  (min =3D  +5.00 V, max =3D +15.00 V)
curr1:         0.00 A  (max =3D  +0.00 A)

amdgpu-pci-6300
Adapter: PCI adapter
vddgfx:        0.00 V=20=20
vddnb:         0.00 V=20=20
edge:         +38.0=C2=B0C=20=20
PPT:           4.00 W  (avg =3D   4.00 W)
sclk:         875 MHz=20

BAT0-acpi-0
Adapter: ACPI interface
in0:           8.26 V=20=20
power1:        0.00 W=20=20

acpi_fan-isa-0000
Adapter: ISA adapter
fan1:        2100 RPM

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
