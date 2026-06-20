Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74D0348C6C
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 12:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781958211; cv=none; b=bLTFz+2a/r9C+hAjAP2M3QZ4et+8Dx8T+ubzQHUlcCMo7gGj2djBpkhSsbIyjZRejaCWkNbSIPN2alfydZdiobgHsZpNDkflLMiDXr1L9PQC0+LHy9JZKhaHQ9LNHIozR4ycjBNx+9KIgrWfjPJ+ZNSUGq9zEuiG2wQxr3mpBNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781958211; c=relaxed/simple;
	bh=iZPvpEZd0PcKWVx5rcQi7ElFgAf9CMwjkJaOqzxwXdc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VM3pAxggbTk10mj1b36hEsIVzzuRzMQr9Eo3iXtocTmhGDfeDshg4hnFA0DqchfdlezfAF7y6u6LG2Tfg17efHgfXzmYT5L0PGdzGCzwqgfVD/Rnpaykj9l8+RG3To/5nSSF/9x0roHvv8jDktpDCQMisChP9JNYaIB56AD3p4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ue3cYxwa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ue3cYxwa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6BEDDC2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 12:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781958211;
	bh=iZPvpEZd0PcKWVx5rcQi7ElFgAf9CMwjkJaOqzxwXdc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ue3cYxwa3PQH8L2pP0W1E3KxEsmWQPTQO/PQ3xuGxzo8kIXZl7gC/B/4LWaQUvrgi
	 QKZmAxR/eddXhR1FYF2hCiMD8YfwzZjNxMAGH+nsBGtPs8TqOZw/Jfsf/uQbTK3h4I
	 VHwA9b06GzP7HL76VJTU5wy34o5J+LJ2Aj3TO1NwIf5Bz5ibWtWu7a/ThkZlKGYmX/
	 MvpKd7OpLxtYB9IrJ+Hyy34RMRK0kZOtKNfP2+VjCv/010AkcZSfYV8rXgUfJYgpW0
	 j4olqVQJEnGyFJoE/01mtI295saEBFY7eM/iNVs/Cyv4mp418HmtdsLlFUVVD84jYQ
	 BRjsYfBLoan1A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 64C0FC4160E; Sat, 20 Jun 2026 12:23:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 12:23:31 +0000
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
Message-ID: <bug-221569-215701-rrt5WjpSzg@https.bugzilla.kernel.org/>
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

--- Comment #42 from Milan Oravec (moravec@ukf.sk) ---
nothing changed, only 2min. later:

migo@migo-HP:~$ sudo sensors
hp-isa-0000
Adapter: ISA adapter
fan1:           0 RPM
fan2:           0 RPM
pwm1:             N/A

k10temp-pci-00c3
Adapter: PCI adapter
Tctl:         +39.9=C2=B0C=20=20

mt7925_phy0-pci-6200
Adapter: PCI adapter
temp1:        +49.0=C2=B0C=20=20

nvme-pci-6000
Adapter: PCI adapter
Composite:    +37.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +81.8=C2=B0C)
                       (crit =3D +84.8=C2=B0C)
Sensor 1:     +37.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)
Sensor 2:     +38.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)

acpitz-acpi-0
Adapter: ACPI interface
temp1:        +40.0=C2=B0C=20=20

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
edge:         +38.0=C2=B0C=20=20
PPT:           3.06 W  (avg =3D   3.06 W)
sclk:         718 MHz=20

BAT0-acpi-0
Adapter: ACPI interface
in0:           8.27 V=20=20
power1:        0.00 W=20=20

acpi_fan-isa-0000
Adapter: ISA adapter
fan1:        2100 RPM

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
