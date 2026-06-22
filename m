Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DAA39B959
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 09:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782119193; cv=none; b=kG0WnZtk1sYbLB5oKhAOUIR18qti3t93XMznteHmWwaJ+xzC2k3FB5b+wBFop+TXYgwxpCfrHRq0vkkMcPtd/2EjdtmIydLQXQPwiNvSZkE1YB2b2OpxriRCINrwmrwjVrHCxvET0bwp2xbLPTqldTMVHllSUqcO6M7qHRyqR74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782119193; c=relaxed/simple;
	bh=+d3Xk0QrNsmIXZaucd2FSRDTgf5ucDmSNwXof+dKosg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UdMF5vEeitR76iMr5qPMgJY80wf0rzgbvwh3DIo57ethnQEQ26g7a/+3qUbUaJh0HEllmu6kR6B8AJXpNdoKYtOcdZE8yk7nRw9y8OYr0Zjakpa7WyAS0potT6TyIWVLf5+5U8nVqlhbfMRdfkO4VfZoU+KN3Gy6pWs9qcgGrFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OkNh1FIO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OkNh1FIO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E291C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 09:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782119192;
	bh=+d3Xk0QrNsmIXZaucd2FSRDTgf5ucDmSNwXof+dKosg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OkNh1FIOmMRgrExEgUWPKFfIJ0NnAI7Xn0d6GzbtOJUwQeg5DSjXiSCNVmW2ccVbu
	 t/NDJ47GdnpuIVYrTWCFnr/ohF5819Gglvc13j/Eq75PNbQyi1kezzw5/74Uhj/3o5
	 wEx3fhRr49iEPeqm85XFnDGIT3uFI18Gj/Skp+8WZL9RIxlBFrBrXDWXA+ByPn7qjd
	 cxwfJCJ2kxX+wQQ5PI7PssobW0HVeUDFQPRYyiuDSbsJ2jmQqAAWfD5EYsYgx7/CgG
	 JIsyX9nd7cQxC+Dh40wTxNpKff1rYF3zoKC4UB7wdIpActfg1dz/bTqW0DoI9s2oPx
	 Cvm+zqWrqhWsg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 84896C41612; Mon, 22 Jun 2026 09:06:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Mon, 22 Jun 2026 09:06:32 +0000
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
Message-ID: <bug-221569-215701-mCr2Ynqgxs@https.bugzilla.kernel.org/>
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

--- Comment #45 from Milan Oravec (moravec@ukf.sk) ---
Hello, when is laptop idle fan stops spinning for a while sometimes. But th=
at
fan trigger point is set very conservatively and fan is spinning nearly alw=
ays
when not idling. Is there something I can do about it? Thank you!

migo@migo-HP:~$ sudo sensors
[sudo] password for migo:=20
hp-isa-0000
Adapter: ISA adapter
fan1:           0 RPM
fan2:           0 RPM
pwm1:             N/A

k10temp-pci-00c3
Adapter: PCI adapter
Tctl:         +46.4=C2=B0C=20=20

mt7925_phy0-pci-6200
Adapter: PCI adapter
temp1:        +47.0=C2=B0C=20=20

nvme-pci-6000
Adapter: PCI adapter
Composite:    +36.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +81.8=C2=B0C)
                       (crit =3D +84.8=C2=B0C)
Sensor 1:     +36.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)
Sensor 2:     +38.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)

acpitz-acpi-0
Adapter: ACPI interface
temp1:        +43.0=C2=B0C=20=20

ucsi_source_psy_USBC000:001-isa-0000
Adapter: ISA adapter
in0:           5.00 V  (min =3D  +5.00 V, max =3D +15.00 V)
curr1:         3.00 A  (max =3D  +5.00 A)

ucsi_source_psy_USBC000:002-isa-0000
Adapter: ISA adapter
in0:           0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
curr1:         0.00 A  (max =3D  +0.00 A)

amdgpu-pci-6300
Adapter: PCI adapter
vddgfx:        0.00 V=20=20
vddnb:         0.00 V=20=20
edge:         +44.0=C2=B0C=20=20
PPT:           4.01 W  (avg =3D   4.01 W)
sclk:         806 MHz=20

BAT0-acpi-0
Adapter: ACPI interface
in0:           8.26 V=20=20
power1:        0.00 W=20=20

acpi_fan-isa-0000
Adapter: ISA adapter
fan1:           0 RPM



migo@migo-HP:~$ sudo sensors
hp-isa-0000
Adapter: ISA adapter
fan1:           0 RPM
fan2:           0 RPM
pwm1:             N/A

k10temp-pci-00c3
Adapter: PCI adapter
Tctl:         +45.4=C2=B0C=20=20

mt7925_phy0-pci-6200
Adapter: PCI adapter
temp1:        +47.0=C2=B0C=20=20

nvme-pci-6000
Adapter: PCI adapter
Composite:    +36.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +81.8=C2=B0C)
                       (crit =3D +84.8=C2=B0C)
Sensor 1:     +36.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)
Sensor 2:     +39.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)

acpitz-acpi-0
Adapter: ACPI interface
temp1:        +44.0=C2=B0C=20=20

ucsi_source_psy_USBC000:001-isa-0000
Adapter: ISA adapter
in0:           5.00 V  (min =3D  +5.00 V, max =3D +15.00 V)
curr1:         3.00 A  (max =3D  +5.00 A)

ucsi_source_psy_USBC000:002-isa-0000
Adapter: ISA adapter
in0:           0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
curr1:         0.00 A  (max =3D  +0.00 A)

amdgpu-pci-6300
Adapter: PCI adapter
vddgfx:        0.00 V=20=20
vddnb:         0.00 V=20=20
edge:         +44.0=C2=B0C=20=20
PPT:           4.07 W  (avg =3D   4.07 W)
sclk:         973 MHz=20

BAT0-acpi-0
Adapter: ACPI interface
in0:           8.26 V=20=20
power1:        0.00 W=20=20

acpi_fan-isa-0000
Adapter: ISA adapter
fan1:        2100 RPM

migo@migo-HP:~$=20

migo@migo-HP:~$ w
 11:05:31 up 2 days, 18 min,  1 user,  load average: 0,27, 0,36, 0,41

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
